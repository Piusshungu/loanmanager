<?php

namespace App\Http\Controllers;

use Aloha\Twilio\Twilio;
use App\Helpers\BulkSms;
use App\Helpers\GeneralHelper;
use App\Models\Borrower;

use App\Models\Collateral;
use App\Models\CollateralType;
use App\Models\CustomField;
use App\Models\CustomFieldMeta;
use App\Models\Expense;
use App\Models\ExpenseType;
use App\Models\Loan;
use App\Models\LoanRepayment;
use App\Models\LoanSchedule;
use App\Models\OtherIncome;
use App\Models\Payroll;
use App\Models\SavingTransaction;
use App\Models\Setting;
use App\Models\User;
use Cartalyst\Sentinel\Laravel\Facades\Sentinel;
use Clickatell\Api\ClickatellHttp;
use Illuminate\Http\Request;
use App\Http\Requests;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;
use Laracasts\Flash\Flash;

class ReportController extends Controller
{
    public function __construct()
    {
        $this->middleware('sentinel');
    }


    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function cash_flow(Request $request)
    {
        if (!Sentinel::hasAccess('reports')) {
            Flash::warning("Permission Denied");
            return redirect('/');
        }
        $start_date = $request->start_date;
        $end_date = $request->end_date;
        $capital = GeneralHelper::total_capital($request->start_date, $request->end_date);
        $expenses = GeneralHelper::total_expenses($request->start_date, $request->end_date);
        $payroll = GeneralHelper::total_payroll($request->start_date, $request->end_date);
        $principal = GeneralHelper::loans_total_principal($request->start_date, $request->end_date);
        $other_income = GeneralHelper::total_other_income($request->start_date, $request->end_date);
        $deposits = GeneralHelper::total_savings_deposits($request->start_date, $request->end_date);
        $withdrawals = GeneralHelper::total_savings_withdrawals($request->start_date, $request->end_date);
        $principal_paid = GeneralHelper::loans_total_paid_item('principal', $request->start_date, $request->end_date);
        $interest_paid = GeneralHelper::loans_total_paid_item('interest', $request->start_date, $request->end_date);
        $fees_paid = GeneralHelper::loans_total_paid_item('fees', $request->start_date, $request->end_date);
        $penalty_paid = GeneralHelper::loans_total_paid_item('penalty', $request->start_date, $request->end_date);
        $total_payments = $expenses + $payroll + $principal + $withdrawals;
        $total_receipts = $principal_paid + $fees_paid + $interest_paid + $penalty_paid + $other_income + $deposits + $capital;
        $cash_balance = $total_receipts - $total_payments;
        return view('report.cash_flow',
            compact('expenses', 'payroll', 'principal', 'total_payments', 'other_income', 'principal_paid',
                'interest_paid', 'fees_paid', 'penalty_paid', 'total_receipts', 'cash_balance', 'start_date',
                'end_date', 'withdrawals', 'deposits', 'capital'));
    }

    public function profit_loss(Request $request)
    {
        if (!Sentinel::hasAccess('reports')) {
            Flash::warning("Permission Denied");
            return redirect('/');
        }
        $start_date = $request->start_date;
        $end_date = $request->end_date;
        $expenses = GeneralHelper::total_expenses($request->start_date, $request->end_date);
        $other_expenses = GeneralHelper::total_savings_interest($request->start_date, $request->end_date);
        $payroll = GeneralHelper::total_payroll($request->start_date, $request->end_date);
        $other_income = GeneralHelper::total_other_income($request->start_date, $request->end_date);
        $interest_paid = GeneralHelper::loans_total_paid_item('interest', $request->start_date, $request->end_date);
        $fees_paid = GeneralHelper::loans_total_paid_item('fees', $request->start_date, $request->end_date);
        $penalty_paid = GeneralHelper::loans_total_paid_item('penalty', $request->start_date, $request->end_date);
        $loan_default = GeneralHelper::loans_total_default($request->start_date, $request->end_date);
        $operating_expenses = $expenses + $payroll;
        $operating_profit = $fees_paid + $interest_paid + $penalty_paid + $other_income;
        $gross_profit = $operating_profit - $operating_expenses - $other_expenses;
        $net_profit = $gross_profit - $loan_default;
        //build graphs here
        $monthly_net_income_data = array();
        $monthly_operating_profit_expenses_data = array();
        $monthly_other_expenses_data = array();
        if (isset($request->end_date)) {
            $date = $request->end_date;
        } else {
            $date = date("Y-m-d");
        }
        $start_date1 = date_format(date_sub(date_create($date),
            date_interval_create_from_date_string('1 years')),
            'Y-m-d');
        $start_date2 = date_format(date_sub(date_create($date),
            date_interval_create_from_date_string('1 years')),
            'Y-m-d');
        $start_date3 = date_format(date_sub(date_create($date),
            date_interval_create_from_date_string('1 years')),
            'Y-m-d');
        for ($i = 1; $i < 14; $i++) {
            $d = explode('-', $start_date1);
            //get loans in that period
            $o_profit = 0;
            foreach (Loan::where('branch_id', session('branch_id'))->where('year', $d[0])->where('month', $d[1])->where('status',
                'disbursed')->get() as $key) {
                $o_profit = $o_profit + GeneralHelper::loan_paid_item($key->id, 'interest',
                        $key->due_date) + GeneralHelper::loan_paid_item($key->id, 'fees',
                        $key->due_date) + GeneralHelper::loan_paid_item($key->id, 'penalty', $key->due_date);
            }
            $o_profit = round($o_profit + OtherIncome::where('year', $d[0])->where('month',
                    $d[1])->sum('amount'), 2);
            $o_expense = Expense::where('branch_id', session('branch_id'))->where('year', $d[0])->where('month',
                $d[1])->sum('amount');
            foreach (Payroll::where('year', $d[0])->where('month',
                $d[1])->get() as $key) {
                $o_expense = $o_expense + GeneralHelper::single_payroll_total_pay($key->id);
            }
            $o_expense = round($o_expense, 2);
            $ot_expense = 0;
            foreach (Loan::where('branch_id', session('branch_id'))->where('year', $d[0])->where('month', $d[1])->where('status',
                'disbursed')->get() as $key) {
                $ot_expense = $ot_expense + ($key->principal - GeneralHelper::loan_total_paid($key->id));
            }
            $ot_expense = round($ot_expense, 2);
            if ($i == 1 or $i == 13) {
                $ext = ' ' . $d[0];
            } else {
                $ext = '';
            }
            $n_income = round(($o_profit - $o_expense - $ot_expense), 2);
            array_push($monthly_net_income_data, array(
                'month' => date_format(date_create($start_date1),
                    'M' . $ext),
                'amount' => $n_income

            ));
            //add 1 month to start date
            $start_date1 = date_format(date_add(date_create($start_date1),
                date_interval_create_from_date_string('1 months')),
                'Y-m-d');
        }
        for ($i = 1; $i < 14; $i++) {
            $d = explode('-', $start_date2);
            //get loans in that period
            $o_profit = 0;
            foreach (Loan::where('branch_id', session('branch_id'))->where('year', $d[0])->where('month', $d[1])->where('status',
                'disbursed')->get() as $key) {
                $o_profit = $o_profit + GeneralHelper::loan_paid_item($key->id, 'interest',
                        $key->due_date) + GeneralHelper::loan_paid_item($key->id, 'fees',
                        $key->due_date) + GeneralHelper::loan_paid_item($key->id, 'penalty', $key->due_date);
            }
            $o_profit = round($o_profit + OtherIncome::where('branch_id', session('branch_id'))->where('year', $d[0])->where('month',
                    $d[1])->sum('amount'), 2);
            $o_expense = Expense::where('branch_id', session('branch_id'))->where('year', $d[0])->where('month',
                $d[1])->sum('amount');
            foreach (Payroll::where('branch_id', session('branch_id'))->where('year', $d[0])->where('month',
                $d[1])->get() as $key) {
                $o_expense = $o_expense + GeneralHelper::single_payroll_total_pay($key->id);
            }
            $o_expense = round($o_expense, 2);
            $ot_expense = 0;
            foreach (Loan::where('branch_id', session('branch_id'))->where('year', $d[0])->where('month', $d[1])->where('status',
                'disbursed')->get() as $key) {
                $ot_expense = $ot_expense + ($key->principal - GeneralHelper::loan_total_paid($key->id));
            }
            $ot_expense = round($ot_expense, 2);
            if ($i == 1 or $i == 13) {
                $ext = ' ' . $d[0];
            } else {
                $ext = '';
            }
            $n_income = round(($o_profit - $o_expense - $ot_expense), 2);
            array_push($monthly_operating_profit_expenses_data, array(
                'month' => date_format(date_create($start_date2),
                    'M' . $ext),
                'profit' => $o_profit,
                'expenses' => $o_expense

            ));
            //add 1 month to start date
            $start_date2 = date_format(date_add(date_create($start_date2),
                date_interval_create_from_date_string('1 months')),
                'Y-m-d');
        }
        for ($i = 1; $i < 14; $i++) {
            $d = explode('-', $start_date3);
            //get loans in that period
            $o_profit = 0;
            foreach (Loan::where('branch_id', session('branch_id'))->where('year', $d[0])->where('month', $d[1])->where('status',
                'disbursed')->get() as $key) {
                $o_profit = $o_profit + GeneralHelper::loan_paid_item($key->id, 'interest',
                        $key->due_date) + GeneralHelper::loan_paid_item($key->id, 'fees',
                        $key->due_date) + GeneralHelper::loan_paid_item($key->id, 'penalty', $key->due_date);
            }
            $o_profit = round($o_profit + OtherIncome::where('branch_id', session('branch_id'))->where('year', $d[0])->where('month',
                    $d[1])->sum('amount'), 2);
            $o_expense = Expense::where('branch_id', session('branch_id'))->where('year', $d[0])->where('month',
                $d[1])->sum('amount');
            foreach (Payroll::where('branch_id', session('branch_id'))->where('year', $d[0])->where('month',
                $d[1])->get() as $key) {
                $o_expense = $o_expense + GeneralHelper::single_payroll_total_pay($key->id);
            }
            $o_expense = round($o_expense, 2);
            $ot_expense = 0;
            foreach (Loan::where('branch_id', session('branch_id'))->where('year', $d[0])->where('month', $d[1])->where('status',
                'disbursed')->get() as $key) {
                $ot_expense = $ot_expense + ($key->principal - GeneralHelper::loan_total_paid($key->id));
            }
            foreach (SavingTransaction::where('branch_id', session('branch_id'))->where('year', $d[0])->where('month', $d[1])->where('type',
                'interest')->get() as $key) {
                $ot_expense = $ot_expense + $key->amount;
            }
            $ot_expense = round($ot_expense, 2);
            if ($i == 1 or $i == 13) {
                $ext = ' ' . $d[0];
            } else {
                $ext = '';
            }
            $n_income = round(($o_profit - $o_expense - $ot_expense), 2);
            array_push($monthly_other_expenses_data, array(
                'month' => date_format(date_create($start_date3),
                    'M' . $ext),
                'expenses' => $ot_expense

            ));
            //add 1 month to start date
            $start_date3 = date_format(date_add(date_create($start_date3),
                date_interval_create_from_date_string('1 months')),
                'Y-m-d');
        }
        $monthly_net_income_data = json_encode($monthly_net_income_data);
        $monthly_operating_profit_expenses_data = json_encode($monthly_operating_profit_expenses_data);
        $monthly_other_expenses_data = json_encode($monthly_other_expenses_data);
        return view('report.profit_loss',
            compact('expenses', 'payroll', 'operating_expenses', 'other_income',
                'interest_paid', 'fees_paid', 'penalty_paid', 'operating_profit', 'gross_profit', 'start_date',
                'end_date', 'loan_default', 'net_profit', 'monthly_net_income_data',
                'monthly_operating_profit_expenses_data', 'monthly_other_expenses_data', 'other_expenses'));
    }

    public function collection_report(Request $request)
    {
        if (!Sentinel::hasAccess('reports')) {
            Flash::warning("Permission Denied");
            return redirect('/');
        }
        $start_date = $request->start_date;
        $end_date = $request->end_date;
        if (isset($request->end_date)) {
            $date = $request->end_date;
        } else {
            $date = date("Y-m-d");
        }
        $monthly_collections = array();
        $start_date1 = date_format(date_sub(date_create($date),
            date_interval_create_from_date_string('1 years')),
            'Y-m-d');
        for ($i = 1; $i < 14; $i++) {
            $d = explode('-', $start_date1);
            //get loans in that period
            $payments = 0;
            $payments_due = 0;
            foreach (Loan::where('branch_id', session('branch_id'))->where('year', $d[0])->where('month', $d[1])->where('status',
                'disbursed')->get() as $key) {
                $payments = $payments + GeneralHelper::loan_paid_item($key->id, 'interest',
                        $key->due_date) + GeneralHelper::loan_paid_item($key->id, 'fees',
                        $key->due_date) + GeneralHelper::loan_paid_item($key->id, 'penalty',
                        $key->due_date) + GeneralHelper::loan_paid_item($key->id, 'principal', $key->due_date);
                $payments_due = $payments_due + GeneralHelper::loan_total_principal($key->id) + GeneralHelper::loan_total_fees($key->id) + GeneralHelper::loan_total_penalty($key->id) + GeneralHelper::loan_total_interest($key->id);
            }
            $payments = round($payments, 2);
            $payments_due = round($payments_due, 2);

            if ($i == 1 or $i == 13) {
                $ext = ' ' . $d[0];
            } else {
                $ext = '';
            }
            array_push($monthly_collections, array(
                'month' => date_format(date_create($start_date1),
                    'M' . $ext),
                'payments' => $payments,
                'due' => $payments_due

            ));
            //add 1 month to start date
            $start_date1 = date_format(date_add(date_create($start_date1),
                date_interval_create_from_date_string('1 months')),
                'Y-m-d');
        }
        $monthly_collections = json_encode($monthly_collections);
        return view('report.collection',
            compact('start_date', 'end_date', 'monthly_collections'));
    }

    public function balance_sheet(Request $request)
    {
        if (!Sentinel::hasAccess('reports')) {
            Flash::warning("Permission Denied");
            return redirect('/');
        }
        $start_date = $request->start_date;
        $end_date = $request->end_date;
        //$capital = GeneralHelper::total_capital($request->start_date, $request->end_date);
        /* $expenses = GeneralHelper::total_expenses($request->start_date, $request->end_date);
         $payroll = GeneralHelper::total_payroll($request->start_date, $request->end_date);
         $principal = GeneralHelper::loans_total_principal($request->start_date, $request->end_date);
         $other_income = GeneralHelper::total_other_income($request->start_date, $request->end_date);*/
        // $deposits = GeneralHelper::total_savings_deposits($request->start_date, $request->end_date);
        //$withdrawals = GeneralHelper::total_savings_withdrawals($request->start_date, $request->end_date);
        /*$principal_paid = GeneralHelper::loans_total_paid_item('principal', $request->start_date, $request->end_date);
        $interest_paid = GeneralHelper::loans_total_paid_item('interest', $request->start_date, $request->end_date);
        $fees_paid = GeneralHelper::loans_total_paid_item('fees', $request->start_date, $request->end_date);
        $penalty_paid = GeneralHelper::loans_total_paid_item('penalty', $request->start_date, $request->end_date);*/
        //$total_payments = $expenses + $payroll + $principal + $withdrawals;
        //$total_receipts = $principal_paid + $fees_paid + $interest_paid + $penalty_paid + $other_income + $deposits+$capital;
        //$cash_balance = $total_receipts - $total_payments;
        return view('report.balance_sheet',
            compact('expenses', 'payroll', 'principal', 'total_payments', 'other_income', 'principal_paid',
                'interest_paid', 'fees_paid', 'penalty_paid', 'total_receipts', 'cash_balance', 'start_date',
                'end_date', 'withdrawals', 'deposits', 'capital'));
    }

    public function loan_list(Request $request)
    {
        if (!Sentinel::hasAccess('reports')) {
            Flash::warning("Permission Denied");
            return redirect('/');
        }
        $start_date = $request->start_date;
        $end_date = $request->end_date;
        $status = '';
        if (!empty($request->status)) {
            if ($request->status == 'all') {
                $status = "All Status";
            } else {
                $status = $request->status;
            }
        } else {

        }
        if ($request->isMethod('post')) {
            if ($request->status == 'all') {
                $data = Loan::where('branch_id', session('branch_id'))->whereBetween('release_date', [$start_date, $end_date])->get();
            } else {
                $data = Loan::where('branch_id', session('branch_id'))->whereBetween('release_date', [$start_date, $end_date])->where('status',
                    $request->status)->get();
            }

        } else {
            $data = array();
        }
        return view('report.loan_list',
            compact('data', 'start_date',
                'end_date', 'status'));
    }

    public function loan_balance(Request $request)
    {
        if (!Sentinel::hasAccess('reports')) {
            Flash::warning("Permission Denied");
            return redirect('/');
        }
        $start_date = $request->start_date;
        $end_date = $request->end_date;
        if ($request->isMethod('post')) {

            $data = Loan::where('branch_id', session('branch_id'))->whereBetween('disbursed_date', [$start_date, $end_date])->where('status', 'disbursed')->get();

        } else {
            $data = array();
        }
        return view('report.loan_balance',
            compact('data', 'start_date',
                'end_date'));
    }

    public function loan_arrears(Request $request)
    {
        if (!Sentinel::hasAccess('reports')) {
            Flash::warning("Permission Denied");
            return redirect('/');
        }
        $start_date = $request->start_date;
        $end_date = $request->end_date;

        return view('report.balance_sheet',
            compact('expenses'));
    }

    public function loan_transaction(Request $request)
    {
        if (!Sentinel::hasAccess('reports')) {
            Flash::warning("Permission Denied");
            return redirect('/');
        }
        $start_date = $request->start_date;
        $end_date = $request->end_date;
        if ($request->isMethod('post')) {

            $data = LoanRepayment::where('branch_id', session('branch_id'))->whereBetween('collection_date', [$start_date, $end_date])->get();

        } else {
            $data = array();
        }
        return view('report.loan_transaction',
            compact('data', 'start_date',
                'end_date'));
    }

    public function loan_classification(Request $request)
    {
        if (!Sentinel::hasAccess('reports')) {
            Flash::warning("Permission Denied");
            return redirect('/');
        }
        $start_date = $request->start_date;
        $end_date = $request->end_date;


        $data = Loan::where('branch_id', session('branch_id'))->where('status', 'disbursed')->get();

        return view('report.loan_classification',
            compact('data', 'start_date',
                'end_date'));
    }

    public function loan_projection(Request $request)
    {
        if (!Sentinel::hasAccess('reports')) {
            Flash::warning("Permission Denied");
            return redirect('/');
        }
        $start_date = $request->start_date;
        $end_date = $request->end_date;

        $monthly_collections = array();
        $start_date1 = date("Y-m-d");
        for ($i = 1; $i < 14; $i++) {
            $d = explode('-', $start_date1);
            //get loans in that period
            $payments = 0;
            $payments_due = 0;
            foreach (LoanSchedule::where('branch_id', session('branch_id'))->where('year', $d[0])->where('month', $d[1])->get() as $key) {
                $payments_due = $payments_due + $key->principal + $key->interest + $key->fees + $key->penalty;
            }
            $payments_due = round($payments_due, 2);
            $ext = ' ' . $d[0];
            array_push($monthly_collections, array(
                'month' => date_format(date_create($start_date1),
                    'M' . $ext),
                'due' => $payments_due

            ));
            //add 1 month to start date
            $start_date1 = date_format(date_add(date_create($start_date1),
                date_interval_create_from_date_string('1 months')),
                'Y-m-d');
        }
        $monthly_collections = json_encode($monthly_collections);
        return view('report.loan_projection',
            compact('monthly_collections', 'start_date',
                'end_date'));
    }
}

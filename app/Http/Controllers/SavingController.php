<?php

namespace App\Http\Controllers;

use Aloha\Twilio\Twilio;
use App\Helpers\GeneralHelper;
use App\Models\Borrower;
use App\Models\CustomField;
use App\Models\CustomFieldMeta;
use App\Models\Loan;
use App\Models\LoanRepayment;
use App\Models\LoanSchedule;
use App\Models\Saving;
use App\Models\SavingFee;
use App\Models\SavingProduct;
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
use Illuminate\Support\Facades\View;
use Laracasts\Flash\Flash;
use PDF;

class SavingController extends Controller
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
    public function index()
    {
        $data = Saving::where('branch_id', session('branch_id'))->get();

        return view('saving.data', compact('data'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
        $borrowers = array();
        foreach (Borrower::all() as $key) {
            $borrowers[$key->id] = $key->first_name . ' ' . $key->last_name . '(' . $key->unique_number . ')';
        }
        $savings_products = array();
        foreach (SavingProduct::all() as $key) {
            $savings_products[$key->id] = $key->name;
        }
        if (isset($request->borrower_id)) {
            $borrower_id = $request->borrower_id;
        } else {
            $borrower_id = '';
        }
        return view('saving.create', compact('savings_products', 'borrowers', 'borrower_id'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        if (Saving::where('borrower_id', $request->borrower_id)->count() > 0) {
            Flash::warning(trans('general.saving_account_already_exists'));
            return redirect()->back()->withInput();
        }
        $saving = new Saving();
        $saving->user_id = Sentinel::getUser()->id;
        $saving->savings_product_id = $request->savings_product_id;
        $saving->borrower_id = $request->borrower_id;
        $saving->branch_id = session('branch_id');
        $saving->notes = $request->notes;
        $saving->date = date("Y-m-d");
        $saving->save();

        Flash::success(trans('general.successfully_saved'));
        return redirect('saving/data');
    }


    public function show($saving)
    {
        //$transactions = SavingTransaction::where('savings_id', $saving->id)->orderBy('date', 'desc')->orderBy('time','desc')->get();
        $transactions = array();
        $balance = 0;
        foreach (SavingTransaction::where('savings_id', $saving->id)->orderBy('date', 'asc')->orderBy('time',
            'asc')->get() as $key) {
            $savings_transactions = array();
            if ($key->type == 'deposit' || $key->type == 'interest' || $key->type == 'dividend' || $key->type == 'guarantee_restored') {
                $balance = $balance + $key->amount;
            } else {
                $balance = $balance - $key->amount;
            }
            $savings_transactions['id'] = $key->id;
            $savings_transactions['type'] = $key->type;
            $savings_transactions['time'] = $key->time;
            $savings_transactions['date'] = $key->date;
            $savings_transactions['amount'] = $key->amount;
            $savings_transactions['notes'] = $key->notes;
            $savings_transactions['user'] = $key->user;
            $savings_transactions['balance'] = $balance;
            array_push($transactions, $savings_transactions);
        }
        $transactions = array_reverse($transactions);
        $custom_fields = CustomFieldMeta::where('category', 'savings')->where('parent_id',
            $saving->id)->get();
        return view('saving.show', compact('saving', 'custom_fields', 'transactions'));
    }


    public function edit($saving)
    {
        $borrowers = array();
        foreach (Borrower::all() as $key) {
            $borrowers[$key->id] = $key->first_name . ' ' . $key->last_name . '(' . $key->unique_number . ')';
        }
        $savings_products = array();
        foreach (SavingProduct::all() as $key) {
            $savings_products[$key->id] = $key->name;
        }
        return view('saving.edit', compact('saving', 'savings_products', 'borrowers'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $saving = Saving::find($id);
        $saving->savings_product_id = $request->savings_product_id;
        $saving->borrower_id = $request->borrower_id;
        $saving->notes = $request->notes;
        $saving->save();

        Flash::success(trans('general.successfully_saved'));
        return redirect('saving/data');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function delete($id)
    {
        Saving::destroy($id);
        SavingTransaction::where('savings_id', $id)->delete();
        Flash::success(trans('general.successfully_deleted'));
        return redirect('saving/data');
    }

    public function printStatement($saving)
    {
        //$transactions = SavingTransaction::where('savings_id', $saving->id)->orderBy('date', 'desc')->orderBy('time','desc')->get();
        $transactions = array();
        $balance = 0;
        foreach (SavingTransaction::where('savings_id', $saving->id)->orderBy('date', 'asc')->orderBy('time',
            'asc')->get() as $key) {
            $savings_transactions = array();
            if ($key->type == 'deposit' || $key->type == 'interest' || $key->type == 'dividend' || $key->type == 'guarantee_restored') {
                $balance = $balance + $key->amount;
            } else {
                $balance = $balance - $key->amount;
            }
            $savings_transactions['id'] = $key->id;
            $savings_transactions['type'] = $key->type;
            $savings_transactions['time'] = $key->time;
            $savings_transactions['date'] = $key->date;
            $savings_transactions['amount'] = $key->amount;
            $savings_transactions['notes'] = $key->notes;
            $savings_transactions['user'] = $key->user;
            $savings_transactions['balance'] = $balance;
            array_push($transactions, $savings_transactions);
        }
        $transactions = array_reverse($transactions);
        $custom_fields = CustomFieldMeta::where('category', 'savings')->where('parent_id',
            $saving->id)->get();
        return view('saving.print', compact('saving', 'custom_fields', 'transactions'));
    }

    public function pdfStatement($saving)
    {

        $transactions = array();
        $balance = 0;
        foreach (SavingTransaction::where('savings_id', $saving->id)->orderBy('date', 'asc')->orderBy('time',
            'asc')->get() as $key) {
            $savings_transactions = array();
            if ($key->type == 'deposit' || $key->type == 'interest' || $key->type == 'dividend' || $key->type == 'guarantee_restored') {
                $balance = $balance + $key->amount;
            } else {
                $balance = $balance - $key->amount;
            }
            $savings_transactions['id'] = $key->id;
            $savings_transactions['type'] = $key->type;
            $savings_transactions['time'] = $key->time;
            $savings_transactions['date'] = $key->date;
            $savings_transactions['amount'] = $key->amount;
            $savings_transactions['notes'] = $key->notes;
            $savings_transactions['user'] = $key->user;
            $savings_transactions['balance'] = $balance;
            array_push($transactions, $savings_transactions);
        }
        $transactions = array_reverse($transactions);
        $custom_fields = CustomFieldMeta::where('category', 'savings')->where('parent_id',
            $saving->id)->get();
        PDF::AddPage();
        PDF::writeHTML(View::make('saving.pdf_statement',
            compact('saving', 'custom_fields', 'transactions'))->render());
        PDF::SetAuthor('Tererai Mugova');
        PDF::Output($saving->borrower->title . ' ' . $saving->borrower->first_name . ' ' . $saving->borrower->last_name . " - Savings Statement.pdf",
            'D');

    }

    public function transfer($saving)
    {
        $loans = array();
        foreach (Loan::where('borrower_id', $saving->borrower_id)->get() as $key) {
            $loans[$key->id] = $key->borrower->first_name . ' ' . $key->borrower->last_name . '(' . trans_choice('general.loan',
                    1) . '#' . $key->id . ',' . trans_choice('general.due',
                    1) . ':' . GeneralHelper::loan_total_balance($key->id) . ')';
        }

        return view('saving.transfer', compact('saving', 'loans'));
    }

    public function storeTransfer(Request $request, $saving)
    {

        $savings_transaction = new SavingTransaction();
        if ($request->type == "withdrawal" && GeneralHelper::savings_account_balance($saving->id) < $request->amount && $saving->savings_product->allow_overdraw == 0) {
            Flash::warning(trans('general.withdrawal_more_than_balance'));
            return redirect()->back()->withInput();
        }
        $savings_transaction->user_id = Sentinel::getUser()->id;
        $savings_transaction->borrower_id = $saving->borrower_id;
        $savings_transaction->amount = $request->amount;
        $savings_transaction->savings_id = $saving->id;
        $savings_transaction->branch_id = session('branch_id');
        $savings_transaction->type = 'withdrawal';
        $savings_transaction->date = $request->date;
        $savings_transaction->time = $request->time;
        $date = explode('-', $request->date);
        $savings_transaction->year = $date[0];
        $savings_transaction->month = $date[1];
        if (empty($request->notes)) {
            $savings_transaction->notes = "Transferred amount to <a href='" . url('loan/' . $request->loan_id . '/show') . "''>Loan #" . $request->loan_id . "</a>";

        } else {
            $savings_transaction->notes = $request->notes;
        }

        $savings_transaction->save();
        //store the loan payment
        $repayment = new LoanRepayment();
        $repayment->user_id = Sentinel::getUser()->id;
        $repayment->amount = $request->amount;
        $repayment->loan_id = $request->loan_id;
        $repayment->branch_id = session('branch_id');
        $repayment->borrower_id = $saving->borrower_id;
        $repayment->collection_date = $request->date;
        // $repayment->repayment_method_id = $request->repayment_method_id;
        $repayment->notes = $request->notes;
        $date = explode('-', $request->date);
        $repayment->year = $date[0];
        $repayment->month = $date[1];
        //determine which schedule due date the payment applies too
        $schedule = LoanSchedule::where('due_date', '>=', $request->date)->where('loan_id',
            $request->loan_id)->orderBy('due_date',
            'asc')->first();
        if (!empty($schedule)) {
            $repayment->due_date = $schedule->due_date;
        } else {
            $schedule = LoanSchedule::where('loan_id',
                $request->loan_id)->orderBy('due_date',
                'desc')->first();
            if ($request->date > $schedule->due_date) {
                $repayment->due_date = $schedule->due_date;
            } else {
                $schedule = LoanSchedule::where('due_date', '>', $request->date)->where('loan_id',
                    $request->loan_id)->orderBy('due_date',
                    'asc')->first();
                $repayment->due_date = $schedule->due_date;
            }

        }
        $repayment->save();
        $loan = Loan::find($request->loan_id);
        if ($request->apply_penalty == 1) {
            if (!empty($loan->loan_product)) {
                if ($loan->loan_product->enable_late_repayment_penalty == 1) {
                    $schedules = LoanSchedule::where('due_date', '<',
                        $repayment->due_date)->where('missed_penalty_applied',
                        0)->orderBy('due_date', 'asc')->get();
                    foreach ($schedules as $schedule) {
                        if (GeneralHelper::loan_total_due_period($loan->id,
                                $schedule->due_date) > GeneralHelper::loan_total_paid_period($loan->id,
                                $schedule->due_date)
                        ) {
                            $sch = LoanSchedule::find($schedule->id);
                            $sch->missed_penalty_applied = 1;
                            //determine which amount to use
                            if ($loan->loan_product->late_repayment_penalty_type == "fixed") {
                                $sch->penalty = $sch->penalty + $loan->loan_product->late_repayment_penalty_amount;
                            } else {
                                if ($loan->loan_product->late_repayment_penalty_calculate == 'overdue_principal') {
                                    $principal = (GeneralHelper::loan_total_principal($loan->id,
                                            $schedule->due_date) - GeneralHelper::loan_paid_item($loan->id,
                                            'principal', $schedule->due_date));
                                    $sch->penalty = $sch->penalty + (($loan->loan_product->late_repayment_penalty_amount / 100) * $principal);
                                }
                                if ($loan->loan_product->late_repayment_penalty_calculate == 'overdue_principal_interest') {
                                    $principal = (GeneralHelper::loan_total_principal($loan->id,
                                            $schedule->due_date) + GeneralHelper::loan_total_interest($loan->id,
                                            $schedule->due_date) - GeneralHelper::loan_paid_item($loan->id,
                                            'principal',
                                            $schedule->due_date) - GeneralHelper::loan_paid_item($loan->id,
                                            'interest', $schedule->due_date));
                                    $sch->penalty = $sch->penalty + (($loan->loan_product->late_repayment_penalty_amount / 100) * $principal);
                                }
                                if ($loan->loan_product->late_repayment_penalty_calculate == 'overdue_principal_interest_fees') {
                                    $principal = (GeneralHelper::loan_total_principal($loan->id,
                                            $schedule->due_date) + GeneralHelper::loan_total_interest($loan->id,
                                            $schedule->due_date) + GeneralHelper::loan_total_fees($loan->id,
                                            $schedule->due_date) - GeneralHelper::loan_paid_item($loan->id,
                                            'principal',
                                            $schedule->due_date) - GeneralHelper::loan_paid_item($loan->id,
                                            'interest',
                                            $schedule->due_date) - GeneralHelper::loan_paid_item($loan->id, 'fees',
                                            $schedule->due_date));
                                    $sch->penalty = $sch->penalty + (($loan->loan_product->late_repayment_penalty_amount / 100) * $principal);
                                }
                                if ($loan->loan_product->late_repayment_penalty_calculate == 'total_overdue') {
                                    $principal = (GeneralHelper::loan_total_due_amount($loan->id,
                                            $schedule->due_date) - GeneralHelper::loan_total_paid($loan->id,
                                            $schedule->due_date));
                                    $sch->penalty = $sch->penalty + (($loan->loan_product->late_repayment_penalty_amount / 100) * $principal);
                                }
                            }
                            $sch->save();
                        }
                    }
                }
            }
        }
        Flash::success(trans('general.successfully_saved'));
        return redirect('saving/' . $saving->id . '/show');
    }
}

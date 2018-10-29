<?php

namespace App\Http\Controllers;

use App\Helpers\GeneralHelper;
use App\Models\Borrower;
use App\Models\CustomFieldMeta;
use App\Models\Guarantor;
use App\Models\Loan;
use App\Models\LoanApplication;
use App\Models\LoanProduct;
use App\Models\LoanRepayment;
use App\Models\LoanSchedule;
use App\Models\Saving;
use App\Models\SavingTransaction;
use App\Models\Setting;
use PDF;
use Illuminate\Http\Request;

use App\Http\Requests;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\View;
use Laracasts\Flash\Flash;

class ClientController extends Controller
{
    public function __construct(Request $request)
    {
        if (!$request->session()->has('uid')) {
            //user is logged in
            return redirect('client');
        }
    }

    public function clientDashboard(Request $request)
    {
        if ($request->session()->has('uid')) {
            $borrower = Borrower::find($request->session()->get('uid'));
            return view('client.dashboard', compact('borrower'));
        }
        return view('client_login');

    }

    public function clientProfile(Request $request)
    {
        if ($request->session()->has('uid')) {
            $borrower = Borrower::find($request->session()->get('uid'));
            return view('client.profile', compact('borrower'));
        }
        return view('client_login');

    }

    public function processClientProfile(Request $request)
    {
        if ($request->session()->has('uid')) {
            $rules = array(
                'repeatpassword' => 'required|same:password',
                'password' => 'required'
            );
            $validator = Validator::make(Input::all(), $rules);
            if ($validator->fails()) {
                Flash::warning('Passwords do not match');
                return redirect()->back()->withInput()->withErrors($validator);

            } else {
                $borrower = Borrower::find($request->session()->get('uid'));
                $borrower->password = md5($request->password);
                $borrower->save();
                Flash::success('Successfully Saved');
                return redirect('client_dashboard')->with('msg', "Successfully Saved");
            }
            $borrower = Borrower::find($request->session()->get('uid'));
            return view('client.profile', compact('borrower'));
        }
        return view('client_login');

    }

    public function processClientRegister(Request $request)
    {
        if (Setting::where('setting_key', 'allow_self_registration')->first()->setting_value == 1) {
            $rules = array(
                'repeatpassword' => 'required|same:password|min:6',
                'password' => 'required|min:6',
                'first_name' => 'required',
                'last_name' => 'required',
                'gender' => 'required',
                'email' => 'required|email',
                'dob' => 'required',
                'username' => 'unique:borrowers',
            );
            $validator = Validator::make(Input::all(), $rules);
            if ($validator->fails()) {
                Flash::warning('Validation errors occurred');
                return redirect()->back()->withInput()->withErrors($validator);

            } else {
                $borrower = new Borrower();
                $borrower->first_name = $request->first_name;
                $borrower->last_name = $request->last_name;
                $borrower->gender = $request->gender;
                $borrower->mobile = $request->mobile;
                $borrower->email = $request->email;
                $borrower->dob = $request->dob;
                $borrower->files = serialize(array());
                $borrower->working_status = $request->working_status;
                if (Setting::where('setting_key', 'client_auto_activate_account')->first()->setting_value == 1) {
                    $borrower->active = 1;
                } else {
                    $borrower->active = 0;
                }
                $borrower->source = 'online';
                $borrower->username = $request->username;
                $borrower->password = md5($request->password);
                $date = explode('-', date("Y-m-d"));
                $borrower->year = $date[0];
                $borrower->month = $date[1];
                $borrower->save();
                if ($borrower->active == 1) {
                    $request->session()->put('uid', $borrower->id);
                    Flash::success(trans('general.successfully_registered_logged_in'));
                    return redirect('client')->with('msg', trans('general.logged_in'));
                }
                Flash::success(trans('general.successfully_registered'));
                return redirect('client')->with('msg', trans('general.successfully_registered'));
            }
        } else {
            Flash::success("Registration disabled");
            return redirect()->back();
        }
    }

    public function indexApplication(Request $request)
    {

        $data = LoanApplication::where('borrower_id', $request->session()->has('uid'))->get();
        $borrower = Borrower::find($request->session()->get('uid'));
        return view('client.applications', compact('data', 'borrower'));
    }

    public function createApplication(Request $request)
    {
        $products = array();
        foreach (LoanProduct::all() as $key) {
            $products[$key->id] = $key->name . '(' . round($key->minimum_principal) . '-' . round($key->maximum_principal) . ')';
        }
        $borrower = Borrower::find($request->session()->get('uid'));
        return view('client.apply', compact('borrower', 'products'));
    }

    public function storeApplication(Request $request)
    {

        $application = new LoanApplication();
        $application->status = "pending";
        $application->loan_product_id = $request->loan_product_id;
        $application->borrower_id = $request->session()->get('uid');
        $application->amount = $request->amount;
        $application->save();
        Flash::success(trans_choice('general.successfully_saved', 1));
        return redirect('client/application/' . $application->id . '/show');
    }

    public function showApplication(Request $request, $loan_application)
    {
        $borrower = Borrower::find($request->session()->get('uid'));
        return view('client.show_application', compact('loan_application', 'borrower'));
    }

    public function createGuarantor(Request $request, $loan_application)
    {
        $borrower = Borrower::find($request->session()->get('uid'));
        $borrowers = array();
        foreach (Borrower::all() as $key) {
            $borrowers[$key->id] = $key->first_name . ' ' . $key->last_name . '(' . $key->unique_number . ')';
        }
        return view('client.create_guarantor', compact('loan_application', 'borrower', 'borrowers'));
    }

    public function storeGuarantor(Request $request, $loan_application)
    {
        $guarantor = new Guarantor();
        $guarantor->loan_application_id = $loan_application->id;
        $guarantor->borrower_id = $loan_application->borrower_id;
        $guarantor->guarantor_id = $request->guarantor_id;
        $guarantor->amount = $request->amount;
        $guarantor->date = date("Y-m-d");
        $guarantor->save();
        Flash::success(trans_choice('general.successfully_saved', 1));
        return redirect('client/application/' . $loan_application->id . '/show');
    }

    public function acceptGuarantor(Request $request, $id)
    {
        $guarantor = Guarantor::find($id);
        if ($guarantor->guarantor_id != $request->session()->get('uid')) {
            Flash::warning(trans_choice('general.identity_error', 1));
            return redirect()->back();
        }
        $guarantor->status = "accepted";
        $guarantor->accepted_amount = $request->amount;
        $guarantor->save();
        Flash::success(trans_choice('general.successfully_saved', 1));
        return redirect()->back();
    }

    public function indexGuarantor(Request $request)
    {
        $borrower = Borrower::find($request->session()->get('uid'));
        $data = Guarantor::where('guarantor_id', $borrower->id)->get();
        return view('client.index_guarantor', compact('borrower', 'data'));
    }

    public function showSaving(Request $request)
    {
        $borrower = Borrower::find($request->session()->get('uid'));
        if (empty(Saving::where('borrower_id', $borrower->id)->first())) {
            Flash::warning(trans_choice('general.no_saving_account', 1));
            return redirect()->back();
        }
        $saving = Saving::where('borrower_id', $borrower->id)->first();
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
        return view('client.show_saving', compact('borrower', 'saving', 'transactions'));
    }

    public function printSavingStatement($saving)
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
        $custom_fields = CustomFieldMeta::where('category', 'borrowers')->where('parent_id',
            $saving->borrwer_id)->get();
        return view('saving.print', compact('saving', 'custom_fields', 'transactions'));
    }

    public function pdfSavingStatement($saving)
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
        $custom_fields = CustomFieldMeta::where('category', 'borrowers')->where('parent_id',
            $saving->borrwer_id)->get();
        PDF::AddPage();
        PDF::writeHTML(View::make('saving.pdf_statement',
            compact('saving', 'custom_fields', 'transactions'))->render());
        PDF::SetAuthor('Tererai Mugova');
        PDF::Output($saving->borrower->title . ' ' . $saving->borrower->first_name . ' ' . $saving->borrower->last_name . " - Savings Statement.pdf",
            'D');

    }

    public function paySaving(Request $request, $saving)
    {
        if ($request->session()->has('uid') != $saving->borrower_id) {
            //user is trying to view wrong loan
            return redirect('client');
        }

        $borrower = Borrower::find($request->session()->get('uid'));
        $methods = array();
        if (Setting::where('setting_key',
                'paypal_enabled')->first()->setting_value == 1 && !empty(Setting::where('setting_key',
                'paypal_email')->first()->setting_value)
        ) {
            $methods["paypal"] = 'Paypal';
        }
        if (Setting::where('setting_key',
                'paynow_enabled')->first()->setting_value == 1 && !empty(Setting::where('setting_key',
                'paynow_key')->first()->setting_value) && !empty(Setting::where('setting_key',
                'paynow_id')->first()->setting_value)
        ) {
            $methods["paynow"] = 'Paynow';
        }
        return view('client.pay_saving', compact('borrower', 'saving', 'methods'));
    }

    public function paynowSaving(Request $request, $saving)
    {

        $values = array(
            "id" => Setting::where('setting_key', 'paynow_id')->first()->setting_value,
            "reference" => $saving->id,
            "amount" => $request->amount,
            "returnurl" => url('clients/saving/' . $saving->id . '/pay/paynow/return'),
            "resulturl" => url('clients/saving/' . $saving->id . '/pay/paynow/result'),
            "status" => "Message"
        );
        //generate hash
        $string = "";
        foreach ($values as $key => $value) {
            $string .= $value;
        }
        $integrationkey = Setting::where('setting_key', 'paynow_key')->first()->setting_value;
        $string .= $integrationkey;
        $hash = hash("sha512", $string);
        $values['hash'] = strtoupper($hash);
        $ch = curl_init();
        $url = "https://www.paynow.co.zw/Interface/InitiateTransaction";
        // 2. set the options, including the url
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $values);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_HEADER, 0);

// 3. execute and fetch the resulting HTML output
        $output = curl_exec($ch);
        if ($output) {
            $parts = explode("&", $output);
            $result = array();
            foreach ($parts as $i => $value) {
                $bits = explode("=", $value, 2);
                $result[$bits[0]] = urldecode($bits[1]);
            }
            curl_close($ch);
            //print_r($result);
            if ($result['status'] == 'Ok') {
                Flash::success("Success");
                return redirect($result['browserurl']);
            } else {
                Flash::warning("There was an error processing your request. Please try again");
                return redirect()->back();
            }
        } else {
            Flash::warning("There was an error processing your request. Please try again" . curl_error($ch));
            return redirect()->back();
        }
    }

    public function paynowReturnSaving(Request $request)
    {
        $status = $request->status;
        if ($status == "Paid" || $status = "Awaiting Delivery" || $status = "Delivered") {
            Flash::success(trans("general.payment_success"));
            return redirect('client/saving/show');
        } else {
            //payment was unsuccessful
            Flash::warning("There was an error processing your payment");
            return redirect('client/saving/show');
        }

    }

    public function paynowResultSaving(Request $request, $saving)
    {
        $status = $request->status;
        if ($status == "Paid" || $status = "Awaiting Delivery" || $status = "Delivered") {
            //payment successful update database and show download

            $savings_transaction = new SavingTransaction();
            $savings_transaction->borrower_id = $saving->borrower_id;
            $savings_transaction->amount = $request->amount;
            $savings_transaction->savings_id = $saving->id;
            $savings_transaction->type = "deposit";
            $savings_transaction->date = date("Y-m-d");
            $savings_transaction->time = date("H:i");
            $date = explode('-', date("Y-m-d"));
            $savings_transaction->year = $date[0];
            $savings_transaction->month = $date[1];
            $savings_transaction->notes = $request->paynowreference;
            $savings_transaction->save();
        } else {
            //payment was unsuccessful
        }

    }

    public function paypalDoneSaving(Request $request, $saving)
    {


        // Thank the user for the purchase
        Flash::success(trans('general.payment_success'));
        return redirect('client/saving/show');
    }

    public function paypalCancelSaving(Request $request, $saving)
    {
        // Curse and humiliate the user for cancelling this most sacred payment (yours)
        Flash::warning(trans('general.payment_cancel'));
        return redirect('client/saving/show');
    }

    public function paypalIPNSaving(Request $request)
    {
        // read the post from PayPal system and add 'cmd'
        $req = 'cmd=_notify-validate';
        foreach ($_POST as $key => $value) {
            $value = urlencode(stripslashes($value));
            $req .= "&$key=$value";
        }
// post back to PayPal system to validate
        $header = "POST /cgi-bin/webscr HTTP/1.0\r\n";
        $header .= "Content-Type: application/x-www-form-urlencoded\r\n";
        $header .= "Content-Length: " . strlen($req) . "\r\n\r\n";

        $fp = fsockopen('ssl://www.paypal.com', 443, $errno, $errstr, 30);


        if (!$fp) {
// HTTP ERROR
        } else {
            fputs($fp, $header . $req);
            while (!feof($fp)) {
                $res = fgets($fp, 1024);
                if (strcmp($res, "VERIFIED") == 0) {

// PAYMENT VALIDATED & VERIFIED!
                    $item_name = $request['item_name'];
                    $item_number = $request['item_number'];
                    $payment_status = $request['payment_status'];
                    $payment_amount = $request['mc_gross'];
                    $payment_currency = $request['mc_currency'];
                    $txn_id = $request['txn_id'];
                    $receiver_email = $request['receiver_email'];
                    $payer_email = $request['payer_email'];
                    $notes = 'Paypal: txn_id=' . $txn_id . '.<br>Payer Email:' . $payer_email . '.<br>Currency:' . $payment_currency;
                    if ($payment_status == 'Completed' || $payment_status == 'Processed' || $payment_status == 'Sent' || $payment_status == 'Pending') {
                        $saving = Saving::find($item_number);
                        $savings_transaction = new SavingTransaction();
                        $savings_transaction->borrower_id = $saving->borrower_id;
                        $savings_transaction->amount = $payment_amount;
                        $savings_transaction->savings_id = $saving->id;
                        $savings_transaction->type = "deposit";
                        $savings_transaction->date = date("Y-m-d");
                        $savings_transaction->time = date("H:i");
                        $date = explode('-', date("Y-m-d"));
                        $savings_transaction->year = $date[0];
                        $savings_transaction->month = $date[1];
                        $savings_transaction->notes = $notes;
                        $savings_transaction->save();


                        //notify admin


                        //notify client that we have received payment
                    }

                } else {
                    if (strcmp($res, "INVALID") == 0) {

// PAYMENT INVALID & INVESTIGATE MANUALY!
                        //notify admin that payment was unsuccessful

                    }
                }
            }
            fclose($fp);
        }
    }

    public function showLoan(Request $request, $loan)
    {
        if ($request->session()->has('uid') != $loan->borrower_id) {
            //user is trying to view wrong loan
            return redirect('client');
        }
        $borrower = Borrower::find($request->session()->get('uid'));

        $schedules = LoanSchedule::where('loan_id', $loan->id)->orderBy('due_date', 'asc')->get();
        $payments = LoanRepayment::where('loan_id', $loan->id)->orderBy('collection_date', 'asc')->get();
        $custom_fields = CustomFieldMeta::where('category', 'loans')->where('parent_id', $loan->id)->get();
        return view('client.show_loan', compact('borrower', 'loan', 'schedules', 'payments', 'custom_fields'));
    }

    public function pay(Request $request, $loan)
    {
        if ($request->session()->has('uid') != $loan->borrower_id) {
            //user is trying to view wrong loan
            return redirect('client');
        }
        $due_date = GeneralHelper::determine_due_date($loan->id, date("Y-m-d"));
        $owing = GeneralHelper::loan_total_principal($loan->id,
                $due_date) + GeneralHelper::loan_total_interest($loan->id,
                $due_date) + GeneralHelper::loan_total_fees($loan->id,
                $due_date) + GeneralHelper::loan_total_penalty($loan->id, $due_date);
        $paid = GeneralHelper::loan_total_paid($loan->id, $due_date);
        if ($owing > $paid) {
            $balance = $owing - $paid;
        } else {
            $balance = 0;
        }
        $borrower = Borrower::find($request->session()->get('uid'));
        $methods = array();
        if (Setting::where('setting_key',
                'paypal_enabled')->first()->setting_value == 1 && !empty(Setting::where('setting_key',
                'paypal_email')->first()->setting_value)
        ) {
            $methods["paypal"] = 'Paypal';
        }
        if (Setting::where('setting_key',
                'paynow_enabled')->first()->setting_value == 1 && !empty(Setting::where('setting_key',
                'paynow_key')->first()->setting_value) && !empty(Setting::where('setting_key',
                'paynow_id')->first()->setting_value)
        ) {
            $methods["paynow"] = 'Paynow';
        }

        return view('client.pay', compact('borrower', 'loan', 'balance', 'methods'));
    }

    public function paynow(Request $request, $loan)
    {

        $values = array(
            "id" => Setting::where('setting_key', 'paynow_id')->first()->setting_value,
            "reference" => $loan->id,
            "amount" => $request->amount,
            "returnurl" => url('clients/loan/' . $loan->id . '/pay/paynow/return'),
            "resulturl" => url('clients/loan/' . $loan->id . '/pay/paynow/result'),
            "status" => "Message"
        );
        //generate hash
        $string = "";
        foreach ($values as $key => $value) {
            $string .= $value;
        }
        $integrationkey = Setting::where('setting_key', 'paynow_key')->first()->setting_value;
        $string .= $integrationkey;
        $hash = hash("sha512", $string);
        $values['hash'] = strtoupper($hash);
        $ch = curl_init();
        $url = "https://www.paynow.co.zw/Interface/InitiateTransaction";
        // 2. set the options, including the url
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $values);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($ch, CURLOPT_HEADER, 0);

// 3. execute and fetch the resulting HTML output
        $output = curl_exec($ch);
        if ($output) {
            $parts = explode("&", $output);
            $result = array();
            foreach ($parts as $i => $value) {
                $bits = explode("=", $value, 2);
                $result[$bits[0]] = urldecode($bits[1]);
            }
            curl_close($ch);
            //print_r($result);
            if ($result['status'] == 'Ok') {
                Flash::success("Success");
                return redirect($result['browserurl']);
            } else {
                Flash::warning("There was an error processing your request. Please try again");
                return redirect()->back();
            }
        } else {
            Flash::warning("There was an error processing your request. Please try again" . curl_error($ch));
            return redirect()->back();
        }
    }

    public function paynowReturn(Request $request, $loan)
    {
        $status = $request->status;
        if ($status == "Paid" || $status = "Awaiting Delivery" || $status = "Delivered") {
            Flash::success(trans("general.payment_success"));
            return redirect('client/loan/' . $loan->id . '/show');
        } else {
            //payment was unsuccessful
            Flash::warning("There was an error processing your payment");
            return redirect('client/loan/' . $loan->id . '/show');
        }

    }

    public function paynowResult(Request $request, $loan)
    {
        $status = $request->status;
        if ($status == "Paid" || $status = "Awaiting Delivery" || $status = "Delivered") {
            //payment successful update database and show download
            $repayment = new LoanRepayment();
            $repayment->amount = $request->amount;
            $repayment->loan_id = $loan->id;
            $repayment->borrower_id = $loan->borrower_id;
            $repayment->collection_date = date("Y-m-d");
            $repayment->notes = $request->paynowreference;
            $date = explode('-', date("Y-m-d"));
            $repayment->year = $date[0];
            $repayment->month = $date[1];
            //determine which schedule due date the payment applies too
            $schedule = LoanSchedule::where('due_date', '>=', date("Y-m-d"))->where('loan_id',
                $loan->id)->orderBy('due_date',
                'asc')->first();
            if (!empty($schedule)) {
                $repayment->due_date = $schedule->due_date;
            } else {
                $schedule = LoanSchedule::where('loan_id',
                    $loan->id)->orderBy('due_date',
                    'desc')->first();
                if ($request->collection_date > $schedule->due_date) {
                    $repayment->due_date = $schedule->due_date;
                } else {
                    $schedule = LoanSchedule::where('due_date', '>', date("Y-m-d"))->where('loan_id',
                        $loan->id)->orderBy('due_date',
                        'asc')->first();
                    $repayment->due_date = $schedule->due_date;
                }

            }
            $repayment->save();
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
        } else {
            //payment was unsuccessful
        }

    }

    public function paypalDone(Request $request, $loan)
    {


        // Thank the user for the purchase
        Flash::success(trans('general.payment_success'));
        return redirect('client/loan/' . $loan->id . '/show');
    }

    public function paypalCancel(Request $request, $loan)
    {
        // Curse and humiliate the user for cancelling this most sacred payment (yours)
        Flash::warning(trans('general.payment_cancel'));
        return redirect('client/loan/' . $loan->id . '/show');
    }

    public function paypalIPN(Request $request)
    {
        // read the post from PayPal system and add 'cmd'
        $req = 'cmd=_notify-validate';
        foreach ($_POST as $key => $value) {
            $value = urlencode(stripslashes($value));
            $req .= "&$key=$value";
        }
// post back to PayPal system to validate
        $header = "POST /cgi-bin/webscr HTTP/1.0\r\n";
        $header .= "Content-Type: application/x-www-form-urlencoded\r\n";
        $header .= "Content-Length: " . strlen($req) . "\r\n\r\n";

        $fp = fsockopen('ssl://www.paypal.com', 443, $errno, $errstr, 30);


        if (!$fp) {
// HTTP ERROR
        } else {
            fputs($fp, $header . $req);
            while (!feof($fp)) {
                $res = fgets($fp, 1024);
                if (strcmp($res, "VERIFIED") == 0) {

// PAYMENT VALIDATED & VERIFIED!
                    $item_name = $request['item_name'];
                    $item_number = $request['item_number'];
                    $payment_status = $request['payment_status'];
                    $payment_amount = $request['mc_gross'];
                    $payment_currency = $request['mc_currency'];
                    $txn_id = $request['txn_id'];
                    $receiver_email = $request['receiver_email'];
                    $payer_email = $request['payer_email'];
                    $notes = 'Paypal: txn_id=' . $txn_id . '.<br>Payer Email:' . $payer_email . '.<br>Currency:' . $payment_currency;
                    if ($payment_status == 'Completed' || $payment_status == 'Processed' || $payment_status == 'Sent' || $payment_status == 'Pending') {
                        $loan = Loan::find($item_number);
                        $repayment = new LoanRepayment();
                        $repayment->amount = $payment_amount;
                        $repayment->loan_id = $loan->id;
                        $repayment->borrower_id = $loan->borrower_id;
                        $repayment->collection_date = date("Y-m-d");
                        $repayment->notes = $notes;
                        $date = explode('-', date("Y-m-d"));
                        $repayment->year = $date[0];
                        $repayment->month = $date[1];
                        //determine which schedule due date the payment applies too
                        $schedule = LoanSchedule::where('due_date', '>=', date("Y-m-d"))->where('loan_id',
                            $loan->id)->orderBy('due_date',
                            'asc')->first();
                        if (!empty($schedule)) {
                            $repayment->due_date = $schedule->due_date;
                        } else {
                            $schedule = LoanSchedule::where('loan_id',
                                $loan->id)->orderBy('due_date',
                                'desc')->first();
                            if ($request->collection_date > $schedule->due_date) {
                                $repayment->due_date = $schedule->due_date;
                            } else {
                                $schedule = LoanSchedule::where('due_date', '>', date("Y-m-d"))->where('loan_id',
                                    $loan->id)->orderBy('due_date',
                                    'asc')->first();
                                $repayment->due_date = $schedule->due_date;
                            }

                        }
                        $repayment->save();
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
                                                    $schedule->due_date) - GeneralHelper::loan_paid_item($loan->id,
                                                    'fees',
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
                        //notify admin


                        //notify client that we have received payment
                    }

                } else {
                    if (strcmp($res, "INVALID") == 0) {

// PAYMENT INVALID & INVESTIGATE MANUALY!
                        //notify admin that payment was unsuccessful

                    }
                }
            }
            fclose($fp);
        }
    }
}

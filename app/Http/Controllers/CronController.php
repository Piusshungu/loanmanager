<?php

namespace App\Http\Controllers;

use Aloha\Twilio\Twilio;
use App\Helpers\GeneralHelper;
use App\Helpers\Infobip;
use App\Helpers\RouteSms;
use App\Models\CustomField;
use App\Models\CustomFieldMeta;
use App\Models\Email;
use App\Models\Expense;
use App\Models\Loan;
use App\Models\LoanRepayment;
use App\Models\LoanSchedule;
use App\Models\Payroll;
use App\Models\PayrollMeta;
use App\Models\PayrollTemplateMeta;
use App\Models\Saving;
use App\Models\SavingProduct;
use App\Models\SavingTransaction;
use App\Models\Setting;
use App\Models\Sms;
use Cartalyst\Sentinel\Laravel\Facades\Reminder;
use Cartalyst\Sentinel\Laravel\Facades\Sentinel;
use Clickatell\Rest;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\View;
use Laracasts\Flash\Flash;
use PDF;
use Illuminate\Http\Request;
use Cartalyst\Sentinel\Laravel\Facades\Activation;
use App\Http\Requests;

class CronController extends Controller
{
    public function __construct()
    {

    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if (Setting::where('setting_key', 'enable_cron')->first()->setting_value == 0) {
            //someone attempted to run con job but it is disabled
            Mail::raw('Someone attempted to run con job but it is disabled, please enable it in settings',
                function ($message) {
                    $message->from(Setting::where('setting_key', 'company_email')->first()->setting_value,
                        Setting::where('setting_key', 'company_name')->first()->setting_value);
                    $message->to(Setting::where('setting_key', 'company_email')->first()->setting_value);
                    $headers = $message->getHeaders();
                    $message->setContentType('text/html');
                    $message->setSubject('Cron Job Failed');

                });
            return 'cron job disabled';
        } else {
            //check for upcoming payments
            //send via email
            if (Setting::where('setting_key', 'auto_repayment_email_reminder')->first()->setting_value == 1) {
                $days = Setting::where('setting_key', 'auto_repayment_days')->first()->setting_value;
                $due_date = date_format(date_add(date_create(date("Y-m-d")),
                    date_interval_create_from_date_string($days . ' days')),
                    'Y-m-d');
                $schedules = LoanSchedule::where('due_date', $due_date)->get();
                foreach ($schedules as $schedule) {
                    //check if borrower has email
                    if (!empty($schedule->borrower->email)) {
                        $borrower = $schedule->borrower;
                        $loan = $schedule->loan;
                        $body = Setting::where('setting_key',
                            'loan_payment_reminder_email_template')->first()->setting_value;
                        $body = str_replace('{borrowerTitle}', $borrower->title, $body);
                        $body = str_replace('{borrowerFirstName}', $borrower->first_name, $body);
                        $body = str_replace('{borrowerLastName}', $borrower->last_name, $body);
                        $body = str_replace('{borrowerAddress}', $borrower->address, $body);
                        $body = str_replace('{borrowerUniqueNumber}', $borrower->unique_number, $body);
                        $body = str_replace('{borrowerMobile}', $borrower->mobile, $body);
                        $body = str_replace('{borrowerPhone}', $borrower->phone, $body);
                        $body = str_replace('{borrowerEmail}', $borrower->email, $body);
                        $body = str_replace('{loanNumber}', $loan->id, $body);
                        $body = str_replace('{paymentAmount}',
                            round(($schedule->principal + $schedule->interest + $schedule->fees + $schedule->penalty),
                                2), $body);
                        $body = str_replace('{paymentDate}', $schedule->due_date, $body);
                        $body = str_replace('{loanPayments}', GeneralHelper::loan_total_paid($loan->id), $body);
                        $body = str_replace('{loanDue}',
                            round(GeneralHelper::loan_total_due_amount($loan->id), 2), $body);
                        $body = str_replace('{loanBalance}',
                            round((GeneralHelper::loan_total_due_amount($loan->id) - GeneralHelper::loan_total_paid($loan->id)),
                                2), $body);
                        Mail::raw($body, function ($message) use ($borrower, $loan) {
                            $message->from(Setting::where('setting_key', 'company_email')->first()->setting_value,
                                Setting::where('setting_key', 'company_name')->first()->setting_value);
                            $message->to($borrower->email);
                            $headers = $message->getHeaders();
                            $message->setContentType('text/html');
                            $message->setSubject(Setting::where('setting_key',
                                'loan_payment_reminder_subject')->first()->setting_value);
                        });
                        $mail = new Email();
                        //$mail->user_id = Sentinel::getUser()->id;
                        $mail->message = $body;
                        $mail->subject = Setting::where('setting_key',
                            'loan_payment_reminder_subject')->first()->setting_value;
                        $mail->recipients = 1;
                        $mail->send_to = $borrower->first_name . ' ' . $borrower->last_name . '(' . $borrower->unique_number . ')';
                        $mail->save();
                    }
                }
            }
            //send via sms
            if (Setting::where('setting_key', 'auto_repayment_sms_reminder')->first()->setting_value == 1) {
                $days = Setting::where('setting_key', 'auto_repayment_days')->first()->setting_value;
                $due_date = date_format(date_add(date_create(date("Y-m-d")),
                    date_interval_create_from_date_string($days . ' days')),
                    'Y-m-d');
                $schedules = LoanSchedule::where('due_date', $due_date)->get();
                foreach ($schedules as $schedule) {
                    //check if borrower has email
                    if (!empty($schedule->borrower->email)) {
                        $borrower = $schedule->borrower;
                        $loan = $schedule->loan;
                        $body = Setting::where('setting_key',
                            'loan_payment_reminder_email_template')->first()->setting_value;
                        $body = str_replace('{borrowerTitle}', $borrower->title, $body);
                        $body = str_replace('{borrowerFirstName}', $borrower->first_name, $body);
                        $body = str_replace('{borrowerLastName}', $borrower->last_name, $body);
                        $body = str_replace('{borrowerAddress}', $borrower->address, $body);
                        $body = str_replace('{borrowerUniqueNumber}', $borrower->unique_number, $body);
                        $body = str_replace('{borrowerMobile}', $borrower->mobile, $body);
                        $body = str_replace('{borrowerPhone}', $borrower->phone, $body);
                        $body = str_replace('{borrowerEmail}', $borrower->email, $body);
                        $body = str_replace('{loanNumber}', $loan->id, $body);
                        $body = str_replace('{paymentAmount}',
                            round(($schedule->principal + $schedule->interest + $schedule->fees + $schedule->penalty),
                                2), $body);
                        $body = str_replace('{paymentDate}', $schedule->due_date, $body);
                        $body = str_replace('{loanPayments}', GeneralHelper::loan_total_paid($loan->id), $body);
                        $body = str_replace('{loanDue}',
                            round(GeneralHelper::loan_total_due_amount($loan->id), 2), $body);
                        $body = str_replace('{loanBalance}',
                            round((GeneralHelper::loan_total_due_amount($loan->id) - GeneralHelper::loan_total_paid($loan->id)),
                                2), $body);
                        if (!empty($borrower->mobile)) {
                            $active_sms = Setting::where('setting_key', 'active_sms')->first()->setting_value;
                            if ($active_sms == 'twilio') {
                                $twilio = new Twilio(Setting::where('setting_key',
                                    'twilio_sid')->first()->setting_value,
                                    Setting::where('setting_key', 'twilio_token')->first()->setting_value,
                                    Setting::where('setting_key', 'twilio_phone_number')->first()->setting_value);
                                $twilio->message('+' . $borrower->mobile, $body);
                            }
                            if ($active_sms == 'routesms') {
                                $host = Setting::where('setting_key', 'routesms_host')->first()->setting_value;
                                $port = Setting::where('setting_key', 'routesms_port')->first()->setting_value;
                                $username = Setting::where('setting_key',
                                    'routesms_username')->first()->setting_value;
                                $password = Setting::where('setting_key',
                                    'routesms_password')->first()->setting_value;
                                $sender = Setting::where('setting_key', 'sms_sender')->first()->setting_value;
                                $SMSText = $body;
                                $GSM = $borrower->mobile;
                                $msgtype = 2;
                                $dlr = 1;
                                $routesms = new RouteSms($host, $port, $username, $password, $sender, $SMSText,
                                    $GSM, $msgtype,
                                    $dlr);
                                $routesms->Submit();
                            }
                            if ($active_sms == 'clickatell') {
                                $clickatell = new Rest(Setting::where('setting_key',
                                    'clickatell_api_id')->first()->setting_value);
                                $response = $clickatell->sendMessage(array($borrower->mobile), $body);
                            }
                            if ($active_sms == 'infobip') {
                                $infobip = new Infobip(Setting::where('setting_key',
                                    'sms_sender')->first()->setting_value, $body,
                                    $borrower->mobile);
                            }
                            $sms = new Sms();
                            //$sms->user_id = Sentinel::getUser()->id;
                            $sms->message = $body;
                            $sms->gateway = $active_sms;
                            $sms->recipients = 1;
                            $sms->send_to = $borrower->first_name . ' ' . $borrower->last_name . '(' . $borrower->unique_number . ')';
                            $sms->save();

                        }
                    }
                }
            }
            //check for missed repayments
            //send via email
            if (Setting::where('setting_key', 'auto_overdue_repayment_email_reminder')->first()->setting_value == 1) {
                $days = Setting::where('setting_key', 'auto_overdue_repayment_days')->first()->setting_value;
                $due_date = date_format(date_sub(date_create(date("Y-m-d")),
                    date_interval_create_from_date_string($days . ' days')),
                    'Y-m-d');
                $schedules = LoanSchedule::where('due_date', $due_date)->get();
                foreach ($schedules as $schedule) {
                    //check if borrower has email
                    if (!empty($schedule->borrower->email)) {
                        $borrower = $schedule->borrower;
                        $loan = $schedule->loan;
                        $payments = LoanRepayment::where('loan_id', $loan->id)->where('due_date',
                            $schedule->due_date)->sum('amount');
                        if ($payments == 0) {
                            $body = Setting::where('setting_key',
                                'missed_payment_email_template')->first()->setting_value;
                            $body = str_replace('{borrowerTitle}', $borrower->title, $body);
                            $body = str_replace('{borrowerFirstName}', $borrower->first_name, $body);
                            $body = str_replace('{borrowerLastName}', $borrower->last_name, $body);
                            $body = str_replace('{borrowerAddress}', $borrower->address, $body);
                            $body = str_replace('{borrowerUniqueNumber}', $borrower->unique_number, $body);
                            $body = str_replace('{borrowerMobile}', $borrower->mobile, $body);
                            $body = str_replace('{borrowerPhone}', $borrower->phone, $body);
                            $body = str_replace('{borrowerEmail}', $borrower->email, $body);
                            $body = str_replace('{loanNumber}', $loan->id, $body);
                            $body = str_replace('{paymentAmount}',
                                round(($schedule->principal + $schedule->interest + $schedule->fees + $schedule->penalty),
                                    2), $body);
                            $body = str_replace('{paymentDate}', $schedule->due_date, $body);
                            $body = str_replace('{loanPayments}', GeneralHelper::loan_total_paid($loan->id), $body);
                            $body = str_replace('{loanDue}',
                                round(GeneralHelper::loan_total_due_amount($loan->id), 2), $body);
                            $body = str_replace('{loanBalance}',
                                round((GeneralHelper::loan_total_due_amount($loan->id) - GeneralHelper::loan_total_paid($loan->id)),
                                    2), $body);
                            Mail::raw($body, function ($message) use ($borrower, $loan) {
                                $message->from(Setting::where('setting_key', 'company_email')->first()->setting_value,
                                    Setting::where('setting_key', 'company_name')->first()->setting_value);
                                $message->to($borrower->email);
                                $headers = $message->getHeaders();
                                $message->setContentType('text/html');
                                $message->setSubject(Setting::where('setting_key',
                                    'missed_payment_email_subject')->first()->setting_value);
                            });
                            $mail = new Email();
                            //$mail->user_id = Sentinel::getUser()->id;
                            $mail->message = $body;
                            $mail->subject = Setting::where('setting_key',
                                'missed_payment_email_subject')->first()->setting_value;
                            $mail->recipients = 1;
                            $mail->send_to = $borrower->first_name . ' ' . $borrower->last_name . '(' . $borrower->unique_number . ')';
                            $mail->save();
                        } else {
                            //user has paid something
                        }
                    }
                }
            }
            //send via sms
            if (Setting::where('setting_key', 'auto_overdue_repayment_sms_reminder')->first()->setting_value == 1) {
                $days = Setting::where('setting_key', 'auto_overdue_repayment_days')->first()->setting_value;
                $due_date = date_format(date_sub(date_create(date("Y-m-d")),
                    date_interval_create_from_date_string($days . ' days')),
                    'Y-m-d');
                $schedules = LoanSchedule::where('due_date', $due_date)->get();
                foreach ($schedules as $schedule) {
                    //check if borrower has email
                    if (!empty($schedule->borrower->email)) {
                        $borrower = $schedule->borrower;
                        $loan = $schedule->loan;
                        $payments = LoanRepayment::where('loan_id', $loan->id)->where('due_date',
                            $schedule->due_date)->sum('amount');
                        if ($payments == 0) {
                            $body = Setting::where('setting_key',
                                'missed_payment_sms_template')->first()->setting_value;
                            $body = str_replace('{borrowerTitle}', $borrower->title, $body);
                            $body = str_replace('{borrowerFirstName}', $borrower->first_name, $body);
                            $body = str_replace('{borrowerLastName}', $borrower->last_name, $body);
                            $body = str_replace('{borrowerAddress}', $borrower->address, $body);
                            $body = str_replace('{borrowerUniqueNumber}', $borrower->unique_number, $body);
                            $body = str_replace('{borrowerMobile}', $borrower->mobile, $body);
                            $body = str_replace('{borrowerPhone}', $borrower->phone, $body);
                            $body = str_replace('{borrowerEmail}', $borrower->email, $body);
                            $body = str_replace('{loanNumber}', $loan->id, $body);
                            $body = str_replace('{paymentAmount}',
                                round(($schedule->principal + $schedule->interest + $schedule->fees + $schedule->penalty),
                                    2), $body);
                            $body = str_replace('{paymentDate}', $schedule->due_date, $body);
                            $body = str_replace('{loanPayments}', GeneralHelper::loan_total_paid($loan->id), $body);
                            $body = str_replace('{loanDue}',
                                round(GeneralHelper::loan_total_due_amount($loan->id), 2), $body);
                            $body = str_replace('{loanBalance}',
                                round((GeneralHelper::loan_total_due_amount($loan->id) - GeneralHelper::loan_total_paid($loan->id)),
                                    2), $body);
                            if (!empty($borrower->mobile)) {
                                $active_sms = Setting::where('setting_key', 'active_sms')->first()->setting_value;
                                if ($active_sms == 'twilio') {
                                    $twilio = new Twilio(Setting::where('setting_key',
                                        'twilio_sid')->first()->setting_value,
                                        Setting::where('setting_key', 'twilio_token')->first()->setting_value,
                                        Setting::where('setting_key', 'twilio_phone_number')->first()->setting_value);
                                    $twilio->message('+' . $borrower->mobile, $body);
                                }
                                if ($active_sms == 'routesms') {
                                    $host = Setting::where('setting_key', 'routesms_host')->first()->setting_value;
                                    $port = Setting::where('setting_key', 'routesms_port')->first()->setting_value;
                                    $username = Setting::where('setting_key',
                                        'routesms_username')->first()->setting_value;
                                    $password = Setting::where('setting_key',
                                        'routesms_password')->first()->setting_value;
                                    $sender = Setting::where('setting_key', 'sms_sender')->first()->setting_value;
                                    $SMSText = $body;
                                    $GSM = $borrower->mobile;
                                    $msgtype = 2;
                                    $dlr = 1;
                                    $routesms = new RouteSms($host, $port, $username, $password, $sender, $SMSText,
                                        $GSM, $msgtype,
                                        $dlr);
                                    $routesms->Submit();
                                }
                                if ($active_sms == 'clickatell') {
                                    $clickatell = new Rest(Setting::where('setting_key',
                                        'clickatell_api_id')->first()->setting_value);
                                    $response = $clickatell->sendMessage(array($borrower->mobile), $body);
                                }
                                if ($active_sms == 'infobip') {
                                    $infobip = new Infobip(Setting::where('setting_key',
                                        'sms_sender')->first()->setting_value, $body,
                                        $borrower->mobile);
                                }
                                $sms = new Sms();
                                //$sms->user_id = Sentinel::getUser()->id;
                                $sms->message = $body;
                                $sms->gateway = $active_sms;
                                $sms->recipients = 1;
                                $sms->send_to = $borrower->first_name . ' ' . $borrower->last_name . '(' . $borrower->unique_number . ')';
                                $sms->save();
                            }
                        } else {
                            //user has paid something
                        }
                    }
                }
            }
            //check for overdue loans
            //send via email
            if (Setting::where('setting_key', 'auto_overdue_loan_email_reminder')->first()->setting_value == 1) {
                $days = Setting::where('setting_key', 'auto_overdue_loan_days')->first()->setting_value;
                $due_date = date_format(date_sub(date_create(date("Y-m-d")),
                    date_interval_create_from_date_string($days . ' days')),
                    'Y-m-d');
                $loans = Loan::where('maturity_date', $due_date)->where('loan_status', 'open')->get();
                foreach ($loans as $loan) {
                    //check if borrower has email
                    if (!empty($loan->borrower->email)) {
                        $borrower = $loan->borrower;

                        $body = Setting::where('setting_key',
                            'loan_overdue_email_template')->first()->setting_value;
                        $body = str_replace('{borrowerTitle}', $borrower->title, $body);
                        $body = str_replace('{borrowerFirstName}', $borrower->first_name, $body);
                        $body = str_replace('{borrowerLastName}', $borrower->last_name, $body);
                        $body = str_replace('{borrowerAddress}', $borrower->address, $body);
                        $body = str_replace('{borrowerUniqueNumber}', $borrower->unique_number, $body);
                        $body = str_replace('{borrowerMobile}', $borrower->mobile, $body);
                        $body = str_replace('{borrowerPhone}', $borrower->phone, $body);
                        $body = str_replace('{borrowerEmail}', $borrower->email, $body);
                        $body = str_replace('{loanNumber}', $loan->id, $body);
                        $body = str_replace('{loanPayments}', GeneralHelper::loan_total_paid($loan->id), $body);
                        $body = str_replace('{loanDue}',
                            round(GeneralHelper::loan_total_due_amount($loan->id), 2), $body);
                        $body = str_replace('{loanBalance}',
                            round((GeneralHelper::loan_total_due_amount($loan->id) - GeneralHelper::loan_total_paid($loan->id)),
                                2), $body);
                        Mail::raw($body, function ($message) use ($borrower, $loan) {
                            $message->from(Setting::where('setting_key', 'company_email')->first()->setting_value,
                                Setting::where('setting_key', 'company_name')->first()->setting_value);
                            $message->to($borrower->email);
                            $headers = $message->getHeaders();
                            $message->setContentType('text/html');
                            $message->setSubject(Setting::where('setting_key',
                                'loan_overdue_email_subject')->first()->setting_value);
                        });
                        $mail = new Email();
                        //$mail->user_id = Sentinel::getUser()->id;
                        $mail->message = $body;
                        $mail->subject = Setting::where('setting_key',
                            'loan_overdue_email_subject')->first()->setting_value;
                        $mail->recipients = 1;
                        $mail->send_to = $borrower->first_name . ' ' . $borrower->last_name . '(' . $borrower->unique_number . ')';
                        $mail->save();

                    }
                }
            }
            //send via sms
            if (Setting::where('setting_key', 'auto_overdue_loan_sms_reminder')->first()->setting_value == 1) {
                $days = Setting::where('setting_key', 'auto_overdue_loan_days')->first()->setting_value;
                $due_date = date_format(date_sub(date_create(date("Y-m-d")),
                    date_interval_create_from_date_string($days . ' days')),
                    'Y-m-d');
                $loans = Loan::where('maturity_date', $due_date)->where('loan_status', 'open')->get();
                foreach ($loans as $loan) {
                    //check if borrower has email
                    if (!empty($loan->borrower->email)) {
                        $borrower = $loan->borrower;
                        $body = Setting::where('setting_key',
                            'loan_overdue_sms_template')->first()->setting_value;
                        $body = str_replace('{borrowerTitle}', $borrower->title, $body);
                        $body = str_replace('{borrowerFirstName}', $borrower->first_name, $body);
                        $body = str_replace('{borrowerLastName}', $borrower->last_name, $body);
                        $body = str_replace('{borrowerAddress}', $borrower->address, $body);
                        $body = str_replace('{borrowerUniqueNumber}', $borrower->unique_number, $body);
                        $body = str_replace('{borrowerMobile}', $borrower->mobile, $body);
                        $body = str_replace('{borrowerPhone}', $borrower->phone, $body);
                        $body = str_replace('{borrowerEmail}', $borrower->email, $body);
                        $body = str_replace('{loanNumber}', $loan->id, $body);
                        $body = str_replace('{loanPayments}', GeneralHelper::loan_total_paid($loan->id), $body);
                        $body = str_replace('{loanDue}',
                            round(GeneralHelper::loan_total_due_amount($loan->id), 2), $body);
                        $body = str_replace('{loanBalance}',
                            round((GeneralHelper::loan_total_due_amount($loan->id) - GeneralHelper::loan_total_paid($loan->id)),
                                2), $body);
                        if (!empty($borrower->mobile)) {
                            $active_sms = Setting::where('setting_key', 'active_sms')->first()->setting_value;
                            if ($active_sms == 'twilio') {
                                $twilio = new Twilio(Setting::where('setting_key',
                                    'twilio_sid')->first()->setting_value,
                                    Setting::where('setting_key', 'twilio_token')->first()->setting_value,
                                    Setting::where('setting_key', 'twilio_phone_number')->first()->setting_value);
                                $twilio->message('+' . $borrower->mobile, $body);
                            }
                            if ($active_sms == 'routesms') {
                                $host = Setting::where('setting_key', 'routesms_host')->first()->setting_value;
                                $port = Setting::where('setting_key', 'routesms_port')->first()->setting_value;
                                $username = Setting::where('setting_key',
                                    'routesms_username')->first()->setting_value;
                                $password = Setting::where('setting_key',
                                    'routesms_password')->first()->setting_value;
                                $sender = Setting::where('setting_key', 'sms_sender')->first()->setting_value;
                                $SMSText = $body;
                                $GSM = $borrower->mobile;
                                $msgtype = 2;
                                $dlr = 1;
                                $routesms = new RouteSms($host, $port, $username, $password, $sender, $SMSText,
                                    $GSM, $msgtype,
                                    $dlr);
                                $routesms->Submit();
                            }
                            if ($active_sms == 'clickatell') {
                                $clickatell = new Rest(Setting::where('setting_key',
                                    'clickatell_api_id')->first()->setting_value);
                                $response = $clickatell->sendMessage(array($borrower->mobile), $body);
                            }
                            if ($active_sms == 'infobip') {
                                $infobip = new Infobip(Setting::where('setting_key',
                                    'sms_sender')->first()->setting_value, $body,
                                    $borrower->mobile);
                            }
                            $sms = new Sms();
                            //$sms->user_id = Sentinel::getUser()->id;
                            $sms->message = $body;
                            $sms->gateway = $active_sms;
                            $sms->recipients = 1;
                            $sms->send_to = $borrower->first_name . ' ' . $borrower->last_name . '(' . $borrower->unique_number . ')';
                            $sms->save();
                        }
                    }
                }
            }
            //check for penalties
            //missed payment penalty
            $loans = Loan::all();
            foreach ($loans as $loan) {
                if (!empty($loan->loan_product)) {
                    if ($loan->loan_product->enable_late_repayment_penalty == 1) {
                        $schedules = LoanSchedule::where('due_date', '<',
                            date("Y-m-d"))->where('missed_penalty_applied',
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
            //after maturity date payment
            $loans = Loan::all();
            foreach ($loans as $loan) {
                if (!empty($loan->loan_product)) {
                    if ($loan->loan_product->enable_after_maturity_date_penalty == 1) {
                        $schedule = LoanSchedule::orderBy('due_date', 'desc')->first();

                        if (GeneralHelper::loan_total_due_period($loan->id,
                                $schedule->due_date) > GeneralHelper::loan_total_paid_period($loan->id,
                                $schedule->due_date)
                        ) {
                            $sch = LoanSchedule::find($schedule->id);
                            $sch->missed_penalty_applied = 1;
                            //determine which amount to use
                            if ($loan->loan_product->after_maturity_date_penalty_type == "fixed") {
                                $sch->penalty = $sch->penalty + $loan->loan_product->after_maturity_date_penalty_amount;
                            } else {
                                if ($loan->loan_product->after_maturity_date_penalty_calculate == 'overdue_principal') {
                                    $principal = (GeneralHelper::loan_total_principal($loan->id,
                                            $schedule->due_date) - GeneralHelper::loan_paid_item($loan->id,
                                            'principal', $schedule->due_date));
                                    $sch->penalty = $sch->penalty + (($loan->loan_product->after_maturity_date_penalty_amount / 100) * $principal);
                                }
                                if ($loan->loan_product->after_maturity_date_penalty_calculate == 'overdue_principal_interest') {
                                    $principal = (GeneralHelper::loan_total_principal($loan->id,
                                            $schedule->due_date) + GeneralHelper::loan_total_interest($loan->id,
                                            $schedule->due_date) - GeneralHelper::loan_paid_item($loan->id,
                                            'principal',
                                            $schedule->due_date) - GeneralHelper::loan_paid_item($loan->id,
                                            'interest', $schedule->due_date));
                                    $sch->penalty = $sch->penalty + (($loan->loan_product->after_maturity_date_penalty_amount / 100) * $principal);
                                }
                                if ($loan->loan_product->after_maturity_date_penalty_calculate == 'overdue_principal_interest_fees') {
                                    $principal = (GeneralHelper::loan_total_principal($loan->id,
                                            $schedule->due_date) + GeneralHelper::loan_total_interest($loan->id,
                                            $schedule->due_date) + GeneralHelper::loan_total_fees($loan->id,
                                            $schedule->due_date) - GeneralHelper::loan_paid_item($loan->id,
                                            'principal',
                                            $schedule->due_date) - GeneralHelper::loan_paid_item($loan->id,
                                            'interest',
                                            $schedule->due_date) - GeneralHelper::loan_paid_item($loan->id, 'fees',
                                            $schedule->due_date));
                                    $sch->penalty = $sch->penalty + (($loan->loan_product->after_maturity_date_penalty_amount / 100) * $principal);
                                }
                                if ($loan->loan_product->after_maturity_date_penalty_calculate == 'total_overdue') {
                                    $principal = (GeneralHelper::loan_total_due_amount($loan->id,
                                            $schedule->due_date) - GeneralHelper::loan_total_paid($loan->id,
                                            $schedule->due_date));
                                    $sch->penalty = $sch->penalty + (($loan->loan_product->after_maturity_date_penalty_amount / 100) * $principal);
                                }
                            }
                            $sch->save();
                        }
                    }
                }
            }
            //check for recurring expenses
            $expenses = Expense::where('recurring', 1)->get();
            foreach ($expenses as $expense) {
                if (empty($expense->recur_end_date)) {
                    if ($expense->recur_next_date == date("Y-m-d")) {
                        $exp1 = new Expense();
                        $exp1->expense_type_id = $expense->expense_type_id;
                        $exp1->amount = $expense->amount;
                        $exp1->notes = $expense->notes;
                        $exp1->date = date("Y-m-d");
                        $date = explode('-', date("Y-m-d"));
                        $exp1->year = $date[0];
                        $exp1->month = $date[1];
                        $exp1->save();
                        $custom_fields = CustomFieldMeta::where('parent_id', $expense->id)->where('category',
                            'expenses')->get();
                        foreach ($custom_fields as $key) {
                            $custom_field = new CustomFieldMeta();
                            $custom_field->name = $key->name;
                            $custom_field->parent_id = $exp1->id;
                            $custom_field->custom_field_id = $key->custom_field_id;
                            $custom_field->category = "expenses";
                            $custom_field->save();
                        }
                        $exp2 = Expense::find($expense->id);
                        $exp2->recur_next_date = date_format(date_add(date_create(date("Y-m-d")),
                            date_interval_create_from_date_string($expense->recur_frequency . ' ' . $expense->recur_type . 's')),
                            'Y-m-d');
                        $exp2->save();
                    }
                } else {
                    if (date("Y-m-d") <= $expense->recur_end_date) {
                        if ($expense->recur_next_date == date("Y-m-d")) {
                            $exp1 = new Expense();
                            $exp1->expense_type_id = $expense->expense_type_id;
                            $exp1->amount = $expense->amount;
                            $exp1->notes = $expense->notes;
                            $exp1->date = date("Y-m-d");
                            $date = explode('-', date("Y-m-d"));
                            $exp1->year = $date[0];
                            $exp1->month = $date[1];
                            $exp1->save();
                            $custom_fields = CustomFieldMeta::where('parent_id', $expense->id)->where('category',
                                'expenses')->get();
                            foreach ($custom_fields as $key) {
                                $custom_field = new CustomFieldMeta();
                                $custom_field->name = $key->name;
                                $custom_field->parent_id = $exp1->id;
                                $custom_field->custom_field_id = $key->custom_field_id;
                                $custom_field->category = "expenses";
                                $custom_field->save();
                            }
                            $exp2 = Expense::find($expense->id);
                            $exp2->recur_next_date = date_format(date_add(date_create(date("Y-m-d")),
                                date_interval_create_from_date_string($expense->recur_frequency . ' ' . $expense->recur_type . 's')),
                                'Y-m-d');
                            $exp2->save();
                        }
                    }
                }
            }
            //check for recurring payroll
            $payrolls = Payroll::where('recurring', 1)->get();
            foreach ($payrolls as $payroll) {
                if (empty($payroll->recur_end_date)) {
                    if ($payroll->recur_next_date == date("Y-m-d")) {
                        $pay1 = new Payroll();
                        $pay1->payroll_template_id = $payroll->payroll_template_id;
                        $pay1->user_id = $payroll->user_id;
                        $pay1->employee_name = $payroll->employee_name;
                        $pay1->business_name = $payroll->business_name;
                        $pay1->payment_method = $payroll->payment_method;
                        $pay1->bank_name = $payroll->bank_name;
                        $pay1->account_number = $payroll->account_number;
                        $pay1->description = $payroll->description;
                        $pay1->comments = $payroll->comments;
                        $pay1->paid_amount = $payroll->paid_amount;
                        $date = explode('-', date("Y-m-d"));
                        $pay1->date = date("Y-m-d");
                        $pay1->year = $date[0];
                        $pay1->month = $date[1];
                        $pay1->save();
                        //save payroll meta
                        $metas = PayrollMeta::where('payroll_id',
                            $payroll->id)->get();;
                        foreach ($metas as $key) {
                            $meta = new PayrollMeta();
                            $meta->value = $key->value;
                            $meta->payroll_id = $pay1->id;
                            $meta->payroll_template_meta_id = $key->payroll_template_meta_id;
                            $meta->position = $key->position;
                            $meta->save();
                        }
                        $pay2 = Payroll::find($payroll->id);
                        $pay2->recur_next_date = date_format(date_add(date_create(date("Y-m-d")),
                            date_interval_create_from_date_string($payroll->recur_frequency . ' ' . $payroll->recur_type . 's')),
                            'Y-m-d');
                        $pay2->save();
                    } else {
                        if (date("Y-m-d") <= $payroll->recur_end_date) {
                            if ($payroll->recur_next_date == date("Y-m-d")) {
                                $pay1 = new Payroll();
                                $pay1->payroll_template_id = $payroll->payroll_template_id;
                                $pay1->user_id = $payroll->user_id;
                                $pay1->employee_name = $payroll->employee_name;
                                $pay1->business_name = $payroll->business_name;
                                $pay1->payment_method = $payroll->payment_method;
                                $pay1->bank_name = $payroll->bank_name;
                                $pay1->account_number = $payroll->account_number;
                                $pay1->description = $payroll->description;
                                $pay1->comments = $payroll->comments;
                                $pay1->paid_amount = $payroll->paid_amount;
                                $date = explode('-', date("Y-m-d"));
                                $pay1->date = date("Y-m-d");
                                $pay1->year = $date[0];
                                $pay1->month = $date[1];
                                $pay1->save();
                                //save payroll meta
                                $metas = PayrollMeta::where('payroll_id',
                                    $payroll->id)->get();;
                                foreach ($metas as $key) {
                                    $meta = new PayrollMeta();
                                    $meta->value = $key->value;
                                    $meta->payroll_id = $pay1->id;
                                    $meta->payroll_template_meta_id = $key->payroll_template_meta_id;
                                    $meta->position = $key->position;
                                    $meta->save();
                                }
                                $pay2 = Payroll::find($payroll->id);
                                $pay2->recur_next_date = date_format(date_add(date_create(date("Y-m-d")),
                                    date_interval_create_from_date_string($payroll->recur_frequency . ' ' . $payroll->recur_type . 's')),
                                    'Y-m-d');
                                $pay2->save();
                            }
                        }
                    }
                }
            }
            //generate savings interest
            foreach (SavingProduct::all() as $key) {
                //check post date
                if (date("d") == '01') {
                    foreach (Saving::where('savings_product_id', $key->id) as $saving) {
                        if ($key->minimum_balance == 0) {
                            //interest posted right away
                            if ($key->interest_posting == 1) {
                                $interest = GeneralHelper::savings_account_balance($saving->id) * $key->interest_rate / 100;
                                $last_interest = SavingTransaction::where('savings_id', $saving->id)->where('type',
                                    'interest')->where('system_interest', 1)->orderBy('date', 'desc')->first();
                                if (empty($last_interest)) {
                                    $savings_transaction = new SavingTransaction();
                                    $savings_transaction->borrower_id = $saving->borrower_id;
                                    $savings_transaction->amount = $interest;
                                    $savings_transaction->savings_id = $saving->id;
                                    $savings_transaction->type = 'interest';
                                    $savings_transaction->system_interest = '1';
                                    $savings_transaction->date = date("Y-m-d");
                                    $savings_transaction->time = date("H:i");
                                    $date = explode('-', date("Y-m-d"));
                                    $savings_transaction->year = $date[0];
                                    $savings_transaction->month = $date[1];
                                    $savings_transaction->notes = $key->interest_rate . " Per Annum Interest calculated";
                                    $savings_transaction->save();
                                } else {
                                    if (date_format(date_add(date_create($last_interest->date),
                                            date_interval_create_from_date_string('1 months')),
                                            'Y-m-d') == date("Y-m-d")
                                    ) {
                                        $savings_transaction = new SavingTransaction();
                                        $savings_transaction->borrower_id = $saving->borrower_id;
                                        $savings_transaction->amount = $interest;
                                        $savings_transaction->savings_id = $saving->id;
                                        $savings_transaction->type = 'interest';
                                        $savings_transaction->system_interest = '1';
                                        $savings_transaction->date = date("Y-m-d");
                                        $savings_transaction->time = date("H:i");
                                        $date = explode('-', date("Y-m-d"));
                                        $savings_transaction->year = $date[0];
                                        $savings_transaction->month = $date[1];
                                        $savings_transaction->notes = $key->interest_rate . " Per Annum Interest calculated";
                                        $savings_transaction->save();
                                    }
                                }
                            }
                            if ($key->interest_posting == 2) {
                                $interest = GeneralHelper::savings_account_balance($saving->id) * $key->interest_rate / 100;
                                $last_interest = SavingTransaction::where('savings_id', $saving->id)->where('type',
                                    'interest')->where('system_interest', 1)->orderBy('date', 'desc')->first();
                                if (empty($last_interest)) {
                                    $savings_transaction = new SavingTransaction();
                                    $savings_transaction->borrower_id = $saving->borrower_id;
                                    $savings_transaction->amount = $interest;
                                    $savings_transaction->savings_id = $saving->id;
                                    $savings_transaction->type = 'interest';
                                    $savings_transaction->system_interest = '1';
                                    $savings_transaction->date = date("Y-m-d");
                                    $savings_transaction->time = date("H:i");
                                    $date = explode('-', date("Y-m-d"));
                                    $savings_transaction->year = $date[0];
                                    $savings_transaction->month = $date[1];
                                    $savings_transaction->notes = $key->interest_rate . " Per Annum Interest calculated";
                                    $savings_transaction->save();
                                } else {
                                    if (date_format(date_add(date_create($last_interest->date),
                                            date_interval_create_from_date_string('2 months')),
                                            'Y-m-d') == date("Y-m-d")
                                    ) {
                                        $savings_transaction = new SavingTransaction();
                                        $savings_transaction->borrower_id = $saving->borrower_id;
                                        $savings_transaction->amount = $interest;
                                        $savings_transaction->savings_id = $saving->id;
                                        $savings_transaction->type = 'interest';
                                        $savings_transaction->system_interest = '1';
                                        $savings_transaction->date = date("Y-m-d");
                                        $savings_transaction->time = date("H:i");
                                        $date = explode('-', date("Y-m-d"));
                                        $savings_transaction->year = $date[0];
                                        $savings_transaction->month = $date[1];
                                        $savings_transaction->notes = $key->interest_rate . " Per Annum Interest calculated";
                                        $savings_transaction->save();
                                    }
                                }
                            }
                            if ($key->interest_posting == 3) {
                                $interest = GeneralHelper::savings_account_balance($saving->id) * $key->interest_rate / 100;
                                $last_interest = SavingTransaction::where('savings_id', $saving->id)->where('type',
                                    'interest')->where('system_interest', 1)->orderBy('date', 'desc')->first();
                                if (empty($last_interest)) {
                                    $savings_transaction = new SavingTransaction();
                                    $savings_transaction->borrower_id = $saving->borrower_id;
                                    $savings_transaction->amount = $interest;
                                    $savings_transaction->savings_id = $saving->id;
                                    $savings_transaction->type = 'interest';
                                    $savings_transaction->system_interest = '1';
                                    $savings_transaction->date = date("Y-m-d");
                                    $savings_transaction->time = date("H:i");
                                    $date = explode('-', date("Y-m-d"));
                                    $savings_transaction->year = $date[0];
                                    $savings_transaction->month = $date[1];
                                    $savings_transaction->notes = $key->interest_rate . " Per Annum Interest calculated";
                                    $savings_transaction->save();
                                } else {
                                    if (date_format(date_add(date_create($last_interest->date),
                                            date_interval_create_from_date_string('3 months')),
                                            'Y-m-d') == date("Y-m-d")
                                    ) {
                                        $savings_transaction = new SavingTransaction();
                                        $savings_transaction->borrower_id = $saving->borrower_id;
                                        $savings_transaction->amount = $interest;
                                        $savings_transaction->savings_id = $saving->id;
                                        $savings_transaction->type = 'interest';
                                        $savings_transaction->system_interest = '1';
                                        $savings_transaction->date = date("Y-m-d");
                                        $savings_transaction->time = date("H:i");
                                        $date = explode('-', date("Y-m-d"));
                                        $savings_transaction->year = $date[0];
                                        $savings_transaction->month = $date[1];
                                        $savings_transaction->notes = $key->interest_rate . " Per Annum Interest calculated";
                                        $savings_transaction->save();
                                    }
                                }
                            }
                            if ($key->interest_posting == 4) {
                                $interest = GeneralHelper::savings_account_balance($saving->id) * $key->interest_rate / 100;
                                $last_interest = SavingTransaction::where('savings_id', $saving->id)->where('type',
                                    'interest')->where('system_interest', 1)->orderBy('date', 'desc')->first();
                                if (empty($last_interest)) {
                                    $savings_transaction = new SavingTransaction();
                                    $savings_transaction->borrower_id = $saving->borrower_id;
                                    $savings_transaction->amount = $interest;
                                    $savings_transaction->savings_id = $saving->id;
                                    $savings_transaction->type = 'interest';
                                    $savings_transaction->system_interest = '1';
                                    $savings_transaction->date = date("Y-m-d");
                                    $savings_transaction->time = date("H:i");
                                    $date = explode('-', date("Y-m-d"));
                                    $savings_transaction->year = $date[0];
                                    $savings_transaction->month = $date[1];
                                    $savings_transaction->notes = $key->interest_rate . " Per Annum Interest calculated";
                                    $savings_transaction->save();
                                } else {
                                    if (date_format(date_add(date_create($last_interest->date),
                                            date_interval_create_from_date_string('4 months')),
                                            'Y-m-d') == date("Y-m-d")
                                    ) {
                                        $savings_transaction = new SavingTransaction();
                                        $savings_transaction->borrower_id = $saving->borrower_id;
                                        $savings_transaction->amount = $interest;
                                        $savings_transaction->savings_id = $saving->id;
                                        $savings_transaction->type = 'interest';
                                        $savings_transaction->system_interest = '1';
                                        $savings_transaction->date = date("Y-m-d");
                                        $savings_transaction->time = date("H:i");
                                        $date = explode('-', date("Y-m-d"));
                                        $savings_transaction->year = $date[0];
                                        $savings_transaction->month = $date[1];
                                        $savings_transaction->notes = $key->interest_rate . " Per Annum Interest calculated";
                                        $savings_transaction->save();
                                    }
                                }
                            }
                            if ($key->interest_posting == 5) {
                                $interest = GeneralHelper::savings_account_balance($saving->id) * $key->interest_rate / 100;
                                $last_interest = SavingTransaction::where('savings_id', $saving->id)->where('type',
                                    'interest')->where('system_interest', 1)->orderBy('date', 'desc')->first();
                                if (empty($last_interest)) {
                                    $savings_transaction = new SavingTransaction();
                                    $savings_transaction->borrower_id = $saving->borrower_id;
                                    $savings_transaction->amount = $interest;
                                    $savings_transaction->savings_id = $saving->id;
                                    $savings_transaction->type = 'interest';
                                    $savings_transaction->system_interest = '1';
                                    $savings_transaction->date = date("Y-m-d");
                                    $savings_transaction->time = date("H:i");
                                    $date = explode('-', date("Y-m-d"));
                                    $savings_transaction->year = $date[0];
                                    $savings_transaction->month = $date[1];
                                    $savings_transaction->notes = $key->interest_rate . " Per Annum Interest calculated";
                                    $savings_transaction->save();
                                } else {
                                    if (date_format(date_add(date_create($last_interest->date),
                                            date_interval_create_from_date_string('5 months')),
                                            'Y-m-d') == date("Y-m-d")
                                    ) {
                                        $savings_transaction = new SavingTransaction();
                                        $savings_transaction->borrower_id = $saving->borrower_id;
                                        $savings_transaction->amount = $interest;
                                        $savings_transaction->savings_id = $saving->id;
                                        $savings_transaction->type = 'interest';
                                        $savings_transaction->system_interest = '1';
                                        $savings_transaction->date = date("Y-m-d");
                                        $savings_transaction->time = date("H:i");
                                        $date = explode('-', date("Y-m-d"));
                                        $savings_transaction->year = $date[0];
                                        $savings_transaction->month = $date[1];
                                        $savings_transaction->notes = $key->interest_rate . " Per Annum Interest calculated";
                                        $savings_transaction->save();
                                    }
                                }
                            }
                            if ($key->interest_posting == 6) {
                                $interest = GeneralHelper::savings_account_balance($saving->id) * $key->interest_rate / 100;
                                $last_interest = SavingTransaction::where('savings_id', $saving->id)->where('type',
                                    'interest')->where('system_interest', 1)->orderBy('date', 'desc')->first();
                                if (empty($last_interest)) {
                                    $savings_transaction = new SavingTransaction();
                                    $savings_transaction->borrower_id = $saving->borrower_id;
                                    $savings_transaction->amount = $interest;
                                    $savings_transaction->savings_id = $saving->id;
                                    $savings_transaction->type = 'interest';
                                    $savings_transaction->system_interest = '1';
                                    $savings_transaction->date = date("Y-m-d");
                                    $savings_transaction->time = date("H:i");
                                    $date = explode('-', date("Y-m-d"));
                                    $savings_transaction->year = $date[0];
                                    $savings_transaction->month = $date[1];
                                    $savings_transaction->notes = $key->interest_rate . " Per Annum Interest calculated";
                                    $savings_transaction->save();
                                } else {
                                    if (date_format(date_add(date_create($last_interest->date),
                                            date_interval_create_from_date_string('6 months')),
                                            'Y-m-d') == date("Y-m-d")
                                    ) {
                                        $savings_transaction = new SavingTransaction();
                                        $savings_transaction->borrower_id = $saving->borrower_id;
                                        $savings_transaction->amount = $interest;
                                        $savings_transaction->savings_id = $saving->id;
                                        $savings_transaction->type = 'interest';
                                        $savings_transaction->system_interest = '1';
                                        $savings_transaction->date = date("Y-m-d");
                                        $savings_transaction->time = date("H:i");
                                        $date = explode('-', date("Y-m-d"));
                                        $savings_transaction->year = $date[0];
                                        $savings_transaction->month = $date[1];
                                        $savings_transaction->notes = $key->interest_rate . " Per Annum Interest calculated";
                                        $savings_transaction->save();
                                    }
                                }
                            }
                            if ($key->interest_posting == 7) {
                                $interest = GeneralHelper::savings_account_balance($saving->id) * $key->interest_rate / 100;
                                $last_interest = SavingTransaction::where('savings_id', $saving->id)->where('type',
                                    'interest')->where('system_interest', 1)->orderBy('date', 'desc')->first();
                                if (empty($last_interest)) {
                                    $savings_transaction = new SavingTransaction();
                                    $savings_transaction->borrower_id = $saving->borrower_id;
                                    $savings_transaction->amount = $interest;
                                    $savings_transaction->savings_id = $saving->id;
                                    $savings_transaction->type = 'interest';
                                    $savings_transaction->system_interest = '1';
                                    $savings_transaction->date = date("Y-m-d");
                                    $savings_transaction->time = date("H:i");
                                    $date = explode('-', date("Y-m-d"));
                                    $savings_transaction->year = $date[0];
                                    $savings_transaction->month = $date[1];
                                    $savings_transaction->notes = $key->interest_rate . " Per Annum Interest calculated";
                                    $savings_transaction->save();
                                } else {
                                    if (date_format(date_add(date_create($last_interest->date),
                                            date_interval_create_from_date_string('12 months')),
                                            'Y-m-d') == date("Y-m-d")
                                    ) {
                                        $savings_transaction = new SavingTransaction();
                                        $savings_transaction->borrower_id = $saving->borrower_id;
                                        $savings_transaction->amount = $interest;
                                        $savings_transaction->savings_id = $saving->id;
                                        $savings_transaction->type = 'interest';
                                        $savings_transaction->system_interest = '1';
                                        $savings_transaction->date = date("Y-m-d");
                                        $savings_transaction->time = date("H:i");
                                        $date = explode('-', date("Y-m-d"));
                                        $savings_transaction->year = $date[0];
                                        $savings_transaction->month = $date[1];
                                        $savings_transaction->notes = $key->interest_rate . " Per Annum Interest calculated";
                                        $savings_transaction->save();
                                    }
                                }
                            }

                        } elseif (GeneralHelper::savings_account_balance($saving->id) > $key->minimum_balance) {
                            if ($key->interest_posting == 1) {
                                $interest = GeneralHelper::savings_account_balance($saving->id) * $key->interest_rate / 100;
                                $last_interest = SavingTransaction::where('savings_id', $saving->id)->where('type',
                                    'interest')->where('system_interest', 1)->orderBy('date', 'desc')->first();
                                if (empty($last_interest)) {
                                    $savings_transaction = new SavingTransaction();
                                    $savings_transaction->borrower_id = $saving->borrower_id;
                                    $savings_transaction->amount = $interest;
                                    $savings_transaction->savings_id = $saving->id;
                                    $savings_transaction->type = 'interest';
                                    $savings_transaction->system_interest = '1';
                                    $savings_transaction->date = date("Y-m-d");
                                    $savings_transaction->time = date("H:i");
                                    $date = explode('-', date("Y-m-d"));
                                    $savings_transaction->year = $date[0];
                                    $savings_transaction->month = $date[1];
                                    $savings_transaction->notes = $key->interest_rate . " Per Annum Interest calculated";
                                    $savings_transaction->save();
                                } else {
                                    if (date_format(date_add(date_create($last_interest->date),
                                            date_interval_create_from_date_string('1 months')),
                                            'Y-m-d') == date("Y-m-d")
                                    ) {
                                        $savings_transaction = new SavingTransaction();
                                        $savings_transaction->borrower_id = $saving->borrower_id;
                                        $savings_transaction->amount = $interest;
                                        $savings_transaction->savings_id = $saving->id;
                                        $savings_transaction->type = 'interest';
                                        $savings_transaction->system_interest = '1';
                                        $savings_transaction->date = date("Y-m-d");
                                        $savings_transaction->time = date("H:i");
                                        $date = explode('-', date("Y-m-d"));
                                        $savings_transaction->year = $date[0];
                                        $savings_transaction->month = $date[1];
                                        $savings_transaction->notes = $key->interest_rate . " Per Annum Interest calculated";
                                        $savings_transaction->save();
                                    }
                                }
                            }
                            if ($key->interest_posting == 2) {
                                $interest = GeneralHelper::savings_account_balance($saving->id) * $key->interest_rate / 100;
                                $last_interest = SavingTransaction::where('savings_id', $saving->id)->where('type',
                                    'interest')->where('system_interest', 1)->orderBy('date', 'desc')->first();
                                if (empty($last_interest)) {
                                    $savings_transaction = new SavingTransaction();
                                    $savings_transaction->borrower_id = $saving->borrower_id;
                                    $savings_transaction->amount = $interest;
                                    $savings_transaction->savings_id = $saving->id;
                                    $savings_transaction->type = 'interest';
                                    $savings_transaction->system_interest = '1';
                                    $savings_transaction->date = date("Y-m-d");
                                    $savings_transaction->time = date("H:i");
                                    $date = explode('-', date("Y-m-d"));
                                    $savings_transaction->year = $date[0];
                                    $savings_transaction->month = $date[1];
                                    $savings_transaction->notes = $key->interest_rate . " Per Annum Interest calculated";
                                    $savings_transaction->save();
                                } else {
                                    if (date_format(date_add(date_create($last_interest->date),
                                            date_interval_create_from_date_string('2 months')),
                                            'Y-m-d') == date("Y-m-d")
                                    ) {
                                        $savings_transaction = new SavingTransaction();
                                        $savings_transaction->borrower_id = $saving->borrower_id;
                                        $savings_transaction->amount = $interest;
                                        $savings_transaction->savings_id = $saving->id;
                                        $savings_transaction->type = 'interest';
                                        $savings_transaction->system_interest = '1';
                                        $savings_transaction->date = date("Y-m-d");
                                        $savings_transaction->time = date("H:i");
                                        $date = explode('-', date("Y-m-d"));
                                        $savings_transaction->year = $date[0];
                                        $savings_transaction->month = $date[1];
                                        $savings_transaction->notes = $key->interest_rate . " Per Annum Interest calculated";
                                        $savings_transaction->save();
                                    }
                                }
                            }
                            if ($key->interest_posting == 3) {
                                $interest = GeneralHelper::savings_account_balance($saving->id) * $key->interest_rate / 100;
                                $last_interest = SavingTransaction::where('savings_id', $saving->id)->where('type',
                                    'interest')->where('system_interest', 1)->orderBy('date', 'desc')->first();
                                if (empty($last_interest)) {
                                    $savings_transaction = new SavingTransaction();
                                    $savings_transaction->borrower_id = $saving->borrower_id;
                                    $savings_transaction->amount = $interest;
                                    $savings_transaction->savings_id = $saving->id;
                                    $savings_transaction->type = 'interest';
                                    $savings_transaction->system_interest = '1';
                                    $savings_transaction->date = date("Y-m-d");
                                    $savings_transaction->time = date("H:i");
                                    $date = explode('-', date("Y-m-d"));
                                    $savings_transaction->year = $date[0];
                                    $savings_transaction->month = $date[1];
                                    $savings_transaction->notes = $key->interest_rate . " Per Annum Interest calculated";
                                    $savings_transaction->save();
                                } else {
                                    if (date_format(date_add(date_create($last_interest->date),
                                            date_interval_create_from_date_string('3 months')),
                                            'Y-m-d') == date("Y-m-d")
                                    ) {
                                        $savings_transaction = new SavingTransaction();
                                        $savings_transaction->borrower_id = $saving->borrower_id;
                                        $savings_transaction->amount = $interest;
                                        $savings_transaction->savings_id = $saving->id;
                                        $savings_transaction->type = 'interest';
                                        $savings_transaction->system_interest = '1';
                                        $savings_transaction->date = date("Y-m-d");
                                        $savings_transaction->time = date("H:i");
                                        $date = explode('-', date("Y-m-d"));
                                        $savings_transaction->year = $date[0];
                                        $savings_transaction->month = $date[1];
                                        $savings_transaction->notes = $key->interest_rate . " Per Annum Interest calculated";
                                        $savings_transaction->save();
                                    }
                                }
                            }
                            if ($key->interest_posting == 4) {
                                $interest = GeneralHelper::savings_account_balance($saving->id) * $key->interest_rate / 100;
                                $last_interest = SavingTransaction::where('savings_id', $saving->id)->where('type',
                                    'interest')->where('system_interest', 1)->orderBy('date', 'desc')->first();
                                if (empty($last_interest)) {
                                    $savings_transaction = new SavingTransaction();
                                    $savings_transaction->borrower_id = $saving->borrower_id;
                                    $savings_transaction->amount = $interest;
                                    $savings_transaction->savings_id = $saving->id;
                                    $savings_transaction->type = 'interest';
                                    $savings_transaction->system_interest = '1';
                                    $savings_transaction->date = date("Y-m-d");
                                    $savings_transaction->time = date("H:i");
                                    $date = explode('-', date("Y-m-d"));
                                    $savings_transaction->year = $date[0];
                                    $savings_transaction->month = $date[1];
                                    $savings_transaction->notes = $key->interest_rate . " Per Annum Interest calculated";
                                    $savings_transaction->save();
                                } else {
                                    if (date_format(date_add(date_create($last_interest->date),
                                            date_interval_create_from_date_string('4 months')),
                                            'Y-m-d') == date("Y-m-d")
                                    ) {
                                        $savings_transaction = new SavingTransaction();
                                        $savings_transaction->borrower_id = $saving->borrower_id;
                                        $savings_transaction->amount = $interest;
                                        $savings_transaction->savings_id = $saving->id;
                                        $savings_transaction->type = 'interest';
                                        $savings_transaction->system_interest = '1';
                                        $savings_transaction->date = date("Y-m-d");
                                        $savings_transaction->time = date("H:i");
                                        $date = explode('-', date("Y-m-d"));
                                        $savings_transaction->year = $date[0];
                                        $savings_transaction->month = $date[1];
                                        $savings_transaction->notes = $key->interest_rate . " Per Annum Interest calculated";
                                        $savings_transaction->save();
                                    }
                                }
                            }
                            if ($key->interest_posting == 5) {
                                $interest = GeneralHelper::savings_account_balance($saving->id) * $key->interest_rate / 100;
                                $last_interest = SavingTransaction::where('savings_id', $saving->id)->where('type',
                                    'interest')->where('system_interest', 1)->orderBy('date', 'desc')->first();
                                if (empty($last_interest)) {
                                    $savings_transaction = new SavingTransaction();
                                    $savings_transaction->borrower_id = $saving->borrower_id;
                                    $savings_transaction->amount = $interest;
                                    $savings_transaction->savings_id = $saving->id;
                                    $savings_transaction->type = 'interest';
                                    $savings_transaction->system_interest = '1';
                                    $savings_transaction->date = date("Y-m-d");
                                    $savings_transaction->time = date("H:i");
                                    $date = explode('-', date("Y-m-d"));
                                    $savings_transaction->year = $date[0];
                                    $savings_transaction->month = $date[1];
                                    $savings_transaction->notes = $key->interest_rate . " Per Annum Interest calculated";
                                    $savings_transaction->save();
                                } else {
                                    if (date_format(date_add(date_create($last_interest->date),
                                            date_interval_create_from_date_string('5 months')),
                                            'Y-m-d') == date("Y-m-d")
                                    ) {
                                        $savings_transaction = new SavingTransaction();
                                        $savings_transaction->borrower_id = $saving->borrower_id;
                                        $savings_transaction->amount = $interest;
                                        $savings_transaction->savings_id = $saving->id;
                                        $savings_transaction->type = 'interest';
                                        $savings_transaction->system_interest = '1';
                                        $savings_transaction->date = date("Y-m-d");
                                        $savings_transaction->time = date("H:i");
                                        $date = explode('-', date("Y-m-d"));
                                        $savings_transaction->year = $date[0];
                                        $savings_transaction->month = $date[1];
                                        $savings_transaction->notes = $key->interest_rate . " Per Annum Interest calculated";
                                        $savings_transaction->save();
                                    }
                                }
                            }
                            if ($key->interest_posting == 6) {
                                $interest = GeneralHelper::savings_account_balance($saving->id) * $key->interest_rate / 100;
                                $last_interest = SavingTransaction::where('savings_id', $saving->id)->where('type',
                                    'interest')->where('system_interest', 1)->orderBy('date', 'desc')->first();
                                if (empty($last_interest)) {
                                    $savings_transaction = new SavingTransaction();
                                    $savings_transaction->borrower_id = $saving->borrower_id;
                                    $savings_transaction->amount = $interest;
                                    $savings_transaction->savings_id = $saving->id;
                                    $savings_transaction->type = 'interest';
                                    $savings_transaction->system_interest = '1';
                                    $savings_transaction->date = date("Y-m-d");
                                    $savings_transaction->time = date("H:i");
                                    $date = explode('-', date("Y-m-d"));
                                    $savings_transaction->year = $date[0];
                                    $savings_transaction->month = $date[1];
                                    $savings_transaction->notes = $key->interest_rate . " Per Annum Interest calculated";
                                    $savings_transaction->save();
                                } else {
                                    if (date_format(date_add(date_create($last_interest->date),
                                            date_interval_create_from_date_string('6 months')),
                                            'Y-m-d') == date("Y-m-d")
                                    ) {
                                        $savings_transaction = new SavingTransaction();
                                        $savings_transaction->borrower_id = $saving->borrower_id;
                                        $savings_transaction->amount = $interest;
                                        $savings_transaction->savings_id = $saving->id;
                                        $savings_transaction->type = 'interest';
                                        $savings_transaction->system_interest = '1';
                                        $savings_transaction->date = date("Y-m-d");
                                        $savings_transaction->time = date("H:i");
                                        $date = explode('-', date("Y-m-d"));
                                        $savings_transaction->year = $date[0];
                                        $savings_transaction->month = $date[1];
                                        $savings_transaction->notes = $key->interest_rate . " Per Annum Interest calculated";
                                        $savings_transaction->save();
                                    }
                                }
                            }
                            if ($key->interest_posting == 7) {
                                $interest = GeneralHelper::savings_account_balance($saving->id) * $key->interest_rate / 100;
                                $last_interest = SavingTransaction::where('savings_id', $saving->id)->where('type',
                                    'interest')->where('system_interest', 1)->orderBy('date', 'desc')->first();
                                if (empty($last_interest)) {
                                    $savings_transaction = new SavingTransaction();
                                    $savings_transaction->borrower_id = $saving->borrower_id;
                                    $savings_transaction->amount = $interest;
                                    $savings_transaction->savings_id = $saving->id;
                                    $savings_transaction->type = 'interest';
                                    $savings_transaction->system_interest = '1';
                                    $savings_transaction->date = date("Y-m-d");
                                    $savings_transaction->time = date("H:i");
                                    $date = explode('-', date("Y-m-d"));
                                    $savings_transaction->year = $date[0];
                                    $savings_transaction->month = $date[1];
                                    $savings_transaction->notes = $key->interest_rate . " Per Annum Interest calculated";
                                    $savings_transaction->save();
                                } else {
                                    if (date_format(date_add(date_create($last_interest->date),
                                            date_interval_create_from_date_string('12 months')),
                                            'Y-m-d') == date("Y-m-d")
                                    ) {
                                        $savings_transaction = new SavingTransaction();
                                        $savings_transaction->borrower_id = $saving->borrower_id;
                                        $savings_transaction->amount = $interest;
                                        $savings_transaction->savings_id = $saving->id;
                                        $savings_transaction->type = 'interest';
                                        $savings_transaction->system_interest = '1';
                                        $savings_transaction->date = date("Y-m-d");
                                        $savings_transaction->time = date("H:i");
                                        $date = explode('-', date("Y-m-d"));
                                        $savings_transaction->year = $date[0];
                                        $savings_transaction->month = $date[1];
                                        $savings_transaction->notes = $key->interest_rate . " Per Annum Interest calculated";
                                        $savings_transaction->save();
                                    }
                                }
                            }
                        }
                    }
                }
            }
            Setting::where('setting_key',
                'cron_last_run')->update(['setting_value' => date("Y-m-d H:i:s")]);
        }
    }

}

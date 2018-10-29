<?php

namespace App\Http\Controllers;

use App\Helpers\GeneralHelper;
use App\Models\Setting;
use Cartalyst\Sentinel\Laravel\Facades\Sentinel;
use Illuminate\Http\Request;

use App\Http\Requests;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Validator;
use Laracasts\Flash\Flash;

class SettingController extends Controller
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
    public function updateSystem()
    {
        Artisan::call('migrate');
        Flash::success("Successfully Updated");
        return redirect('setting/data');
    }

    public function index()
    {
        if (!Sentinel::hasAccess('settings')) {
            Flash::warning("Permission Denied");
            return redirect('/');
        }
        return view('setting.data');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {
        if (!Sentinel::hasAccess('settings')) {
            Flash::warning("Permission Denied");
            return redirect('/');
        }
        Setting::where('setting_key', 'company_name')->update(['setting_value' => $request->company_name]);
        Setting::where('setting_key', 'company_phone')->update(['setting_value' => $request->company_phone]);
        Setting::where('setting_key', 'company_email')->update(['setting_value' => $request->company_email]);
        Setting::where('setting_key', 'company_website')->update(['setting_value' => $request->company_website]);
        Setting::where('setting_key', 'portal_address')->update(['setting_value' => $request->portal_address]);
        Setting::where('setting_key', 'currency_symbol')->update(['setting_value' => $request->currency_symbol]);
        Setting::where('setting_key', 'currency_position')->update(['setting_value' => $request->currency_position]);
        Setting::where('setting_key', 'company_currency')->update(['setting_value' => $request->company_currency]);
        Setting::where('setting_key', 'company_country')->update(['setting_value' => $request->company_country]);
        Setting::where('setting_key', 'routesms_host')->update(['setting_value' => $request->routesms_host]);
        Setting::where('setting_key', 'routesms_username')->update(['setting_value' => $request->routesms_username]);
        Setting::where('setting_key', 'routesms_password')->update(['setting_value' => $request->routesms_password]);
        Setting::where('setting_key', 'routesms_port')->update(['setting_value' => $request->routesms_port]);
        Setting::where('setting_key', 'sms_enabled')->update(['setting_value' => $request->sms_enabled]);
        Setting::where('setting_key', 'sms_sender')->update(['setting_value' => $request->sms_sender]);
        Setting::where('setting_key', 'active_sms')->update(['setting_value' => $request->active_sms]);
        Setting::where('setting_key', 'twilio_sid')->update(['setting_value' => $request->twilio_sid]);
        Setting::where('setting_key', 'twilio_token')->update(['setting_value' => $request->twilio_token]);
        Setting::where('setting_key', 'infobip_username')->update(['setting_value' => $request->infobip_username]);
        Setting::where('setting_key', 'infobip_password')->update(['setting_value' => $request->infobip_password]);
        Setting::where('setting_key',
            'twilio_phone_number')->update(['setting_value' => $request->twilio_phone_number]);
        Setting::where('setting_key', 'clickatell_api_id')->update(['setting_value' => $request->clickatell_api_id]);
        Setting::where('setting_key',
            'payment_received_sms_template')->update(['setting_value' => $request->payment_received_sms_template]);
        Setting::where('setting_key',
            'payment_received_email_template')->update(['setting_value' => $request->payment_received_email_template]);
        Setting::where('setting_key',
            'payment_received_email_subject')->update(['setting_value' => $request->payment_received_email_subject]);
        Setting::where('setting_key',
            'payment_email_subject')->update(['setting_value' => $request->payment_email_subject]);
        Setting::where('setting_key',
            'payment_email_template')->update(['setting_value' => $request->payment_email_template]);
        Setting::where('setting_key',
            'borrower_statement_email_subject')->update(['setting_value' => $request->borrower_statement_email_subject]);
        Setting::where('setting_key',
            'borrower_statement_email_template')->update(['setting_value' => $request->borrower_statement_email_template]);
        Setting::where('setting_key',
            'loan_statement_email_subject')->update(['setting_value' => $request->loan_statement_email_subject]);
        Setting::where('setting_key',
            'loan_statement_email_template')->update(['setting_value' => $request->loan_statement_email_template]);
        Setting::where('setting_key',
            'loan_schedule_email_subject')->update(['setting_value' => $request->loan_schedule_email_subject]);
        Setting::where('setting_key',
            'loan_schedule_email_template')->update(['setting_value' => $request->loan_schedule_email_template]);
        Setting::where('setting_key', 'auto_apply_penalty')->update(['setting_value' => $request->auto_apply_penalty]);
        Setting::where('setting_key',
            'auto_payment_receipt_email')->update(['setting_value' => $request->auto_payment_receipt_email]);
        Setting::where('setting_key',
            'auto_payment_receipt_sms')->update(['setting_value' => $request->auto_payment_receipt_sms]);
        Setting::where('setting_key',
            'auto_repayment_sms_reminder')->update(['setting_value' => $request->auto_repayment_sms_reminder]);
        Setting::where('setting_key',
            'auto_repayment_email_reminder')->update(['setting_value' => $request->auto_repayment_email_reminder]);
        Setting::where('setting_key',
            'auto_repayment_days')->update(['setting_value' => $request->auto_repayment_days]);
        Setting::where('setting_key',
            'auto_overdue_repayment_sms_reminder')->update(['setting_value' => $request->auto_overdue_repayment_sms_reminder]);
        Setting::where('setting_key',
            'auto_overdue_repayment_email_reminder')->update(['setting_value' => $request->auto_overdue_repayment_email_reminder]);
        Setting::where('setting_key',
            'auto_overdue_repayment_days')->update(['setting_value' => $request->auto_overdue_repayment_days]);
        Setting::where('setting_key',
            'auto_overdue_loan_sms_reminder')->update(['setting_value' => $request->auto_overdue_loan_sms_reminder]);
        Setting::where('setting_key',
            'auto_overdue_loan_email_reminder')->update(['setting_value' => $request->auto_overdue_loan_email_reminder]);
        Setting::where('setting_key',
            'auto_overdue_loan_days')->update(['setting_value' => $request->auto_overdue_loan_days]);
        Setting::where('setting_key',
            'loan_overdue_email_subject')->update(['setting_value' => $request->loan_overdue_email_subject]);
        Setting::where('setting_key',
            'loan_overdue_email_template')->update(['setting_value' => $request->loan_overdue_email_template]);
        Setting::where('setting_key',
            'loan_overdue_sms_template')->update(['setting_value' => $request->loan_overdue_sms_template]);
        Setting::where('setting_key',
            'loan_payment_reminder_subject')->update(['setting_value' => $request->loan_payment_reminder_subject]);
        Setting::where('setting_key',
            'loan_payment_reminder_email_template')->update(['setting_value' => $request->loan_payment_reminder_email_template]);
        Setting::where('setting_key',
            'loan_payment_reminder_sms_template')->update(['setting_value' => $request->loan_payment_reminder_sms_template]);
        Setting::where('setting_key',
            'missed_payment_email_subject')->update(['setting_value' => $request->missed_payment_email_subject]);
        Setting::where('setting_key',
            'missed_payment_email_template')->update(['setting_value' => $request->missed_payment_email_template]);
        Setting::where('setting_key',
            'missed_payment_sms_template')->update(['setting_value' => $request->missed_payment_sms_template]);
        Setting::where('setting_key', 'enable_cron')->update(['setting_value' => $request->enable_cron]);
        Setting::where('setting_key', 'welcome_note')->update(['setting_value' => $request->welcome_note]);
        Setting::where('setting_key',
            'allow_self_registration')->update(['setting_value' => $request->allow_self_registration]);
        Setting::where('setting_key', 'allow_client_login')->update(['setting_value' => $request->allow_client_login]);
        Setting::where('setting_key', 'allow_client_apply')->update(['setting_value' => $request->allow_client_apply]);

        Setting::where('setting_key',
            'enable_online_payment')->update(['setting_value' => $request->enable_online_payment]);
        Setting::where('setting_key', 'paypal_enabled')->update(['setting_value' => $request->paypal_enabled]);
        Setting::where('setting_key', 'paypal_email')->update(['setting_value' => $request->paypal_email]);
        Setting::where('setting_key', 'paynow_enabled')->update(['setting_value' => $request->paynow_enabled]);
        Setting::where('setting_key', 'paynow_id')->update(['setting_value' => $request->paynow_id]);
        Setting::where('setting_key', 'paynow_key')->update(['setting_value' => $request->paynow_key]);

        Setting::where('setting_key',
            'client_request_guarantor')->update(['setting_value' => $request->client_request_guarantor]);
        Setting::where('setting_key',
            'auto_post_savings_interest')->update(['setting_value' => $request->auto_post_savings_interest]);
        Setting::where('setting_key',
            'client_auto_activate_account')->update(['setting_value' => $request->client_auto_activate_account]);

        if ($request->hasFile('company_logo')) {
            $file = array('company_logo' => $request->file('company_logo'));
            $rules = array('company_logo' => 'required|mimes:jpeg,jpg,bmp,png');
            $validator = Validator::make($file, $rules);
            if ($validator->fails()) {
                Flash::warning(trans('general.validation_error'));
                return redirect()->back()->withInput()->withErrors($validator);
            } else {
                Setting::where('setting_key',
                    'company_logo')->update(['setting_value' => $request->file('company_logo')->getClientOriginalName()]);
                $request->file('company_logo')->move(public_path() . '/uploads',
                    $request->file('company_logo')->getClientOriginalName());
            }
        }
        if ($request->hasFile('client_login_background')) {
            $file = array('client_login_background' => $request->file('client_login_background'));
            $rules = array('client_login_background' => 'required|mimes:jpeg,jpg,bmp,png');
            $validator = Validator::make($file, $rules);
            if ($validator->fails()) {
                Flash::warning(trans('general.validation_error'));
                return redirect()->back()->withInput()->withErrors($validator);
            } else {
                Setting::where('setting_key',
                    'client_login_background')->update(['setting_value' => $request->file('client_login_background')->getClientOriginalName()]);
                $request->file('client_login_background')->move(public_path() . '/uploads',
                    $request->file('client_login_background')->getClientOriginalName());
            }
        }
        GeneralHelper::audit_trail("Updated Settings");
        Flash::success("Successfully Saved");
        return redirect('setting/data');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}

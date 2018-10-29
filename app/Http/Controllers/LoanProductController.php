<?php

namespace App\Http\Controllers;

use Aloha\Twilio\Twilio;
use App\Helpers\BulkSms;
use App\Helpers\GeneralHelper;
use App\Models\CustomField;
use App\Models\LoanDisbursedBy;
use App\Models\LoanFee;
use App\Models\LoanFeeMeta;
use App\Models\LoanProduct;
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

class LoanProductController extends Controller
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
        $data = LoanProduct::all();

        return view('loan_product.data', compact('data'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $loan_fees = LoanFee::all();
        $loan_disbursed_by = LoanDisbursedBy::all();
        return view('loan_product.create', compact('loan_disbursed_by', 'loan_fees'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $loan_product = new LoanProduct();
        $loan_product->name = $request->name;

        if (empty($request->loan_disbursed_by_id)) {
            $loan_product->loan_disbursed_by_id = serialize(array());
        } else {
            $loan_product->loan_disbursed_by_id = serialize($request->loan_disbursed_by_id);
        }
        if (empty($request->repayment_order)||count($request->repayment_order)!=4) {
            Flash::warning(trans('general.repayment_order_error'));
            return redirect()->back()->withInput();
        } else {
            $loan_product->repayment_order = serialize($request->repayment_order);
        }
        $loan_product->minimum_principal = $request->minimum_principal;
        $loan_product->default_principal = $request->default_principal;
        $loan_product->maximum_principal = $request->maximum_principal;
        $loan_product->interest_method = $request->interest_method;
        $loan_product->default_interest_rate = $request->default_interest_rate;
        $loan_product->minimum_interest_rate = $request->minimum_interest_rate;
        $loan_product->maximum_interest_rate = $request->maximum_interest_rate;
        $loan_product->interest_period = $request->interest_period;
        $loan_product->default_loan_duration = $request->default_loan_duration;
        $loan_product->default_loan_duration_type = $request->default_loan_duration_type;
        $loan_product->repayment_cycle = $request->repayment_cycle;
        $loan_product->decimal_places = $request->decimal_places;
        $loan_product->override_interest = $request->override_interest;
        $loan_product->override_interest_amount = $request->override_interest_amount;
        $loan_product->grace_on_interest_charged = $request->grace_on_interest_charged;
        if (!empty($request->enable_late_repayment_penalty)) {
            $loan_product->enable_late_repayment_penalty = $request->enable_late_repayment_penalty;
        }
        if (!empty($request->enable_after_maturity_date_penalty)) {
            $loan_product->enable_after_maturity_date_penalty = $request->enable_after_maturity_date_penalty;
        }
        $loan_product->after_maturity_date_penalty_type = $request->after_maturity_date_penalty_type;
        $loan_product->late_repayment_penalty_type = $request->late_repayment_penalty_type;
        $loan_product->late_repayment_penalty_calculate = $request->late_repayment_penalty_calculate;
        $loan_product->after_maturity_date_penalty_calculate = $request->after_maturity_date_penalty_calculate;
        $loan_product->late_repayment_penalty_amount = $request->late_repayment_penalty_amount;
        $loan_product->after_maturity_date_penalty_amount = $request->after_maturity_date_penalty_amount;
        $loan_product->late_repayment_penalty_grace_period = $request->late_repayment_penalty_grace_period;
        $loan_product->after_maturity_date_penalty_grace_period = $request->after_maturity_date_penalty_grace_period;
        $loan_product->late_repayment_penalty_recurring = $request->late_repayment_penalty_recurring;
        $loan_product->after_maturity_date_penalty_recurring = $request->after_maturity_date_penalty_recurring;
        $loan_product->save();
        //save loan fees
        foreach (LoanFee::all() as $key) {
            $loan_fee = new LoanFeeMeta();
            $value = 'loan_fees_amount_' . $key->id;
            $loan_fees_schedule = 'loan_fees_schedule_' . $key->id;
            $loan_fee->user_id = Sentinel::getUser()->id;
            $loan_fee->category = 'loan_product';
            $loan_fee->parent_id = $loan_product->id;
            $loan_fee->loan_fees_id = $key->id;
            $loan_fee->value = $request->$value;
            $loan_fee->loan_fees_schedule = $request->$loan_fees_schedule;
            $loan_fee->save();
        }
        GeneralHelper::audit_trail("Added loan product with id:".$loan_product->id);
        Flash::success(trans('general.successfully_saved'));
        return redirect('loan/loan_product/data');
    }


    public function show($loan_product)
    {

        return view('loan_product.show', compact('loan_product'));
    }


    public function edit($loan_product)
    {
        $loan_disbursed_by = LoanDisbursedBy::all();
        $loan_fees = LoanFee::all();
        return view('loan_product.edit', compact('loan_product', 'loan_disbursed_by', 'loan_fees'));
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
        $loan_product = LoanProduct::find($id);
        $loan_product->name = $request->name;
        if (empty($request->loan_disbursed_by_id)) {
            $loan_product->loan_disbursed_by_id = serialize(array());
        } else {
            $loan_product->loan_disbursed_by_id = serialize($request->loan_disbursed_by_id);
        }
        if (empty($request->repayment_order)||count($request->repayment_order)!=4) {
            Flash::warning(trans('general.repayment_order_error'));
            return redirect()->back()->withInput();
        } else {
            $loan_product->repayment_order = serialize($request->repayment_order);
        }
        $loan_product->minimum_principal = $request->minimum_principal;
        $loan_product->default_principal = $request->default_principal;
        $loan_product->maximum_principal = $request->maximum_principal;
        $loan_product->interest_method = $request->interest_method;
        $loan_product->default_interest_rate = $request->default_interest_rate;
        $loan_product->minimum_interest_rate = $request->minimum_interest_rate;
        $loan_product->maximum_interest_rate = $request->maximum_interest_rate;
        $loan_product->interest_period = $request->interest_period;
        $loan_product->default_loan_duration = $request->default_loan_duration;
        $loan_product->default_loan_duration_type = $request->default_loan_duration_type;
        $loan_product->repayment_cycle = $request->repayment_cycle;
        $loan_product->decimal_places = $request->decimal_places;
        $loan_product->loan_fees_schedule = $request->loan_fees_schedule;
        $loan_product->grace_on_interest_charged = $request->grace_on_interest_charged;
        if (!empty($request->enable_late_repayment_penalty)) {
            $loan_product->enable_late_repayment_penalty = $request->enable_late_repayment_penalty;
        }
        if (!empty($request->enable_after_maturity_date_penalty)) {
            $loan_product->enable_after_maturity_date_penalty = $request->enable_after_maturity_date_penalty;
        }
        $loan_product->after_maturity_date_penalty_type = $request->after_maturity_date_penalty_type;
        $loan_product->late_repayment_penalty_type = $request->late_repayment_penalty_type;
        $loan_product->late_repayment_penalty_calculate = $request->late_repayment_penalty_calculate;
        $loan_product->after_maturity_date_penalty_calculate = $request->after_maturity_date_penalty_calculate;
        $loan_product->late_repayment_penalty_amount = $request->late_repayment_penalty_amount;
        $loan_product->after_maturity_date_penalty_amount = $request->after_maturity_date_penalty_amount;
        $loan_product->late_repayment_penalty_grace_period = $request->late_repayment_penalty_grace_period;
        $loan_product->after_maturity_date_penalty_grace_period = $request->after_maturity_date_penalty_grace_period;
        $loan_product->late_repayment_penalty_recurring = $request->late_repayment_penalty_recurring;
        $loan_product->after_maturity_date_penalty_recurring = $request->after_maturity_date_penalty_recurring;
        $loan_product->save();
        foreach (LoanFee::all() as $key) {
            if (!empty(LoanFeeMeta::where('loan_fees_id', $key->id)->where('parent_id', $id)->where('category',
                'loan_product')->first())
            ) {
                $loan_fee = LoanFeeMeta::where('loan_fees_id', $key->id)->where('parent_id', $id)->where('category',
                    'loan_product')->first();
            } else {
                $loan_fee = new LoanFeeMeta();
            }

            $value = 'loan_fees_amount_' . $key->id;
            $loan_fees_schedule = 'loan_fees_schedule_' . $key->id;
            $loan_fee->user_id = Sentinel::getUser()->id;
            $loan_fee->category = 'loan_product';
            $loan_fee->parent_id = $loan_product->id;
            $loan_fee->loan_fees_id = $key->id;
            $loan_fee->value = $request->$value;
            $loan_fee->loan_fees_schedule = $request->$loan_fees_schedule;
            $loan_fee->save();
        }
        GeneralHelper::audit_trail("Updated loan product with id:".$loan_product->id);
        Flash::success(trans('general.successfully_saved'));
        return redirect('loan/loan_product/data');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function delete($id)
    {
        LoanProduct::destroy($id);
        GeneralHelper::audit_trail("Deleted loan product with id:".$id);
        Flash::success(trans('general.successfully_deleted'));
        return redirect('loan/loan_product/data');
    }

}

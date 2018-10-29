<?php

namespace App\Http\Controllers;

use Aloha\Twilio\Twilio;
use App\Models\CustomField;
use App\Models\SavingProduct;
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

class SavingProductController extends Controller
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
        $data = SavingProduct::all();

        return view('savings_product.data', compact('data'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $interest_posting = array();
        $interest_posting[1] = trans('general.every_1_month');
        $interest_posting[2] = trans('general.every_2_month');
        $interest_posting[3] = trans('general.every_3_month');
        $interest_posting[4] = trans('general.every_3_month');
        $interest_posting[5] = trans('general.every_4_month');
        $interest_posting[6] = trans('general.every_6_month');
        $interest_posting[7] = trans('general.every_12_month');
        $interest_adding = array();
        $interest_adding[1] = trans('general.1st_month');
        $interest_adding[2] = trans('general.2nd_month');
        $interest_adding[3] = trans('general.3rd_month');
        $interest_adding[4] = trans('general.4th_month');
        $interest_adding[5] = trans('general.5th_month');
        $interest_adding[6] = trans('general.6th_month');
        $interest_adding[7] = trans('general.7th_month');
        $interest_adding[8] = trans('general.8th_month');
        $interest_adding[9] = trans('general.9th_month');
        $interest_adding[10] = trans('general.10th_month');
        $interest_adding[11] = trans('general.11th_month');
        $interest_adding[12] = trans('general.12th_month');
        $interest_adding[13] = trans('general.13th_month');
        $interest_adding[14] = trans('general.14th_month');
        $interest_adding[15] = trans('general.15th_month');
        $interest_adding[16] = trans('general.16th_month');
        $interest_adding[17] = trans('general.17th_month');
        $interest_adding[18] = trans('general.18th_month');
        $interest_adding[19] = trans('general.19th_month');
        $interest_adding[20] = trans('general.20th_month');
        $interest_adding[21] = trans('general.21th_month');
        $interest_adding[22] = trans('general.22th_month');
        $interest_adding[23] = trans('general.23th_month');
        $interest_adding[24] = trans('general.24th_month');
        $interest_adding[25] = trans('general.25th_month');
        $interest_adding[26] = trans('general.26th_month');
        $interest_adding[27] = trans('general.27th_month');
        $interest_adding[28] = trans('general.28th_month');
        $interest_adding[29] = trans('general.29th_month');
        $interest_adding[30] = trans('general.30th_month');
        $interest_adding[31] = trans('general.31st_month');
        $interest_adding[0] = trans('general.end_month');
        return view('savings_product.create', compact('interest_posting','interest_adding'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $savings_product = new SavingProduct();
        $savings_product->user_id = Sentinel::getUser()->id;
        $savings_product->name = $request->name;
        $savings_product->allow_overdraw = $request->allow_overdraw;
        $savings_product->interest_rate = $request->interest_rate;
        $savings_product->minimum_balance = $request->minimum_balance;
        $savings_product->interest_posting = $request->interest_posting;
        $savings_product->interest_adding = $request->interest_adding;
        $savings_product->save();

        Flash::success(trans('general.successfully_saved'));
        return redirect('saving/savings_product/data');
    }


    public function show($savings_product)
    {

        return view('savings_product.show', compact('savings_product'));
    }


    public function edit($savings_product)
    {
        $interest_posting = array();
        $interest_posting[1] = trans('general.every_1_month');
        $interest_posting[2] = trans('general.every_2_month');
        $interest_posting[3] = trans('general.every_3_month');
        $interest_posting[4] = trans('general.every_3_month');
        $interest_posting[5] = trans('general.every_4_month');
        $interest_posting[6] = trans('general.every_6_month');
        $interest_posting[7] = trans('general.every_12_month');
        $interest_adding = array();
        $interest_adding[1] = trans('general.1st_month');
        $interest_adding[2] = trans('general.2nd_month');
        $interest_adding[3] = trans('general.3rd_month');
        $interest_adding[4] = trans('general.4th_month');
        $interest_adding[5] = trans('general.5th_month');
        $interest_adding[6] = trans('general.6th_month');
        $interest_adding[7] = trans('general.7th_month');
        $interest_adding[8] = trans('general.8th_month');
        $interest_adding[9] = trans('general.9th_month');
        $interest_adding[10] = trans('general.10th_month');
        $interest_adding[11] = trans('general.11th_month');
        $interest_adding[12] = trans('general.12th_month');
        $interest_adding[13] = trans('general.13th_month');
        $interest_adding[14] = trans('general.14th_month');
        $interest_adding[15] = trans('general.15th_month');
        $interest_adding[16] = trans('general.16th_month');
        $interest_adding[17] = trans('general.17th_month');
        $interest_adding[18] = trans('general.18th_month');
        $interest_adding[19] = trans('general.19th_month');
        $interest_adding[20] = trans('general.20th_month');
        $interest_adding[21] = trans('general.21th_month');
        $interest_adding[22] = trans('general.22th_month');
        $interest_adding[23] = trans('general.23th_month');
        $interest_adding[24] = trans('general.24th_month');
        $interest_adding[25] = trans('general.25th_month');
        $interest_adding[26] = trans('general.26th_month');
        $interest_adding[27] = trans('general.27th_month');
        $interest_adding[28] = trans('general.28th_month');
        $interest_adding[29] = trans('general.29th_month');
        $interest_adding[30] = trans('general.30th_month');
        $interest_adding[31] = trans('general.31st_month');
        $interest_adding[0] = trans('general.end_month');
        return view('savings_product.edit', compact('savings_product','interest_posting','interest_adding'));
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
        $savings_product = SavingProduct::find($id);
        $savings_product->name = $request->name;
        $savings_product->allow_overdraw = $request->allow_overdraw;
        $savings_product->interest_rate = $request->interest_rate;
        $savings_product->minimum_balance = $request->minimum_balance;
        $savings_product->interest_posting = $request->interest_posting;
        $savings_product->interest_adding = $request->interest_adding;
        $savings_product->save();

        Flash::success(trans('general.successfully_saved'));
        return redirect('saving/savings_product/data');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function delete($id)
    {
        SavingProduct::destroy($id);
        Flash::success(trans('general.successfully_deleted'));
        return redirect('saving/savings_product/data');
    }

}

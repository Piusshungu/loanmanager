<?php

namespace App\Http\Controllers;

use Aloha\Twilio\Twilio;
use App\Helpers\GeneralHelper;
use App\Models\Borrower;

use App\Models\Capital;
use App\Models\CustomField;
use App\Models\BankAccount;
use App\Models\CustomFieldMeta;

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

class CapitalController extends Controller
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
        if (!Sentinel::hasAccess('capital')) {
            Flash::warning("Permission Denied");
            return redirect('/');
        }
        $data = Capital::where('branch_id', session('branch_id'))->get();

        return view('capital.data', compact('data'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        if (!Sentinel::hasAccess('capital.create')) {
            Flash::warning("Permission Denied");
            return redirect('/');
        }
        $banks = array();
        foreach (BankAccount::all() as $key) {
            $banks[$key->id] = $key->name;
        }
        return view('capital.create', compact('banks'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        if (!Sentinel::hasAccess('capital.create')) {
            Flash::warning("Permission Denied");
            return redirect('/');
        }
        $capital = new Capital();
        $capital->user_id = Sentinel::getUser()->id;
        $capital->amount = $request->amount;
        $capital->bank_account_id = $request->bank_account_id;
        $capital->branch_id =session('branch_id');;
        $capital->notes = $request->notes;
        $capital->date = $request->date;
        $date = explode('-', $request->date);
        $capital->year = $date[0];
        $capital->month = $date[1];
        $capital->save();

        Flash::success(trans('general.successfully_saved'));
        GeneralHelper::audit_trail("Added Capital  with id:" . $capital->id);
        if (isset($request->return_url)) {
            return redirect($request->return_url);
        }
        return redirect('capital/data');
    }


    public function show($capital)
    {
        if (!Sentinel::hasAccess('capital.view')) {
            Flash::warning("Permission Denied");
            return redirect('/');
        }
        return view('capital.show', compact(''));
    }


    public function edit($capital)
    {
        if (!Sentinel::hasAccess('capital.update')) {
            Flash::warning("Permission Denied");
            return redirect('/');
        }
        $banks = array();
        foreach (BankAccount::all() as $key) {
            $banks[$key->id] = $key->name;
        }
        return view('capital.edit', compact('capital','banks'));
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
        if (!Sentinel::hasAccess('capital.update')) {
            Flash::warning("Permission Denied");
            return redirect('/');
        }
        $capital = Capital::find($id);
        $capital->amount = $request->amount;
        $capital->bank_account_id = $request->bank_account_id;
        $capital->notes = $request->notes;
        $capital->date = $request->date;
        $date = explode('-', $request->date);
        $capital->year = $date[0];
        $capital->month = $date[1];
        $capital->save();
        GeneralHelper::audit_trail("Updated Capital  with id:" . $capital->id);
        Flash::success(trans('general.successfully_saved'));
        if (isset($request->return_url)) {
            return redirect($request->return_url);
        }
        return redirect('capital/data');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function delete($id)
    {
        if (!Sentinel::hasAccess('capital.delete')) {
            Flash::warning("Permission Denied");
            return redirect('/');
        }
        Capital::destroy($id);
        GeneralHelper::audit_trail("Deleted Capital  with id:" . $id);
        Flash::success(trans('general.successfully_deleted'));
        return redirect('capital/data');
    }


}

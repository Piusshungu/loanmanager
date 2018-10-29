<?php

namespace App\Http\Controllers;

use Aloha\Twilio\Twilio;
use App\Helpers\GeneralHelper;
use App\Models\CustomField;
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
use Laracasts\Flash\Flash;

class SavingTransactionController extends Controller
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
        $data = SavingTransaction::where('branch_id', session('branch_id'))->get();

        return view('savings_transaction.data', compact('data'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create($saving)
    {
        return view('savings_transaction.create', compact('saving'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request, $saving)
    {
        $savings_transaction = new SavingTransaction();
        if ($request->type == "withdrawal" && GeneralHelper::savings_account_balance($saving->id) < $request->amount && $saving->savings_product->allow_overdraw == 0) {
            Flash::warning(trans('general.withdrawal_more_than_balance'));
            return redirect()->back()->withInput();
        }
        $savings_transaction->user_id = Sentinel::getUser()->id;
        $savings_transaction->borrower_id = $saving->borrower_id;
        $savings_transaction->amount = $request->amount;
        $savings_transaction->branch_id = session('branch_id');
        $savings_transaction->savings_id = $saving->id;
        $savings_transaction->type = $request->type;
        $savings_transaction->date = $request->date;
        $savings_transaction->time = $request->time;
        $date = explode('-', $request->date);
        $savings_transaction->year = $date[0];
        $savings_transaction->month = $date[1];
        $savings_transaction->notes = $request->notes;
        $savings_transaction->save();

        Flash::success(trans('general.successfully_saved'));
        return redirect('saving/' . $saving->id . '/show');
    }


    public function show($savings_transaction)
    {

        return view('savings_transaction.show', compact('savings_transaction'));
    }


    public function edit($saving, $savings_transaction)
    {
        return view('savings_transaction.edit', compact('savings_transaction', 'saving'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $saving, $id)
    {
        $savings_transaction = SavingTransaction::find($id);
        $savings_transaction->amount = $request->amount;
        $savings_transaction->type = $request->type;
        $savings_transaction->date = $request->date;
        $savings_transaction->time = $request->time;
        $date = explode('-', $request->date);
        $savings_transaction->year = $date[0];
        $savings_transaction->month = $date[1];
        $savings_transaction->notes = $request->notes;
        $savings_transaction->save();

        Flash::success(trans('general.successfully_saved'));
        return redirect('saving/' . $saving->id . '/show');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function delete($saving, $id)
    {
        SavingTransaction::destroy($id);
        Flash::success(trans('general.successfully_deleted'));
        return redirect('saving/' . $saving->id . '/show');
    }

}

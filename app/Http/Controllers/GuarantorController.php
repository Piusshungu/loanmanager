<?php

namespace App\Http\Controllers;

use Aloha\Twilio\Twilio;
use App\Helpers\GeneralHelper;
use App\Models\Borrower;

use App\Models\CustomField;
use App\Models\CustomFieldMeta;
use App\Models\Guarantor;
use App\Models\Saving;
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

class GuarantorController extends Controller
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
        $data = Guarantor::all();

        return view('guarantor.data', compact('data'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create($id)
    {
        $borrowers = array();
        foreach (Borrower::all() as $key) {
            $borrowers[$key->id] = $key->first_name . ' ' . $key->last_name . ' (' . $key->unique_number . ')';
        }
        return view('guarantor.create', compact('id', 'borrowers'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request, $loan)
    {
        $guarantor = new Guarantor();
        $guarantor->user_id = Sentinel::getUser()->id;
        $guarantor->loan_id = $loan->id;
        $guarantor->borrower_id = $loan->borrower_id;
        $guarantor->guarantor_id = $request->guarantor_id;
        $guarantor->amount = $request->amount;
        $guarantor->accepted_amount = $request->accepted_amount;
        $guarantor->status = $request->status;
        $guarantor->notes = $request->notes;
        $guarantor->date = $request->date;
        $guarantor->save();
        Flash::success(trans('general.successfully_saved'));
        return redirect('loan/' . $loan->id . '/show');
    }


    public function show($guarantor)
    {

    }


    public function edit($guarantor)
    {
        $borrowers = array();
        foreach (Borrower::all() as $key) {
            $borrowers[$key->id] = $key->first_name . ' ' . $key->last_name . ' (' . $key->unique_number . ')';
        }
        return view('guarantor.edit', compact('id', 'guarantor', 'borrowers'));
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
        $guarantor = Guarantor::find($id);
        $guarantor->guarantor_id = $request->guarantor_id;
        $guarantor->amount = $request->amount;
        $guarantor->accepted_amount = $request->accepted_amount;
        $guarantor->status = $request->status;
        $guarantor->notes = $request->notes;
        $guarantor->date = $request->date;
        $guarantor->save();
        Flash::success(trans('general.successfully_saved'));
        return redirect('loan/' . $guarantor->loan_id . '/show');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int $id
     * @return \Illuminate\Http\Response
     */
    public function delete($lid, $id)
    {
        Guarantor::destroy($id);
        Flash::success(trans('general.successfully_deleted'));
        return redirect('loan/' . $lid . '/show');
    }

    public function withdraw(Request $request, $loan, $guarantor)
    {
        if (Saving::where('borrower_id', $guarantor->guarantor_id)->count() <= 0) {
            Flash::warning(trans('general.no_saving_account'));
            return redirect()->back();
        }
        if (GeneralHelper::borrower_savings_account_balance($guarantor->guarantor_id) <= 0) {
            Flash::warning(trans('general.saving_account_low_balance'));
            return redirect()->back();
        }
        $saving = Saving::where('borrower_id', $guarantor->guarantor_id)->first();
        $savings_transaction = new SavingTransaction();
        $savings_transaction->user_id = Sentinel::getUser()->id;
        $savings_transaction->borrower_id = $guarantor->guarantor_id;
        $savings_transaction->amount = $request->amount;
        $savings_transaction->savings_id = $saving->id;
        $savings_transaction->type = 'guarantee';
        $savings_transaction->date = $request->date;
        $savings_transaction->time = $request->time;
        $date = explode('-', $request->date);
        $savings_transaction->year = $date[0];
        $savings_transaction->month = $date[1];
        if (empty($request->notes)) {
            $savings_transaction->notes = "Amount use  to guarantee loan  <a href='" . url('loan/' . $loan->id . '/show') . "''>Loan #" . $loan->id . "</a>";

        } else {
            $savings_transaction->notes = $request->notes;
        }

        $savings_transaction->save();
        //$g=Guarantor::find($guarantor->id);
        $guarantor->saving_status = "hold";
        $guarantor->saving_amount = $request->amount;
        $guarantor->accepted_amount = $request->amount;
        $guarantor->save();
        Flash::success(trans('general.successfully_saved'));
        return redirect('loan/' . $loan->id . '/show');
    }

    public function restore($loan, $guarantor)
    {
        if (Saving::where('borrower_id', $guarantor->guarantor_id)->count() <= 0) {
            Flash::warning(trans('general.no_saving_account'));
            return redirect()->back();
        }
        $saving = Saving::where('borrower_id', $guarantor->guarantor_id)->first();
        $savings_transaction = new SavingTransaction();
        $savings_transaction->user_id = Sentinel::getUser()->id;
        $savings_transaction->borrower_id = $guarantor->guarantor_id;
        $savings_transaction->amount = $guarantor->accepted_amount;
        $savings_transaction->savings_id = $saving->id;
        $savings_transaction->type = 'guarantee_restored';
        $savings_transaction->date = date("Y-m-d");
        $savings_transaction->time = date("H:i");
        $date = explode('-', date("Y-m-d"));
        $savings_transaction->year = $date[0];
        $savings_transaction->month = $date[1];
        $savings_transaction->notes = "Amount restored from loan <a href='" . url('loan/' . $loan->id . '/show') . "''>Loan #" . $loan->id . "</a>";
        $savings_transaction->save();
        //$g=Guarantor::find($guarantor->id);
        $guarantor->saving_status = "restored";
        $guarantor->save();
        Flash::success(trans('general.successfully_saved'));
        return redirect('loan/' . $loan->id . '/show');
    }
}

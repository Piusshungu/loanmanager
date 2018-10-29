<?php

namespace App\Http\Controllers;

use App\Helpers\GeneralHelper;
use App\Models\Borrower;
use App\Models\Setting;
use Cartalyst\Sentinel\Laravel\Facades\Reminder;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\View;
use Laracasts\Flash\Flash;
use Sentinel;
use Illuminate\Http\Request;
use Cartalyst\Sentinel\Laravel\Facades\Activation;
use App\Http\Requests;

class HomeController extends Controller
{
    public function __construct()
    {
        if (Sentinel::check()) {
            return redirect('dashboard')->send();
        }
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if (!Sentinel::check()) {
            if (Setting::where('setting_key', 'allow_client_login')->first()->setting_value == 1) {
                return redirect('client')->send();
            } else {
                return redirect('admin')->send();
            }
        } else {
            return redirect('dashboard');
        }
    }

    public function login()
    {
        return view('login');
    }



    public function adminLogin()
    {
        return view('admin_login');
    }

    public function logout()
    {
        GeneralHelper::audit_trail("Logged out of system");
        Sentinel::logout(null, true);
        return view('login');
    }

    public function processLogin()
    {
        $rules = array(
            'email' => 'required',
            'password' => 'required',
        );
        $validator = Validator::make(Input::all(), $rules);
        if ($validator->fails()) {
            return redirect()->back()->withInput()->withErrors($validator);
        } else {
            //process validation here
            $credentials = array(
                "email" => Input::get('email'),
                "password" => Input::get('password'),
            );
            if (!empty(Input::get('remember'))) {
                //remember me token set
                if (Sentinel::authenticateAndRemember($credentials)) {
                    GeneralHelper::audit_trail("Logged in to system");
                    return redirect('/');
                } else {
                    //return back
                    Flash::warning(trans('login.failure'));
                    return redirect()->back()->withInput()->withErrors('Invalid email or password.');
                }
            } else {
                if (Sentinel::authenticate($credentials)) {
                    //logged in, redirect
                    GeneralHelper::audit_trail("Logged in to system");
                    return redirect('/');
                } else {
                    //return back
                    Flash::warning(trans('login.failure'));
                    return redirect()->back()->withInput()->withErrors('Invalid email or password.');
                }
            }


        }
    }

    public function register()
    {
        $rules = array(
            'email' => 'required|unique:users',
            'password' => 'required',
            'rpassword' => 'required|same:password',
            'first_name' => 'required',
            'last_name' => 'required',
        );
        $validator = Validator::make(Input::all(), $rules);
        if ($validator->fails()) {
            Flash::warning(trans('login.failure'));
            return redirect()->back()->withInput()->withErrors($validator);

        } else {
            //process validation here
            $credentials = array(
                "email" => Input::get('email'),
                "password" => Input::get('password'),
                "first_name" => Input::get('first_name'),
                "last_name" => Input::get('last_name'),
            );
            $user = Sentinel::registerAndActivate($credentials);
            $role = Sentinel::findRoleByName('Client');
            $role->users()->attach($user);
            $msg = trans('login.success');
            Flash::success(trans('login.success'));
            return redirect('login')->with('msg', $msg);

        }
    }

    /*
     * Password Resets
     */
    public function passwordReset()
    {
        $rules = array(
            'email' => 'required',
        );
        $validator = Validator::make(Input::all(), $rules);
        if ($validator->fails()) {
            return redirect()->back()->withInput()->withErrors($validator);
        } else {
            //process validation here
            $credentials = array(
                "email" => Input::get('email'),
            );
            $user = Sentinel::findByCredentials($credentials);
            if (!$user) {
                return redirect()->back()
                    ->withInput()
                    ->withErrors('No user with that email address belongs in our system.');
            } else {
                $reminder = Reminder::exists($user) ?: Reminder::create($user);
                $code = $reminder->code;
                $body = Setting::where('setting_key', 'password_reset_template')->first()->setting_value;
                $body = str_replace('{firstName}', $user->first_name, $body);
                $body = str_replace('{lastName}', $user->last_name, $body);
                $body = str_replace('{resetLink}', Setting::where('setting_key',
                        'portal_address')->first()->setting_value . '/reset/' . $user->id . '/' . $code, $body);
                Mail::raw($body, function ($message) use ($user) {
                    $message->from(Setting::where('setting_key', 'company_email')->first()->setting_value,
                        Setting::where('setting_key', 'company_name')->first()->setting_value);
                    $message->to($user->email);
                    $message->setContentType('text/html');
                    $message->setSubject(Setting::where('setting_key',
                        'password_reset_subject')->first()->setting_value);
                });
                Flash::success(trans('login.reset_sent'));
                return redirect()->back()
                    ->withSuccess(trans('login.reset_sent'));
            }

        }
    }

    public function confirmReset($id, $code)
    {
        return view('reset', compact('id', 'code'));
    }

    public function completeReset(Request $request, $id, $code)
    {
        $rules = array(
            'password' => 'required',
            'rpassword' => 'required|same:password',
        );
        $validator = Validator::make(Input::all(), $rules);
        if ($validator->fails()) {
            return redirect()->back()->withInput()->withErrors($validator);
        } else {
            //process validation here
            $credentials = array(
                "email" => Input::get('email'),
            );
            $user = Sentinel::findById($id);
            if (!$user) {
                return redirect()->back()
                    ->withInput()
                    ->withErrors('No user with that email address belongs in our system.');
            }
            if (!Reminder::complete($user, $code, Input::get('password'))) {
                return redirect()->to('login')
                    ->withErrors('Invalid or expired reset code.');
            }

            Flash::success(trans('login.reset_success'));
            return redirect()->back()
                ->withSuccess(trans('login.reset_success'));

        }
    }
    //client functions

    public function clientLogin(Request $request)
    {
        if ($request->session()->has('uid')) {
            //user is logged in
            return redirect('client_dashboard');
        }
        return view('client_login');
    }

    public function processClientLogin(Request $request)
    {
        if (Borrower::where('username', $request->username)->where('password', md5($request->password))->count() == 1) {
            $borrower = Borrower::where('username', $request->username)->where('password',
                md5($request->password))->first();
            //session('uid',$borrower->id);
            if($borrower->active==1) {
                $request->session()->put('uid', $borrower->id);
                return redirect('client')->with('msg', "Logged in");
            }else{
                Flash::warning(trans_choice('general.account_not_active',1));
                return redirect('client')->with('error', trans_choice('general.account_not_active',1));
            }
        } else {
            //no match
            Flash::warning(trans_choice('general.invalid_login_details',1));
            return redirect('client')->with('error', trans_choice('general.invalid_login_details',1));
        }
    }

    public function clientLogout(Request $request)
    {
        $request->session()->forget('uid');
        return redirect('client');

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

}

<?php
/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/
//route model binding
Route::model('custom_field', 'App\Models\CustomField');
Route::model('borrower', 'App\Models\Borrower');
Route::model('setting', 'App\Models\Setting');
Route::model('status', 'App\Models\LoanStatus');
Route::model('loan_comment', 'App\Models\LoanComment');
Route::model('loan_disbursed_by', 'App\Models\LoanDisbursedBy');
Route::model('loan_product', 'App\Models\LoanProduct');
Route::model('loan_fee', 'App\Models\LoanFee');
Route::model('repayment', 'App\Models\LoanRepayment');
Route::model('loan', 'App\Models\Loan');
Route::model('user', 'App\Models\User');
Route::model('expense', 'App\Models\Expense');
Route::model('expense_type', 'App\Models\ExpenseType');
Route::model('collateral', 'App\Models\Collateral');
Route::model('collateral_type', 'App\Models\CollateralType');
Route::model('other_income', 'App\Models\OtherIncome');
Route::model('other_income_type', 'App\Models\OtherIncomeType');
Route::model('payroll', 'App\Models\Payroll');
Route::model('loan_repayment_method', 'App\Models\LoanRepaymentMethod');
Route::model('permission', 'App\Models\Permission');
Route::model('loan_application', 'App\Models\LoanApplication');
Route::model('saving', 'App\Models\Saving');
Route::model('savings_product', 'App\Models\SavingProduct');
Route::model('savings_fee', 'App\Models\SavingFee');
Route::model('savings_transaction', 'App\Models\SavingTransaction');
Route::model('asset', 'App\Models\Asset');
Route::model('asset_type', 'App\Models\AssetType');
Route::model('asset_valuation', 'App\Models\AssetValuation');
Route::model('capital', 'App\Models\Capital');
Route::model('guarantor', 'App\Models\Guarantor');
Route::model('borrower_group', 'App\Models\BorrowerGroup');
Route::model('provision', 'App\Models\ProvisionRate');
Route::model('bank', 'App\Models\BankAccount');
Route::model('branch', 'App\Models\Branch');
//route for installation
Route::get('install', 'InstallController@index');
Route::group(['prefix' => 'install'], function () {
    Route::get('start', 'InstallController@index');
    Route::get('requirements', 'InstallController@requirements');
    Route::get('permissions', 'InstallController@permissions');
    Route::any('database', 'InstallController@database');
    Route::any('installation', 'InstallController@installation');
    Route::get('complete', 'InstallController@complete');

});
//cron route
Route::get('cron', 'CronController@index');
Route::get('/clear-cache', function () {
    Artisan::call('cache:clear');
    Artisan::call('view:clear');
    Artisan::call('config:clear');
    return redirect('/');

});
Route::get('/config-cache', function () {
    Artisan::call('config:cache');
    return redirect('/');
});
Route::get('/', 'HomeController@index');
Route::get('login', 'HomeController@login');
Route::get('client', 'HomeController@clientLogin');
Route::post('client', 'HomeController@processClientLogin');
Route::get('client_logout', 'HomeController@clientLogout');
Route::get('admin', 'HomeController@adminLogin');

Route::get('logout', 'HomeController@logout');
Route::post('login', 'HomeController@processLogin');
Route::post('register', 'HomeController@register');
Route::post('reset', 'HomeController@passwordReset');
Route::get('reset/{id}/{code}', 'HomeController@confirmReset');
Route::post('reset/{id}/{code}', 'HomeController@completeReset');
Route::get('check/{id}', 'HomeController@checkStatus');
Route::get('no_branch', [
    'middleware' => 'sentinel',
    function () {
        $error = "You don't have permission to access any branch. Please contact your system administrator.";
        return view('no_branch', compact('error'));
    }
]);
Route::get('dashboard', [
    'middleware' => ['sentinel', 'branch'],
    function () {
        $loans_released_monthly = array();
        $loan_collections_monthly = array();
        $date = date("Y-m-d");
        $start_date1 = date_format(date_sub(date_create($date),
            date_interval_create_from_date_string('1 years')),
            'Y-m-d');
        $start_date2 = date_format(date_sub(date_create($date),
            date_interval_create_from_date_string('1 years')),
            'Y-m-d');
        for ($i = 1; $i < 14; $i++) {
            $d = explode('-', $start_date1);
            $amount = round(\App\Models\Loan::where('branch_id', session('branch_id'))->where('status',
                'disbursed')->where('year', $d[0])->where('month',
                $d[1])->sum('principal'), 2);
            if ($i == 1 or $i == 13) {
                $ext = ' ' . $d[0];
            } else {
                $ext = '';
            }
            array_push($loans_released_monthly, array(
                'month' => date_format(date_create($start_date1),
                    'M' . $ext),
                'amount' => $amount

            ));
            //add 1 month to start date
            $start_date1 = date_format(date_add(date_create($start_date1),
                date_interval_create_from_date_string('1 months')),
                'Y-m-d');
        }
        for ($i = 1; $i < 14; $i++) {
            $d = explode('-', $start_date2);
            $amount = 0;
            foreach (\App\Models\Loan::where('branch_id', session('branch_id'))->where('status',
                'disbursed')->get() as $key) {
                $amount = $amount + \App\Models\LoanRepayment::where('branch_id', session('branch_id'))->where('loan_id', $key->id)->where('year',
                        $d[0])->where('month',
                        $d[1])->sum('amount');
            }
            $amount = round($amount, 2);
            if ($i == 1 or $i == 13) {
                $ext = ' ' . $d[0];
            } else {
                $ext = '';
            }
            array_push($loan_collections_monthly, array(
                'month' => date_format(date_create($start_date2),
                    'M' . $ext),
                'amount' => $amount

            ));
            //add 1 month to start date
            $start_date2 = date_format(date_add(date_create($start_date2),
                date_interval_create_from_date_string('1 months')),
                'Y-m-d');
        }
        $loans_released_monthly = json_encode($loans_released_monthly);
        $loan_collections_monthly = json_encode($loan_collections_monthly);
//        return $loans_released_monthly;
        return view('dashboard', compact('loans_released_monthly', 'loan_collections_monthly'));
    }
]);
//route for custom fields
Route::group(['prefix' => 'custom_field'], function () {

    Route::get('data', 'CustomFieldController@index');
    Route::get('create', 'CustomFieldController@create');
    Route::post('store', 'CustomFieldController@store');
    Route::get('{custom_field}/show', 'CustomFieldController@show');
    Route::get('{custom_field}/edit', 'CustomFieldController@edit');
    Route::post('{id}/update', 'CustomFieldController@update');
    Route::get('{id}/delete', 'CustomFieldController@delete');

});
//route for borrowers
Route::group(['prefix' => 'borrower'], function () {

    Route::get('data', 'BorrowerController@index');
    Route::get('pending', 'BorrowerController@pending');
    Route::get('create', 'BorrowerController@create');
    Route::post('store', 'BorrowerController@store');
    Route::get('{borrower}/show', 'BorrowerController@show');
    Route::get('{borrower}/edit', 'BorrowerController@edit');
    Route::post('{id}/update', 'BorrowerController@update');
    Route::get('{id}/delete', 'BorrowerController@delete');
    Route::get('{id}/approve', 'BorrowerController@approve');
    Route::get('{id}/decline', 'BorrowerController@decline');
    Route::get('{id}/delete_file', 'BorrowerController@deleteFile');
    Route::get('{id}/blacklist', 'BorrowerController@blacklist');
    Route::get('{id}/unblacklist', 'BorrowerController@unBlacklist');
    //borrower group
    Route::get('group/data', 'BorrowerGroupController@index');
    Route::get('group/create', 'BorrowerGroupController@create');
    Route::post('group/store', 'BorrowerGroupController@store');
    Route::get('group/{borrower_group}/show', 'BorrowerGroupController@show');
    Route::get('group/{borrower_group}/edit', 'BorrowerGroupController@edit');
    Route::post('group/{id}/update', 'BorrowerGroupController@update');
    Route::get('group/{id}/delete', 'BorrowerGroupController@delete');
    Route::post('group/{id}/add_borrower', 'BorrowerGroupController@addBorrower');
    Route::get('group/{id}/remove_borrower', 'BorrowerGroupController@removeBorrower');
});

Route::get('update',
    function () {
        \Illuminate\Support\Facades\Artisan::call('migrate');
        \Laracasts\Flash\Flash::success("Successfully Updated");
        return redirect('/');
    });
Route::group(['prefix' => 'update'], function () {
    Route::get('download', 'UpdateController@download');
    Route::get('install', 'UpdateController@install');
    Route::get('clean', 'UpdateController@clean');
    Route::get('finish', 'UpdateController@finish');
});
Route::get('fix', 'UpdateController@fix');
//route for setting
Route::group(['prefix' => 'setting'], function () {
    Route::get('data', 'SettingController@index');
    Route::post('update', 'SettingController@update');
    Route::get('update_system', 'SettingController@updateSystem');
});
//route for user
Route::group(['prefix' => 'user'], function () {
    Route::get('data', 'UserController@index');
    Route::get('create', 'UserController@create');
    Route::post('store', 'UserController@store');
    Route::get('{user}/edit', 'UserController@edit');
    Route::get('{user}/show', 'UserController@show');
    Route::post('{id}/update', 'UserController@update');
    Route::get('{id}/delete', 'UserController@delete');
    Route::get('{id}/profile', 'UserController@profile');
    Route::post('{id}/profile', 'UserController@profileUpdate');
    //manage permissions
    Route::get('permission/data', 'UserController@indexPermission');
    Route::get('permission/create', 'UserController@createPermission');
    Route::post('permission/store', 'UserController@storePermission');
    Route::get('permission/{permission}/edit', 'UserController@editPermission');
    Route::post('permission/{id}/update', 'UserController@updatePermission');
    Route::get('permission/{id}/delete', 'UserController@deletePermission');
    //manage roles
    Route::get('role/data', 'UserController@indexRole');
    Route::get('role/create', 'UserController@createRole');
    Route::post('role/store', 'UserController@storeRole');
    Route::get('role/{id}/edit', 'UserController@editRole');
    Route::post('role/{id}/update', 'UserController@updateRole');
    Route::get('role/{id}/delete', 'UserController@deleteRole');
});
//route for loans
Route::group(['prefix' => 'loan'], function () {
    //main loan routes
    Route::get('data', 'LoanController@index');
    Route::get('pending_approval', 'LoanController@pendingApproval');
    Route::get('pending_disbursement', 'LoanController@pendingDisbursement');
    Route::get('declined', 'LoanController@declined');
    Route::get('withdrawn', 'LoanController@withdrawn');
    Route::get('written_off', 'LoanController@writtenOff');
    Route::get('closed', 'LoanController@closed');
    Route::get('pending_reschedule', 'LoanController@pendingReschedule');
    Route::get('{id}/reschedule', 'LoanController@reschedule');
    Route::post('{id}/reschedule/store', 'LoanController@rescheduleStore');
    Route::post('{id}/approve', 'LoanController@approve');
    Route::get('{id}/unapprove', 'LoanController@unapprove');
    Route::post('{id}/decline', 'LoanController@decline');
    Route::post('{loan}/disburse', 'LoanController@disburse');
    Route::get('{id}/undisburse', 'LoanController@undisburse');
    Route::post('{id}/withdraw', 'LoanController@withdraw');
    Route::post('{id}/write_off', 'LoanController@write_off');
    Route::post('{id}/reschedule', 'LoanController@reschedule');
    Route::get('{id}/unwithdraw', 'LoanController@unwithdraw');
    Route::get('{id}/unwrite_off', 'LoanController@unwrite_off');
    Route::get('create', 'LoanController@create');
    Route::post('store', 'LoanController@store');
    Route::get('{loan}/edit', 'LoanController@edit');
    Route::get('{loan}/show', 'LoanController@show');
    Route::any('{loan}/override', 'LoanController@override');
    Route::post('{id}/update', 'LoanController@update');
    Route::get('{id}/delete', 'LoanController@delete');
    Route::get('{id}/delete_file', 'LoanController@deleteFile');
    Route::get('{loan}/loan_statement/print', 'LoanController@printLoanStatement');
    Route::get('{loan}/loan_statement/pdf', 'LoanController@pdfLoanStatement');
    Route::get('{loan}/loan_statement/email', 'LoanController@emailLoanStatement');
    Route::get('{borrower}/borrower_statement/print', 'LoanController@printBorrowerStatement');
    Route::get('{borrower}/borrower_statement/pdf', 'LoanController@pdfBorrowerStatement');
    Route::get('{borrower}/borrower_statement/email', 'LoanController@emailBorrowerStatement');
    //loan repayment routes
    Route::get('{loan}/repayment/data', 'LoanController@indexRepayment');
    Route::get('{loan}/repayment/create', 'LoanController@createRepayment');
    Route::post('{loan}/repayment/store', 'LoanController@storeRepayment');
    Route::get('{loan}/repayment/{repayment}/edit', 'LoanController@editRepayment');
    Route::get('{loan}/repayment/show', 'LoanController@showRepayment');
    Route::post('{loan}/repayment/{id}/update', 'LoanController@updateRepayment');
    Route::get('{loan}/repayment/{repayment}/pdf', 'LoanController@pdfRepayment');
    Route::get('{loan}/repayment/{repayment}/email', 'LoanController@emailRepayment');
    Route::get('{loan}/repayment/{repayment}/print', 'LoanController@printRepayment');
    Route::get('{loan}/repayment/{id}/delete', 'LoanController@deleteRepayment');
    //comment routes
    Route::get('loan_comment/data', 'LoanCommentController@index');
    Route::get('{id}/loan_comment/create', 'LoanCommentController@create');
    Route::post('{id}/loan_comment/store', 'LoanCommentController@store');
    Route::get('{id}/loan_comment/{loan_comment}/edit', 'LoanCommentController@edit');
    Route::get('{id}/loan_comment/{loan_comment}/show', 'LoanCommentController@show');
    Route::post('{id}/loan_comment/{cid}/update', 'LoanCommentController@update');
    Route::get('{id}/loan_comment/{cid}/delete', 'LoanCommentController@delete');
    //status routes
    Route::get('loan_status/data', 'LoanStatusController@index');
    Route::get('loan_status/create', 'LoanStatusController@create');
    Route::post('loan_status/store', 'LoanStatusController@store');
    Route::get('loan_status/{loan_status}/edit', 'LoanStatusController@edit');
    Route::get('loan_status/{loan_status}/show', 'LoanStatusController@show');
    Route::post('loan_status/{id}/update', 'LoanStatusController@update');
    Route::get('loan_status/{id}/delete', 'LoanStatusController@delete');
    //routes for disbursed by
    Route::get('loan_disbursed_by/data', 'LoanDisbursedByController@index');
    Route::get('loan_disbursed_by/create', 'LoanDisbursedByController@create');
    Route::post('loan_disbursed_by/store', 'LoanDisbursedByController@store');
    Route::get('loan_disbursed_by/{loan_disbursed_by}/edit', 'LoanDisbursedByController@edit');
    Route::get('loan_disbursed_by/{loan_disbursed_by}/show', 'LoanDisbursedByController@show');
    Route::post('loan_disbursed_by/{id}/update', 'LoanDisbursedByController@update');
    Route::get('loan_disbursed_by/{id}/delete', 'LoanDisbursedByController@delete');
    //routes for repayment method
    Route::get('loan_repayment_method/data', 'LoanRepaymentMethodController@index');
    Route::get('loan_repayment_method/create', 'LoanRepaymentMethodController@create');
    Route::post('loan_repayment_method/store', 'LoanRepaymentMethodController@store');
    Route::get('loan_repayment_method/{loan_repayment_method}/edit', 'LoanRepaymentMethodController@edit');
    Route::get('loan_repayment_method/{loan_repayment_method}/show', 'LoanRepaymentMethodController@show');
    Route::post('loan_repayment_method/{id}/update', 'LoanRepaymentMethodController@update');
    Route::get('loan_repayment_method/{id}/delete', 'LoanRepaymentMethodController@delete');
    //routes for loan product
    Route::get('loan_product/data', 'LoanProductController@index');
    Route::get('loan_product/create', 'LoanProductController@create');
    Route::post('loan_product/store', 'LoanProductController@store');
    Route::get('loan_product/{loan_product}/edit', 'LoanProductController@edit');
    Route::get('loan_product/{loan_product}/show', 'LoanProductController@show');
    Route::post('loan_product/{id}/update', 'LoanProductController@update');
    Route::get('loan_product/{id}/delete', 'LoanProductController@delete');
    //route for managing schedules
    Route::get('{loan}/schedule/edit', 'LoanController@editSchedule');
    Route::post('{loan}/schedule/update', 'LoanController@updateSchedule');
    Route::get('{loan}/schedule/print', 'LoanController@printSchedule');
    Route::get('{loan}/schedule/pdf', 'LoanController@pdfSchedule');
    Route::get('{loan}/schedule/email', 'LoanController@emailLoanSchedule');
    //routes for repayment method
    Route::get('loan_fee/data', 'LoanFeeController@index');
    Route::get('loan_fee/create', 'LoanFeeController@create');
    Route::post('loan_fee/store', 'LoanFeeController@store');
    Route::get('loan_fee/{loan_fee}/edit', 'LoanFeeController@edit');
    Route::get('loan_fee/{loan_fee}/show', 'LoanFeeController@show');
    Route::post('loan_fee/{id}/update', 'LoanFeeController@update');
    Route::get('loan_fee/{id}/delete', 'LoanFeeController@delete');
    //routes for applications
    Route::get('loan_application/data', 'LoanController@indexApplication');
    Route::get('loan_application/{id}/decline', 'LoanController@declineApplication');
    Route::get('loan_application/{id}/approve', 'LoanController@approveApplication');
    Route::post('loan_application/{id}/store', 'LoanController@storeApproveApplication');
    //routes for guarantors
    Route::get('{loan}/guarantor/data', 'GuarantorController@index');
    Route::get('{id}/guarantor/create', 'GuarantorController@create');
    Route::post('{loan}/guarantor/store', 'GuarantorController@store');
    Route::get('guarantor/{guarantor}/edit', 'GuarantorController@edit');
    Route::get('{loan}/guarantor/{guarantor}/show', 'GuarantorController@show');
    Route::post('guarantor/{id}/update', 'GuarantorController@update');
    Route::get('{lid}/guarantor/{id}/delete', 'GuarantorController@delete');
    Route::post('{loan}/guarantor/{guarantor}/withdraw', 'GuarantorController@withdraw');
    Route::get('{loan}/guarantor/{guarantor}/restore', 'GuarantorController@restore');
    //loan calculator
    Route::get('loan_calculator/create', 'LoanController@createLoanCalculator');
    Route::post('loan_calculator/show', 'LoanController@showLoanCalculator');
    Route::post('loan_calculator/store', 'LoanController@storeLoanCalculator');
    //routes for provision rates
    Route::get('provision/data', 'ProvisionRateController@index');
    Route::get('provision/create', 'ProvisionRateController@create');
    Route::post('provision/store', 'ProvisionRateController@store');
    Route::get('provision/{provision}/edit', 'ProvisionRateController@edit');
    Route::get('provision/{provision}/show', 'ProvisionRateController@show');
    Route::post('provision/{id}/update', 'ProvisionRateController@update');
    Route::get('provision/{id}/delete', 'ProvisionRateController@delete');
});
//loan repayment list
Route::get('repayment/data', 'LoanController@indexRepayment');
Route::get('repayment/bulk/create', 'LoanController@createBulkRepayment');
Route::post('repayment/bulk/store', 'LoanController@storeBulkRepayment');
//route for tax
Route::group(['prefix' => 'tax'], function () {
    Route::get('data', 'TaxController@index');
    Route::get('create', 'TaxController@create');
    Route::post('store', 'TaxController@store');
    Route::get('{tax}/edit', 'TaxController@edit');
    Route::get('{id}/show', 'TaxController@show');
    Route::post('{id}/update', 'TaxController@update');
    Route::get('{id}/delete', 'TaxController@destroy');
});
//route for payroll
Route::group(['prefix' => 'payroll'], function () {
    Route::get('data', 'PayrollController@index');
    Route::get('create', 'PayrollController@create');
    Route::post('store', 'PayrollController@store');
    Route::get('{payroll}/show', 'PayrollController@show');
    Route::get('{payroll}/edit', 'PayrollController@edit');
    Route::post('{id}/update', 'PayrollController@update');
    Route::get('{id}/delete', 'PayrollController@delete');
    Route::get('getUser/{id}', 'PayrollController@getUser');
    Route::get('{payroll}/payslip', 'PayrollController@pdfPayslip');
    Route::get('{user}/data', 'PayrollController@staffPayroll');
//template
    Route::any('template', 'PayrollController@indexTemplate');
    Route::get('template/{id}/edit', 'PayrollController@editTemplate');
    Route::post('template/{id}/update', 'PayrollController@updateTemplate');
    Route::get('template/{id}/delete_meta', 'PayrollController@deleteTemplateMeta');
    Route::post('template/{id}/add_row', 'PayrollController@addTemplateRow');
});
//route for expenses
Route::group(['prefix' => 'expense'], function () {
    Route::get('data', 'ExpenseController@index');
    Route::get('create', 'ExpenseController@create');
    Route::post('store', 'ExpenseController@store');
    Route::get('{expense}/edit', 'ExpenseController@edit');
    Route::get('{expense}/show', 'ExpenseController@show');
    Route::post('{id}/update', 'ExpenseController@update');
    Route::get('{id}/delete', 'ExpenseController@delete');
    Route::get('{id}/delete_file', 'ExpenseController@deleteFile');

    //expense types
    Route::get('type/data', 'ExpenseController@indexType');
    Route::get('type/create', 'ExpenseController@createType');
    Route::post('type/store', 'ExpenseController@storeType');
    Route::get('type/{expense_type}/edit', 'ExpenseController@editType');
    Route::get('type/{expense_type}/show', 'ExpenseController@showType');
    Route::post('type/{id}/update', 'ExpenseController@updateType');
    Route::get('type/{id}/delete', 'ExpenseController@deleteType');
});
//route for other income
Route::group(['prefix' => 'other_income'], function () {
    Route::get('data', 'OtherIncomeController@index');
    Route::get('create', 'OtherIncomeController@create');
    Route::post('store', 'OtherIncomeController@store');
    Route::get('{other_income}/edit', 'OtherIncomeController@edit');
    Route::get('{other_income}/show', 'OtherIncomeController@show');
    Route::post('{id}/update', 'OtherIncomeController@update');
    Route::get('{id}/delete', 'OtherIncomeController@delete');
    Route::get('{id}/delete_file', 'OtherIncomeController@deleteFile');
    //income types
    Route::get('type/data', 'OtherIncomeController@indexType');
    Route::get('type/create', 'OtherIncomeController@createType');
    Route::post('type/store', 'OtherIncomeController@storeType');
    Route::get('type/{other_income_type}/edit', 'OtherIncomeController@editType');
    Route::get('type/{other_income_type}/show', 'OtherIncomeController@showType');
    Route::post('type/{id}/update', 'OtherIncomeController@updateType');
    Route::get('type/{id}/delete', 'OtherIncomeController@deleteType');
});
//route for collateral
Route::group(['prefix' => 'collateral'], function () {
    Route::get('data', 'CollateralController@index');
    Route::get('{id}/create', 'CollateralController@create');
    Route::post('{loan}/store', 'CollateralController@store');
    Route::get('{collateral}/edit', 'CollateralController@edit');
    Route::get('{collateral}/show', 'CollateralController@show');
    Route::post('{id}/update', 'CollateralController@update');
    Route::get('{id}/delete', 'CollateralController@delete');
    Route::get('{id}/delete_file', 'CollateralController@deleteFile');
    // types
    Route::get('type/data', 'CollateralController@indexType');
    Route::get('type/fix/create', 'CollateralController@createType');
    Route::post('type/fix/store', 'CollateralController@storeType');
    Route::get('type/{collateral_type}/edit', 'CollateralController@editType');
    Route::get('type/{collateral_type}/show', 'CollateralController@showType');
    Route::post('type/{id}/update', 'CollateralController@updateType');
    Route::get('type/{id}/delete', 'CollateralController@deleteType');
});
//route for reports
Route::group(['prefix' => 'report'], function () {
    Route::any('cash_flow', 'ReportController@cash_flow');
    Route::any('profit_loss', 'ReportController@profit_loss');
    Route::any('collection', 'ReportController@collection_report');
    Route::any('loan_product', 'ReportController@loan_product');
    Route::any('balance_sheet', 'ReportController@balance_sheet');
    Route::any('loan_list', 'ReportController@loan_list');
    Route::any('loan_balance', 'ReportController@loan_balance');
    Route::any('loan_arrears', 'ReportController@loan_arrears');
    Route::any('loan_transaction', 'ReportController@loan_transaction');
    Route::any('loan_classification', 'ReportController@loan_classification');
    Route::any('loan_projection', 'ReportController@loan_projection');

});
//route for communication
Route::group(['prefix' => 'communication'], function () {
    Route::get('email', 'CommunicationController@indexEmail');
    Route::get('sms', 'CommunicationController@indexSms');
    Route::get('email/create', 'CommunicationController@createEmail');
    Route::post('email/store', 'CommunicationController@storeEmail');
    Route::get('email/{id}/delete', 'CommunicationController@deleteEmail');
    Route::get('sms/create', 'CommunicationController@createSms');
    Route::post('sms/store', 'CommunicationController@storeSms');
    Route::get('sms/{id}/delete', 'CommunicationController@deleteSms');

});
//routes for clients

Route::get('client_dashboard', 'ClientController@clientDashboard');
Route::get('client_profile', 'ClientController@clientProfile');
Route::post('client_register', 'ClientController@processClientRegister');
Route::post('client_profile', 'ClientController@processClientProfile');
Route::group(['prefix' => 'client'], function () {
    Route::get('application/data', 'ClientController@indexApplication');
    Route::get('application/create', 'ClientController@createApplication');
    Route::get('application/{loan_application}/show', 'ClientController@showApplication');
    Route::get('application/{loan_application}/guarantor/create', 'ClientController@createGuarantor');
    Route::post('application/{loan_application}/guarantor/store', 'ClientController@storeGuarantor');
    Route::post('application/store', 'ClientController@storeApplication');
    Route::get('guarantor/data', 'ClientController@indexGuarantor');
    Route::get('guarantor/{id}/decline', 'ClientController@declineGuarantor');
    Route::post('guarantor/{id}/accept', 'ClientController@acceptGuarantor');
    Route::get('loan/{loan}/show', 'ClientController@showLoan');
    Route::get('loan/{loan}/pay', 'ClientController@pay');
    Route::post('loan/{loan}/pay/paynow', 'ClientController@paynow');
    Route::any('loan/{loan}/pay/paynow/return', 'ClientController@paynowReturn');
    Route::any('loan/{loan}/pay/paynow/result', 'ClientController@paynowResult');
    Route::any('loan/{loan}/pay/paypal/done', 'ClientController@paypalDone');
    Route::any('loan/pay/paypal/ipn', 'ClientController@paypalIPN');
    Route::get('saving/show', 'ClientController@showSaving');
    Route::get('saving/{saving}/statement/print', 'ClientController@printSavingStatement');
    Route::get('saving/{saving}/statement/pdf', 'ClientController@pdfSavingStatement');
    Route::get('saving/{saving}/pay', 'ClientController@paySaving');
    Route::post('saving/{saving}/pay/paynow', 'ClientController@paynowSaving');
    Route::any('saving/{saving}/pay/paynow/return', 'ClientController@paynowReturnSaving');
    Route::any('saving/{saving}/pay/paynow/result', 'ClientController@paynowResultSaving');
    Route::any('saving/{saving}/pay/paypal/done', 'ClientController@paypalDoneSaving');
    Route::any('saving/pay/paypal/ipn', 'ClientController@paypalIPNSaving');
});
//route for savings
Route::group(['prefix' => 'saving'], function () {
    Route::get('data', 'SavingController@index');
    Route::get('create', 'SavingController@create');
    Route::post('store', 'SavingController@store');
    Route::get('{saving}/edit', 'SavingController@edit');
    Route::get('{saving}/show', 'SavingController@show');
    Route::post('{id}/update', 'SavingController@update');
    Route::get('{id}/delete', 'SavingController@delete');
    Route::get('{saving}/statement/print', 'SavingController@printStatement');
    Route::get('{saving}/statement/pdf', 'SavingController@pdfStatement');
    Route::get('{saving}/transfer/create', 'SavingController@transfer');
    Route::post('{saving}/transfer/store', 'SavingController@storeTransfer');
    //saving products
    Route::get('savings_product/data', 'SavingProductController@index');
    Route::get('savings_product/create', 'SavingProductController@create');
    Route::post('savings_product/store', 'SavingProductController@store');
    Route::get('savings_product/{savings_product}/edit', 'SavingProductController@edit');
    Route::post('savings_product/{id}/update', 'SavingProductController@update');
    Route::get('savings_product/{id}/delete', 'SavingProductController@delete');
    //saving fees
    Route::get('savings_fee/data', 'SavingFeeController@index');
    Route::get('savings_fee/create', 'SavingFeeController@create');
    Route::post('savings_fee/store', 'SavingFeeController@store');
    Route::get('savings_fee/{savings_fee}/edit', 'SavingFeeController@edit');
    Route::post('savings_fee/{id}/update', 'SavingFeeController@update');
    Route::get('savings_fee/{id}/delete', 'SavingFeeController@delete');
    //saving transactions
    Route::get('savings_transaction/data', 'SavingTransactionController@index');
    Route::get('{saving}/savings_transaction/create', 'SavingTransactionController@create');
    Route::post('{saving}/savings_transaction/store', 'SavingTransactionController@store');
    Route::get('{saving}/savings_transaction/{savings_transaction}/edit', 'SavingTransactionController@edit');
    Route::post('{saving}/savings_transaction/{id}/update', 'SavingTransactionController@update');
    Route::get('{saving}/savings_transaction/{id}/delete', 'SavingTransactionController@delete');
});
//routes for assets
Route::group(['prefix' => 'asset'], function () {
    Route::get('data', 'AssetController@index');
    Route::get('create', 'AssetController@create');
    Route::post('store', 'AssetController@store');
    Route::get('{asset}/edit', 'AssetController@edit');
    Route::get('{asset}/show', 'AssetController@show');
    Route::post('{id}/update', 'AssetController@update');
    Route::get('{id}/delete', 'AssetController@delete');
    Route::get('{id}/delete_file', 'AssetController@deleteFile');

    //expense types
    Route::get('type/data', 'AssetController@indexType');
    Route::get('type/create', 'AssetController@createType');
    Route::post('type/store', 'AssetController@storeType');
    Route::get('type/{asset_type}/edit', 'AssetController@editType');
    Route::get('type/{asset_type}/show', 'AssetController@showType');
    Route::post('type/{id}/update', 'AssetController@updateType');
    Route::get('type/{id}/delete', 'AssetController@deleteType');
});
//route for capital
Route::group(['prefix' => 'capital'], function () {
    Route::get('data', 'CapitalController@index');
    Route::get('create', 'CapitalController@create');
    Route::post('store', 'CapitalController@store');
    Route::get('{capital}/edit', 'CapitalController@edit');
    Route::get('{id}/show', 'CapitalController@show');
    Route::post('{id}/update', 'CapitalController@update');
    Route::get('{id}/delete', 'CapitalController@delete');
    //bank accounts
    Route::get('bank/data', 'BankAccountController@index');
    Route::get('bank/create', 'BankAccountController@create');
    Route::post('bank/store', 'BankAccountController@store');
    Route::get('bank/{bank}/edit', 'BankAccountController@edit');
    Route::get('bank/{id}/show', 'BankAccountController@show');
    Route::post('bank/{id}/update', 'BankAccountController@update');
    Route::get('bank/{id}/delete', 'BankAccountController@delete');
});
Route::get('audit_trail/data', 'AuditTrailController@index');
//routes branches
Route::group(['prefix' => 'branch'], function () {
    Route::get('data', 'BranchController@index');
    Route::get('create', 'BranchController@create');
    Route::post('store', 'BranchController@store');
    Route::get('{branch}/show', 'BranchController@show');
    Route::get('{branch}/edit', 'BranchController@edit');
    Route::post('{id}/update', 'BranchController@update');
    Route::get('{id}/delete', 'BranchController@delete');
    Route::get('{id}/delete_file', 'BranchController@deleteFile');
    Route::post('{id}/add_user', 'BranchController@addUser');
    Route::get('{id}/remove_user', 'BranchController@removeUser');
    Route::get('change', 'BranchController@change');
    Route::post('change', 'BranchController@updateChange');
});
<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateDefaultBranchAndAssignUser extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        $branch = new \App\Models\Branch();
        $branch->name = "Default";
        $branch->default_branch = "1";
        $branch->save();
        //look for 1 admin user to give the permission
        $role = \Cartalyst\Sentinel\Laravel\Facades\Sentinel::findRoleByName('admin');
        if (!empty($role->users()->with('roles')->first())) {
            $user = $role->users()->with('roles')->orderBy('created_at','asc')->first();
            $permission = new \App\Models\BranchUser();
            $permission->branch_id = $branch->id;
            $permission->user_id = $user->id;
            $permission->save();
            //notify user
            \Illuminate\Support\Facades\Mail::raw("Default Branch permission has been assigned to you",
                function ($message) {
                    $message->from(\App\Models\Setting::where('setting_key',
                        'company_email')->first()->setting_value,
                        \App\Models\Setting::where('setting_key', 'company_name')->first()->setting_value);
                    $message->to(\App\Models\Setting::where('setting_key',
                        'company_email')->first()->setting_value);
                    $headers = $message->getHeaders();
                    $message->setContentType('text/html');
                    $message->setSubject("Branch permission assigned");

                });
            if (!empty(\App\Models\Setting::where('setting_key', 'company_email')->first())) {
                \Illuminate\Support\Facades\Mail::raw("Default Branch permission has been assigned to: " . $user->first_name . " " . $user->last_name,
                    function ($message) {
                        $message->from(\App\Models\Setting::where('setting_key',
                            'company_email')->first()->setting_value,
                            \App\Models\Setting::where('setting_key', 'company_name')->first()->setting_value);
                        $message->to(\App\Models\Setting::where('setting_key',
                            'company_email')->first()->setting_value);
                        $headers = $message->getHeaders();
                        $message->setContentType('text/html');
                        $message->setSubject("Branch permission assigned");

                    });
            }
        } else {
            //failed to assign default user, notify admin
            if (!empty(\App\Models\Setting::where('setting_key', 'company_email')->first())) {
                \Illuminate\Support\Facades\Mail::raw("Failed to assign branch permission to user",
                    function ($message) {
                        $message->from(\App\Models\Setting::where('setting_key',
                            'company_email')->first()->setting_value,
                            \App\Models\Setting::where('setting_key', 'company_name')->first()->setting_value);
                        $message->to(\App\Models\Setting::where('setting_key',
                            'company_email')->first()->setting_value);
                        $headers = $message->getHeaders();
                        $message->setContentType('text/html');
                        $message->setSubject("Failed to assign branch permission");

                    });
            }

        }
        //move all data to current default branch

    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //
    }
}

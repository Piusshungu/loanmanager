<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddPaymentToV11SettingsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        \Illuminate\Support\Facades\DB::table('settings')->insert([
            [
                'setting_key' => 'enable_online_payment',
                'setting_value' => '0',
            ],
            [
                'setting_key' => 'paynow_key',
                'setting_value' => '',
            ],
            [
                'setting_key' => 'paynow_id',
                'setting_value' => '',
            ],
            [
                'setting_key' => 'paypal_enabled',
                'setting_value' => '0',
            ],
            [
                'setting_key' => 'paynow_enabled',
                'setting_value' => '0',
            ],
        ]);
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

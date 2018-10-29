<style>

    .table {
        width: 100%;
        max-width: 100%;
        margin-bottom: 20px;
        display: table;
    }

    .text-left {
        text-align: left;
    }

    .text-right {
        text-align: right;
    }

    .text-center {
        text-align: center;
    }

    .text-justify {
        text-align: justify;
    }

    .pull-right {
        float: right !important;
    }
</style>


<div>
    <h3 class="text-center"><b>{{\App\Models\Setting::where('setting_key','company_name')->first()->setting_value}}</b>
    </h3>

    <h3 class="text-center"><b>{{trans_choice('general.loan',1)}} {{trans_choice('general.repayment',1)}} {{trans_choice('general.schedule',1)}}</b></h3>

    <div style="width: 100%;margin-left: auto;font-size:10px;margin-right: auto;border-top: solid thin #2cc3dd;border-bottom: solid thin #2cc3dd;padding-top: 40px;text-transform: capitalize">
        <table style="margin-top: 20px">
            <tr>
                <td style="width: 30%;margin-right: 20px;float: left">
                    <b>{{trans_choice('general.date',1)}}:</b>{{date("Y-m-d")}}<br><br>
                    <b>{{$loan->borrower->title}}. {{$loan->borrower->first_name}} {{$loan->borrower->last_name}}</b>
                </td>
                <td style="width: 30%;margin-right: 20px;float: left">
                    <table width="100%">
                        <tr>
                            <td><b>{{trans_choice('general.loan',1)}} #</b></td>
                            <td>{{$loan->id}}</td>
                        </tr>
                        <tr>
                            <td><b>{{trans_choice('general.released',1)}}</b></td>
                            <td>{{$loan->release_date}}</td>
                        </tr>
                        <tr>
                            <td><b>{{trans_choice('general.maturity_date',1)}}</b></td>
                            <td>{{$loan->maturity_date}}</td>
                        </tr>
                        <tr>
                            <td><b>{{trans_choice('general.repayment',1)}}</b></td>
                            <td>{{$loan->repayment_cycle}}</td>
                        </tr>
                        <tr>
                            <td><b>{{trans_choice('general.principal',1)}}</b></td>
                            <td>{{number_format($loan->principal,2)}}</td>
                        </tr>
                        <tr>
                            <td><b>{{trans_choice('general.interest',1)}}%</b></td>
                            <td>{{number_format($loan->interest_rate,2)}}
                                %/{{$loan->interest_period}}</td>
                        </tr>
                    </table>
                </td>
                <td style="width: 30%;margin-right: 20px;float: left">
                    <table>
                        <tr>
                            <td><b>{{trans_choice('general.interest',1)}} </b></td>
                            <td>{{number_format(\App\Helpers\GeneralHelper::loan_total_interest($loan->id),2)}}</td>
                        </tr>
                        <tr>
                            <td><b>{{trans_choice('general.fee',2)}}</b></td>
                            <td>{{number_format(\App\Helpers\GeneralHelper::loan_total_fees($loan->id),2)}}</td>
                        </tr>
                        <tr>
                            <td><b>{{trans_choice('general.penalty',1)}}</b></td>
                            <td>{{number_format(\App\Helpers\GeneralHelper::loan_total_penalty($loan->id),2)}}</td>
                        </tr>
                        <tr>
                            <td><b>{{trans_choice('general.due',1)}}</b></td>
                            <td>{{number_format(\App\Helpers\GeneralHelper::loan_total_due_amount($loan->id),2)}}</td>
                        </tr>
                        <tr>
                            <td><b>{{trans_choice('general.paid',1)}}</b></td>
                            <td>{{number_format(\App\Helpers\GeneralHelper::loan_total_paid($loan->id),2)}}</td>
                        </tr>
                        <tr>
                            <td><b>{{trans_choice('general.balance',1)}}</b></td>
                            <td>{{number_format(\App\Helpers\GeneralHelper::loan_total_balance($loan->id),2)}}</td>
                        </tr>
                    </table>

                </td>
            </tr>
        </table>
    </div>
    <div style="margin-top:30px;margin-left: auto;margin-right: auto;text-transform: capitalize;font-size: 8px;">
        <table border="1" class="table ">
            <thead>
            <tr>
                <th>
                    <b>#</b>
                </th>
                <th>
                    <b>{{trans_choice('general.date',1)}}</b>
                </th>
                <th>
                    <b>{{trans_choice('general.description',1)}}</b>
                </th>
                <th style="text-align:right;">
                    <b>{{trans_choice('general.principal',1)}}</b>
                </th>
                <th style="text-align:right;">
                    <b>{{trans_choice('general.interest',1)}}</b>
                </th>
                <th style="text-align:right;">
                    <b>{{trans_choice('general.fee',2)}}</b>
                </th>
                <th style="text-align:right;">
                    <b>{{trans_choice('general.penalty',1)}}</b>
                </th>
                <th style="text-align:right;">
                    <b>{{trans_choice('general.due',1)}}</b>
                </th>
                <th style="text-align:right;">
                    <b>{{trans_choice('general.total',1)}} {{trans_choice('general.due',1)}}</b>
                </th>
                <th style="text-align:right;">
                    <b>{{trans_choice('general.principal',1)}} {{trans_choice('general.balance',1)}} {{trans_choice('general.owed',1)}}</b>
                </th>
            </tr>
            </thead>
            <tbody>

            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <td style="text-align:right;">
                    {{number_format(\App\Models\LoanSchedule::where('loan_id',
                    $loan->id)->sum('principal'),2)}}
                </td>
            </tr>
            <?php
            $count = 1;
            $total_due = 0;
            $principal_balance = \App\Models\LoanSchedule::where('loan_id',
                    $loan->id)->sum('principal');
            foreach ($schedules as $schedule) {
            $principal_balance = $principal_balance - $schedule->principal;
            if ($count == 1) {
                $total_due = ($schedule->principal + $schedule->interest + $schedule->fees + $schedule->penalty);

            } else {
                $total_due = $total_due + ($schedule->principal + $schedule->interest + $schedule->fees + $schedule->penalty);
            }
            ?>
            <tr>
                <td>
                    {{$count}}
                </td>
                <td>
                    {{$schedule->due_date}}
                </td>
                <td>
                    {{$schedule->description}}
                </td>
                <td style="text-align:right">
                    {{number_format($schedule->principal,2)}}
                </td>
                <td style="text-align:right">
                    {{number_format($schedule->interest,2)}}
                </td>
                <td style="text-align:right">
                    {{number_format($schedule->fees,2)}}
                </td>
                <td style="text-align:right">
                    {{number_format($schedule->penalty,2)}}
                </td>
                <td style="text-align:right; font-weight:bold">
                    {{number_format(($schedule->principal+$schedule->interest+$schedule->fees+$schedule->penalty),2)}}
                </td>
                <td style="text-align:right;">
                    {{number_format($total_due,2)}}
                </td>
                <td style="text-align:right;">
                    {{number_format($principal_balance,2)}}
                </td>
            </tr>
            <?php
            $count++;
            }
            ?>
            <tr>
                <td></td>
                <td></td>
                <td style="font-weight:bold">{{trans_choice('general.total',1)}} {{trans_choice('general.due',1)}}</td>
                <td style="text-align:right;">
                    {{number_format(\App\Helpers\GeneralHelper::loan_total_principal($loan->id),2)}}
                </td>
                <td style="text-align:right;">
                    {{number_format(\App\Helpers\GeneralHelper::loan_total_interest($loan->id),2)}}
                </td>
                <td style="text-align:right;">
                    {{number_format(\App\Helpers\GeneralHelper::loan_total_fees($loan->id),2)}}
                </td>
                <td style="text-align:right;">
                    {{number_format(\App\Helpers\GeneralHelper::loan_total_penalty($loan->id),2)}}
                </td>
                <td style="text-align:right; font-weight:bold">
                    {{number_format(\App\Helpers\GeneralHelper::loan_total_due_amount($loan->id),2)}}
                </td>
                <td></td>
                <td></td>
            </tr>
            </tbody>
        </table>
    </div>
</div>

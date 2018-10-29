@extends('client.layout')
@section('title')
    {{ trans_choice('general.loan',1) }}  {{ trans_choice('general.detail',2) }}
@endsection

@section('content')

    <div class="box box-info">
        <div class="box-body table-responsive no-padding">
            <table id="" class="table table-bordered table-condensed table-hover">
                <thead>
                <tr style="background-color: #D1F9FF">
                    <th>{{trans_choice('general.loan',1)}}#</th>
                    <th>{{trans_choice('general.released',1)}}</th>
                    <th>{{trans_choice('general.maturity',1)}}</th>
                    <th>{{trans_choice('general.repayment',1)}}</th>
                    <th>{{trans_choice('general.principal',1)}}</th>
                    <th>{{trans_choice('general.interest',1)}}%</th>
                    <th>{{trans_choice('general.interest',1)}}</th>
                    <th>{{trans_choice('general.fee',2)}}</th>
                    <th>{{trans_choice('general.penalty',1)}}</th>
                    <th>{{trans_choice('general.due',1)}}</th>
                    <th>{{trans_choice('general.paid',1)}}</th>
                    <th>{{trans_choice('general.balance',1)}}</th>
                    <th>{{trans_choice('general.status',1)}}</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>{{$loan->id}}</td>
                    <td>{{$loan->release_date}}</td>
                    <td>{{$loan->maturity_date}}</td>
                    <td>
                        @if($loan->repayment_cycle=='daily')
                            {{trans_choice('general.daily',1)}}
                        @endif
                        @if($loan->repayment_cycle=='weekly')
                            {{trans_choice('general.weekly',1)}}
                        @endif
                        @if($loan->repayment_cycle=='monthly')
                            {{trans_choice('general.monthly',1)}}
                        @endif
                        @if($loan->repayment_cycle=='bi_monthly')
                            {{trans_choice('general.bi_monthly',1)}}
                        @endif
                        @if($loan->repayment_cycle=='quarterly')
                            {{trans_choice('general.quarterly',1)}}
                        @endif
                        @if($loan->repayment_cycle=='semi_annual')
                            {{trans_choice('general.semi_annually',1)}}
                        @endif
                        @if($loan->repayment_cycle=='annually')
                            {{trans_choice('general.annual',1)}}
                        @endif
                    </td>
                    <td>{{round($loan->principal,2)}}</td>
                    <td>  {{round($loan->interest_rate,2)}}%/{{$loan->interest_period}}</td>
                    <td>{{round(\App\Helpers\GeneralHelper::loan_total_interest($loan->id),2)}}</td>
                    <td>{{round(\App\Helpers\GeneralHelper::loan_total_fees($loan->id),2)}}</td>
                    <td>{{round(\App\Helpers\GeneralHelper::loan_total_penalty($loan->id),2)}}</td>
                    <td>
                        @if($loan->override==1)
                            <s>{{round(\App\Helpers\GeneralHelper::loan_total_due_amount($loan->id),2)}}</s><br>
                            {{round($loan->balance,2)}}
                        @else
                            {{round(\App\Helpers\GeneralHelper::loan_total_due_amount($loan->id),2)}}
                        @endif
                    </td>
                    <td>{{round(\App\Helpers\GeneralHelper::loan_total_paid($loan->id),2)}}</td>
                    <td>{{round(\App\Helpers\GeneralHelper::loan_total_balance($loan->id),2)}}</td>
                    <td>
                        @if($loan->maturity_date<date("Y-m-d") && \App\Helpers\GeneralHelper::loan_total_balance($loan->id)>0)
                            <span class="label label-danger">{{trans_choice('general.past_maturity',1)}}</span>
                        @else
                            @if($loan->status=='pending')
                                <span class="label label-warning">{{trans_choice('general.pending',1)}} {{trans_choice('general.approval',1)}}</span>
                            @endif
                            @if($loan->status=='approved')
                                <span class="label label-info">{{trans_choice('general.awaiting',1)}} {{trans_choice('general.disbursement',1)}}</span>
                            @endif
                            @if($loan->status=='disbursed')
                                <span class="label label-info">{{trans_choice('general.active',1)}}</span>
                            @endif
                            @if($loan->status=='declined')
                                <span class="label label-danger">{{trans_choice('general.declined',1)}}</span>
                            @endif
                            @if($loan->status=='withdrawn')
                                <span class="label label-danger">{{trans_choice('general.withdrawn',1)}}</span>
                            @endif
                            @if($loan->status=='written_off')
                                <span class="label label-danger">{{trans_choice('general.written_off',1)}}</span>
                            @endif
                            @if($loan->status=='closed')
                                <span class="label label-success">{{trans_choice('general.closed',1)}}</span>
                            @endif
                            @if($loan->status=='pending_reschedule')
                                <span class="label label-warning">{{trans_choice('general.pending',1)}} {{trans_choice('general.reschedule',1)}}</span>
                            @endif
                            @if($loan->status=='rescheduled')
                                <span class="label label-info">{{trans_choice('general.rescheduled',1)}}</span>
                            @endif
                        @endif
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <!-- Custom Tabs -->
            <div class="nav-tabs-custom">
                <ul class="nav nav-tabs">
                    @if($loan->status=="disbursed" || $loan->status=="closed" || $loan->status=="withdrawn" || $loan->status=="written_off" || $loan->status=="rescheduled" )

                        <li class=""><a href="#repayments" data-toggle="tab"
                                        aria-expanded="true">{{trans_choice('general.repayment',2)}}</a></li>
                        <li class=""><a href="#loan_schedule" data-toggle="tab"
                                        aria-expanded="false">{{trans_choice('general.loan',1)}}
                                {{trans_choice('general.schedule',1)}}</a></li>
                        <li class=""><a href="#pending_dues" data-toggle="tab"
                                        aria-expanded="false">{{trans_choice('general.pending',1)}} {{trans_choice('general.due',2)}}</a>
                        </li>
                    @endif
                    <li class="active"><a href="#loan_terms" data-toggle="tab"
                                          aria-expanded="false">{{trans_choice('general.loan',1)}} {{trans_choice('general.term',2)}}</a>
                    </li>
                </ul>
                <div class="tab-content">
                    @if($loan->status=="disbursed" || $loan->status=="closed" || $loan->status=="withdrawn" || $loan->status=="written_off" || $loan->status=="rescheduled" )
                        <div class="tab-pane " id="repayments">
                            <div class="btn-group-horizontal">
                                @if(\App\Models\Setting::where('setting_key','enable_online_payment')->first()->setting_value==1)
                                    <a type="button" class="btn btn-info margin"
                                       href="{{url('client/loan/'.$loan->id.'/pay')}}">
                                        {{trans_choice('general.pay',1)}}</a>
                                @endif
                            </div>
                            <div class="box box-info">
                                <div class="box-body">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="table-responsive">
                                                <table id="view-repayments"
                                                       class="table table-bordered table-condensed table-hover dataTable no-footer">
                                                    <thead>
                                                    <tr style="background-color: #D1F9FF" role="row">
                                                        <th>
                                                            {{trans_choice('general.collection',1)}} {{trans_choice('general.date',1)}}
                                                        </th>
                                                        <th>
                                                            {{trans_choice('general.collected_by',1)}}
                                                        </th>
                                                        <th>
                                                            {{trans_choice('general.method',1)}}
                                                        </th>
                                                        <th>
                                                            {{trans_choice('general.amount',1)}}
                                                        </th>
                                                        <th>
                                                            {{trans_choice('general.receipt',1)}}
                                                        </th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    @foreach($payments as $key)
                                                        <tr>
                                                            <td>{{$key->collection_date}}</td>
                                                            <td>
                                                                @if(!empty($key->user))
                                                                    {{$key->user->first_name}} {{$key->user->last_name}}
                                                                @endif
                                                            </td>
                                                            <td>
                                                                @if(!empty($key->loan_repayment_method))
                                                                    {{$key->loan_repayment_method->name}}
                                                                @endif
                                                            </td>
                                                            <td>${{round($key->amount,2)}}</td>
                                                            <td>
                                                                <a type="button" class="btn btn-default btn-xs"
                                                                   href="{{url('client/loan/'.$loan->id.'/repayment/'.$key->id.'/print')}}"
                                                                   target="_blank">
                                                                <span class="glyphicon glyphicon-print"
                                                                      aria-hidden="true"></span>
                                                                </a>
                                                                <a type="button" class="btn btn-default btn-xs"
                                                                   href="{{url('client/loan/'.$loan->id.'/repayment/'.$key->id.'/pdf')}}"
                                                                   target="_blank">
                                                                <span class="glyphicon glyphicon-file"
                                                                      aria-hidden="true"></span>
                                                                </a>

                                                            </td>
                                                        </tr>
                                                    @endforeach
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /.tab-pane -->
                        <!-- /.tab-pane -->
                        <div class="tab-pane active" id="loan_schedule">
                            <div class="row">
                                <div class="col-sm-3">

                                    <div class="input-group-btn">
                                        <button type="button" class="btn btn-info dropdown-toggle margin"
                                                data-toggle="dropdown"
                                                aria-expanded="false">{{trans_choice('general.loan',1)}} {{trans_choice('general.schedule',1)}}
                                            <span class="fa fa-caret-down"></span></button>
                                        <ul class="dropdown-menu" role="menu">
                                            <li>
                                                <a href="{{url('client/loan/'.$loan->id.'/schedule/print')}}"
                                                   target="_blank">{{trans_choice('general.print',1)}} {{trans_choice('general.statement',1)}}</a>
                                            </li>
                                            <li>
                                                <a href="{{url('client/loan/'.$loan->id.'/schedule/pdf')}}"
                                                   target="_blank">{{trans_choice('general.download',1)}} {{trans_choice('general.in',1)}} {{trans_choice('general.pdf',1)}}</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-sm-9 pull-right">
                                    <div class="btn-group-horizontal">
                                        <a type="button" class="btn bg-gray margin"
                                           href="{{url('loan/'.$loan->id.'/schedule/print')}}"
                                           target="_blank">{{trans_choice('general.print',1)}} {{trans_choice('general.schedule',1)}}</a>

                                    </div>
                                </div>
                            </div>
                            <div class="box box-success">
                                <div class="box-body table-responsive no-padding">
                                    <table class="table table-bordered table-condensed table-hover">
                                        <tbody>
                                        <tr style="background-color: #F2F8FF">
                                            <th style="width: 10px">
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
                                                {{trans_choice('general.total',1)}} {{trans_choice('general.due',1)}}
                                            </th>
                                            <th style="text-align:right;">
                                                {{trans_choice('general.paid',1)}}
                                            </th>
                                            <th style="text-align:right;">
                                                {{trans_choice('general.pending',1)}} {{trans_choice('general.due',1)}}
                                            </th>
                                            <th style="text-align:right;">
                                                {{trans_choice('general.principal',1)}} {{trans_choice('general.balance',1)}} {{trans_choice('general.owed',1)}}
                                            </th>
                                        </tr>
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
                                            <td></td>
                                            <td></td>
                                            <td style="text-align:right;">
                                                {{round(\App\Models\LoanSchedule::where('loan_id',
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
                                        <tr class="@if((($schedule->principal+$schedule->interest+$schedule->fees+$schedule->penalty)-\App\Models\LoanRepayment::where('loan_id',$loan->id)->where('due_date',$schedule->due_date)->sum('amount'))<=0) success @endif">
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
                                                {{round($schedule->principal,2)}}
                                            </td>
                                            <td style="text-align:right">
                                                {{round($schedule->interest,2)}}
                                            </td>
                                            <td style="text-align:right">
                                                {{round($schedule->fees,2)}}
                                            </td>
                                            <td style="text-align:right">
                                                {{round($schedule->penalty,2)}}
                                            </td>
                                            <td style="text-align:right; font-weight:bold">
                                                {{round(($schedule->principal+$schedule->interest+$schedule->fees+$schedule->penalty),2)}}
                                            </td>
                                            <td style="text-align:right;">
                                                {{round($total_due,2)}}
                                            </td>
                                            <td style="text-align:right;">
                                                {{round(\App\Models\LoanRepayment::where('loan_id',$loan->id)->where('due_date',$schedule->due_date)->sum('amount'),2)}}
                                            </td>
                                            <td style="text-align:right;">
                                                {{round((($schedule->principal+$schedule->interest+$schedule->fees+$schedule->penalty)-\App\Models\LoanRepayment::where('loan_id',$loan->id)->where('due_date',$schedule->due_date)->sum('amount')),2)}}
                                            </td>
                                            <td style="text-align:right;">
                                                {{round($principal_balance,2)}}
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
                                                {{round(\App\Helpers\GeneralHelper::loan_total_principal($loan->id),2)}}
                                            </td>
                                            <td style="text-align:right;">
                                                {{round(\App\Helpers\GeneralHelper::loan_total_interest($loan->id),2)}}
                                            </td>
                                            <td style="text-align:right;">
                                                {{round(\App\Helpers\GeneralHelper::loan_total_fees($loan->id),2)}}
                                            </td>
                                            <td style="text-align:right;">
                                                {{round(\App\Helpers\GeneralHelper::loan_total_penalty($loan->id),2)}}
                                            </td>
                                            <td style="text-align:right; font-weight:bold">
                                                {{round(\App\Helpers\GeneralHelper::loan_total_due_amount($loan->id),2)}}
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>

                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="pending_dues">
                            <div class="tab_content">
                                <p>{{trans_choice('general.pending_due_msg',1)}}</p>

                                <div class="box box-success">
                                    <div class="box-body table-responsive no-padding">
                                        <table class="table table-bordered table-condensed table-hover">
                                            <tbody>
                                            <tr style="background-color: #F2F8FF">
                                                <th width="200">
                                                    <b>{{trans_choice('general.based_on',1)}} {{trans_choice('general.loan',1)}} {{trans_choice('general.term',2)}}
                                                        :</b>
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
                                                    <b>{{trans_choice('general.total',1)}}</b>
                                                </th>
                                            </tr>
                                            <tr>
                                                <td class="text-bold bg-red">
                                                    {{trans_choice('general.total',1)}} {{trans_choice('general.due',1)}}
                                                </td>
                                                <td style="text-align:right">
                                                    {{round(\App\Helpers\GeneralHelper::loan_total_principal($loan->id),2)}}
                                                </td>
                                                <td style="text-align:right">
                                                    {{round(\App\Helpers\GeneralHelper::loan_total_interest($loan->id),2)}}
                                                </td>
                                                <td style="text-align:right">
                                                    {{round(\App\Helpers\GeneralHelper::loan_total_fees($loan->id),2)}}
                                                </td>
                                                <td style="text-align:right">
                                                    {{round(\App\Helpers\GeneralHelper::loan_total_penalty($loan->id),2)}}
                                                </td>
                                                <td style="text-align:right; font-weight:bold">
                                                    {{round(\App\Helpers\GeneralHelper::loan_total_due_amount($loan->id),2)}}
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="text-bold bg-green">
                                                    {{trans_choice('general.total',1)}} {{trans_choice('general.paid',1)}}
                                                </td>
                                                <td style="text-align:right">
                                                    {{round(\App\Helpers\GeneralHelper::loan_paid_item($loan->id,'principal'),2)}}
                                                </td>
                                                <td style="text-align:right">
                                                    {{round(\App\Helpers\GeneralHelper::loan_paid_item($loan->id,'interest'),2)}}
                                                </td>
                                                <td style="text-align:right">
                                                    {{round(\App\Helpers\GeneralHelper::loan_paid_item($loan->id,'fees'),2)}}
                                                </td>
                                                <td style="text-align:right">
                                                    {{round(\App\Helpers\GeneralHelper::loan_paid_item($loan->id,'penalty'),2)}}
                                                </td>
                                                <td style="text-align:right; font-weight:bold">
                                                    {{round(\App\Helpers\GeneralHelper::loan_total_paid($loan->id),2)}}
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="text-bold bg-gray">
                                                    {{trans_choice('general.balance',1)}}
                                                </td>
                                                <td style="text-align:right">
                                                    {{round((\App\Helpers\GeneralHelper::loan_total_principal($loan->id)-\App\Helpers\GeneralHelper::loan_paid_item($loan->id,'principal')),2)}}
                                                </td>
                                                <td style="text-align:right">
                                                    {{round((\App\Helpers\GeneralHelper::loan_total_interest($loan->id)-\App\Helpers\GeneralHelper::loan_paid_item($loan->id,'interest')),2)}}

                                                </td>
                                                <td style="text-align:right">
                                                    {{round((\App\Helpers\GeneralHelper::loan_total_fees($loan->id)-\App\Helpers\GeneralHelper::loan_paid_item($loan->id,'fees')),2)}}

                                                </td>
                                                <td style="text-align:right">
                                                    {{round((\App\Helpers\GeneralHelper::loan_total_penalty($loan->id)-\App\Helpers\GeneralHelper::loan_paid_item($loan->id,'penalty')),2)}}

                                                </td>
                                                <td style="text-align:right; font-weight:bold">
                                                    {{round((\App\Helpers\GeneralHelper::loan_total_due_amount($loan->id)-\App\Helpers\GeneralHelper::loan_total_paid($loan->id)),2)}}

                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="6">
                                                    <br><br><b>{{trans_choice('general.based_on',1)}} {{trans_choice('general.loan',1)}} {{trans_choice('general.schedule',1)}}
                                                        :</b></td>
                                            </tr>
                                            <tr>
                                                <td class="text-bold bg-red">
                                                    {{trans_choice('general.due',1)}}
                                                    {{trans_choice('general.till',1)}} {{\App\Helpers\GeneralHelper::determine_due_date($loan->id,date("Y-m-d"))}}
                                                </td>
                                                <td style="text-align:right">
                                                    {{round(\App\Helpers\GeneralHelper::loan_total_principal($loan->id,\App\Helpers\GeneralHelper::determine_due_date($loan->id,date("Y-m-d"))),2)}}
                                                </td>
                                                <td style="text-align:right">
                                                    {{round(\App\Helpers\GeneralHelper::loan_total_interest($loan->id,\App\Helpers\GeneralHelper::determine_due_date($loan->id,date("Y-m-d"))),2)}}
                                                </td>
                                                <td style="text-align:right">
                                                    {{round(\App\Helpers\GeneralHelper::loan_total_fees($loan->id,\App\Helpers\GeneralHelper::determine_due_date($loan->id,date("Y-m-d"))),2)}}
                                                </td>
                                                <td style="text-align:right">
                                                    {{round(\App\Helpers\GeneralHelper::loan_total_penalty($loan->id,\App\Helpers\GeneralHelper::determine_due_date($loan->id,date("Y-m-d"))),2)}}
                                                </td>
                                                <td style="text-align:right; font-weight:bold">
                                                    {{round(\App\Helpers\GeneralHelper::loan_total_due_amount($loan->id,\App\Helpers\GeneralHelper::determine_due_date($loan->id,date("Y-m-d"))),2)}}
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="text-bold bg-green">
                                                    {{trans_choice('general.paid',1)}}
                                                    {{trans_choice('general.till',1)}} {{\App\Helpers\GeneralHelper::determine_due_date($loan->id,date("Y-m-d"))}}
                                                </td>
                                                <td style="text-align:right">
                                                    {{round(\App\Helpers\GeneralHelper::loan_paid_item($loan->id,'principal',\App\Helpers\GeneralHelper::determine_due_date($loan->id,date("Y-m-d"))),2)}}
                                                </td>
                                                <td style="text-align:right">
                                                    {{round(\App\Helpers\GeneralHelper::loan_paid_item($loan->id,'interest',\App\Helpers\GeneralHelper::determine_due_date($loan->id,date("Y-m-d"))),2)}}
                                                </td>
                                                <td style="text-align:right">
                                                    {{round(\App\Helpers\GeneralHelper::loan_paid_item($loan->id,'fees',\App\Helpers\GeneralHelper::determine_due_date($loan->id,date("Y-m-d"))),2)}}
                                                </td>
                                                <td style="text-align:right">
                                                    {{round(\App\Helpers\GeneralHelper::loan_paid_item($loan->id,'penalty',\App\Helpers\GeneralHelper::determine_due_date($loan->id,date("Y-m-d"))),2)}}
                                                </td>
                                                <td style="text-align:right; font-weight:bold">
                                                    {{round(\App\Helpers\GeneralHelper::loan_total_paid($loan->id,\App\Helpers\GeneralHelper::determine_due_date($loan->id,date("Y-m-d"))),2)}}
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="text-bold bg-gray">
                                                    {{trans_choice('general.balance',1)}}
                                                    {{trans_choice('general.till',1)}} {{\App\Helpers\GeneralHelper::determine_due_date($loan->id,date("Y-m-d"))}}
                                                </td>
                                                <td style="text-align:right">
                                                    {{round((\App\Helpers\GeneralHelper::loan_total_principal($loan->id,\App\Helpers\GeneralHelper::determine_due_date($loan->id,date("Y-m-d")))-\App\Helpers\GeneralHelper::loan_paid_item($loan->id,'principal',\App\Helpers\GeneralHelper::determine_due_date($loan->id,date("Y-m-d")))),2)}}
                                                </td>
                                                <td style="text-align:right">
                                                    {{round((\App\Helpers\GeneralHelper::loan_total_interest($loan->id,\App\Helpers\GeneralHelper::determine_due_date($loan->id,date("Y-m-d")))-\App\Helpers\GeneralHelper::loan_paid_item($loan->id,'interest',\App\Helpers\GeneralHelper::determine_due_date($loan->id,date("Y-m-d")))),2)}}

                                                </td>
                                                <td style="text-align:right">
                                                    {{round((\App\Helpers\GeneralHelper::loan_total_fees($loan->id,\App\Helpers\GeneralHelper::determine_due_date($loan->id,date("Y-m-d")))-\App\Helpers\GeneralHelper::loan_paid_item($loan->id,'fees',\App\Helpers\GeneralHelper::determine_due_date($loan->id,date("Y-m-d")))),2)}}

                                                </td>
                                                <td style="text-align:right">
                                                    {{round((\App\Helpers\GeneralHelper::loan_total_penalty($loan->id,\App\Helpers\GeneralHelper::determine_due_date($loan->id,date("Y-m-d")))-\App\Helpers\GeneralHelper::loan_paid_item($loan->id,'penalty',\App\Helpers\GeneralHelper::determine_due_date($loan->id,date("Y-m-d")))),2)}}

                                                </td>
                                                <td style="text-align:right; font-weight:bold">
                                                    {{round((\App\Helpers\GeneralHelper::loan_total_due_amount($loan->id,\App\Helpers\GeneralHelper::determine_due_date($loan->id,date("Y-m-d")))-\App\Helpers\GeneralHelper::loan_total_paid($loan->id,\App\Helpers\GeneralHelper::determine_due_date($loan->id,date("Y-m-d")))),2)}}

                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    @endif
                    <div class="tab-pane" id="loan_terms">
                        <div class="row">
                            <div class="col-sm-3">

                                <div class="input-group-btn">
                                    <button type="button" class="btn btn-info dropdown-toggle margin"
                                            data-toggle="dropdown"
                                            aria-expanded="false">{{trans_choice('general.loan',1)}} {{trans_choice('general.schedule',1)}}
                                        <span class="fa fa-caret-down"></span></button>
                                    <ul class="dropdown-menu" role="menu">

                                        <li>
                                            <a href="{{url('client/loan/'.$loan->id.'/loan_statement/print')}}"
                                               target="_blank">{{trans_choice('general.print',1)}} {{trans_choice('general.statement',1)}}</a>
                                        </li>

                                        <li>
                                            <a href="{{url('client/loan/'.$loan->id.'/loan_statement/pdf')}}"
                                               target="_blank">{{trans_choice('general.download',1)}} {{trans_choice('general.in',1)}} {{trans_choice('general.pdf',1)}}</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="col-sm-9 pull-right">
                                <div class="btn-group-horizontal">

                                </div>
                            </div>
                        </div>

                        <div class="box-body no-padding">
                            <table class="table table-condensed">
                                <tbody>
                                <tr>
                                    <td><b>{{trans_choice('general.loan',1)}} {{trans_choice('general.status',1)}}</b>
                                    </td>
                                    <td>
                                        @if($loan->maturity_date<date("Y-m-d") && \App\Helpers\GeneralHelper::loan_total_balance($loan->id)>0)
                                            <span class="label label-danger">{{trans_choice('general.past_maturity',1)}}</span>
                                        @else
                                            @if($loan->loan_status=='open')
                                                <span class="label label-info">{{trans_choice('general.open',1)}}</span>
                                            @endif
                                            @if($loan->loan_status=='defaulted')
                                                <span class="label label-danger">{{trans_choice('general.defaulted',1)}}</span>
                                            @endif
                                            @if($loan->loan_status=='fully_paid')
                                                <span class="label label-success">{{trans_choice('general.fully_paid',1)}}</span>
                                            @endif
                                            @if($loan->loan_status=='processing')
                                                <span class="label label-warning">{{trans_choice('general.processing',1)}}</span>
                                            @endif
                                        @endif
                                    </td>
                                </tr>
                                <tr>

                                    <td width="200">
                                        <b>{{trans_choice('general.loan',1)}} {{trans_choice('general.application',1)}} {{trans_choice('general.id',1)}}</b>
                                    </td>
                                    <td>{{$loan->id}}</td>

                                </tr>
                                <tr>
                                    <td><b>{{trans_choice('general.loan',1)}} {{trans_choice('general.product',1)}}</b>
                                    </td>
                                    <td>
                                        @if(!empty($loan->loan_product))
                                            {{$loan->loan_product->name}}
                                        @endif
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2"></td>
                                </tr>
                                <tr>
                                    <td colspan="2" class="bg-navy disabled color-palette">
                                        {{trans_choice('general.loan',1)}} {{trans_choice('general.term',2)}}
                                    </td>
                                </tr>
                                <tr>
                                    <td><b>{{trans_choice('general.disbursed_by',1)}}</b></td>
                                    <td>
                                        @if(!empty($loan->loan_disbursed_by))
                                            {{$loan->loan_disbursed_by->name}}
                                        @endif
                                    </td>
                                </tr>
                                <tr>

                                    <td>
                                        <b>{{trans_choice('general.principal',1)}} {{trans_choice('general.amount',1)}}</b>
                                    </td>
                                    <td>{{round($loan->principal,2)}}</td>

                                </tr>
                                <tr>

                                    <td>
                                        <b>{{trans_choice('general.loan',1)}} {{trans_choice('general.release',1)}} {{trans_choice('general.date',1)}}</b>
                                    </td>
                                    <td>{{$loan->release_date}}</td>

                                </tr>
                                <tr>
                                    <td>
                                        <b>{{trans_choice('general.loan',1)}} {{trans_choice('general.interest',1)}} {{trans_choice('general.method',1)}}</b>
                                    </td>
                                    <td>
                                        @if($loan->interest_method=='declining_balance_equal_installments')
                                            {{trans_choice('general.declining_balance_equal_installments',1)}}
                                        @endif
                                        @if($loan->interest_method=='declining_balance_equal_principal')
                                            {{trans_choice('general.declining_balance_equal_principal',1)}}
                                        @endif
                                        @if($loan->interest_method=='interest_only')
                                            {{trans_choice('general.interest_only',1)}}
                                        @endif
                                        @if($loan->interest_method=='flat_rate')
                                            {{trans_choice('general.flat_rate',1)}}
                                        @endif
                                        @if($loan->interest_method=='compound_interest')
                                            {{trans_choice('general.compound_interest',1)}}
                                        @endif
                                    </td>
                                </tr>
                                <tr>
                                    <td><b>{{trans_choice('general.loan',1)}} {{trans_choice('general.interest',1)}}</b>
                                    </td>
                                    <td>{{round($loan->interest_rate,2)}}%/{{$loan->interest_period}}
                                    </td>
                                </tr>
                                <tr>
                                    <td><b>{{trans_choice('general.loan',1)}} {{trans_choice('general.duration',1)}}</b>
                                    </td>
                                    <td>{{$loan->loan_duration}} {{$loan->loan_duration_type}}s
                                    </td>
                                </tr>
                                <tr>
                                    <td><b>{{trans_choice('general.repayment_cycle',1)}}</b></td>
                                    <td>
                                        @if($loan->repayment_cycle=='daily')
                                            {{trans_choice('general.daily',1)}}
                                        @endif
                                        @if($loan->repayment_cycle=='weekly')
                                            {{trans_choice('general.weekly',1)}}
                                        @endif
                                        @if($loan->repayment_cycle=='monthly')
                                            {{trans_choice('general.monthly',1)}}
                                        @endif
                                        @if($loan->repayment_cycle=='bi_monthly')
                                            {{trans_choice('general.bi_monthly',1)}}
                                        @endif
                                        @if($loan->repayment_cycle=='quarterly')
                                            {{trans_choice('general.quarterly',1)}}
                                        @endif
                                        @if($loan->repayment_cycle=='semi_annual')
                                            {{trans_choice('general.semi_annually',1)}}
                                        @endif
                                        @if($loan->repayment_cycle=='annually')
                                            {{trans_choice('general.annual',1)}}
                                        @endif
                                    </td>
                                </tr>

                                <tr>
                                    <td><b>{{trans_choice('general.number',1)}}
                                            of {{trans_choice('general.repayment',2)}}</b></td>
                                    <td>
                                        {{\App\Models\LoanSchedule::where('loan_id',$loan->id)->count()}}
                                    </td>
                                </tr>
                                <tr>
                                    <td><b>{{trans_choice('general.decimal_place',1)}}</b></td>
                                    <td>
                                        @if($loan->decimal_places=='round_off_to_two_decimal')
                                            {{trans_choice('general.round_off_to_two_decimal',1)}}
                                        @endif
                                        @if($loan->decimal_places=='round_off_to_integer')
                                            {{trans_choice('general.round_off_to_integer',1)}}
                                        @endif
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>{{trans_choice('general.first',1)}} {{trans_choice('general.repayment',1)}} {{trans_choice('general.date',1)}}</b>
                                    </td>
                                    <td>{{$loan->first_payment_date}}</td>
                                </tr>
                                <tr>
                                    <td colspan="2"></td>
                                </tr>
                                <tr>
                                    <td colspan="2" class="bg-navy disabled color-palette">
                                        System Generated Penalties
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2"
                                        class="bg-blue disabled color-palette">{{trans_choice('general.late_repayment_penalty',1)}}
                                    </td>
                                </tr>
                                <tr>
                                    <td class="text-red" colspan="2">
                                        @if($loan->loan_product->enable_late_repayment_penalty==1)
                                            <table class="table">
                                                <thead>
                                                <tr>
                                                    <th>{{trans_choice('general.name',1)}}</th>
                                                    <th>{{trans_choice('general.type',1)}}</th>
                                                    <th>{{trans_choice('general.value',1)}}</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td>
                                                        @if($loan->loan_product->late_repayment_penalty_calculate=='overdue_principal')
                                                            <b>{{trans_choice('general.overdue_principal',1)}}</b>
                                                        @endif
                                                        @if($loan->loan_product->late_repayment_penalty_calculate=='overdue_principal_interest')
                                                            <b>{{trans_choice('general.overdue_principal_interest',1)}}</b>
                                                        @endif
                                                        @if($loan->loan_product->late_repayment_penalty_calculate=='overdue_principal_interest_fees')
                                                            <b>{{trans_choice('general.overdue_principal_interest_fees',1)}}</b>
                                                        @endif
                                                        @if($loan->loan_product->late_repayment_penalty_calculate=='total_overdue')
                                                            <b>{{trans_choice('general.total_overdue',1)}}</b>
                                                        @endif
                                                    </td>
                                                    <td>{{$loan->loan_product->late_repayment_penalty_type}}</td>
                                                    <td>{{$loan->loan_product->late_repayment_penalty_amount}}</td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        @else
                                            <b>{{trans_choice('general.late_repayment_disabled',1)}}</b>
                                        @endif
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <br><br>
                            <table class="table table-bordered table-hover">
                                <tbody>
                                <tr>
                                    <td colspan="2"
                                        class="bg-blue disabled color-palette">{{trans_choice('general.after_maturity_date_penalty',1)}}
                                    </td>
                                </tr>
                                <tr>
                                    <td class="text-red" colspan="2">
                                        @if($loan->loan_product->enable_after_maturity_date_penalty==1)
                                            <table class="table">
                                                <thead>
                                                <tr>
                                                    <th>{{trans_choice('general.name',1)}}</th>
                                                    <th>{{trans_choice('general.type',1)}}</th>
                                                    <th>{{trans_choice('general.value',1)}}</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td>
                                                        @if($loan->loan_product->after_maturity_date_penalty_calculate=='overdue_principal')
                                                            <b>{{trans_choice('general.overdue_principal',1)}}</b>
                                                        @endif
                                                        @if($loan->loan_product->after_maturity_date_penalty_calculate=='overdue_principal_interest')
                                                            <b>{{trans_choice('general.overdue_principal_interest',1)}}</b>
                                                        @endif
                                                        @if($loan->loan_product->after_maturity_date_penalty_calculate=='overdue_principal_interest_fees')
                                                            <b>{{trans_choice('general.overdue_principal_interest_fees',1)}}</b>
                                                        @endif
                                                        @if($loan->loan_product->after_maturity_date_penalty_calculate=='total_overdue')
                                                            <b>{{trans_choice('general.total_overdue',1)}}</b>
                                                        @endif
                                                    </td>
                                                    <td>{{$loan->loan_product->after_maturity_date_penalty_type}}</td>
                                                    <td>{{$loan->loan_product->after_maturity_date_penalty_amount}}</td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        @else
                                            <b>{{trans_choice('general.after_maturity_date_disabled',1)}}</b>
                                        @endif

                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2"></td>
                                </tr>
                                <tr>
                                    <td colspan="2" class="bg-navy disabled color-palette">
                                        {{trans_choice('general.description',1)}}
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        @if(!empty($loan->description))
                                            {{$loan->description}}
                                        @else
                                            {{trans_choice('general.none',1)}}
                                        @endif
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>

                    </div>


                </div>
                <!-- /.tab-content -->
            </div>
            <!-- nav-tabs-custom -->
        </div>
    </div>

    <script>
        $(document).ready(function () {

        });
    </script>
@endsection

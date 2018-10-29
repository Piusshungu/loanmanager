@extends('layouts.master')
@section('title')
    {{trans_choice('general.loan',1)}} {{trans_choice('general.detail',2)}}
@endsection
@section('content')
    <div class="box box-widget">
        <div class="box-header with-border">
            <div class="row">
                <div class="col-sm-3">
                    <div class="user-block">
                        @if(!empty($loan->borrower->photo))
                            <a href="{{asset('uploads/'.$loan->borrower->photo)}}" class="fancybox"> <img
                                        class="img-circle"
                                        src="{{asset('uploads/'.$loan->borrower->photo)}}"
                                        alt="user image"/></a>
                        @else
                            <img class="img-circle"
                                 src="{{asset('assets/dist/img/user.png')}}"
                                 alt="user image"/>
                        @endif

                        <span class="username">
                                {{$loan->borrower->title}}
                            . {{$loan->borrower->first_name}} {{$loan->borrower->last_name}}
                            </span>
                        <span class="description" style="font-size:13px; color:#000000">{{$loan->borrower->unique_number}}
                            <br>
                            @if(Sentinel::hasAccess('borrowers.create'))
                                <a href="{{url('borrower/'.$loan->borrower->id.'/edit')}}">{{trans_choice('general.edit',1)}}</a>
                                <br>
                            @endif
                            {{$loan->borrower->business_name}}, {{$loan->borrower->working_status}}
                            <br>{{$loan->borrower->gender}}
                            , {{date("Y-m-d")-$loan->borrower->dob}} {{trans_choice('general.year',2)}}
                            </span>
                    </div>
                    <!-- /.user-block -->
                </div>
                <!-- /.col -->
                <div class="col-sm-3">
                    <ul class="list-unstyled">
                        <li><b>{{trans_choice('general.address',1)}}:</b> {{$loan->borrower->address}}</li>
                        <li><b>{{trans_choice('general.city',1)}}:</b> {{$loan->borrower->city}}</li>
                        <li><b>{{trans_choice('general.state',1)}}:</b> {{$loan->borrower->state}}</li>
                        <li><b>{{trans_choice('general.zip',1)}}:</b> {{$loan->borrower->zip}}</li>

                        <a data-toggle="collapse" data-parent="#accordion" href="#viewFiles">
                            {{trans_choice('general.view',1)}} {{trans_choice('general.borrower',1)}} {{trans_choice('general.file',2)}}
                        </a>

                        <div id="viewFiles" class="panel-collapse collapse">
                            <div class="box-body">
                                <ul class="no-margin" style="font-size:12px; padding-left:10px">

                                    @foreach(unserialize($loan->borrower->files) as $key=>$value)
                                        <li><a href="{!!asset('uploads/'.$value)!!}"
                                               target="_blank">{!!  $value!!}</a></li>
                                    @endforeach
                                </ul>
                            </div>
                        </div>
                    </ul>
                </div>
                <div class="col-sm-3">
                    <ul class="list-unstyled">
                        <li><b>{{trans_choice('general.phone',1)}}:</b> {{$loan->borrower->phone}}</li>
                        <li>
                            <b>{{trans_choice('general.email',1)}}:</b>
                            <a
                                    onclick="javascript:window.open('mailto:{{$loan->borrower->email}}', 'mail');event.preventDefault()"
                                    href="mailto:{{$loan->borrower->email}}">{{$loan->borrower->email}}</a>
                            @if(Sentinel::hasAccess('communication.create'))
                                <div class="btn-group-horizontal"><a type="button" class="btn-xs bg-red"
                                                                     href="{{url('communication/email/create?borrower_id='.$loan->borrower->id)}}">{{trans_choice('general.send',1)}}
                                        {{trans_choice('general.email',1)}}</a></div>
                            @endif
                        </li>
                        <li><b>Mobile:</b> {{$loan->borrower->mobile}}
                            @if(Sentinel::hasAccess('communication.create'))
                                <div class="btn-group-horizontal"><a type="button" class="btn-xs bg-red"
                                                                     href="{{url('communication/sms/create?borrower_id='.$loan->borrower->id)}}">{{trans_choice('general.send',1)}}
                                        {{trans_choice('general.sms',1)}}</a></div>
                            @endif
                        </li>

                    </ul>
                </div>
                <div class="col-sm-3">
                    <ul class="list-unstyled">
                        <li><b>{{trans_choice('general.custom_field',2)}}</b></li>
                        @foreach($custom_fields as $key)
                            <li>
                                @if(!empty($key->custom_field))
                                    <strong>{{$key->custom_field->name}}:</strong>
                                @endif
                                {{$key->name}}
                            </li>
                        @endforeach

                    </ul>
                </div>
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-sm-9">
                    <div class="btn-group-horizontal">
                        @if(Sentinel::hasAccess('loan.create'))
                            <a type="button" class="btn bg-olive margin"
                               href="{{url('loan/create?borrower_id='.$loan->borrower_id)}}">{{trans_choice('general.add',1)}}
                                {{trans_choice('general.loan',1)}}</a>
                        @endif
                        <a type="button" class="btn bg-navy margin"
                           href="{{url('loan/data')}}">{{trans_choice('general.view',1)}}
                            {{trans_choice('general.loan',2)}}</a>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="pull-left">
                        <div class="input-group-btn">
                            <button type="button" class="btn btn-info dropdown-toggle margin" data-toggle="dropdown">
                                {{trans_choice('general.borrower',1)}} {{trans_choice('general.statement',1)}}
                                <span class="fa fa-caret-down"></span></button>
                            <ul class="dropdown-menu" role="menu">

                                <li>
                                    <a href="{{url('loan/'.$loan->borrower_id.'/borrower_statement/print')}}"
                                       target="_blank">{{trans_choice('general.print',1)}} {{trans_choice('general.statement',1)}}</a>
                                </li>
                                <li>
                                    <a href="{{url('loan/'.$loan->borrower_id.'/borrower_statement/pdf')}}"
                                       target="_blank">{{trans_choice('general.download',1)}} {{trans_choice('general.in',1)}} {{trans_choice('general.pdf',1)}}</a>
                                </li>
                                <li>
                                    <a href="{{url('loan/'.$loan->borrower_id.'/borrower_statement/email')}}"
                                    >{{trans_choice('general.email',1)}} {{trans_choice('general.statement',1)}}</a>
                                </li>
                                <li>
                                <!--<li>
                                    <a href="{{url('loan/'.$loan->borrower_id.'/borrower_statement/excel')}}"
                                       target="_blank">Download in Excel</a></li>

                                <li>
                                    <a href="{{url('loan/'.$loan->borrower_id.'/borrower_statement/csv')}}"
                                       target="_blank">Download in CSV</a></li>-->
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    @if($loan->borrower->blacklisted==1)
        <div class="row">
            <div class="col-sm-12">
                <div class="alert alert-danger">{{trans_choice('general.blacklist_notification',1)}}</div>
            </div>
        </div>
    @endif
    @if($loan->status=="disbursed" || $loan->status=="closed" || $loan->status=="withdrawn" || $loan->status=="written_off" || $loan->status=="rescheduled" )
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
                        <td>{{number_format($loan->principal,2)}}</td>
                        <td>  {{number_format($loan->interest_rate,2)}}%/{{$loan->interest_period}}</td>
                        <td>{{number_format(\App\Helpers\GeneralHelper::loan_total_interest($loan->id),2)}}</td>
                        <td>{{number_format(\App\Helpers\GeneralHelper::loan_total_fees($loan->id),2)}}</td>
                        <td>{{number_format(\App\Helpers\GeneralHelper::loan_total_penalty($loan->id),2)}}</td>
                        <td>
                            @if($loan->override==1)
                                <s>{{number_format(\App\Helpers\GeneralHelper::loan_total_due_amount($loan->id),2)}}</s><br>
                                {{number_format($loan->balance,2)}}
                            @else
                                {{number_format(\App\Helpers\GeneralHelper::loan_total_due_amount($loan->id),2)}}
                            @endif
                            <br>
                            <small>
                                <a href="{{url('loan/'.$loan->id.'/override')}}">{{trans_choice('general.override',1)}}</a>
                            </small>
                        </td>
                        <td>{{number_format(\App\Helpers\GeneralHelper::loan_total_paid($loan->id),2)}}</td>
                        <td>{{number_format(\App\Helpers\GeneralHelper::loan_total_balance($loan->id),2)}}</td>
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
    @endif
    <div class="row">
        <div class="col-md-12">
            <!-- Custom Tabs -->
            <div class="nav-tabs-custom">
                <ul class="nav nav-tabs">
                    @if($loan->status=="disbursed" || $loan->status=="closed" || $loan->status=="withdrawn" || $loan->status=="written_off" || $loan->status=="rescheduled" )
                        <li class=""><a href="#repayments" data-toggle="tab"
                                        aria-expanded="true">{{trans_choice('general.repayment',2)}}</a></li>
                        <li><a href="#loan_schedule" data-toggle="tab"
                               aria-expanded="false">{{trans_choice('general.loan',1)}}
                                {{trans_choice('general.schedule',1)}}</a></li>
                        <li class=""><a href="#pending_dues" data-toggle="tab"
                                        aria-expanded="false">{{trans_choice('general.pending',1)}} {{trans_choice('general.due',2)}}</a>
                        </li>

                    @endif
                    <li class="active"><a href="#loan_terms" data-toggle="tab"
                                          aria-expanded="false">{{trans_choice('general.loan',1)}} {{trans_choice('general.term',2)}}</a>
                    </li>

                    <li class=""><a href="#loan_collateral" data-toggle="tab"
                                    aria-expanded="false">{{trans_choice('general.loan',1)}} {{trans_choice('general.collateral',1)}}</a>
                    </li>
                    <li class=""><a href="#loan_guarantors" data-toggle="tab"
                                    aria-expanded="false">{{trans_choice('general.loan',1)}} {{trans_choice('general.guarantor',2)}}</a>
                    </li>
                    <li class=""><a href="#loan_files" data-toggle="tab"
                                    aria-expanded="false">{{trans_choice('general.loan',1)}} {{trans_choice('general.file',2)}}</a>
                    </li>
                    <li class=""><a href="#loan_comments" data-toggle="tab"
                                    aria-expanded="false">{{trans_choice('general.loan',1)}} {{trans_choice('general.comment',2)}}</a>
                    </li>

                </ul>
                <div class="tab-content">
                    @if($loan->status=="disbursed" || $loan->status=="closed" || $loan->status=="withdrawn" || $loan->status=="written_off" || $loan->status=="rescheduled" )
                        <div class="tab-pane " id="repayments">
                            <div class="btn-group-horizontal">
                                @if(Sentinel::hasAccess('repayments.create'))
                                    <a type="button" class="btn bg-gray margin"
                                       href="{{url('loan/'.$loan->id.'/repayment/create')}}">{{trans_choice('general.add',1)}}
                                        {{trans_choice('general.repayment',1)}}</a>
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
                                                            {{trans_choice('general.action',1)}}
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
                                                            <td>${{number_format($key->amount,2)}}</td>
                                                            <td>
                                                                <div class="btn-group-horizontal">
                                                                    @if(Sentinel::hasAccess('repayments.update'))
                                                                        <a type="button"
                                                                           class="btn bg-white btn-xs text-bold"
                                                                           href="{{url('loan/'.$loan->id.'/repayment/'.$key->id.'/edit')}}">{{trans_choice('general.edit',1)}}</a>
                                                                    @endif
                                                                    @if(Sentinel::hasAccess('repayments.delete'))
                                                                        <a type="button"
                                                                           class="btn bg-white btn-xs text-bold deletePayment"
                                                                           href="{{url('loan/'.$loan->id.'/repayment/'.$key->id.'/delete')}}"
                                                                        >{{trans_choice('general.delete',1)}}</a>
                                                                    @endif
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <a type="button" class="btn btn-default btn-xs"
                                                                   href="{{url('loan/'.$loan->id.'/repayment/'.$key->id.'/print')}}"
                                                                   target="_blank">
                                                                <span class="glyphicon glyphicon-print"
                                                                      aria-hidden="true"></span>
                                                                </a>
                                                                <a type="button" class="btn btn-default btn-xs"
                                                                   href="{{url('loan/'.$loan->id.'/repayment/'.$key->id.'/pdf')}}"
                                                                   target="_blank">
                                                                <span class="glyphicon glyphicon-file"
                                                                      aria-hidden="true"></span>
                                                                </a>
                                                                @if(Sentinel::hasAccess('communication.create'))
                                                                    <a type="button" class="btn btn-default btn-xs"
                                                                       href="{{url('loan/'.$loan->id.'/repayment/'.$key->id.'/email')}}"
                                                                       target="_blank">
                                                                <span class="glyphicon glyphicon-envelope"
                                                                      aria-hidden="true"></span>
                                                                    </a>
                                                                @endif
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
                        <div class="tab-pane" id="loan_schedule">
                            <div class="row">
                                <div class="col-sm-3">

                                    <div class="input-group-btn">
                                        <button type="button" class="btn btn-info dropdown-toggle margin"
                                                data-toggle="dropdown"
                                                aria-expanded="false">{{trans_choice('general.loan',1)}} {{trans_choice('general.schedule',1)}}
                                            <span class="fa fa-caret-down"></span></button>
                                        <ul class="dropdown-menu" role="menu">
                                            <li>
                                                <a href="{{url('loan/'.$loan->id.'/schedule/print')}}"
                                                   target="_blank">{{trans_choice('general.print',1)}} {{trans_choice('general.statement',1)}}</a>
                                            </li>
                                            <li>
                                                <a href="{{url('loan/'.$loan->id.'/schedule/pdf')}}"
                                                   target="_blank">{{trans_choice('general.download',1)}} {{trans_choice('general.in',1)}} {{trans_choice('general.pdf',1)}}</a>
                                            </li>
                                            @if(Sentinel::hasAccess('communication.create'))
                                                <li>
                                                    <a href="{{url('loan/'.$loan->id.'/schedule/email')}}"
                                                    >{{trans_choice('general.email',1)}} {{trans_choice('general.schedule',1)}}</a>
                                                </li>
                                        @endif
                                        <!--<li>
                                            <a href="{{url('loan/'.$loan->id.'/schedule/excel')}}"
                                               target="_blank">Download in Excel</a></li>

                                        <li>
                                            <a href="{{url('loan/'.$loan->id.'/schedule/csv')}}"
                                               target="_blank">Download in CSV</a></li>-->
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-sm-9 pull-right">
                                    <div class="btn-group-horizontal">
                                        <a type="button" class="btn bg-gray margin"
                                           href="{{url('loan/'.$loan->id.'/schedule/print')}}"
                                           target="_blank">{{trans_choice('general.print',1)}} {{trans_choice('general.schedule',1)}}</a>
                                        @if(Sentinel::hasAccess('loans.update'))
                                            <a type="button" class="btn bg-gray margin"
                                               href="{{url('loan/'.$loan->id.'/schedule/edit')}}">{{trans_choice('general.edit',1)}}
                                                {{trans_choice('general.schedule',1)}}</a>
                                        @endif
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
                                                {{number_format(\App\Models\LoanRepayment::where('loan_id',$loan->id)->where('due_date',$schedule->due_date)->sum('amount'),2)}}
                                            </td>
                                            <td style="text-align:right;">
                                                {{number_format((($schedule->principal+$schedule->interest+$schedule->fees+$schedule->penalty)-\App\Models\LoanRepayment::where('loan_id',$loan->id)->where('due_date',$schedule->due_date)->sum('amount')),2)}}
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
                                                    {{number_format(\App\Helpers\GeneralHelper::loan_total_principal($loan->id),2)}}
                                                </td>
                                                <td style="text-align:right">
                                                    {{number_format(\App\Helpers\GeneralHelper::loan_total_interest($loan->id),2)}}
                                                </td>
                                                <td style="text-align:right">
                                                    {{number_format(\App\Helpers\GeneralHelper::loan_total_fees($loan->id),2)}}
                                                </td>
                                                <td style="text-align:right">
                                                    {{number_format(\App\Helpers\GeneralHelper::loan_total_penalty($loan->id),2)}}
                                                </td>
                                                <td style="text-align:right; font-weight:bold">
                                                    {{number_format(\App\Helpers\GeneralHelper::loan_total_due_amount($loan->id),2)}}
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="text-bold bg-green">
                                                    {{trans_choice('general.total',1)}} {{trans_choice('general.paid',1)}}
                                                </td>
                                                <td style="text-align:right">
                                                    {{number_format(\App\Helpers\GeneralHelper::loan_paid_item($loan->id,'principal'),2)}}
                                                </td>
                                                <td style="text-align:right">
                                                    {{number_format(\App\Helpers\GeneralHelper::loan_paid_item($loan->id,'interest'),2)}}
                                                </td>
                                                <td style="text-align:right">
                                                    {{number_format(\App\Helpers\GeneralHelper::loan_paid_item($loan->id,'fees'),2)}}
                                                </td>
                                                <td style="text-align:right">
                                                    {{number_format(\App\Helpers\GeneralHelper::loan_paid_item($loan->id,'penalty'),2)}}
                                                </td>
                                                <td style="text-align:right; font-weight:bold">
                                                    {{number_format(\App\Helpers\GeneralHelper::loan_total_paid($loan->id),2)}}
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="text-bold bg-gray">
                                                    {{trans_choice('general.balance',1)}}
                                                </td>
                                                <td style="text-align:right">
                                                    {{number_format((\App\Helpers\GeneralHelper::loan_total_principal($loan->id)-\App\Helpers\GeneralHelper::loan_paid_item($loan->id,'principal')),2)}}
                                                </td>
                                                <td style="text-align:right">
                                                    {{number_format((\App\Helpers\GeneralHelper::loan_total_interest($loan->id)-\App\Helpers\GeneralHelper::loan_paid_item($loan->id,'interest')),2)}}

                                                </td>
                                                <td style="text-align:right">
                                                    {{number_format((\App\Helpers\GeneralHelper::loan_total_fees($loan->id)-\App\Helpers\GeneralHelper::loan_paid_item($loan->id,'fees')),2)}}

                                                </td>
                                                <td style="text-align:right">
                                                    {{number_format((\App\Helpers\GeneralHelper::loan_total_penalty($loan->id)-\App\Helpers\GeneralHelper::loan_paid_item($loan->id,'penalty')),2)}}

                                                </td>
                                                <td style="text-align:right; font-weight:bold">
                                                    {{number_format((\App\Helpers\GeneralHelper::loan_total_due_amount($loan->id)-\App\Helpers\GeneralHelper::loan_total_paid($loan->id)),2)}}

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
                                                    {{number_format(\App\Helpers\GeneralHelper::loan_total_principal($loan->id,\App\Helpers\GeneralHelper::determine_due_date($loan->id,date("Y-m-d"))),2)}}
                                                </td>
                                                <td style="text-align:right">
                                                    {{number_format(\App\Helpers\GeneralHelper::loan_total_interest($loan->id,\App\Helpers\GeneralHelper::determine_due_date($loan->id,date("Y-m-d"))),2)}}
                                                </td>
                                                <td style="text-align:right">
                                                    {{number_format(\App\Helpers\GeneralHelper::loan_total_fees($loan->id,\App\Helpers\GeneralHelper::determine_due_date($loan->id,date("Y-m-d"))),2)}}
                                                </td>
                                                <td style="text-align:right">
                                                    {{number_format(\App\Helpers\GeneralHelper::loan_total_penalty($loan->id,\App\Helpers\GeneralHelper::determine_due_date($loan->id,date("Y-m-d"))),2)}}
                                                </td>
                                                <td style="text-align:right; font-weight:bold">
                                                    {{number_format(\App\Helpers\GeneralHelper::loan_total_due_amount($loan->id,\App\Helpers\GeneralHelper::determine_due_date($loan->id,date("Y-m-d"))),2)}}
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="text-bold bg-green">
                                                    {{trans_choice('general.paid',1)}}
                                                    {{trans_choice('general.till',1)}} {{\App\Helpers\GeneralHelper::determine_due_date($loan->id,date("Y-m-d"))}}
                                                </td>
                                                <td style="text-align:right">
                                                    {{number_format(\App\Helpers\GeneralHelper::loan_paid_item($loan->id,'principal',\App\Helpers\GeneralHelper::determine_due_date($loan->id,date("Y-m-d"))),2)}}
                                                </td>
                                                <td style="text-align:right">
                                                    {{number_format(\App\Helpers\GeneralHelper::loan_paid_item($loan->id,'interest',\App\Helpers\GeneralHelper::determine_due_date($loan->id,date("Y-m-d"))),2)}}
                                                </td>
                                                <td style="text-align:right">
                                                    {{number_format(\App\Helpers\GeneralHelper::loan_paid_item($loan->id,'fees',\App\Helpers\GeneralHelper::determine_due_date($loan->id,date("Y-m-d"))),2)}}
                                                </td>
                                                <td style="text-align:right">
                                                    {{number_format(\App\Helpers\GeneralHelper::loan_paid_item($loan->id,'penalty',\App\Helpers\GeneralHelper::determine_due_date($loan->id,date("Y-m-d"))),2)}}
                                                </td>
                                                <td style="text-align:right; font-weight:bold">
                                                    {{number_format(\App\Helpers\GeneralHelper::loan_total_paid($loan->id,\App\Helpers\GeneralHelper::determine_due_date($loan->id,date("Y-m-d"))),2)}}
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="text-bold bg-gray">
                                                    {{trans_choice('general.balance',1)}}
                                                    {{trans_choice('general.till',1)}} {{\App\Helpers\GeneralHelper::determine_due_date($loan->id,date("Y-m-d"))}}
                                                </td>
                                                <td style="text-align:right">
                                                    {{number_format((\App\Helpers\GeneralHelper::loan_total_principal($loan->id,\App\Helpers\GeneralHelper::determine_due_date($loan->id,date("Y-m-d")))-\App\Helpers\GeneralHelper::loan_paid_item($loan->id,'principal',\App\Helpers\GeneralHelper::determine_due_date($loan->id,date("Y-m-d")))),2)}}
                                                </td>
                                                <td style="text-align:right">
                                                    {{number_format((\App\Helpers\GeneralHelper::loan_total_interest($loan->id,\App\Helpers\GeneralHelper::determine_due_date($loan->id,date("Y-m-d")))-\App\Helpers\GeneralHelper::loan_paid_item($loan->id,'interest',\App\Helpers\GeneralHelper::determine_due_date($loan->id,date("Y-m-d")))),2)}}

                                                </td>
                                                <td style="text-align:right">
                                                    {{number_format((\App\Helpers\GeneralHelper::loan_total_fees($loan->id,\App\Helpers\GeneralHelper::determine_due_date($loan->id,date("Y-m-d")))-\App\Helpers\GeneralHelper::loan_paid_item($loan->id,'fees',\App\Helpers\GeneralHelper::determine_due_date($loan->id,date("Y-m-d")))),2)}}

                                                </td>
                                                <td style="text-align:right">
                                                    {{number_format((\App\Helpers\GeneralHelper::loan_total_penalty($loan->id,\App\Helpers\GeneralHelper::determine_due_date($loan->id,date("Y-m-d")))-\App\Helpers\GeneralHelper::loan_paid_item($loan->id,'penalty',\App\Helpers\GeneralHelper::determine_due_date($loan->id,date("Y-m-d")))),2)}}

                                                </td>
                                                <td style="text-align:right; font-weight:bold">
                                                    {{number_format((\App\Helpers\GeneralHelper::loan_total_due_amount($loan->id,\App\Helpers\GeneralHelper::determine_due_date($loan->id,date("Y-m-d")))-\App\Helpers\GeneralHelper::loan_total_paid($loan->id,\App\Helpers\GeneralHelper::determine_due_date($loan->id,date("Y-m-d")))),2)}}

                                                </td>
                                            </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    @endif
                    <div class="tab-pane active" id="loan_terms">
                        <div class="row">
                            <div class="col-sm-8">
                                @if($loan->status=='pending')
                                    <div class="col-sm-6">
                                        @if(Sentinel::hasAccess('loans.approve'))
                                            <button type="button" class="btn btn-success margin"
                                                    data-toggle="modal"
                                                    data-target="#approveLoan">{{trans_choice('general.approve',1)}}</button>
                                            <button type="button" class="btn btn-danger margin"
                                                    data-toggle="modal"
                                                    data-target="#declineLoan">{{trans_choice('general.decline',1)}}</button>
                                        @endif
                                    </div>
                                @endif
                                @if($loan->status=='declined')
                                    <div class="col-sm-6">
                                        @if(Sentinel::hasAccess('loans.approve'))
                                            <button type="button" class="btn btn-success margin"
                                                    data-toggle="modal"
                                                    data-target="#approveLoan">{{trans_choice('general.approve',1)}}</button>
                                        @endif
                                    </div>
                                @endif
                                @if($loan->status=='approved')
                                    <div class="col-sm-6">
                                        @if(Sentinel::hasAccess('loans.disburse'))
                                            <button type="button" class="btn btn-success margin"
                                                    data-toggle="modal"
                                                    data-target="#disburseLoan">{{trans_choice('general.disburse',1)}}</button>
                                            <a type="button" class="btn btn-danger  delete margin"
                                               href="{{url('loan/'.$loan->id.'/unapprove')}}">{{trans_choice('general.undo',1)}} {{trans_choice('general.approval',1)}}</a>
                                        @endif
                                    </div>
                                @endif
                                @if($loan->status=='written_off')
                                    <div class="col-sm-6">
                                        @if(Sentinel::hasAccess('loans.writeoff'))
                                            <a type="button" class="btn btn-danger  delete margin"
                                               href="{{url('loan/'.$loan->id.'/unwrite_off')}}">{{trans_choice('general.undo',1)}} {{trans_choice('general.write_off',1)}}</a>
                                        @endif
                                    </div>
                                @endif
                                @if($loan->status=='withdrawn')
                                    <div class="col-sm-6">
                                        @if(Sentinel::hasAccess('loans.withdraw'))
                                            <a type="button" class="btn btn-danger  delete margin"
                                               href="{{url('loan/'.$loan->id.'/unwithdraw')}}">{{trans_choice('general.undo',1)}} {{trans_choice('general.withdrawal',1)}}</a>
                                        @endif
                                    </div>
                                @endif
                                @if($loan->status=='disbursed')
                                    <div class="col-sm-3">
                                        <div class="btn-group-horizontal">
                                            @if(Sentinel::hasAccess('loans.disburse'))
                                                <a type="button" class="btn btn-danger delete margin"
                                                   href="{{url('loan/'.$loan->id.'/undisburse')}}"
                                                >{{trans_choice('general.undo',1)}} {{trans_choice('general.disbursement',1)}}</a>
                                            @endif
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="input-group-btn">
                                            <button type="button" class="btn btn-info dropdown-toggle margin"
                                                    data-toggle="dropdown"
                                                    aria-expanded="false">{{trans_choice('general.more_action',1)}}
                                                <span class="fa fa-caret-down"></span></button>
                                            <ul class="dropdown-menu" role="menu">
                                                @if(Sentinel::hasAccess('loans.withdraw'))
                                                    <li>
                                                        <a href="#" class=""
                                                           data-toggle="modal"
                                                           data-target="#withdrawLoan">{{trans_choice('general.withdraw',1)}} {{trans_choice('general.loan',1)}}</a>
                                                    </li>
                                                @endif
                                                @if(Sentinel::hasAccess('loans.writeoff'))
                                                    <li>
                                                        <a href="#" class=""
                                                           data-toggle="modal"
                                                           data-target="#writeoffLoan">{{trans_choice('general.write_off',1)}} {{trans_choice('general.loan',1)}}</a>
                                                    </li>
                                                @endif
                                                @if(Sentinel::hasAccess('loans.reschedule'))
                                                    <li>
                                                        <a href="#"
                                                           class=""
                                                           data-toggle="modal"
                                                           data-target="#rescheduleLoan">{{trans_choice('general.reschedule',1)}} {{trans_choice('general.loan',1)}}</a>
                                                    </li>
                                                @endif
                                            </ul>
                                        </div>
                                    </div>
                                @endif

                                @if($loan->status=="disbursed" || $loan->status=="closed" || $loan->status=="withdrawn" || $loan->status=="written_off" || $loan->status=="rescheduled" )
                                    <div class="col-sm-3">
                                        <div class="input-group-btn">
                                            <button type="button" class="btn btn-info dropdown-toggle margin"
                                                    data-toggle="dropdown"
                                                    aria-expanded="false">{{trans_choice('general.loan',1)}} {{trans_choice('general.schedule',1)}}
                                                <span class="fa fa-caret-down"></span></button>
                                            <ul class="dropdown-menu" role="menu">

                                                <li>
                                                    <a href="{{url('loan/'.$loan->id.'/loan_statement/print')}}"
                                                       target="_blank">{{trans_choice('general.print',1)}} {{trans_choice('general.statement',1)}}</a>
                                                </li>

                                                <li>
                                                    <a href="{{url('loan/'.$loan->id.'/loan_statement/pdf')}}"
                                                       target="_blank">{{trans_choice('general.download',1)}} {{trans_choice('general.in',1)}} {{trans_choice('general.pdf',1)}}</a>
                                                </li>
                                                @if(Sentinel::hasAccess('communication.create'))
                                                    <li>
                                                        <a href="{{url('loan/'.$loan->id.'/loan_statement/email')}}"
                                                        >{{trans_choice('general.email',1)}} {{trans_choice('general.statement',1)}}</a>
                                                    </li>
                                            @endif
                                            <!--<li>
                                            <a href="{{url('loan/'.$loan->id.'/loan_statement/excel')}}"
                                               target="_blank">Download in Excel</a></li>

                                        <li>
                                            <a href="{{url('loan/'.$loan->id.'/loan_statement/csv')}}"
                                               target="_blank">Download in CSV</a></li>-->

                                            </ul>
                                        </div>
                                    </div>
                                @endif
                            </div>

                            <div class="col-sm-4 pull-right">
                                <div class="btn-group-horizontal">
                                    @if(Sentinel::hasAccess('loans.update'))
                                        <a type="button" class="btn bg-gray margin"
                                           href="{{url('loan/'.$loan->id.'/edit')}}">{{trans_choice('general.edit',1)}}
                                            {{trans_choice('general.loan',1)}}</a>
                                    @endif

                                    @if(Sentinel::hasAccess('loans.delete'))
                                        <a type="button" class="btn bg-gray margin deleteLoan"
                                           href="{{url('loan/'.$loan->id.'/delete')}}">{{trans_choice('general.delete',1)}}
                                            {{trans_choice('general.loan',1)}}</a>
                                    @endif
                                </div>
                            </div>
                        </div>

                        <div class="box-body no-padding">
                            <table class="table table-condensed">
                                <tbody>
                                <tr>
                                    <td>
                                        <b>{{trans_choice('general.loan',1)}} {{trans_choice('general.status',1)}}</b>
                                    </td>
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
                                <tr>

                                    <td width="200">
                                        <b>{{trans_choice('general.loan',1)}} {{trans_choice('general.application',1)}} {{trans_choice('general.id',1)}}</b>
                                    </td>
                                    <td>{{$loan->id}}</td>

                                </tr>
                                <tr>
                                    <td>
                                        <b>{{trans_choice('general.loan',1)}} {{trans_choice('general.product',1)}}</b>
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
                                    <td>{{number_format($loan->principal,2)}}</td>

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
                                    <td>
                                        <b>{{trans_choice('general.loan',1)}} {{trans_choice('general.interest',1)}}</b>
                                    </td>
                                    <td>{{number_format($loan->interest_rate,2)}}%/{{$loan->interest_period}}
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>{{trans_choice('general.loan',1)}} {{trans_choice('general.duration',1)}}</b>
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
                    <div class="tab-pane" id="loan_collateral">
                        <div class="btn-group-horizontal">
                            @if(Sentinel::hasAccess('collateral.create'))
                                <a type="button" class="btn bg-gray margin"
                                   href="{{url('collateral/'.$loan->id.'/create?return_url='.Request::url())}}">{{trans_choice('general.add',1)}}
                                    {{trans_choice('general.collateral',1)}}</a>
                            @endif
                        </div>
                        <div class="box box-success">
                            <div class="table-responsive">
                                <table id="data-table" class="table table-bordered table-condensed table-hover">
                                    <thead>
                                    <tr style="background-color: #D1F9FF">
                                        <th>{{trans_choice('general.type',1)}}</th>
                                        <th>{{trans_choice('general.name',1)}}</th>
                                        <th>{{trans_choice('general.value',1)}}</th>
                                        <th>{{trans_choice('general.status',1)}}</th>
                                        <th>{{trans_choice('general.date',1)}}</th>
                                        <th>{{ trans_choice('general.action',1) }}</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    @foreach($loan->collateral as $key)
                                        <tr>
                                            <td>
                                                @if(!empty($key->collateral_type))
                                                    {{$key->collateral_type->name}}
                                                @endif
                                            </td>
                                            <td>{{ $key->name }}</td>
                                            <td>{{ $key->value }}</td>
                                            <td>
                                                @if($key->status=='deposited_into_branch')
                                                    {{trans_choice('general.deposited_into_branch',1)}}
                                                @endif
                                                @if($key->status=='collateral_with_borrower')
                                                    {{trans_choice('general.collateral_with_borrower',1)}}
                                                @endif
                                                @if($key->status=='returned_to_borrower')
                                                    {{trans_choice('general.returned_to_borrower',1)}}
                                                @endif
                                                @if($key->status=='repossession_initiated')
                                                    {{trans_choice('general.repossession_initiated',1)}}
                                                @endif
                                                @if($key->status=='repossessed')
                                                    {{trans_choice('general.repossessed',1)}}
                                                @endif
                                                @if($key->status=='sold')
                                                    {{trans_choice('general.sold',1)}}
                                                @endif
                                                @if($key->status=='lost')
                                                    {{trans_choice('general.lost',1)}}
                                                @endif
                                            </td>
                                            <td>{{ $key->date }}</td>
                                            <td>
                                                <div class="btn-group">
                                                    <button type="button"
                                                            class="btn btn-info btn-xs dropdown-toggle"
                                                            data-toggle="dropdown" aria-expanded="false">
                                                        {{ trans('general.choose') }} <span class="caret"></span>
                                                        <span class="sr-only">Toggle Dropdown</span>
                                                    </button>
                                                    <ul class="dropdown-menu" role="menu">
                                                        @if(Sentinel::hasAccess('collateral.view'))
                                                            <li><a href="{{ url('collateral/'.$key->id.'/show') }}"><i
                                                                            class="fa fa-search"></i> {{ trans('general.view') }}
                                                                </a></li>
                                                        @endif
                                                        @if(Sentinel::hasAccess('collateral.update'))
                                                            <li><a href="{{ url('collateral/'.$key->id.'/edit') }}"><i
                                                                            class="fa fa-edit"></i> {{ trans('general.edit') }}
                                                                </a></li>
                                                        @endif
                                                        @if(Sentinel::hasAccess('collateral.delete'))
                                                            <li>
                                                                <a href="{{ url('collateral/'.$key->id.'/delete') }}"
                                                                   class="delete"><i
                                                                            class="fa fa-trash"></i> {{ trans('general.delete') }}
                                                                </a></li>
                                                        @endif
                                                    </ul>
                                                </div>
                                            </td>
                                        </tr>
                                    @endforeach
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane" id="loan_guarantors">
                        <div class="btn-group-horizontal">
                            @if(Sentinel::hasAccess('loans.guarantor.create'))
                                <a type="button" class="btn bg-gray margin"
                                   href="{{url('loan/'.$loan->id.'/guarantor/create?return_url='.Request::url())}}">{{trans_choice('general.add',1)}}
                                    {{trans_choice('general.guarantor',1)}}</a>
                            @endif
                        </div>
                        <div class="box box-success">
                            <div class="table-responsive">
                                <table id="data-table" class="table table-bordered table-condensed table-hover">
                                    <thead>
                                    <tr style="background-color: #D1F9FF">
                                        <th>{{trans_choice('general.name',1)}}</th>
                                        <th>{{trans_choice('general.status',1)}}</th>
                                        <th>{{trans_choice('general.amount',1)}}</th>
                                        <th>{{trans_choice('general.accepted',1)}} {{trans_choice('general.amount',1)}}</th>
                                        <th>{{trans_choice('general.saving',2)}} {{trans_choice('general.status',1)}}</th>
                                        <th>{{trans_choice('general.note',2)}}</th>
                                        <th>{{trans_choice('general.date',1)}}</th>
                                        <th>{{ trans_choice('general.action',1) }}</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    @foreach($loan->guarantors as $key)
                                        <tr>
                                            <td>
                                                @if(!empty($key->guarantee))
                                                    <a href="{{url('borrower/'.$key->guarantee->id.'/show')}}">{{$key->guarantee->first_name}} {{$key->guarantee->middle_name}} {{$key->guarantee->last_name}}</a>
                                                @endif
                                            </td>
                                            <td>
                                                @if($key->status=='accepted')
                                                    <span class="label label-success">{{trans_choice('general.accepted',1)}}</span>
                                                @endif
                                                @if($key->status=='pending')
                                                    <span class="label label-warning">{{trans_choice('general.pending',1)}}</span>
                                                @endif
                                                @if($key->status=='declined')
                                                    <span class="label label-danger">{{trans_choice('general.declined',1)}}</span>
                                                @endif
                                            </td>
                                            <td>{{ $key->amount }}</td>
                                            <td>{{ $key->accepted_amount }}</td>
                                            <td>
                                                @if($key->saving_status=='hold')
                                                    <span class="label label-success">{{trans_choice('general.withdrawn',1)}}</span>
                                                @endif
                                                @if($key->saving_status=='pending')
                                                    <span class="label label-warning">{{trans_choice('general.pending',1)}}</span>
                                                @endif
                                                @if($key->saving_status=='restored')
                                                    <span class="label label-info">{{trans_choice('general.restored',1)}}</span>
                                                @endif
                                            </td>
                                            <td>{!!   $key->notes !!}</td>
                                            <td>{{ $key->date }}</td>
                                            <td>
                                                <div class="btn-group">
                                                    <button type="button"
                                                            class="btn btn-info btn-xs dropdown-toggle"
                                                            data-toggle="dropdown" aria-expanded="false">
                                                        {{ trans('general.choose') }} <span class="caret"></span>
                                                        <span class="sr-only">Toggle Dropdown</span>
                                                    </button>
                                                    <ul class="dropdown-menu dropdown-menu-right" role="menu">
                                                        @if($key->saving_status=='hold')
                                                            @if(Sentinel::hasAccess('loans.guarantor.savings'))
                                                                <li>
                                                                    <a href="{{ url('loan/'.$loan->id.'/guarantor/'.$key->id.'/restore') }}"
                                                                       class="delete"><i
                                                                                class="fa fa-refresh"></i> {{ trans('general.restore') }} {{trans_choice('general.saving',2)}}
                                                                    </a></li>
                                                            @endif
                                                        @endif
                                                        @if($key->saving_status=='pending' || $key->saving_status=='restored')
                                                            @if(Sentinel::hasAccess('loans.guarantor.savings'))
                                                                <li>
                                                                    <a href="#" data-amount="{{$key->accepted_amount}}"
                                                                       data-loan="{{$key->loan_id}}"
                                                                       data-id="{{$key->id}}" data-toggle="modal"
                                                                       data-target="#withdrawSaving"><i
                                                                                class="fa fa-minus-circle"></i> {{ trans('general.withdraw') }} {{trans_choice('general.saving',2)}}
                                                                    </a></li>
                                                            @endif
                                                        @endif
                                                        @if(Sentinel::hasAccess('loans.guarantor.view'))
                                                            <li>
                                                                <a href="{{ url('borrower/'.$key->guarantor_id.'/show') }}"><i
                                                                            class="fa fa-search"></i> {{ trans('general.view') }} {{trans_choice('general.guarantor',1)}}
                                                                </a></li>
                                                        @endif
                                                        @if(Sentinel::hasAccess('loans.guarantor.update'))
                                                            <li><a href="{{ url('loan/guarantor/'.$key->id.'/edit') }}"><i
                                                                            class="fa fa-edit"></i> {{ trans('general.edit') }}
                                                                </a></li>
                                                        @endif
                                                        @if(Sentinel::hasAccess('loans.guarantor.delete'))
                                                            <li>
                                                                <a href="{{ url('loan/'.$loan->id.'/guarantor/'.$key->id.'/delete') }}"
                                                                   class="delete"><i
                                                                            class="fa fa-trash"></i> {{ trans('general.delete') }}
                                                                </a></li>
                                                        @endif
                                                    </ul>
                                                </div>
                                            </td>
                                        </tr>
                                    @endforeach
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane" id="loan_files">
                        <p>To add new loan files or remove existing files, pls click the <b>Loan Terms</b> tab and
                            then
                            <b>Edit Loan</b>.</p>
                        <ul class="" style="font-size:12px; padding-left:10px">

                            @foreach(unserialize($loan->files) as $key=>$value)
                                <li><a href="{!!asset('uploads/'.$value)!!}"
                                       target="_blank">{!!  $value!!}</a></li>
                            @endforeach
                        </ul>
                    </div>
                    <div class="tab-pane" id="loan_comments">
                        <div class="tab_content">
                            <div class="btn-group-horizontal">
                                <a type="button" class="btn bg-gray margin"
                                   href="{{url('loan/'.$loan->id.'/loan_comment/create')}}">{{trans_choice('general.add',1)}}
                                    {{trans_choice('general.comment',2)}}</a>
                            </div>
                            <br>

                            <div class="box-footer box-comments">
                                @foreach($loan->comments as $comment)
                                    <div class="box-comment">
                                        <!-- User image -->
                                        <img src="{{asset('assets/dist/img/user.png')}}"
                                             class="img-circle" alt="User Image">

                                        <div class="comment-text">
                                <span class="username">
                                    @if(!empty(\App\Models\User::find($comment->user_id)))
                                        {{\App\Models\User::find($comment->user_id)->first_name}} {{\App\Models\User::find($comment->user_id)->last_name}}
                                    @endif

                                    <span class="text-muted pull-right">
                                        {{$comment->created_at}}
                                    </span>
                                </span><!-- /.username -->
                                            {!! $comment->notes !!}
                                            <span class="text-muted pull-right">
            <div class="btn-group-horizontal">
                <a type="button" class="btn bg-white btn-xs text-bold"
                   href="{{url('loan/'.$loan->id.'/loan_comment/'.$comment->id.'/edit')}}">{{trans_choice('general.edit',1)}}</a><a
                        type="button" class="btn bg-white btn-xs text-bold deleteComment"
                        href="{{url('loan/'.$loan->id.'/loan_comment/'.$comment->id.'/delete')}}">{{trans_choice('general.delete',1)}}</a>
            </div>
                                </span>
                                        </div>
                                        <!-- /.comment-text -->
                                    </div>
                                @endforeach
                            </div>
                        </div>
                    </div>
                    <!-- /.tab-pane -->
                </div>
                <!-- /.tab-content -->
            </div>
            <!-- nav-tabs-custom -->
        </div>
    </div>
    <div class="modal fade" id="approveLoan">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">*</span></button>
                    <h4 class="modal-title">{{trans_choice('general.approve',1)}} {{trans_choice('general.loan',1)}}</h4>
                </div>
                {!! Form::open(array('url' => url('loan/'.$loan->id.'/approve'),'method'=>'post')) !!}
                <div class="modal-body">
                    <div class="form-group">
                        <div class="form-line">
                            {!!  Form::label('approved_date',null,array('class'=>' control-label')) !!}
                            {!! Form::text('approved_date',date("Y-m-d"),array('class'=>'form-control date-picker','required'=>'required')) !!}
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="form-line">
                            {!!  Form::label('approved_amount',null,array('class'=>' control-label')) !!}
                            {!! Form::text('approved_amount',$loan->principal,array('class'=>'form-control touchspin','required'=>'required')) !!}
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="form-line">
                            {!!  Form::label( 'Notes',null,array('class'=>' control-label')) !!}
                            {!! Form::textarea('approved_notes','',array('class'=>'form-control','rows'=>'3')) !!}
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-info">{{trans_choice('general.save',1)}}</button>
                    <button type="button" class="btn default"
                            data-dismiss="modal">{{trans_choice('general.close',1)}}</button>
                </div>
                {!! Form::close() !!}
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <div class="modal fade" id="disburseLoan">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">*</span></button>
                    <h4 class="modal-title">{{trans_choice('general.disburse',1)}} {{trans_choice('general.loan',1)}}</h4>
                </div>
                {!! Form::open(array('url' => url('loan/'.$loan->id.'/disburse'),'method'=>'post')) !!}
                <div class="modal-body">
                    <div class="form-group">
                        <div class="form-line">
                            {!!  Form::label('disbursed_date',null,array('class'=>' control-label')) !!}
                            {!! Form::text('disbursed_date',$loan->release_date,array('class'=>'form-control date-picker','required'=>'required')) !!}
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="form-line">
                            {!!  Form::label('first_payment_date',null,array('class'=>' control-label')) !!}
                            {!! Form::text('first_payment_date',$loan->first_payment_date,array('class'=>'form-control date-picker',''=>'')) !!}
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="form-line">
                            {!!  Form::label('loan_disbursed_by_id',"Disbursed By",array('class'=>' control-label')) !!}
                            {!! Form::select('loan_disbursed_by_id',$loan_disbursed_by,null,array('class'=>'form-control','required'=>'required')) !!}
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="form-line">
                            {!!  Form::label( 'Notes',null,array('class'=>' control-label')) !!}
                            {!! Form::textarea('disbursed_notes','',array('class'=>'form-control','rows'=>'3')) !!}
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-info">{{trans_choice('general.save',1)}}</button>
                    <button type="button" class="btn default"
                            data-dismiss="modal">{{trans_choice('general.close',1)}}</button>
                </div>
                {!! Form::close() !!}
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <div class="modal fade" id="declineLoan">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">*</span></button>
                    <h4 class="modal-title">{{trans_choice('general.decline',1)}} {{trans_choice('general.loan',1)}}</h4>
                </div>
                {!! Form::open(array('url' => url('loan/'.$loan->id.'/decline'),'method'=>'post')) !!}
                <div class="modal-body">
                    <div class="form-group">
                        <div class="form-line">
                            {!!  Form::label('declined_date',null,array('class'=>' control-label')) !!}
                            {!! Form::text('declined_date',date("Y-m-d"),array('class'=>'form-control date-picker','required'=>'required')) !!}
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="form-line">
                            {!!  Form::label( 'Notes',null,array('class'=>' control-label')) !!}
                            {!! Form::textarea('declined_notes','',array('class'=>'form-control','rows'=>'3','required'=>'required')) !!}
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-info">{{trans_choice('general.save',1)}}</button>
                    <button type="button" class="btn default"
                            data-dismiss="modal">{{trans_choice('general.close',1)}}</button>
                </div>
                {!! Form::close() !!}
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <div class="modal fade" id="writeoffLoan">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">*</span></button>
                    <h4 class="modal-title">{{trans_choice('general.write_off',1)}} {{trans_choice('general.loan',1)}}</h4>
                </div>
                {!! Form::open(array('url' => url('loan/'.$loan->id.'/write_off'),'method'=>'post')) !!}
                <div class="modal-body">
                    <div class="form-group">
                        <div class="form-line">
                            {!!  Form::label('date',null,array('class'=>' control-label')) !!}
                            {!! Form::text('written_off_date',date("Y-m-d"),array('class'=>'form-control date-picker','required'=>'required')) !!}
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="form-line">
                            {!!  Form::label( 'Notes',null,array('class'=>' control-label')) !!}
                            {!! Form::textarea('written_off_notes','',array('class'=>'form-control','rows'=>'3','required'=>'required')) !!}
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-info">{{trans_choice('general.save',1)}}</button>
                    <button type="button" class="btn default"
                            data-dismiss="modal">{{trans_choice('general.close',1)}}</button>
                </div>
                {!! Form::close() !!}
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <div class="modal fade" id="withdrawLoan">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">*</span></button>
                    <h4 class="modal-title">{{trans_choice('general.withdraw',1)}} {{trans_choice('general.loan',1)}}</h4>
                </div>
                {!! Form::open(array('url' => url('loan/'.$loan->id.'/withdraw'),'method'=>'post')) !!}
                <div class="modal-body">
                    <div class="form-group">
                        <div class="form-line">
                            {!!  Form::label('date',null,array('class'=>' control-label')) !!}
                            {!! Form::text('withdrawn_date',date("Y-m-d"),array('class'=>'form-control date-picker','required'=>'required')) !!}
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="form-line">
                            {!!  Form::label( 'Notes',null,array('class'=>' control-label')) !!}
                            {!! Form::textarea('withdrawn_notes','',array('class'=>'form-control','rows'=>'3','required'=>'required')) !!}
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-info">{{trans_choice('general.save',1)}}</button>
                    <button type="button" class="btn default"
                            data-dismiss="modal">{{trans_choice('general.close',1)}}</button>
                </div>
                {!! Form::close() !!}
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <div class="modal fade" id="withdrawSaving">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">*</span></button>
                    <h4 class="modal-title">{{trans_choice('general.withdraw',1)}} {{trans_choice('general.saving',1)}}</h4>
                </div>
                {!! Form::open(array('url' =>'','method'=>'post','id'=>'withdrawSavingForm')) !!}
                <div class="modal-body">
                    <div class="form-group">
                        {!! Form::label('amount',trans_choice('general.amount',1),array('class'=>'')) !!}
                        {!! Form::text('amount',null, array('class' => 'form-control touchspin', 'id'=>'accepted_amount','required'=>'')) !!}
                    </div>
                    <div class="form-group">
                        {!! Form::label('date',trans_choice('general.date',2),array('class'=>'')) !!}
                        {!! Form::text('date',date("Y-m-d"), array('class' => 'form-control date-picker', 'placeholder'=>'','required'=>'')) !!}
                    </div>
                    <div class="form-group">
                        {!! Form::label('time',trans_choice('general.time',2),array('class'=>'')) !!}
                        {!! Form::text('time',date("H:i"), array('class' => 'form-control time-picker', 'placeholder'=>'','required'=>'')) !!}
                    </div>
                    <div class="form-group">
                        {!! Form::label('notes',trans_choice('general.note',2),array('class'=>'')) !!}
                        {!! Form::textarea('notes',null, array('class' => 'form-control', 'placeholder'=>'',)) !!}
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-info">{{trans_choice('general.save',1)}}</button>
                    <button type="button" class="btn default"
                            data-dismiss="modal">{{trans_choice('general.close',1)}}</button>
                </div>
                {!! Form::close() !!}
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <div class="modal fade" id="rescheduleLoan">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">*</span></button>
                    <h4 class="modal-title">{{trans_choice('general.reschedule',1)}} {{trans_choice('general.loan',1)}}</h4>
                </div>
                {!! Form::open(array('url' => url('loan/'.$loan->id.'/reschedule'),'method'=>'get')) !!}
                <div class="modal-body">
                    <div class="form-group">
                        <div class="form-line">
                            {!!  Form::label('type',trans_choice('general.reschedule',1).' '.trans_choice('general.on',1),array('class'=>' control-label')) !!}
                            {!! Form::select('type',['1'=>trans_choice('general.outstanding_p_i',1),'2'=>trans_choice('general.outstanding_p_i_f',1),'3'=>trans_choice('general.outstanding_total',1)],null,array('class'=>'form-control','required'=>'required')) !!}
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-info">{{trans_choice('general.save',1)}}</button>
                    <button type="button" class="btn default"
                            data-dismiss="modal">{{trans_choice('general.close',1)}}</button>
                </div>
                {!! Form::close() !!}
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
@endsection
@section('footer-scripts')
    <script src="{{ asset('assets/plugins/datatable/media/js/jquery.dataTables.js')}}"></script>
    <script src="{{ asset('assets/plugins/datatable/media/js/dataTables.bootstrap.js')}}"></script>
    <script src="{{ asset('assets/plugins/datatable/extensions/Buttons/js/dataTables.buttons.min.js')}}"></script>
    <script src="{{ asset('assets/plugins/datatable/extensions/Buttons/js/buttons.html5.min.js')}}"></script>
    <script src="{{ asset('assets/plugins/datatable/extensions/Buttons/js/buttons.print.min.js')}}"></script>
    <script src="{{ asset('assets/plugins/datatable/extensions/Responsive/js/dataTables.responsive.min.js')}}"></script>
    <script src="{{ asset('assets/plugins/datatable/extensions/Buttons/js/buttons.colVis.min.js')}}"></script>
    <script>

        $('#view-repayments').DataTable({
            dom: 'frtip',
            "paging": true,
            "lengthChange": true,
            "displayLength": 15,
            "searching": true,
            "ordering": true,
            "info": true,
            "autoWidth": true,
            "order": [[0, "asc"]],
            "columnDefs": [
                {"orderable": false, "targets": [4, 5]}
            ],
            "language": {
                "lengthMenu": "{{ trans('general.lengthMenu') }}",
                "zeroRecords": "{{ trans('general.zeroRecords') }}",
                "info": "{{ trans('general.info') }}",
                "infoEmpty": "{{ trans('general.infoEmpty') }}",
                "search": "{{ trans('general.search') }}",
                "infoFiltered": "{{ trans('general.infoFiltered') }}",
                "paginate": {
                    "first": "{{ trans('general.first') }}",
                    "last": "{{ trans('general.last') }}",
                    "next": "{{ trans('general.next') }}",
                    "previous": "{{ trans('general.previous') }}"
                }
            },
            responsive: false
        });
    </script>
    <script>
        $(document).ready(function () {
            $('#withdrawSaving').on('shown.bs.modal', function (e) {
                var id = $(e.relatedTarget).data('id');
                var amount = $(e.relatedTarget).data('amount');
                var url = "{!!  url('loan/'.$loan->id.'/guarantor') !!}/" + id + "/withdraw";
                $(e.currentTarget).find("#withdrawSavingForm").attr('action', url);
                $(e.currentTarget).find("#accepted_amount").val(amount);
            });
            $('.deleteLoan').on('click', function (e) {
                e.preventDefault();
                var href = $(this).attr('href');
                swal({
                    title: '{{trans_choice('general.are_you_sure',1)}}',
                    text: '{{trans_choice('general.delete_loan_msg',1)}}',
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: '{{trans_choice('general.ok',1)}}',
                    cancelButtonText: '{{trans_choice('general.cancel',1)}}'
                }).then(function () {
                    window.location = href;
                })
            });
            $('.deletePayment').on('click', function (e) {
                e.preventDefault();
                var href = $(this).attr('href');
                swal({
                    title: '{{trans_choice('general.are_you_sure',1)}}',
                    text: '{{trans_choice('general.delete_payment_msg',1)}}',
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: '{{trans_choice('general.ok',1)}}',
                    cancelButtonText: '{{trans_choice('general.cancel',1)}}'
                }).then(function () {
                    window.location = href;
                })
            });
            $('.deleteComment').on('click', function (e) {
                e.preventDefault();
                var href = $(this).attr('href');
                swal({
                    title: '{{trans_choice('general.are_you_sure',1)}}',
                    text: '',
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: '{{trans_choice('general.ok',1)}}',
                    cancelButtonText: '{{trans_choice('general.cancel',1)}}'
                }).then(function () {
                    window.location = href;
                })
            });
        });
    </script>
@endsection
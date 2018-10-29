@extends('client.layout')
@section('title')
    {{ trans('general.dashboard') }}
@endsection

@section('content')
    <div class="heading-sec">
        <div class="row">
            <div class="col-md-12">
                <div class="box">
                    <div class="box-footer">
                        <div class="row">
                            <div class="col-sm-3 col-xs-6">
                                <div class="description-block border-right">
                                    @if(\App\Models\Setting::where('setting_key', 'currency_position')->first()->setting_value=='left')
                                        <h5 class="description-header"> {{ \App\Models\Setting::where('setting_key', 'currency_symbol')->first()->setting_value }} {{ round(\App\Helpers\GeneralHelper::borrower_loans_total_due($borrower->id)) }} </h5>
                                    @else
                                        <h5 class="description-header"> {{ round(\App\Helpers\GeneralHelper::borrower_loans_total_due($borrower->id)) }}  {{ \App\Models\Setting::where('setting_key', 'currency_symbol')->first()->setting_value}}</h5>
                                    @endif
                                    <span class="description-text">{{trans_choice('general.total',1)}} {{trans_choice('general.value',1)}}</span>
                                </div>
                                <!-- /.description-block -->
                            </div>
                            <!-- /.col -->
                            <div class="col-sm-3 col-xs-6">
                                <div class="description-block border-right">
                                    @if(\App\Models\Setting::where('setting_key', 'currency_position')->first()->setting_value=='left')
                                        <h5 class="description-header"> {{ \App\Models\Setting::where('setting_key', 'currency_symbol')->first()->setting_value }} {{round(\App\Helpers\GeneralHelper::borrower_loans_total_paid($borrower->id))}} </h5>
                                    @else
                                        <h5 class="description-header"> {{round(\App\Helpers\GeneralHelper::borrower_loans_total_paid($borrower->id))}} {{ \App\Models\Setting::where('setting_key', 'currency_symbol')->first()->setting_value}}</h5>
                                    @endif
                                    <span class="description-text">{{trans_choice('general.total',1)}} {{trans_choice('general.paid',1)}}</span>
                                </div>
                                <!-- /.description-block -->
                            </div>
                            <!-- /.col -->
                            <div class="col-sm-3 col-xs-6">
                                <div class="description-block border-right">
                                    @if(\App\Models\Setting::where('setting_key', 'currency_position')->first()->setting_value=='left')
                                        <h5 class="description-header"> {{ \App\Models\Setting::where('setting_key', 'currency_symbol')->first()->setting_value }} {{round(\App\Helpers\GeneralHelper::borrower_loans_total_due($borrower->id))-round(\App\Helpers\GeneralHelper::borrower_loans_total_paid($borrower->id))}} </h5>
                                    @else
                                        <h5 class="description-header"> {{round(\App\Helpers\GeneralHelper::borrower_loans_total_due($borrower->id))-round(\App\Helpers\GeneralHelper::borrower_loans_total_paid($borrower->id))}}  {{ \App\Models\Setting::where('setting_key', 'currency_symbol')->first()->setting_value}}</h5>
                                    @endif
                                    <span class="description-text">{{trans_choice('general.balance',1)}}</span>

                                </div>
                                <!-- /.description-block -->
                            </div>
                            <!-- /.col -->
                            <div class="col-sm-3 col-xs-6">
                                <div class="description-block">
                                    @if(!empty(\App\Models\LoanSchedule::where('due_date','>',date('Y-m-d'))->first()))
                                        <h5 class="description-header"
                                            style="font-weight: 300;color: #ff5f5f;">{{ \App\Models\LoanSchedule::where('due_date','>',date('Y-m-d'))->orderBy('due_date','asc')->first()->due_date }}</h5>
                                    @endif
                                    <span class="description-text">{{trans_choice('general.next_payment_due',1)}}</span>
                                </div>
                                <!-- /.description-block -->
                            </div>
                        </div>
                        <!-- /.row -->
                    </div>
                </div>
            </div>

        </div>
    </div>
    <div class="row">

        <div class="col-md-7">

            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">{{trans_choice('general.loan',2)}}</h3>

                    <div class="box-tools pull-right">

                    </div>
                </div>
                <div class="box-body table-responsive ">
                    <table id="data-table" class="table  table-condensed">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>{{trans_choice('general.principal',1)}}</th>
                            <th>{{trans_choice('general.released',1)}}</th>
                            <th>{{trans_choice('general.interest',1)}}%</th>
                            <th>{{trans_choice('general.due',1)}}</th>
                            <th>{{trans_choice('general.paid',1)}}</th>
                            <th>{{trans_choice('general.balance',1)}}</th>
                            <th>{{trans_choice('general.status',1)}}</th>
                            <th>{{trans_choice('general.action',1)}}</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($borrower->loans as $key)
                            <tr>

                                <td>{{$key->id}}</td>
                                <td>{{round($key->principal,2)}}</td>
                                <td>{{$key->release_date}}</td>
                                <td>
                                    {{round($key->interest_rate,2)}}%/{{$key->interest_period}}
                                </td>
                                <td>{{round(\App\Helpers\GeneralHelper::loan_total_due_amount($key->id),2)}}</td>
                                <td>{{round(\App\Helpers\GeneralHelper::loan_total_paid($key->id),2)}}</td>
                                <td>{{round(\App\Helpers\GeneralHelper::loan_total_balance($key->id),2)}}</td>
                                <td>
                                    @if($key->maturity_date<date("Y-m-d") && \App\Helpers\GeneralHelper::loan_total_balance($key->id)>0)
                                        <span class="label label-danger">{{trans_choice('general.past_maturity',1)}}</span>
                                    @else
                                        @if($key->status=='pending')
                                            <span class="label label-warning">{{trans_choice('general.pending',1)}} {{trans_choice('general.approval',1)}}</span>
                                        @endif
                                        @if($key->status=='approved')
                                            <span class="label label-info">{{trans_choice('general.awaiting',1)}} {{trans_choice('general.disbursement',1)}}</span>
                                        @endif
                                        @if($key->status=='disbursed')
                                            <span class="label label-info">{{trans_choice('general.active',1)}}</span>
                                        @endif
                                        @if($key->status=='declined')
                                            <span class="label label-danger">{{trans_choice('general.declined',1)}}</span>
                                        @endif
                                        @if($key->status=='withdrawn')
                                            <span class="label label-danger">{{trans_choice('general.withdrawn',1)}}</span>
                                        @endif
                                        @if($key->status=='written_off')
                                            <span class="label label-danger">{{trans_choice('general.written_off',1)}}</span>
                                        @endif
                                        @if($key->status=='closed')
                                            <span class="label label-success">{{trans_choice('general.closed',1)}}</span>
                                        @endif
                                        @if($key->status=='pending_reschedule')
                                            <span class="label label-warning">{{trans_choice('general.pending',1)}} {{trans_choice('general.reschedule',1)}}</span>
                                        @endif
                                        @if($key->status=='rescheduled')
                                            <span class="label label-info">{{trans_choice('general.rescheduled',1)}}</span>
                                        @endif
                                    @endif
                                </td>
                                <td>
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-info btn-xs dropdown-toggle"
                                                data-toggle="dropdown" aria-expanded="false">
                                            <i class="fa fa-navicon"></i>
                                        </button>
                                        <ul class="dropdown-menu dropdown-menu-right" role="menu">
                                            <li><a href="{{ url('client/loan/'.$key->id.'/show') }}"><i
                                                            class="fa fa-search"></i> {{ trans_choice('general.detail',2) }}
                                                </a>
                                            </li>
                                            @if(\App\Helpers\GeneralHelper::loan_total_balance($key->id)>0)
                                                <li><a href="{{ url('client/loan/'.$key->id.'/pay') }}"><i
                                                                class="fa fa-money"></i> {{ trans('general.pay') }}
                                                    </a>
                                                </li>
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
        <div class="col-md-5">
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">{{trans_choice('general.repayment',2)}}</h3>

                    <div class="box-tools pull-right">

                    </div>
                </div>
                <div class="box-body table-responsive">
                    <table id="view-repayments"
                           class="table table-condensed">
                        <thead>
                        <tr role="row">
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
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($borrower->payments as $key)


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

                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function () {

        });
    </script>
@endsection

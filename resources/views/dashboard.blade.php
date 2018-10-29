@extends('layouts.master')
@section('title')
    {{ trans('general.dashboard') }}
@endsection
@section('current-page-title')
    {{ trans('general.dashboard') }}
@endsection
@section('current-page')
    {{ trans('general.dashboard') }}
@endsection
@section('content')
    <div class="row">
        @if(Sentinel::hasAccess('dashboard.registered_borrowers'))
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="info-box">
                    <span class="info-box-icon bg-red"><i class="fa fa-users"></i></span>

                    <div class="info-box-content">
                <span class="info-box-text">{{ trans_choice('general.registered',1) }}
                    <br>{{ trans_choice('general.borrower',2) }}</span>
                        <span class="info-box-number">{{ \App\Models\Borrower::count() }}</span>
                    </div>
                </div>
            </div>
        @endif
        <div class="clearfix visible-sm-block"></div>
        @if(Sentinel::hasAccess('dashboard.total_loans_released'))
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="info-box">
                    <span class="info-box-icon bg-green"><i class="fa fa-files-o"></i></span>

                    <div class="info-box-content">
                <span class="info-box-text">{{ trans_choice('general.total',1) }} {{ trans_choice('general.loan',2) }}
                    <br>{{ trans_choice('general.released',1) }}</span>
                        @if(\App\Models\Setting::where('setting_key', 'currency_position')->first()->setting_value=='left')
                            <span class="info-box-number"> {{ \App\Models\Setting::where('setting_key', 'currency_symbol')->first()->setting_value }} {{ number_format(\App\Models\Loan::where('status',
                'disbursed')->sum('principal'),2) }} </span>
                        @else
                            <span class="info-box-number"> {{ number_format(\App\Models\Loan::where('status',
                'disbursed')->sum('principal'),2) }}  {{ \App\Models\Setting::where('setting_key', 'currency_symbol')->first()->setting_value}}</span>
                        @endif

                    </div>
                </div>
            </div>
        @endif
        @if(Sentinel::hasAccess('dashboard.total_collections'))
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="info-box">
                    <span class="info-box-icon bg-aqua"><i class="fa fa-dollar"></i></span>

                    <div class="info-box-content">
                        <span class="info-box-text">{{ trans_choice('general.total',1) }}
                            <br>{{ trans_choice('general.collection',2) }}</span>
                        @if(\App\Models\Setting::where('setting_key', 'currency_position')->first()->setting_value=='left')
                            <span class="info-box-number"> {{ \App\Models\Setting::where('setting_key', 'currency_symbol')->first()->setting_value }} {{ number_format(\App\Helpers\GeneralHelper::loans_total_paid(),2) }} </span>
                        @else
                            <span class="info-box-number"> {{ number_format(\App\Helpers\GeneralHelper::loans_total_paid(),2) }}  {{ \App\Models\Setting::where('setting_key', 'currency_symbol')->first()->setting_value}}</span>
                        @endif
                    </div>

                </div>

            </div>
        @endif
        @if(Sentinel::hasAccess('dashboard.loans_disbursed'))
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="info-box">
                    <span class="info-box-icon bg-aqua"><i class="fa fa-balance-scale"></i></span>

                    <div class="info-box-content">
                        <span class="info-box-text">{{ trans_choice('general.total',1) }} {{ trans_choice('general.outstanding',1) }}
                            <br>{{ trans_choice('general.open',1) }} {{ trans_choice('general.loan',2) }}</span>
                        @if(\App\Models\Setting::where('setting_key', 'currency_position')->first()->setting_value=='left')
                            <span class="info-box-number"> {{ \App\Models\Setting::where('setting_key', 'currency_symbol')->first()->setting_value }} {{ number_format(\App\Helpers\GeneralHelper::loans_total_due(),2) }} </span>
                        @else
                            <span class="info-box-number"> {{ number_format(\App\Helpers\GeneralHelper::loans_total_due(),2) }}  {{ \App\Models\Setting::where('setting_key', 'currency_symbol')->first()->setting_value}}</span>
                        @endif
                    </div>

                </div>

            </div>
        @endif
        @if(Sentinel::hasAccess('dashboard.loans_disbursed'))
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="info-box">
                    <span class="info-box-icon bg-green">O</span>

                    <div class="info-box-content">
                        <span class="info-box-text">{{ trans_choice('general.open',1) }}
                            <br>{{ trans_choice('general.loan',2) }}</span>
                        <span class="info-box-number">{{ \App\Models\Loan::where('status','disbursed')->count() }}</span>
                    </div>
                </div>
            </div>
        @endif
        @if(Sentinel::hasAccess('dashboard.loans_closed'))
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="info-box">
                    <span class="info-box-icon bg-green">C</span>

                    <div class="info-box-content">
                        <span class="info-box-text">{{ trans_choice('general.closed',2) }}
                            <br> {{ trans_choice('general.loan',2) }}</span>
                        <span class="info-box-number">{{ \App\Models\Loan::where('status','closed')->count() }}</span>
                    </div>

                </div>

            </div>
        @endif
        @if(Sentinel::hasAccess('dashboard.loans_pending'))
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="info-box">
                    <span class="info-box-icon bg-green">P</span>

                    <div class="info-box-content">
                        <span class="info-box-text">{{ trans_choice('general.pending',2) }}
                            <br> {{ trans_choice('general.loan',2) }}</span>
                        <span class="info-box-number">{{ \App\Models\Loan::where('status','pending')->count() }}</span>
                    </div>

                </div>

            </div>
        @endif
        @if(Sentinel::hasAccess('dashboard.loans_approved'))
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="info-box">
                    <span class="info-box-icon bg-green">A</span>

                    <div class="info-box-content">
                        <span class="info-box-text">{{ trans_choice('general.approved',2) }}
                            <br> {{ trans_choice('general.loan',2) }}</span>
                        <span class="info-box-number">{{ \App\Models\Loan::where('status','approved')->count() }}</span>
                    </div>

                </div>

            </div>
        @endif
        @if(Sentinel::hasAccess('dashboard.loans_rescheduled'))
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="info-box">
                    <span class="info-box-icon bg-green">R</span>

                    <div class="info-box-content">
                        <span class="info-box-text">{{ trans_choice('general.rescheduled',2) }}
                            <br> {{ trans_choice('general.loan',2) }}</span>
                        <span class="info-box-number">{{ \App\Models\Loan::where('status','rescheduled')->count() }}</span>
                    </div>

                </div>

            </div>
        @endif
        @if(Sentinel::hasAccess('dashboard.loans_written_off'))
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="info-box">
                    <span class="info-box-icon bg-green">W</span>

                    <div class="info-box-content">
                        <span class="info-box-text">{{ trans_choice('general.written_off',2) }}
                            <br> {{ trans_choice('general.loan',2) }}</span>
                        <span class="info-box-number">{{ \App\Models\Loan::where('status','written_off')->count() }}</span>
                    </div>

                </div>

            </div>
        @endif
        @if(Sentinel::hasAccess('dashboard.loans_declined'))
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="info-box">
                    <span class="info-box-icon bg-green">D</span>

                    <div class="info-box-content">
                        <span class="info-box-text">{{ trans_choice('general.declined',2) }}
                            <br> {{ trans_choice('general.loan',2) }}</span>
                        <span class="info-box-number">{{ \App\Models\Loan::where('status','declined')->count() }}</span>
                    </div>

                </div>

            </div>
        @endif
        @if(Sentinel::hasAccess('dashboard.loans_withdrawn'))
            <div class="col-md-3 col-sm-6 col-xs-12">
                <div class="info-box">
                    <span class="info-box-icon bg-green">W</span>

                    <div class="info-box-content">
                        <span class="info-box-text">{{ trans_choice('general.withdrawn',2) }}
                            <br> {{ trans_choice('general.loan',2) }}</span>
                        <span class="info-box-number">{{ \App\Models\Loan::where('status','withdrawn')->count() }}</span>
                    </div>

                </div>

            </div>
        @endif

    </div>


    @if(Sentinel::hasAccess('dashboard.loans_released_monthly_graph'))
        <div class="row">
            <div class="col-md-12">
                <!-- BEGIN PORTLET -->
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title"><b><span
                                        style="color: #D72828">{{trans_choice('general.loans_released_monthly',1)}}</span></b>
                        </h3>

                        <div class="box-tools pull-right">
                            <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                            <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                        </div>
                    </div>
                    <div class="box-body">
                        <div id="loans_released_monthly" class="chart" style="height: 300px;">
                        </div>
                    </div>
                </div>
                <!-- END PORTLET -->
            </div>
        </div>
    @endif
    @if(Sentinel::hasAccess('dashboard.loans_collected_monthly_graph'))
        <div class="row">
            <div class="col-md-12">
                <!-- BEGIN PORTLET -->
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title"><b><span
                                        style="color: #3C8DBC">{{trans_choice('general.loan_collections_monthly',1)}}</span></b>
                        </h3>

                        <div class="box-tools pull-right">
                            <button class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
                            <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
                        </div>
                    </div>
                    <div class="box-body">
                        <div id="loan_collections_monthly" class="chart" style="height: 300px;">
                        </div>
                    </div>
                </div>
                <!-- END PORTLET -->
            </div>
        </div>
    @endif
    <script src="{{ asset('assets/plugins/amcharts/amcharts.js') }}"
            type="text/javascript"></script>
    <script src="{{ asset('assets/plugins/amcharts/serial.js') }}"
            type="text/javascript"></script>
    <script src="{{ asset('assets/plugins/amcharts/pie.js') }}"
            type="text/javascript"></script>
    <script src="{{ asset('assets/plugins/amcharts/themes/light.js') }}"
            type="text/javascript"></script>
    <script>
        AmCharts.makeChart("loans_released_monthly", {
            "type": "serial",
            "theme": "light",
            "autoMargins": true,
            "marginLeft": 30,
            "marginRight": 8,
            "marginTop": 10,
            "marginBottom": 26,
            "fontFamily": 'Open Sans',
            "color": '#888',

            "dataProvider": {!! $loans_released_monthly !!},
            "valueAxes": [{
                "axisAlpha": 0,

            }],
            "startDuration": 1,
            "graphs": [{
                "balloonText": "<span style='font-size:13px;'>[[title]] in [[category]]:<b> [[value]]</b> [[additional]]</span>",
                "bullet": "round",
                "bulletSize": 8,
                "lineColor": "#d1655d",
                "lineThickness": 4,
                "negativeLineColor": "#637bb6",
                "title": "Amount",
                "type": "smoothedLine",
                "valueField": "amount"
            }],
            "categoryField": "month",
            "categoryAxis": {
                "gridPosition": "start",
                "axisAlpha": 0,
                "tickLength": 0,
                "labelRotation": 30,

            },


        });
        AmCharts.makeChart("loan_collections_monthly", {
            "type": "serial",
            "theme": "light",
            "autoMargins": true,
            "marginLeft": 30,
            "marginRight": 8,
            "marginTop": 10,
            "marginBottom": 26,
            "fontFamily": 'Open Sans',
            "color": '#888',

            "dataProvider": {!! $loan_collections_monthly !!},
            "valueAxes": [{
                "axisAlpha": 0,

            }],
            "startDuration": 1,
            "graphs": [{
                "balloonText": "<span style='font-size:13px;'>[[title]] in [[category]]:<b> [[value]]</b> [[additional]]</span>",
                "bullet": "round",
                "bulletSize": 8,
                "lineColor": "#3C8DBC",
                "lineThickness": 4,
                "negativeLineColor": "#637bb6",
                "title": "Amount",
                "type": "smoothedLine",
                "valueField": "amount"
            }],
            "categoryField": "month",
            "categoryAxis": {
                "gridPosition": "start",
                "axisAlpha": 0,
                "tickLength": 0,
                "labelRotation": 30,

            },


        });

    </script>

@endsection

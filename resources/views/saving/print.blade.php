<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Web Admin</title>
    <link rel="stylesheet" href="{{ asset('assets/bootstrap/css/bootstrap.min.css') }}">
    <!-- Theme style -->
    <link rel="stylesheet" href="{{ asset('assets/dist/css/AdminLTE.min.css') }}">
    <style type="text/css" media="print">
        @page {
            size: auto;   /* auto is the initial value */
            margin: 0mm;  /* this affects the margin in the printer settings */
        }

        html {
            background-color: #FFFFFF;
            margin: 0px; /* this affects the margin on the html before sending to printer */
        }

        body {
            margin: 10mm 10mm 10mm 10mm; /* margin you want for the content */
        }
    </style>
</head>
<body>
<div class="wrapper">
    <!-- Main content -->
    <section class="invoice">
        <!-- title row -->
        <div class="row">
            <div class="col-xs-12">
            </div>
            <div class="col-xs-12">
                <div class="text-center">

                    <h2 class="page-header">
                        {{\App\Models\Setting::where('setting_key','company_name')->first()->setting_value}}
                        <small class="pull-right"></small>
                    </h2>
                    <h4>{{trans_choice('general.saving',2)}} {{trans_choice('general.account',1)}} {{trans_choice('general.statement',1)}}</h4>
                    <strong>{{trans_choice('general.date',1)}}: </strong>{{date("Y-m-d")}}<br><br>
                </div>
                <br>
            </div>
            <!-- /.col -->
        </div>
        <!-- info row -->

        <div class="row invoice-info">
            <div class="col-sm-6">
                <address>
                    <b>{{ $saving->borrower->title }} {{ $saving->borrower->first_name }} {{ $saving->borrower->last_name }}</b><br>
                </address>
            </div>
        </div>
        <!-- /.row -->
        <!-- Table row -->
        <div class="row">
            <div class="col-xs-12 table-responsive">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th>{{trans_choice('general.account',1)}}#</th>
                        <th>{{trans_choice('general.product',1)}}</th>
                        <th>{{trans_choice('general.minimum',1)}} {{trans_choice('general.balance',1)}}</th>
                        <th>{{trans_choice('general.interest_rate_per_annum',1)}}</th>
                        <th>{{trans_choice('general.interest_posting_frequency',1)}}</th>
                        <th style="text-align:right">{{trans_choice('general.current',1)}} {{trans_choice('general.balance',1)}}</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>{{$saving->id}}</td>
                        <td>
                            @if(!empty($saving->savings_product))
                                {{ $saving->savings_product->name }}
                            @endif
                        </td>
                        <td>{{$saving->savings_product->minimum_balance}}</td>
                        <td>{{$saving->savings_product->interest_rate}}</td>
                        <td>
                            @if($saving->savings_product->interest_posting==1)
                                {{trans_choice('general.every_1_month',1)}}
                            @endif
                            @if($saving->savings_product->interest_posting==2)
                                {{trans_choice('general.every_2_month',1)}}
                            @endif
                            @if($saving->savings_product->interest_posting==3)
                                {{trans_choice('general.every_3_month',1)}}
                            @endif
                            @if($saving->savings_product->interest_posting==4)
                                {{trans_choice('general.every_4_month',1)}}
                            @endif
                            @if($saving->savings_product->interest_posting==5)
                                {{trans_choice('general.every_6_month',1)}}
                            @endif
                            @if($saving->savings_product->interest_posting==6)
                                {{trans_choice('general.every_12_month',1)}}

                            @endif
                        </td>
                        <td style="text-align:right">
                            <b>{{round(\App\Helpers\GeneralHelper::savings_account_balance($saving->id),2)}}</b></td>
                    </tr>
                    </tbody>
                </table>
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th><b>{{trans_choice('general.date',1)}}</b></th>
                        <th><b>{{trans_choice('general.transaction',1)}}</b></th>
                        <th><b>{{trans_choice('general.description',1)}}</b></th>
                        <th style="text-align:right"><b>{{trans_choice('general.debit',1)}}</b></th>
                        <th style="text-align:right"><b>{{trans_choice('general.credit',1)}}</b></th>
                        <th style="text-align:right"><b>{{trans_choice('general.balance',1)}}</b></th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>

                    </tr>
                    @foreach($transactions as $key)
                        <tr>
                            <td>
                                {{$key['date']}}<br>
                                {{$key['time']}}
                            </td>
                            <td>
                                @if($key['type']=="deposit")
                                    {{trans_choice('general.deposit',1)}}
                                @endif
                                @if($key['type']=="withdrawal")
                                    {{trans_choice('general.withdrawal',1)}}
                                @endif
                                @if($key['type']=="bank_fees")
                                    {{trans_choice('general.bank_fee',1)}}
                                @endif
                                @if($key['type']=="dividend")
                                    {{trans_choice('general.dividend',1)}}
                                @endif
                                @if($key['type']=="interest")
                                    {{trans_choice('general.interest',1)}}
                                @endif
                            </td>
                            <td>
                                {!!  $key['notes']!!}
                            </td>
                            @if($key['type']=="deposit" || $key['type']=="dividend" || $key['type']=="interest")
                                <td style="text-align:right">

                                </td>
                                <td style="text-align:right">
                                    {{$key['amount']}}
                                </td>
                            @else
                                <td style="text-align:right">
                                    {{$key['amount']}}
                                </td>
                                <td style="text-align:right">

                                </td>
                            @endif
                            <td style="text-align:right">
                                <b>{{$key['balance']}}</b>
                            </td>
                        </tr>
                    @endforeach
                    </tbody>
                </table>
            </div>
        </div>


    </section>
</div>
<script>
    window.onload = function () {
        window.print();
    }
</script>
</body>
</html>
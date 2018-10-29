@extends('client.layout')
@section('title')
    {{ trans_choice('general.saving',2) }} {{ trans_choice('general.account',2) }} {{ trans_choice('general.detail',2) }}
@endsection

@section('content')

    <div class="box box-info">
        <div class="box-body table-responsive no-padding">
            <table id="" class="table table-bordered table-condensed table-hover">
                <thead>
                <tr style="background-color: #FFF8F2">
                    <th>{{trans_choice('general.account',1)}}#</th>
                    <th>{{trans_choice('general.product',1)}}</th>
                    <th>{{trans_choice('general.minimum',1)}} {{trans_choice('general.balance',1)}}</th>
                    <th>{{trans_choice('general.interest_rate_per_annum',1)}}</th>
                    <th>{{trans_choice('general.interest_posting_frequency',1)}}</th>
                    <th>{{trans_choice('general.current',1)}} {{trans_choice('general.balance',1)}}</th>
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
                    <td>{{round(\App\Helpers\GeneralHelper::savings_account_balance($saving->id),2)}}</td>



                </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-3">

            <div class="input-group-btn">
                <button type="button" class="btn btn-sm btn-info margin-bottom dropdown-toggle" data-toggle="dropdown"
                        aria-expanded="false">{{trans_choice('general.saving',2)}} {{trans_choice('general.statement',1)}}
                    <span class="fa fa-caret-down"></span>
                </button>
                <ul class="dropdown-menu" role="menu">


                    <li><a href="{{url('client/saving/'.$saving->id.'/statement/print')}}"
                           target="_blank">{{trans_choice('general.print',1)}} {{trans_choice('general.statement',1)}}</a>
                    </li>

                    <li><a href="{{url('client/saving/'.$saving->id.'/statement/pdf')}}"
                           target="_blank">{{trans_choice('general.download',1)}} {{trans_choice('general.in',1)}} {{trans_choice('general.pdf',1)}}</a>
                    </li>

                </ul>
            </div>
        </div>
        <div class="col-sm-3">
            <a type="button" class="btn btn-sm btn-info margin-bottom"
               href="{{url('client/saving/'.$saving->id.'/pay')}}">{{trans_choice('general.pay',1)}}</a>
        </div>
        <div class="col-sm-4">
            <!--
            <a type="button" class="btn btn-sm bg-blue margin-bottom"
               href="{{url('saving/'.$saving->id.'/transfer/create')}}">{{trans_choice('general.transfer_money_to_loan_account',1)}}</a>
               -->
        </div>
    </div>
    <div class="box box-warning">
        <div class="box-body table-responsive no-padding">
            <table class="table table-bordered table-condensed  table-hover">
                <tbody>
                <tr style="background-color: #FFF8F2">
                    <th><b>{{trans_choice('general.date',1)}}</b></th>
                    <th><b>{{trans_choice('general.transaction',1)}}</b></th>
                    <th style="text-align:right"><b>{{trans_choice('general.debit',1)}}</b></th>
                    <th style="text-align:right"><b>{{trans_choice('general.credit',1)}}</b></th>
                    <th style="text-align:right"><b>{{trans_choice('general.balance',1)}}</b></th>
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
                            @if($key['type']=="guarantee")
                                {{trans_choice('general.guarantee',1)}}
                            @endif
                            @if($key['type']=="guarantee_restored")
                                {{trans_choice('general.guarantee',1)}} {{trans_choice('general.restored',1)}}
                            @endif
                        </td>
                        @if($key['type']=="deposit" || $key['type']=="dividend" || $key['type']=="interest"  || $key['type'] == 'guarantee_restored')
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
@endsection

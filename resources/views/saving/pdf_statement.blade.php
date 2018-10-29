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

    <h3 class="text-center">
        <b>{{trans_choice('general.saving',2)}} {{trans_choice('general.account',1)}} {{trans_choice('general.statement',1)}}</b>
    </h3>

    <div style="width: 100%;margin-left: auto;font-size:10px;margin-right: auto;border-top: solid thin #2cc3dd;border-bottom: solid thin #2cc3dd;padding-top: 40px;text-transform: capitalize">
        <table class="table table-striped" style="margin-top: 20px">
            <thead>
            <tr>
                <th><b>{{trans_choice('general.account',1)}}#</b></th>
                <th><b>{{trans_choice('general.product',1)}}</b></th>
                <th><b>{{trans_choice('general.minimum',1)}} {{trans_choice('general.balance',1)}}</b></th>
                <th><b>{{trans_choice('general.interest_rate_per_annum',1)}}</b></th>
                <th><b>{{trans_choice('general.interest_posting_frequency',1)}}</b></th>
                <th style="text-align:right">{{trans_choice('general.current',1)}}<b> {{trans_choice('general.balance',1)}}</b></th>
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
    </div>
    <div style="margin-top:30px;margin-left: auto;margin-right: auto;text-transform: capitalize;font-size: 8px;">
        <table border="1" class="table ">
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

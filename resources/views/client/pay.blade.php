@extends('client.layout')
@section('title')
    {{ trans_choice('general.pay',1) }}
@endsection

@section('content')

    <div class="row">

        <div class="col-md-12">

            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">{{ trans_choice('general.pay',1) }}</h3>

                    <div class="box-tools pull-right">
                    </div>
                </div>
                {!! Form::open(array('url' => '', 'method' => 'post', 'id' => 'pay_form',"enctype"=>"multipart/form-data")) !!}
                <div class="box-body">
                    <div class="form-group">
                        {!! Form::label('payment_gateway',trans_choice('general.payment',1).' '.trans_choice('general.method',1),array('class'=>'')) !!}
                        {!! Form::select('payment_gateway',$methods,null, array('class' => 'form-control','id'=>'payment_gateway','placeholder'=>'','required'=>'required')) !!}
                    </div>
                    <div class="form-group">
                        {!! Form::label('amount',trans_choice('general.amount',1),array('class'=>'')) !!}
                        {!! Form::text('amount',$balance, array('class' => 'form-control touchspin', 'placeholder'=>'','required'=>'required')) !!}
                    </div>
                    <div class="col-md-6" style="display: none;">
                        <input name="rm" value="2" type="hidden">
                        <input name="cmd" value="_xclick" type="hidden">
                        <input name="currency_code"
                               value="{{ \App\Models\Setting::where('setting_key', 'currency')->first()->setting_value }}"
                               type="hidden">
                        <input name="quantity" value="1" type="hidden">
                        <input name="business"
                               value="{{ \App\Models\Setting::where('setting_key', 'paypal_email')->first()->setting_value }}"
                               type="hidden">
                        <input name="return" value="{{ url('client/loan/'.$loan->id.'/pay/paypal/done') }}"
                               type="hidden">
                        <input name="cancel_return"
                               value="{{ url('client/loan/'.$loan->id.'/pay/paypal/cancel') }}"
                               type="hidden">
                        <input name="notify_url"
                               value="{{ url('client/loan/'.$loan->id.'/pay/paypal/ipn') }}" type="hidden">
                        <input name="custom" value="" type="hidden">
                        <input name="item_name" value="Loan Repayment" type="hidden">
                        <input name="item_number" value="{{ $loan->id }}" type="hidden">
                    </div>
                </div>
                <div class="box-footer">
                    <button type="submit" class="btn btn-primary pull-left"
                            id="pay_btn">{{trans_choice('general.pay',1)}}</button>
                </div>
                {!! Form::close() !!}
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function () {
            $('#pay_btn').click(function (e) {
                e.preventDefault();
                if ($('#payment_gateway').val() == "") {
                    alert("Please select payment gateway")
                } else if ($('#amount').val() == "") {
                    alert("Please enter amount to pay")
                } else if ($('#amount').val() == "0.00") {
                    alert("Please enter amount to pay")
                } else {
                    if ($('#payment_gateway').val() == "paynow") {
                        $('#pay_form').attr('action', "{!! url('client/loan/'.$loan->id.'/pay/paynow') !!}");
                        $('#pay_form').submit();
                    }
                    if ($('#payment_gateway').val() == "paypal") {
                        $('#pay_form').attr('action', "https://www.paypal.com/cgi-bin/webscr");
                        $('#pay_form').submit();
                    }
                }
            })
        });
    </script>
@endsection

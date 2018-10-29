@extends('layouts.master')
@section('title')
    {{trans_choice('general.add',1)}} {{trans_choice('general.loan',1)}} {{trans_choice('general.product',1)}}
@endsection
@section('content')
    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title">{{trans_choice('general.add',1)}} {{trans_choice('general.loan',1)}} {{trans_choice('general.product',1)}}</h3>

            <div class="box-tools pull-right">

            </div>
        </div>
        {!! Form::open(array('url' => url('loan/loan_product/store'), 'method' => 'post', 'class' => 'form-horizontal')) !!}
        <div class="box-body">
            <div class="form-group">
                {!! Form::label('name',trans_choice('general.name',1),array('class'=>'col-sm-3 control-label')) !!}
                <div class="col-sm-5">
                    {!! Form::text('name',null, array('class' => 'form-control', 'placeholder'=>"",'required'=>'required')) !!}
                </div>
            </div>

            <div class="slidingDiv">
                <hr>
                <p class="text-red"><b>{{trans_choice('general.principal',1)}} {{trans_choice('general.amount',1)}}:</b>
                </p>

                <div class="form-group">
                    <label for="inputDisbursedById"
                           class="col-sm-3 control-label">{{trans_choice('general.disbursed_by',1)}}</label>

                    <div class="col-sm-3">
                        @foreach($loan_disbursed_by as $key)
                            <label> <input class="inputDisbursedById" type="checkbox" name="loan_disbursed_by_id[]"
                                           value="{{$key->id}}">{{$key->name}}</label>
                            <br>
                        @endforeach
                    </div>
                </div>
                <div class="form-group">
                    {!! Form::label('minimum_principal',trans_choice('general.minimum',1).' '.trans_choice('general.principal',1),array('class'=>'col-sm-3 control-label')) !!}
                    <div class="col-sm-5">
                        {!! Form::text('minimum_principal',null, array('class' => 'form-control touchspin', 'placeholder'=>"")) !!}
                    </div>
                </div>
                <div class="form-group">
                    {!! Form::label('default_principal',trans_choice('general.default',1).' '.trans_choice('general.principal',1),array('class'=>'col-sm-3 control-label')) !!}
                    <div class="col-sm-5">
                        {!! Form::text('default_principal',null, array('class' => 'form-control touchspin' ,'required'=>'required')) !!}
                    </div>
                </div>
                <div class="form-group">
                    {!! Form::label('maximum_principal',trans_choice('general.maximum',1).' '.trans_choice('general.principal',1),array('class'=>'col-sm-3 control-label')) !!}
                    <div class="col-sm-5">
                        {!! Form::text('maximum_principal',null, array('class' => 'form-control touchspin', 'placeholder'=>"")) !!}
                    </div>
                </div>
                <hr>
                <p class="text-red"><b>{{trans_choice('general.interest',1)}}:</b></p>

                <div class="form-group">
                    {!! Form::label('interest_method',trans_choice('general.interest',1).' '.trans_choice('general.method',1),array('class'=>'col-sm-3 control-label')) !!}
                    <div class="col-sm-5">
                        {!! Form::select('interest_method',array('flat_rate'=>trans_choice('general.flat_rate',1),'declining_balance_equal_installments'=>trans_choice('general.declining_balance_equal_installments',1),'declining_balance_equal_principal'=>trans_choice('general.declining_balance_equal_principal',1),'interest_only'=>trans_choice('general.interest_only',1)),null, array('class' => 'form-control','required'=>'required')) !!}
                    </div>
                </div>
                <div class="form-group">
                    {!! Form::label('default_interest_rate',trans_choice('general.default',1).' '.trans_choice('general.loan',1).' '.trans_choice('general.interest',1).' %',array('class'=>'col-sm-3 control-label')) !!}
                    <div class="col-sm-2">
                        {!! Form::text('default_interest_rate',null, array('class' => 'form-control touchspin','required'=>'required')) !!}
                    </div>
                    <div class="col-sm-3">
                        {!! Form::select('interest_period',array('day'=>trans_choice('general.per_day',1),'week'=>trans_choice('general.per_week',1),'month'=>trans_choice('general.per_month',1),'year'=>trans_choice('general.per_year',1)),null, array('class' => 'form-control','required'=>'required',"id"=>"inputDefaultInterestPeriod")) !!}
                    </div>
                </div>
                <div class="form-group">
                    {!! Form::label('interest_method',trans_choice('general.minimum',1).' '.trans_choice('general.loan',1).' '.trans_choice('general.interest',1).' %',array('class'=>'col-sm-3 control-label')) !!}
                    <div class="col-sm-2">
                        {!! Form::text('minimum_interest_rate',null, array('class' => 'form-control touchspin', 'placeholder'=>"")) !!}
                    </div>
                    <div class="col-sm-3">
                        {!! Form::select('',array('day'=>trans_choice('general.per_day',1),'week'=>trans_choice('general.per_week',1),'month'=>trans_choice('general.per_month',1),'year'=>trans_choice('general.per_year',1)),null, array('class' => 'form-control', 'placeholder'=>"","id"=>"inputMinInterestPeriod")) !!}
                    </div>
                </div>
                <div class="form-group">
                    {!! Form::label('maximum_interest_rate',trans_choice('general.maximum',1).' '.trans_choice('general.loan',1).' '.trans_choice('general.interest',1).' %',array('class'=>'col-sm-3 control-label')) !!}
                    <div class="col-sm-2">
                        {!! Form::text('maximum_interest_rate',null, array('class' => 'form-control touchspin', 'placeholder'=>"")) !!}
                    </div>
                    <div class="col-sm-3">
                        {!! Form::select('',array('day'=>trans_choice('general.per_day',1),'week'=>trans_choice('general.per_week',1),'month'=>trans_choice('general.per_month',1),'year'=>trans_choice('general.per_year',1)),null, array('class' => 'form-control', 'placeholder'=>"","id"=>"inputMaxInterestPeriod")) !!}
                    </div>
                </div>
                <p>{{trans_choice('general.override_msg',1)}}</p>

                <div class="form-group">
                    {!! Form::label('override_interest',trans_choice('general.override',1).' '.trans_choice('general.interest',1),array('class'=>'col-sm-3 control-label')) !!}
                    <div class="col-sm-5">
                        {!! Form::select('override_interest',array('0'=>trans_choice('general.no',1),'1'=>trans_choice('general.yes',1)),null, array('class' => 'form-control','id'=>'override_interest')) !!}
                    </div>
                </div>

                <div class="form-group" id="overrideDiv">
                    {!! Form::label('override_interest_amount',trans_choice('general.override',1).' '.trans_choice('general.interest',1).' '.trans_choice('general.amount',1),array('class'=>'col-sm-3 control-label')) !!}
                    <div class="col-sm-5">
                        {!! Form::text('override_interest_amount',null, array('class' => 'form-control touchspin','id'=>'override_interest_amount')) !!}
                    </div>

                </div>

                <div class="form-group">
                    {!! Form::label('default_loan_duration',trans_choice('general.default',1).' '.trans_choice('general.loan',1).' '.trans_choice('general.duration',1),array('class'=>'col-sm-3 control-label')) !!}
                    <div class="col-sm-3">
                        {!! Form::number('default_loan_duration',null, array('class' => 'form-control','required'=>'required')) !!}
                    </div>
                    <div class="col-sm-3">
                        {!! Form::select('default_loan_duration_type',array('day'=>trans_choice('general.day',1).'(s)','week'=>trans_choice('general.week',1).'(s)','month'=>trans_choice('general.month',1).'(s)','year'=>trans_choice('general.year',1).'(s)'),null, array('class' => 'form-control','required'=>'required',"id"=>"inputMaxInterestPeriod")) !!}
                    </div>
                    <div class="col-sm-3">
                    </div>
                </div>
                <hr>
                <p class="text-red"><b>{{trans_choice('general.repayment',2)}}:</b></p>

                <div class="form-group">
                    {!! Form::label('repayment_cycle',trans_choice('general.repayment_cycle',1),array('class'=>'col-sm-3 control-label')) !!}
                    <div class="col-sm-5">
                        {!! Form::select('repayment_cycle',array('daily'=>trans_choice('general.daily',1),'weekly'=>trans_choice('general.weekly',1),'monthly'=>trans_choice('general.monthly',1),'bi_monthly'=>trans_choice('general.bi_monthly',1),'quarterly'=>trans_choice('general.quarterly',1),'semi_annual'=>trans_choice('general.semi_annually',1),'annual'=>trans_choice('general.annual',1)),null, array('class' => 'form-control','required'=>'required',"id"=>"")) !!}
                    </div>
                </div>
                <hr>
                <p class="text-red"><b>{{trans_choice('general.loan_due_heading',1)}}:</b></p>

                <p>{{trans_choice('general.decimal_msg',1)}}</p>

                <div class="form-group">
                    {!! Form::label('decimal_places',trans_choice('general.decimal_place',1),array('class'=>'col-sm-3 control-label')) !!}
                    <div class="col-sm-5">
                        {!! Form::select('decimal_places',array('round_off_to_two_decimal'=>'round off to 2 decimal places','round_off_to_integer'=>'Round off to integer'),null, array('class' => 'form-control','required'=>'required',"id"=>"")) !!}
                    </div>
                </div>
                <hr>
                <script>
                    function up() {
                        var selectedOpts = $('#to option:selected');
                        if (selectedOpts.length == 0) {

                            alert("Select a column");

                            e.preventDefault();

                        }
                        var selected = $("#to").find(":selected");
                        var before = selected.prev();
                        if (before.length > 0)
                            selected.detach().insertBefore(before);
                    }

                    function down() {
                        var selectedOpts = $('#to option:selected');
                        if (selectedOpts.length == 0) {

                            alert("Select a column");

                            e.preventDefault();

                        }
                        var selected = $("#to").find(":selected");
                        var next = selected.next();
                        if (next.length > 0)
                            selected.detach().insertAfter(next);
                    }
                    function selectAll() {
                        var listbox = document.getElementById('to');
                        for (var count = 0; count < listbox.options.length; count++) {
                            listbox.options[count].selected = true;
                        }
                    }
                </script>
                <p class="text-red"><b>{{trans_choice('general.repayment',1)}} {{trans_choice('general.order',1)}}:</b></p>

                <p>The order in which repayments are allocated. For example let's say you receive payment of $100 and
                    order
                    is <b>Fees</b>, <b>Principal</b>, <b>Interest</b>, <b>Penalty</b>. Based on the loan schedule, the
                    system will allocate the amount to <b>Fees</b> first and remaining amount to <b>Principal</b> and
                    then
                    <b>Interest</b> and then <b>Penalty</b>.</p>

                <p><b>N.B. Make sure you select all options after you have done rearranging them</b></p>

                <div class="form-group">
                    <label for="inputLoanRepaymentOrder" class="col-sm-3 control-label">{{trans_choice('general.repayment',1)}} {{trans_choice('general.order',1)}}</label>

                    <div class="col-xs-6">
                        {!! Form::select('repayment_order[]',array('penalty'=>trans_choice('general.penalty',1),'fees'=>trans_choice('general.fee',2),'interest'=>trans_choice('general.interest',1),'principal'=>trans_choice('general.principal',1)),null, array('class' => 'l', 'placeholder'=>"","multiple"=>"" ,"id"=>"to" ,"size"=>"7")) !!}
                        <input type="button" value="Up" onclick="up()">
                        <input type="button" value="Down" onclick="down()">
                    </div>
                </div>
                <hr>
                <p class="text-red"><b>{{trans_choice('general.fee',2)}}:</b></p>
                @if(count($loan_fees)>0)
                    @foreach($loan_fees as $key)
                        <div class="form-group">
                            {!! Form::label('loan_fees_'.$key->id,$key->name,array('class'=>'col-sm-3 control-label')) !!}
                            <div class="col-md-3">
                                {!! Form::text('loan_fees_amount_'.$key->id,null, array('class' => 'form-control touchspin')) !!}
                            </div>
                            <div class="col-sm-5">
                                {!! Form::select('loan_fees_schedule_'.$key->id,array('distribute_fees_evenly'=>trans_choice('general.distribute_fees_evenly',1),'charge_fees_on_first_payment'=>trans_choice('general.charge_fees_on_first_payment',1),'charge_fees_on_last_payment'=>trans_choice('general.charge_fees_on_last_payment',1)),null, array('class' => 'form-control','required'=>'required',"id"=>"")) !!}
                            </div>
                        </div>
                    @endforeach
                @else

                @endif
                <hr>
                <p class="text-red"><b>{{trans_choice('general.grace_period',1)}}:</b></p>

                <div class="form-group">
                    {!! Form::label('grace_on_interest_charged',trans_choice('general.grace_on_interest',1),array('class'=>'col-sm-3 control-label')) !!}
                    <div class="col-sm-5">
                        {!! Form::number('grace_on_interest_charged',null, array('class' => 'form-control')) !!}
                    </div>

                </div>
                <hr>
                <p class="bg-navy color-palette">{{trans_choice('general.late_repayment_penalty',1)}}</p>

                <div class="form-group">
                    <div class="checkbox col-sm-10">
                        <label>
                            <input type="checkbox" name="enable_late_repayment_penalty"
                                   id="enable_late_repayment_penalty"
                                   value="0"
                                    >
                            <b>{{trans_choice('general.enable_late_repayment_penalty',1)}}</b>
                        </label>
                    </div>

                </div>
                <div class="form-group">
                    <div class="col-sm-offset-4 col-sm-6">
                        <div class="radio">
                            <label>
                                <input type="radio" name="late_repayment_penalty_type"
                                       id="late_repayment_penalty_type_percentage" value="percentage" checked=""> {{trans_choice('general.percentage_penalty',1)}}
                            </label>
                        </div>
                        <div class="radio">
                            <label>
                                <input type="radio" name="late_repayment_penalty_type"
                                       id="late_repayment_penalty_type_fixed" value="fixed"> {{trans_choice('general.fixed_penalty',1)}}
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="late_repayment_penalty_calculate" class="col-sm-4 control-label">{{trans_choice('general.calculate_penalty_on',1)}}</label>

                    <div class="col-sm-6">
                        {!! Form::select('late_repayment_penalty_calculate',array('overdue_principal'=>trans_choice('general.overdue_principal',1),'overdue_principal_interest'=>trans_choice('general.overdue_principal_interest',1),'overdue_principal_interest_fees'=>trans_choice('general.overdue_principal_interest_fees',1),'total_overdue'=>trans_choice('general.total_overdue',1)),null, array('class' => 'form-control', 'placeholder'=>"","id"=>"late_repayment_penalty_calculate")) !!}
                    </div>
                </div>
                <div class="form-group">
                    <label for="late_repayment_penalty_amount" id="late_repayment_penalty_amount_label"
                           class="col-sm-4 control-label">
                        {{trans_choice('general.penalty',1)}} {{trans_choice('general.amount',1)}}
                    </label>

                    <div class="col-sm-6">
                        {!! Form::text('late_repayment_penalty_amount',null, array('class' => 'form-control touchspin', 'id'=>"late_repayment_penalty_amount")) !!}
                    </div>
                </div>
                <div class="form-group">
                    <label for="late_repayment_penalty_grace_period" class="col-sm-4 control-label">({{trans_choice('general.optional',1)}}) {{trans_choice('general.grace_period',1)}}</label>

                    <div class="col-sm-6">
                        {!! Form::number('late_repayment_penalty_grace_period',null, array('class' => 'form-control', 'id'=>"late_repayment_penalty_grace_period","placeholder"=>"Enter number of days")) !!}
                    </div>
                </div>
                <div class="form-group">
                    <label for="late_repayment_penalty_recurring" class="col-sm-4 control-label">(optional) If penalty
                        on
                        Late Repayments is <u>recurring</u>, enter the number of days</label>

                    <div class="col-sm-6">
                        {!! Form::number('late_repayment_penalty_recurring',null, array('class' => 'form-control', 'id'=>"late_repayment_penalty_recurring","placeholder"=>"Enter number of days")) !!}
                    </div>
                </div>
                <hr>
                <p class="bg-navy color-palette">{{trans_choice('general.after_maturity_date_penalty',1)}}</p>

                <div class="form-group">
                    <div class="checkbox col-sm-10">
                        <label>
                            <input type="checkbox" name="enable_after_maturity_date_penalty"
                                   id="enable_after_maturity_date_penalty"
                                   value="0"
                                    >
                            <b>{{trans_choice('general.enable_after_maturity_date_penalty',1)}}</b>
                        </label>
                    </div>

                </div>
                <div class="form-group">
                    <div class="col-sm-offset-4 col-sm-6">
                        <div class="radio">
                            <label>
                                <input type="radio" name="after_maturity_date_penalty_type"
                                       id="after_maturity_date_penalty_type_percentage" value="percentage" checked=""> {{trans_choice('general.percentage_penalty',1)}}
                            </label>
                        </div>
                        <div class="radio">
                            <label>
                                <input type="radio" name="after_maturity_date_penalty_type"
                                       id="after_maturity_date_penalty_type_fixed" value="fixed"> {{trans_choice('general.fixed_penalty',1)}}
                            </label>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="late_repayment_penalty_calculate" class="col-sm-4 control-label">{{trans_choice('general.calculate_penalty_on',1)}}
                    </label>

                    <div class="col-sm-6">
                        {!! Form::select('after_maturity_date_penalty_calculate',array('overdue_principal'=>trans_choice('general.overdue_principal',1),'overdue_principal_interest'=>trans_choice('general.overdue_principal_interest',1),'overdue_principal_interest_fees'=>trans_choice('general.overdue_principal_interest_fees',1),'total_overdue'=>trans_choice('general.total_overdue',1)),null, array('class' => 'form-control', 'placeholder'=>"","id"=>"after_maturity_date_penalty_calculate")) !!}
                    </div>
                </div>
                <div class="form-group">
                    <label for="after_maturity_date_penalty_amount" id="after_maturity_date_penalty_amount_label"
                           class="col-sm-4 control-label">
                        {{trans_choice('general.penalty',1)}} {{trans_choice('general.amount',1)}}
                    </label>

                    <div class="col-sm-6">
                        {!! Form::text('after_maturity_date_penalty_amount',null, array('class' => 'form-control touchspin', 'id'=>"after_maturity_date_penalty_amount")) !!}
                    </div>
                </div>
                <div class="form-group">
                    <label for="after_maturity_date_penalty_grace_period" class="col-sm-4 control-label">(optional)
                        Grace
                        Period</label>

                    <div class="col-sm-6">
                        {!! Form::number('after_maturity_date_penalty_grace_period',null, array('class' => 'form-control', 'id'=>"after_maturity_date_penalty_grace_period","placeholder"=>"Enter number of days")) !!}
                    </div>
                </div>
                <div class="form-group">
                    <label for="after_maturity_date_penalty_recurring" class="col-sm-4 control-label">(optional) If
                        penalty on
                        Late Repayments is <u>recurring</u>, enter the number of days</label>

                    <div class="col-sm-6">
                        {!! Form::number('after_maturity_date_penalty_recurring',null, array('class' => 'form-control', 'id'=>"after_maturity_date_penalty_recurring","placeholder"=>"Enter number of days")) !!}
                    </div>
                </div>
            </div>

        </div>
        <!-- /.box-body -->
        <div class="box-footer">
            <button type="submit" class="btn btn-primary pull-left">{{trans_choice('general.save',1)}}</button>
        </div>
        {!! Form::close() !!}
    </div>
    <!-- /.box -->

@endsection
@section('footer-scripts')
    <script>
        $(document).ready(function () {
            if ($('#override_interest').val() == 0) {
                $('#overrideDiv').hide();
                $('#override_interest_amount').removeAttr('required');
            }
            if ($('#override_interest').val() == 1) {
                $('#overrideDiv').show();
                $('#override_interest_amount').attr('required', 'required');
            }
            $('#override_interest').change(function (e) {
                if ($('#override_interest').val() == 0) {
                    $('#overrideDiv').hide();
                    $('#override_interest_amount').removeAttr('required');
                }
                if ($('#override_interest').val() == 1) {
                    $('#overrideDiv').show();
                    $('#override_interest_amount').attr('required', 'required');
                }
            })
            if ($("#enable_late_repayment_penalty").iCheck('update')[0].checked == false) {
                $('#enable_late_repayment_penalty').val('0');
                $('#late_repayment_penalty_type_percentage').attr('disabled', 'disabled');
                $('#late_repayment_penalty_type_fixed').attr('disabled', 'disabled');
                $('#late_repayment_penalty_calculate').attr('disabled', 'disabled').removeAttr('required');
                $('#late_repayment_penalty_amount').attr('disabled', 'disabled');
                $('#late_repayment_penalty_grace_period').attr('disabled', 'disabled');
                $('#late_repayment_penalty_recurring').attr('disabled', 'disabled');
            } else {
                if ($("#late_repayment_penalty_type_percentage").iCheck('update')[0].checked) {
                    $('#late_repayment_penalty_calculate').removeAttr('disabled');
                    $('#late_repayment_penalty_amount_label').html('{{trans_choice('general.penalty',1)}} {{trans_choice('general.interest',1)}} {{trans_choice('general.rate',1)}} %');
                    $('#late_repayment_penalty_calculate').attr('required', 'required');
                }
                if ($("#late_repayment_penalty_type_fixed").iCheck('update')[0].checked) {
                    $('#late_repayment_penalty_calculate').attr('disabled', 'disabled').removeAttr('required');
                    $('#late_repayment_penalty_amount_label').html('{{trans_choice('general.penalty',1)}} {{trans_choice('general.amount',1)}}');
                }
            }
            $("#enable_late_repayment_penalty").on('ifUnchecked', function (e) {
                $('#enable_late_repayment_penalty').val('0');
                $('#late_repayment_penalty_type_percentage').attr('disabled', 'disabled');
                $('#late_repayment_penalty_type_fixed').attr('disabled', 'disabled');
                $('#late_repayment_penalty_calculate').attr('disabled', 'disabled').removeAttr('required');
                ;
                $('#late_repayment_penalty_amount').attr('disabled', 'disabled');
                $('#late_repayment_penalty_grace_period').attr('disabled', 'disabled');
                $('#late_repayment_penalty_recurring').attr('disabled', 'disabled');
            });
            $("#enable_late_repayment_penalty").on('ifChecked', function (e) {
                $('#enable_late_repayment_penalty').val('1');
                $('#late_repayment_penalty_type_percentage').removeAttr('disabled');
                $('#late_repayment_penalty_type_fixed').removeAttr('disabled');
                $('#late_repayment_penalty_calculate').removeAttr('disabled');
                $('#late_repayment_penalty_amount').removeAttr('disabled');
                $('#late_repayment_penalty_grace_period').removeAttr('disabled');
                $('#late_repayment_penalty_recurring').removeAttr('disabled');
                $('#late_repayment_penalty_amount').attr('required', 'required');
                if ($("#late_repayment_penalty_type_percentage").iCheck('update')[0].checked) {
                    $('#late_repayment_penalty_calculate').removeAttr('disabled');
                    $('#late_repayment_penalty_amount_label').html('{{trans_choice('general.penalty',1)}} {{trans_choice('general.interest',1)}} {{trans_choice('general.rate',1)}} %');
                    $('#late_repayment_penalty_calculate').attr('required', 'required');
                }
                if ($("#late_repayment_penalty_type_fixed").iCheck('update')[0].checked) {
                    $('#late_repayment_penalty_calculate').attr('disabled', 'disabled').removeAttr('required');
                    $('#late_repayment_penalty_amount_label').html('{{trans_choice('general.penalty',1)}} {{trans_choice('general.amount',1)}}');
                }

            });
            $("#late_repayment_penalty_type_percentage").on('ifUnchecked', function (e) {
                $('#late_repayment_penalty_calculate').attr('disabled', 'disabled').removeAttr('required');
                $('#late_repayment_penalty_amount_label').html('{{trans_choice('general.penalty',1)}} {{trans_choice('general.amount',1)}}');
            });
            $("#late_repayment_penalty_type_fixed").on('ifUnchecked', function (e) {
                $('#late_repayment_penalty_calculate').removeAttr('disabled', 'disabled').attr('required', 'required');
                $('#late_repayment_penalty_amount_label').html('{{trans_choice('general.penalty',1)}} {{trans_choice('general.interest',1)}} {{trans_choice('general.rate',1)}} %');
            });


            if ($("#enable_after_maturity_date_penalty").iCheck('update')[0].checked == false) {
                $('#enable_after_maturity_date_penalty').val('0');
                $('#after_maturity_date_penalty_type_percentage').attr('disabled', 'disabled');
                $('#after_maturity_date_penalty_type_fixed').attr('disabled', 'disabled');
                $('#after_maturity_date_penalty_calculate').attr('disabled', 'disabled').removeAttr('required');
                $('#after_maturity_date_penalty_amount').attr('disabled', 'disabled');
                $('#after_maturity_date_penalty_grace_period').attr('disabled', 'disabled');
                $('#after_maturity_date_penalty_recurring').attr('disabled', 'disabled');
            } else {
                if ($("#after_maturity_date_penalty_type_percentage").iCheck('update')[0].checked) {
                    $('#after_maturity_date_penalty_calculate').removeAttr('disabled');
                    $('#after_maturity_date_penalty_amount_label').html('{{trans_choice('general.penalty',1)}} {{trans_choice('general.interest',1)}} {{trans_choice('general.rate',1)}} %');
                    $('#after_maturity_date_penalty_calculate').attr('required', 'required');
                }
                if ($("#after_maturity_date_penalty_type_fixed").iCheck('update')[0].checked) {
                    $('#after_maturity_date_penalty_calculate').attr('disabled', 'disabled').removeAttr('required');
                    $('#after_maturity_date_penalty_amount_label').html('{{trans_choice('general.penalty',1)}} {{trans_choice('general.amount',1)}}');
                }
            }
            $("#enable_after_maturity_date_penalty").on('ifUnchecked', function (e) {
                $('#enable_after_maturity_date_penalty').val('0');
                $('#after_maturity_date_penalty_type_percentage').attr('disabled', 'disabled');
                $('#after_maturity_date_penalty_type_fixed').attr('disabled', 'disabled');
                $('#after_maturity_date_penalty_calculate').attr('disabled', 'disabled').removeAttr('required');
                $('#after_maturity_date_penalty_amount').attr('disabled', 'disabled');
                $('#after_maturity_date_penalty_grace_period').attr('disabled', 'disabled');
                $('#after_maturity_date_penalty_recurring').attr('disabled', 'disabled');
            });
            $("#enable_after_maturity_date_penalty").on('ifChecked', function (e) {
                $('#enable_after_maturity_date_penalty').val('1');
                $('#after_maturity_date_penalty_type_percentage').removeAttr('disabled');
                $('#after_maturity_date_penalty_type_fixed').removeAttr('disabled');
                $('#after_maturity_date_penalty_calculate').removeAttr('disabled');
                $('#after_maturity_date_penalty_amount').removeAttr('disabled');
                $('#after_maturity_date_penalty_grace_period').removeAttr('disabled');
                $('#after_maturity_date_penalty_recurring').removeAttr('disabled');
                $('#after_maturity_date_penalty_amount').attr('required', 'required');
                if ($("#after_maturity_date_penalty_type_percentage").iCheck('update')[0].checked) {
                    $('#after_maturity_date_penalty_calculate').removeAttr('disabled');
                    $('#after_maturity_date_penalty_amount_label').html('{{trans_choice('general.penalty',1)}} {{trans_choice('general.interest',1)}} {{trans_choice('general.rate',1)}} %');
                    $('#after_maturity_date_penalty_calculate').attr('required', 'required');
                }
                if ($("#after_maturity_date_penalty_type_fixed").iCheck('update')[0].checked) {
                    $('#after_maturity_date_penalty_calculate').attr('disabled', 'disabled').removeAttr('required');
                    $('#after_maturity_date_penalty_amount_label').html('{{trans_choice('general.penalty',1)}} {{trans_choice('general.amount',1)}}');
                }

            });
            $("#after_maturity_date_penalty_type_percentage").on('ifUnchecked', function (e) {
                $('#after_maturity_date_penalty_calculate').attr('disabled', 'disabled').removeAttr('required');
                $('#after_maturity_date_penalty_amount_label').html('{{trans_choice('general.penalty',1)}} {{trans_choice('general.amount',1)}}');
            });
            $("#after_maturity_date_penalty_type_fixed").on('ifUnchecked', function (e) {
                $('#after_maturity_date_penalty_calculate').removeAttr('disabled', 'disabled').attr('required', 'required');
                $('#after_maturity_date_penalty_amount_label').html('{{trans_choice('general.penalty',1)}} {{trans_choice('general.interest',1)}} {{trans_choice('general.rate',1)}} %');
            });

        });
    </script>
@endsection

@extends('layouts.master')
@section('title')
    {{trans_choice('general.reschedule',1)}} {{trans_choice('general.loan',1)}}
@endsection
@section('content')
    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title">{{trans_choice('general.reschedule',1)}} {{trans_choice('general.loan',1)}}</h3>

            <div class="box-tools pull-right">

            </div>
        </div>
        {!! Form::open(array('url' => url('loan/'.$loan->id.'/reschedule/store'), 'method' => 'post', 'class' => 'form-horizontal',"enctype"=>"multipart/form-data")) !!}
        <div class="box-body">
            <div class="form-group">
                {!! Form::label('loan_product_id',trans_choice('general.loan',1).' '.trans_choice('general.product',1),array('class'=>'col-sm-3 control-label')) !!}
                <div class="col-sm-5">
                    {!! Form::select('loan_product_id',$loan_products,$loan_product->id, array('class' => ' select2 form-control','required'=>'required','id'=>'loanProduct')) !!}
                </div>
            </div>

            <hr>
            <p class="bg-navy disabled color-palette">{{trans_choice('general.loan',1)}} {{trans_choice('general.term',2)}}
                ({{trans_choice('general.required',1)}} {{trans_choice('general.field',2)}}):</p>

            <p class="text-red"><b>{{trans_choice('general.principal',1)}} {{trans_choice('general.amount',1)}}:</b></p>


            <div class="form-group">
                {!! Form::label('principal',trans_choice('general.principal',1).' '.trans_choice('general.amount',1),array('class'=>'col-sm-3 control-label')) !!}
                <div class="col-sm-5">
                    {!! Form::text('principal',$principal, array('class' => 'form-control touchspin', 'placeholder'=>"",'required'=>'required')) !!}
                </div>
            </div>
            <hr>
            <p class="text-red"><b>{{trans_choice('general.duration',1)}}:</b></p>

            <div class="form-group">
                {!! Form::label('loan_duration',trans_choice('general.loan',1).' '.trans_choice('general.duration',1),array('class'=>'col-sm-3 control-label')) !!}
                <div class="col-sm-3">
                    {!! Form::number('loan_duration',$loan_product->default_loan_duration, array('class' => 'form-control', 'placeholder'=>"5",'required'=>'required','id'=>'loan_duration')) !!}
                </div>
                <div class="col-sm-3">
                    {!! Form::select('loan_duration_type',array('day'=>trans_choice('general.day',1).'(s)','week'=>trans_choice('general.week',1).'(s)','month'=>trans_choice('general.month',1).'(s)','year'=>trans_choice('general.year',1).'(s)'),$loan_product->default_loan_duration_type, array('class' => 'form-control',"id"=>"loan_duration_type",'required'=>'required')) !!}
                </div>
                <div class="col-sm-3">
                </div>
            </div>
            <hr>
            <p class="text-red"><b>{{trans_choice('general.repayment',2)}}:</b></p>

            <div class="form-group">
                {!! Form::label('repayment_cycle',trans_choice('general.repayment_cycle',1),array('class'=>'col-sm-3 control-label')) !!}
                <div class="col-sm-5">
                    {!! Form::select('repayment_cycle',array('daily'=>trans_choice('general.daily',1),'weekly'=>trans_choice('general.weekly',1),'monthly'=>trans_choice('general.monthly',1),'bi_monthly'=>trans_choice('general.bi_monthly',1),'quarterly'=>trans_choice('general.quarterly',1),'semi_annual'=>trans_choice('general.semi_annually',1),'annual'=>trans_choice('general.annual',1)),$loan_product->repayment_cycle, array('class' => 'form-control',"id"=>"repayment_cycle",'required'=>'required')) !!}
                </div>
            </div>
            <hr>
            <div class="form-group">
                {!! Form::label('release_date',trans_choice('general.release',1).' '.trans_choice('general.date',1),array('class'=>'col-sm-3 control-label')) !!}
                <div class="col-sm-5">
                    {!! Form::text('release_date',date("Y-m-d"), array('class' => 'form-control date-picker', 'placeholder'=>"yyyy-mm-dd",'required'=>'required','id'=>'release_date')) !!}
                </div>
            </div>
            <p>{{trans_choice('general.first_payment_date_optional',1)}}</p>
            <div class="form-group">
                {!! Form::label('first_payment_date',trans_choice('general.first',1).' '.trans_choice('general.repayment',1).' '.trans_choice('general.date',1),array('class'=>'col-sm-3 control-label')) !!}
                <div class="col-sm-5">
                    {!! Form::text('first_payment_date',null, array('class' => 'form-control date-picker', 'placeholder'=>"yyyy-mm-dd",''=>'','id'=>'first_payment_date')) !!}
                </div>
            </div>
            <hr>
            <p class="text-red"><b>{{trans_choice('general.interest',1)}}:</b></p>

            <div class="form-group">
                {!! Form::label('interest_method',trans_choice('general.interest',1).' '.trans_choice('general.method',1),array('class'=>'col-sm-3 control-label')) !!}
                <div class="col-sm-5">
                    {!! Form::select('interest_method',array('flat_rate'=>trans_choice('general.flat_rate',1),'declining_balance_equal_installments'=>trans_choice('general.declining_balance_equal_installments',1),'declining_balance_equal_principal'=>trans_choice('general.declining_balance_equal_principal',1),'interest_only'=>trans_choice('general.interest_only',1)),$loan_product->interest_method, array('class' => 'form-control','required'=>'required')) !!}
                </div>
            </div>
            <div class="form-group">
                {!! Form::label('interest_rate',trans_choice('general.loan',1).' '.trans_choice('general.interest',1).' %',array('class'=>'col-sm-3 control-label')) !!}
                <div class="col-sm-2">
                    {!! Form::text('interest_rate',$loan_product->default_interest_rate, array('class' => 'form-control touchspin', 'placeholder'=>"",'required'=>'required')) !!}
                </div>
                <div class="col-sm-3">
                    {!! Form::select('interest_period',array('day'=>trans_choice('general.per_day',1),'week'=>trans_choice('general.per_week',1),'month'=>trans_choice('general.per_month',1),'year'=>trans_choice('general.per_year',1)),$loan_product->interest_period, array('class' => 'form-control', "id"=>"inputDefaultInterestPeriod",'required'=>'required')) !!}
                </div>
            </div>
            <p>{{trans_choice('general.override_msg',1)}}</p>

            <div class="form-group">
                {!! Form::label('override_interest',trans_choice('general.override',1).' '.trans_choice('general.interest',1),array('class'=>'col-sm-3 control-label')) !!}
                <div class="col-sm-5">
                    {!! Form::select('override_interest',array('0'=>trans_choice('general.no',1),'1'=>trans_choice('general.yes',1)),0, array('class' => 'form-control','id'=>'override_interest')) !!}
                </div>
            </div>

            <div class="form-group" id="overrideDiv">
                {!! Form::label('override_interest_amount',trans_choice('general.override',1).' '.trans_choice('general.interest',1).' %',array('class'=>'col-sm-3 control-label')) !!}
                <div class="col-sm-5">
                    {!! Form::text('override_interest_amount',null, array('class' => 'form-control touchspin','id'=>'override_interest_amount')) !!}
                </div>

            </div>

            <div class="form-group">
                {!! Form::label('grace_on_interest_charged',trans_choice('general.grace_on_interest',1),array('class'=>'col-sm-3 control-label')) !!}
                <div class="col-sm-5">
                    {!! Form::number('grace_on_interest_charged',$loan_product->grace_on_interest_charged, array('class' => 'form-control', 'placeholder'=>"2")) !!}
                </div>

            </div>
            <hr>

            <p class="text-red"><b>{{trans_choice('general.loan_due_heading',1)}}:</b></p>

            <p>{{trans_choice('general.loan_decimal_msg',1)}}</p>

            <div class="form-group">
                {!! Form::label('decimal_places',trans_choice('general.decimal_place',1),array('class'=>'col-sm-3 control-label')) !!}
                <div class="col-sm-5">
                    {!! Form::select('decimal_places',array('round_off_to_two_decimal'=>trans_choice('general.round_off_to_two_decimal',1),'round_off_to_integer'=>trans_choice('general.round_off_to_integer',1)),$loan_product->decimal_places, array('class' => 'form-control',"id"=>"",'required'=>'required')) !!}
                </div>
            </div>
            <hr>
            <p class="text-red"><b>{{trans_choice('general.fee',2)}}:</b></p>

            @if(count($loan_fees)>0)
                @foreach($loan_fees as $key)
                    <div class="form-group">
                        {!! Form::label('loan_fees_'.$key->id,$key->name,array('class'=>'col-sm-3 control-label')) !!}
                        <div class="col-md-3">
                            <input type="text" class="form-control touchspin" name="loan_fees_amount_{{$key->id}}"
                                   value="@if(!empty(\App\Models\LoanFeeMeta::where('loan_fees_id',$key->id)->where('parent_id',$loan_product->id)->where('category','loan_product')->first())) {{\App\Models\LoanFeeMeta::where('loan_fees_id',$key->id)->where('parent_id',$loan_product->id)->where('category','loan_product')->first()->value}} @endif">
                        </div>
                        <div class="col-sm-5">
                            @if(!empty(\App\Models\LoanFeeMeta::where('loan_fees_id',$key->id)->where('parent_id',$loan_product->id)->where('category','loan_product')->first()))
                                <?php $loan_fees_schedule = \App\Models\LoanFeeMeta::where('loan_fees_id',
                                    $key->id)->where('parent_id', $loan_product->id)->where('category',
                                    'loan_product')->first()->loan_fees_schedule;
                                ?>
                            @else
                                <?php $loan_fees_schedule = ''; ?>
                            @endif
                            {!! Form::select('loan_fees_schedule_'.$key->id,array('distribute_fees_evenly'=>trans_choice('general.distribute_fees_evenly',1),'charge_fees_on_first_payment'=>trans_choice('general.charge_fees_on_first_payment',1),'charge_fees_on_last_payment'=>trans_choice('general.charge_fees_on_last_payment',1)),$loan_fees_schedule, array('class' => 'form-control','required'=>'required',"id"=>"")) !!}
                        </div>
                    </div>
                @endforeach
            @else

            @endif
            <hr>

            <p class="bg-navy disabled color-palette">{{trans_choice('general.other',2)}}
                ({{trans_choice('general.optional',2)}}):</p>

            <div class="form-group">
                {!! Form::label('description',trans_choice('general.description',2),array('class'=>'col-sm-3 control-label')) !!}
                <div class="col-sm-9">
                    {!! Form::textarea('description',null, array('class' => 'form-control', 'rows'=>"3")) !!}
                </div>

            </div>
            <div class="form-group">
                {!! Form::label('files',trans_choice('general.loan',1).' '.trans_choice('general.file',2).'('.trans_choice('general.borrower_file_types',2).')',array('class'=>'col-sm-3 control-label')) !!}
                <div class="col-sm-5">
                    {!! Form::file('files[]', array('class' => 'form-control', 'multiple'=>"multiple")) !!}
                </div>
                <div class="col-sm-9">{{trans_choice('general.select_thirty_files',2)}}
                </div>
            </div>
            <p class="bg-navy disabled color-palette">{{trans_choice('general.custom_field',2)}}</p>
            @foreach($custom_fields as $key)

                <div class="form-group">
                    {!! Form::label($key->id,$key->name,array('class'=>'control-label col-sm-3')) !!}
                    <div class="col-sm-5">
                        @if($key->field_type=="number")
                            <input type="number" class="form-control" name="{{$key->id}}"
                                   @if($key->required==1) required @endif>
                        @endif
                        @if($key->field_type=="textfield")
                            <input type="text" class="form-control" name="{{$key->id}}"
                                   @if($key->required==1) required @endif>
                        @endif
                        @if($key->field_type=="date")
                            <input type="text" class="form-control date-picker" name="{{$key->id}}"
                                   @if($key->required==1) required @endif>
                        @endif
                        @if($key->field_type=="textarea")
                            <textarea class="form-control" name="{{$key->id}}"
                                      @if($key->required==1) required @endif></textarea>
                        @endif
                        @if($key->field_type=="decimal")
                            <input type="text" class="form-control touchspin" name="{{$key->id}}"
                                   @if($key->required==1) required @endif>
                        @endif
                    </div>
                </div>
            @endforeach
            <p style="text-align:center; font-weight:bold;">
                <small><a href="{{url('custom_field/create')}}" target="_blank">Click here to add custom fields on this
                        page</a></small>
            </p>

        </div>
        <!-- /.box-body -->
        <div class="box-footer">
            <button type="submit" class="btn btn-primary pull-right">{{trans_choice('general.save',1)}}</button>
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
            $('#loanProduct').change(function (e) {
                window.location = "{!! Request::fullUrl() !!}&product_id=" + $("#loanProduct").val();
            })
            /*$('#release_date').focusout(function(e){
             var releaseDate=$('#release_date').val();
             var duration=$('#loan_duration').val();
             var durationType=$('#loan_duration_type').val();
             var repaymentCycle=$('#repayment_cycle').val();
             var repaymentDate=moment(releaseDate, 'YYYY-MM-DD');
             if(repaymentCycle=='daily'){

             repaymentDate.add(1, 'days').format('YYYY-MM-DD');
             alert(repaymentDate);
             $('#first_payment_date').val(repaymentDate);

             }
             })*/
        });
    </script>
@endsection

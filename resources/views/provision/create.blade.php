@extends('layouts.master')
@section('title')
    {{trans_choice('general.add',1)}} {{trans_choice('general.loan',1)}} {{trans_choice('general.fee',1)}}
@endsection
@section('content')
    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title">{{trans_choice('general.add',1)}} {{trans_choice('general.loan',1)}} {{trans_choice('general.fee',1)}}</h3>

            <div class="box-tools pull-right">

            </div>
        </div>
        {!! Form::open(array('url' => url('loan/loan_fee/store'), 'method' => 'post', 'class' => 'form-horizontal')) !!}
        <div class="box-body">
            <div class="form-group">
                {!! Form::label('name',trans_choice('general.name',1),array('class'=>'col-sm-2 control-label')) !!}
                <div class="col-sm-10">
                    {!! Form::text('name',null, array('class' => 'form-control', 'placeholder'=>"",'required'=>'required')) !!}
                </div>
            </div>
            <hr>
            <div class="callout callout-info">
                <p>{{trans_choice('general.fee_msg',1)}}</p>
            </div>
            <div class="form-group">
                <label for="inputName" class="col-sm-2 control-label">{{trans_choice('general.fee_calculation',1)}}</label>

                <div class="col-sm-5">
                    <div class="radio">
                        <label>
                            <input type="radio" name="loan_fee_type" id="inputFeeAmountFixed" value="fixed" checked="">
                            {{trans_choice('general.fee_fixed',1)}}

                        </label>
                    </div>
                    <div class="radio">
                        <label>
                            <input type="radio" name="loan_fee_type" id="inputFeeAmountPercentage" value="percentage"> I
                            {{trans_choice('general.fee_percentage',1)}}
                        </label>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.box-body -->
        <div class="box-footer">
            <button type="submit" class="btn btn-primary pull-right"> {{trans_choice('general.save',1)}}</button>
        </div>
        {!! Form::close() !!}
    </div>
    <!-- /.box -->
@endsection


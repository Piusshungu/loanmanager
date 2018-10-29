@extends('layouts.master')
@section('title'){{trans_choice('general.send',1)}} {{trans_choice('general.sms',1)}}
@endsection
@section('content')
    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title">{{trans_choice('general.send',1)}} {{trans_choice('general.sms',1)}}</h3>

            <div class="box-tools pull-right">

            </div>
        </div>
        {!! Form::open(array('url' => url('communication/sms/store'), 'method' => 'post', 'class' => 'form-horizontal')) !!}
        <div class="box-body">
            <p>In your sms you can use any of the following tags:
                {borrowerTitle}, {borrowerFirstName}, {borrowerLastName}, {borrowerAddress}, {borrowerMobile},
                {borrowerEmail}, {borrowerTotalLoansDue}, {borrowerTotalLoansBalance},
                {borrowerTotalLoansPaid}</p>
            <p><b>N.B. SMS cannot exceed 480 characters. 1 sms is 160 characters. Please keep your message in that length</b></p>

            <div class="form-group">
                {!! Form::label('send_to',trans_choice('general.to',1),array('class'=>'col-sm-2 control-label')) !!}
                <div class="col-sm-10">
                    {!! Form::select('send_to',$borrowers, $selected,array('class' => 'form-control select2', 'required'=>"")) !!}
                </div>
            </div>
            <div class="form-group">
                {!! Form::label('message',trans_choice('general.message',1),array('class'=>'col-sm-2 control-label')) !!}
                <div class="col-sm-10">
                    {!! Form::textarea('message',null, array('class' => 'form-control', 'placeholder'=>"")) !!}
                </div>
            </div>
        </div>
        <!-- /.box-body -->
        <div class="box-footer">
            <button type="submit" class="btn btn-primary pull-right">{{trans_choice('general.save',1)}}</button>
        </div>
        {!! Form::close() !!}
    </div>
    <!-- /.box -->
@endsection


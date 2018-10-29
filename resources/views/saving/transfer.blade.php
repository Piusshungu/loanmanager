@extends('layouts.master')
@section('title')
    {{trans_choice('general.add',1)}} {{trans_choice('general.saving',2)}} {{trans_choice('general.transaction',1)}}
@endsection
@section('content')
    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title">{{trans_choice('general.add',1)}} {{trans_choice('general.saving',2)}} {{trans_choice('general.transaction',1)}}</h3>

            <div class="box-tools pull-right">

            </div>
        </div>
        {!! Form::open(array('url' => url('saving/'.$saving->id.'/transfer/store'), 'method' => 'post', 'name' => 'form',"enctype"=>"multipart/form-data")) !!}
        <div class="box-body">
            <div class="col-md-12">
                <div class="callout callout-warning">
                    {{trans_choice('general.transfer_warning',1)}}
                </div>
                <div class="form-group">
                    {!! Form::label('loan_id',trans_choice('general.loan',1),array('class'=>'')) !!}
                    {!! Form::select('loan_id',$loans,null, array('class' => 'form-control select2', 'placeholder'=>'','required'=>'')) !!}
                </div>
                <div class="form-group">
                    {!! Form::label('amount',trans_choice('general.amount',1),array('class'=>'')) !!}
                    {!! Form::text('amount',null, array('class' => 'form-control touchspin', 'placeholder'=>'','required'=>'')) !!}
                </div>
                <div class="form-group">
                    {!! Form::label('date',trans_choice('general.date',2),array('class'=>'')) !!}
                    {!! Form::text('date',date("Y-m-d"), array('class' => 'form-control date-picker', 'placeholder'=>'','required'=>'')) !!}
                </div>
                <div class="form-group">
                    {!! Form::label('time',trans_choice('general.time',2),array('class'=>'')) !!}
                    {!! Form::text('time',date("H:i"), array('class' => 'form-control time-picker', 'placeholder'=>'','required'=>'')) !!}
                </div>

                <div class="form-group">
                    {!! Form::label('notes',trans_choice('general.note',2),array('class'=>'')) !!}
                    {!! Form::textarea('notes',null, array('class' => 'form-control', 'placeholder'=>'',)) !!}
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


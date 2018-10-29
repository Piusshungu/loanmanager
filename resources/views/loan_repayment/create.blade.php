@extends('layouts.master')
@section('title'){{trans_choice('general.add',1)}} {{trans_choice('general.repayment',1)}}
@endsection
@section('content')
    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title">{{trans_choice('general.add',1)}} {{trans_choice('general.repayment',1)}}</h3>

            <div class="box-tools pull-right">

            </div>
        </div>
        {!! Form::open(array('url' => url('loan/'.$loan->id.'/repayment/store'), 'method' => 'post', 'class' => 'form-horizontal')) !!}
        <div class="box-body">
            <p class="bg-navy disabled color-palette">{{trans_choice('general.required',1)}} {{trans_choice('general.field',2)}}</p>

            <div class="form-group">
                {!! Form::label('amount',trans_choice('general.repayment',1).' '.trans_choice('general.amount',1),array('class'=>'col-sm-3 control-label')) !!}
                <div class="col-sm-5">
                    {!! Form::text('amount',null, array('class' => 'form-control touchspin', 'placeholder'=>"Number or decimal only",'required'=>'required')) !!}
                </div>
            </div>
            <div class="form-group">
                {!! Form::label('repayment_method_id',trans_choice('general.repayment',1).' '.trans_choice('general.method',1),array('class'=>'col-sm-3 control-label')) !!}
                <div class="col-sm-5">
                    {!! Form::select('repayment_method_id',$repayment_methods,null, array('class' => ' form-control','required'=>'required','id'=>'loanProduct')) !!}
                </div>
            </div>
            <div class="form-group">
                {!! Form::label('collection_date',trans_choice('general.collection',1).' '.trans_choice('general.date',1),array('class'=>'col-sm-3 control-label')) !!}
                <div class="col-sm-5">
                    {!! Form::text('collection_date',date("Y-m-d"), array('class' => 'form-control date-picker', 'placeholder'=>"",'required'=>'required')) !!}
                </div>
            </div>
            <div class="form-group">
                {!! Form::label('apply_penalty',trans_choice('general.auto_penalty_message',1),array('class'=>'col-sm-3 control-label')) !!}
                <div class="col-sm-5">
                    {!! Form::select('apply_penalty',array('0'=>trans_choice('general.no',1),'1'=>trans_choice('general.yes',1)),0, array('class' => ' form-control','required'=>'required')) !!}
                </div>
            </div>
            <div class="form-group">
                {!! Form::label('notify_borrower',trans_choice('general.notify_borrower',1),array('class'=>'col-sm-3 control-label')) !!}
                <div class="col-sm-5">
                    {!! Form::select('notify_borrower',array('0'=>'No','1'=>'Yes'),\App\Models\Setting::where('setting_key','auto_payment_receipt_email')->first()->setting_value, array('class' => ' form-control','required'=>'required')) !!}
                </div>
            </div>
            <div class="form-group">
                {!! Form::label('notify_method',trans_choice('general.notify_method',1),array('class'=>'col-sm-3 control-label')) !!}
                <div class="col-sm-5">
                    {!! Form::select('notify_method',array('both'=>trans_choice('general.both',1),'sms'=>trans_choice('general.sms',1),'email'=>trans_choice('general.email',1)),'email', array('class' => ' form-control','required'=>'required')) !!}
                </div>
            </div>
            <p class="bg-navy disabled color-palette">{{trans_choice('general.optional',1)}} {{trans_choice('general.field',2)}}</p>

            <div class="form-group">
                {!! Form::label('notes',trans_choice('general.description',1),array('class'=>'col-sm-3 control-label')) !!}
                <div class="col-sm-9">
                    {!! Form::textarea('notes',null, array('class' => 'form-control', 'rows'=>"4")) !!}
                </div>
            </div>
            <p class="bg-navy disabled color-palette">{{trans_choice('general.custom_field',2)}}</p>
            @foreach($custom_fields as $key)

                <div class="form-group">
                    {!! Form::label($key->id,$key->name,array('class'=>'')) !!}
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


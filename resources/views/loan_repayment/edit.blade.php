@extends('layouts.master')
@section('title'){{trans_choice('general.edit',1)}} {{trans_choice('general.repayment',1)}}
@endsection
@section('content')
<div class="box">
    <div class="box-header with-border">
        <h3 class="box-title">{{trans_choice('general.edit',1)}} {{trans_choice('general.repayment',1)}}</h3>

        <div class="box-tools pull-right">

        </div>
    </div>
    {!! Form::open(array('url' => url('loan/'.$loan->id.'/repayment/'.$repayment->id.'/update'), 'method' => 'post', 'class' => 'form-horizontal')) !!}
    <div class="box-body">
        <p class="bg-navy disabled color-palette">{{trans_choice('general.required',1)}} {{trans_choice('general.field',2)}}</p>

        <div class="form-group">
            {!! Form::label('amount',trans_choice('general.repayment',1).' '.trans_choice('general.amount',1),array('class'=>'col-sm-3 control-label')) !!}
            <div class="col-sm-5">
                {!! Form::text('amount',$repayment->amount, array('class' => 'form-control touchspin', 'placeholder'=>"Number or decimal only",'required'=>'required')) !!}
            </div>
        </div>
        <div class="form-group">
            {!! Form::label('repayment_method_id',trans_choice('general.repayment',1).' '.trans_choice('general.method',1),array('class'=>'col-sm-3 control-label')) !!}
            <div class="col-sm-5">
                {!! Form::select('repayment_method_id',$repayment_methods,$repayment->repayment_method_id, array('class' => ' form-control','required'=>'required','id'=>'loanProduct')) !!}
            </div>
        </div>
        <div class="form-group">
            {!! Form::label('collection_date',trans_choice('general.collection',1).' '.trans_choice('general.date',1),array('class'=>'col-sm-3 control-label')) !!}
            <div class="col-sm-5">
                {!! Form::text('collection_date',$repayment->collection_date, array('class' => 'form-control date-picker', 'placeholder'=>"",'required'=>'required')) !!}
            </div>
        </div>
        <p class="bg-navy disabled color-palette">{{trans_choice('general.optional',1)}} {{trans_choice('general.field',2)}}</p>

        <div class="form-group">
            {!! Form::label('notes',trans_choice('general.description',1),array('class'=>'col-sm-3 control-label')) !!}
            <div class="col-sm-9">
                {!! Form::textarea('notes',$repayment->notes, array('class' => 'form-control', 'rows'=>"4")) !!}
            </div>
        </div>
        <p class="bg-navy disabled color-palette">{{trans_choice('general.custom_field',2)}}</p>
        @foreach($custom_fields as $key)

            <div class="form-group">
                {!! Form::label($key->id,$key->name,array('class'=>'')) !!}
                @if($key->field_type=="number")
                    <input type="number" class="form-control" name="{{$key->id}}"
                           @if($key->required==1) required
                           @endif value="@if(!empty(\App\Models\CustomFieldMeta::where('custom_field_id',$key->id)->where('parent_id',$repayment->id)->where('category','repayments')->first())){{\App\Models\CustomFieldMeta::where('custom_field_id',$key->id)->where('parent_id',$repayment->id)->where('category','repayments')->first()->name}} @endif">
                @endif
                @if($key->field_type=="textfield")
                    <input type="text" class="form-control" name="{{$key->id}}"
                           @if($key->required==1) required
                           @endif value="@if(!empty(\App\Models\CustomFieldMeta::where('custom_field_id',$key->id)->where('parent_id',$repayment->id)->where('category','repayments')->first())){{\App\Models\CustomFieldMeta::where('custom_field_id',$key->id)->where('parent_id',$repayment->id)->where('category','repayments')->first()->name}} @endif">
                @endif
                @if($key->field_type=="date")
                    <input type="text" class="form-control date-picker" name="{{$key->id}}"
                           @if($key->required==1) required
                           @endif value="@if(!empty(\App\Models\CustomFieldMeta::where('custom_field_id',$key->id)->where('parent_id',$repayment->id)->where('category','repayments')->first())){{\App\Models\CustomFieldMeta::where('custom_field_id',$key->id)->where('parent_id',$repayment->id)->where('category','repayments')->first()->name}} @endif">
                @endif
                @if($key->field_type=="textarea")
                    <textarea class="form-control" name="{{$key->id}}"
                              @if($key->required==1) required @endif>@if(!empty(\App\Models\CustomFieldMeta::where('custom_field_id',$key->id)->where('parent_id',$repayment->id)->where('category','repayments')->first())){{\App\Models\CustomFieldMeta::where('custom_field_id',$key->id)->where('parent_id',$repayment->id)->where('category','repayments')->first()->name}} @endif</textarea>
                @endif
                @if($key->field_type=="decimal")
                    <input type="text" class="form-control touchspin" name="{{$key->id}}"
                           @if($key->required==1) required
                           @endif value="@if(!empty(\App\Models\CustomFieldMeta::where('custom_field_id',$key->id)->where('parent_id',$repayment->id)->where('category','repayments')->first())){{\App\Models\CustomFieldMeta::where('custom_field_id',$key->id)->where('parent_id',$repayment->id)->where('category','repayments')->first()->name}} @endif">
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
        <button type="submit" class="btn btn-primary pull-left">{{trans_choice('general.save',1)}}</button>
    </div>
    {!! Form::close() !!}
</div>
<!-- /.box -->
@endsection


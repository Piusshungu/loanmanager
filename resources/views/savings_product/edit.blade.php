@extends('layouts.master')
@section('title')
    {{trans_choice('general.edit',1)}} {{trans_choice('general.saving',2)}} {{trans_choice('general.product',1)}}
@endsection
@section('content')
    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title">{{trans_choice('general.edit',1)}} {{trans_choice('general.saving',2)}} {{trans_choice('general.product',1)}}</h3>

            <div class="box-tools pull-right">

            </div>
        </div>
        {!! Form::open(array('url' => url('saving/savings_product/'.$savings_product->id.'/update'), 'method' => 'post', 'name' => 'form',"enctype"=>"multipart/form-data")) !!}
        <div class="box-body">
            <div class="col-md-12">
                <div class="form-group">
                    {!! Form::label('name',trans_choice('general.name',1),array('class'=>'')) !!}
                    {!! Form::text('name',$savings_product->name, array('class' => 'form-control','required'=>'required')) !!}
                </div>
                <div class="form-group">
                    {!! Form::label('interest_rate',trans_choice('general.interest_rate_per_annum',1),array('class'=>'')) !!}
                    {!! Form::text('interest_rate',$savings_product->interest_rate, array('class' => 'form-control touchspin', 'placeholder'=>'','required'=>'required')) !!}
                </div>
                <div class="form-group">
                    {!! Form::label('allow_overdraw',trans_choice('general.allow_saving_overdraw',1),array('class'=>'')) !!}
                    {!! Form::select('allow_overdraw',array('0'=>trans_choice('general.no',1),'1'=>trans_choice('general.yes',1)),$savings_product->allow_overdraw, array('class' => 'form-control','required'=>'required')) !!}
                </div>
                <div class="callout callout-info">
                    <p>{{trans_choice('general.allow_saving_overdraw_yes',1)}}</p>
                </div>
                <div class="form-group">
                    {!! Form::label('interest_posting',trans_choice('general.interest_posting_frequency_on_savings_accounts',1),array('class'=>'')) !!}
                    {!! Form::select('interest_posting',$interest_posting,$savings_product->interest_posting, array('class' => 'form-control','required'=>'')) !!}
                </div>
                <div class="form-group">
                    {!! Form::label('interest_adding',trans_choice('general.interest_adding',1),array('class'=>'')) !!}
                    {!! Form::select('interest_adding',$interest_adding,$savings_product->interest_adding, array('class' => 'form-control','required'=>'','placeholder'=>'')) !!}
                </div>
                <div class="form-group">
                    {!! Form::label('minimum_balance',trans_choice('general.minimum',1).' '.trans_choice('general.balance',1),array('class'=>'')) !!}
                    {!! Form::number('minimum_balance',$savings_product->minimum_balance, array('class' => 'form-control', 'placeholder'=>trans_choice('general.numbers_only',1),'required'=>'')) !!}
                </div>
                <div class="callout callout-info">
                    <p>{{trans_choice('general.minimum_balance_msg',1)}}</p>
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


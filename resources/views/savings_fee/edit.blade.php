@extends('layouts.master')
@section('title')
    {{trans_choice('general.edit',1)}} {{trans_choice('general.saving',2)}} {{trans_choice('general.fee',1)}}
@endsection
@section('content')
    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title">{{trans_choice('general.edit',1)}} {{trans_choice('general.saving',2)}} {{trans_choice('general.fee',1)}}</h3>

            <div class="box-tools pull-right">

            </div>
        </div>
        {!! Form::open(array('url' => url('saving/savings_fee/'.$savings_fee->id.'/update'), 'method' => 'post', 'name' => 'form',"enctype"=>"multipart/form-data")) !!}
        <div class="box-body">
            <div class="col-md-12">
                <div class="form-group">
                    {!! Form::label('name',trans_choice('general.name',1),array('class'=>'')) !!}
                    {!! Form::text('name',$savings_fee->name, array('class' => 'form-control','required'=>'required')) !!}
                </div>
                <div class="form-group">
                    {!! Form::label('amount',trans_choice('general.amount',1),array('class'=>'')) !!}
                    {!! Form::text('amount',$savings_fee->amount, array('class' => 'form-control touchspin', 'placeholder'=>'','required'=>'required')) !!}
                </div>
                <div class="form-group">
                    {!! Form::label('fees_posting',trans_choice('general.fee_posting_frequency_on_savings_accounts',1),array('class'=>'')) !!}
                    {!! Form::select('fees_posting',$interest_posting,$savings_fee->fees_posting, array('class' => 'form-control','required'=>'')) !!}
                </div>
                <div class="form-group">
                    {!! Form::label('fees_adding',trans_choice('general.fees_adding',1),array('class'=>'')) !!}
                    {!! Form::select('fees_adding',$interest_adding,$savings_fee->fees_adding, array('class' => 'form-control','required'=>'','placeholder'=>'')) !!}
                </div>
                <div class="form-group">
                    {!! Form::label('amount',trans_choice('general.minimum',1).' '.trans_choice('general.balance',1),array('class'=>'')) !!}
                    {!! Form::number('amount',$savings_fee->amount, array('class' => 'form-control', 'placeholder'=>trans_choice('general.numbers_only',1),'required'=>'')) !!}
                </div>
                <div class="form-group">
                    <div class="row">
                        <label for="inputDisbursedById"
                               class="col-sm-6 control-label">{{trans_choice('general.fee_saving_product',1)}}</label>

                        <div class="col-sm-3">
                            @foreach($savings_products as $key)
                                <label> <input class="inputDisbursedById" type="checkbox" name="savings_products[]"
                                               value="{{$key->id}}"  @if(in_array($key->id,unserialize($savings_fee->savings_products))) checked @endif> {{$key->name}}</label>
                                <br>
                            @endforeach
                        </div>
                    </div>
                </div>

                <div class="callout callout-danger ">
                    <p>{{trans_choice('general.fee_product_warning',1)}}</p>
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


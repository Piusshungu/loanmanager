@extends('layouts.master')
@section('title')
    {{trans_choice('general.edit',1)}} {{trans_choice('general.saving',2)}} {{trans_choice('general.account',1)}}
@endsection
@section('content')
    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title">{{trans_choice('general.edit',1)}} {{trans_choice('general.saving',2)}} {{trans_choice('general.account',1)}}</h3>

            <div class="box-tools pull-right">

            </div>
        </div>
        {!! Form::open(array('url' => url('saving/'.$saving->id.'/update'), 'method' => 'post', 'name' => 'form',"enctype"=>"multipart/form-data")) !!}
        <div class="box-body">
            <div class="col-md-12">
                <div class="form-group">
                    {!! Form::label('borrower_id',trans_choice('general.borrower',1),array('class'=>'')) !!}
                    {!! Form::select('borrower_id',$borrowers,$saving->borrower_id, array('class' => 'form-control select2','required'=>'required','placeholder'=>'')) !!}
                </div>
                <div class="form-group">
                    {!! Form::label('savings_product_id',trans_choice('general.product',1),array('class'=>'')) !!}
                    {!! Form::select('savings_product_id',$savings_products,$saving->savings_product_id, array('class' => 'form-control','required'=>'')) !!}
                </div>

                <div class="form-group">
                    {!! Form::label('notes',trans_choice('general.note',2),array('class'=>'')) !!}
                    {!! Form::textarea('notes',$saving->notes, array('class' => 'form-control', 'placeholder'=>'',)) !!}
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


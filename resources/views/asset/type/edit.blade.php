@extends('layouts.master')
@section('title')
    {{trans_choice('general.edit',1)}} {{trans_choice('general.asset',1)}} {{trans_choice('general.type',1)}}
@endsection
@section('content')
    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title">{{trans_choice('general.edit',1)}} {{trans_choice('general.expense',1)}} {{trans_choice('general.type',1)}}</h3>

            <div class="box-tools pull-right">

            </div>
        </div>
        {!! Form::open(array('url' => url('asset/type/'.$asset_type->id.'/update'), 'method' => 'post', 'class' => 'form-horizontal')) !!}
        <div class="box-body">
            <div class="form-group">
                {!! Form::label('name',trans_choice('general.name',1),array('class'=>'col-sm-2 control-label')) !!}
                <div class="col-sm-10">
                    {!! Form::text('name',$asset_type->name, array('class' => 'form-control', 'placeholder'=>"",'required'=>'required')) !!}
                </div>
            </div>
            <div class="form-group">
                {!! Form::label('type',trans_choice('general.category',1),array('class'=>'col-sm-2 control-label')) !!}
                <div class="col-sm-10">
                    {!! Form::select('type',array('current'=>trans_choice('general.current',1).' '.trans_choice('general.asset',1),'fixed'=>trans_choice('general.fixed',1).' '.trans_choice('general.asset',1),'intangible'=>trans_choice('general.intangible',1).' '.trans_choice('general.asset',1),'investment'=>trans_choice('general.investment',1).' '.trans_choice('general.asset',1),'other'=>trans_choice('general.other',1).' '.trans_choice('general.asset',1)),$asset_type->type, array('class' => 'form-control', ''=>"",'required'=>'required')) !!}
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


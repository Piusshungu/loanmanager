@extends('layouts.master')
@section('title')
    {{trans_choice('general.edit',1)}} {{trans_choice('general.provision',1)}} {{trans_choice('general.rate',1)}}
@endsection
@section('current-page'){{trans_choice('general.edit',1)}} {{trans_choice('general.provision',1)}} {{trans_choice('general.rate',1)}}
@endsection
@section('content')
    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title">{{trans_choice('general.edit',1)}} {{trans_choice('general.provision',1)}} {{trans_choice('general.rate',1)}}</h3>

            <div class="box-tools pull-right">

            </div>
        </div>
        {!! Form::open(array('url' => url('loan/provision/'.$provision->id.'/update'), 'method' => 'post', 'class' => 'form-horizontal')) !!}
        <div class="box-body">
            <div class="form-group">
                {!! Form::label('rate',trans_choice('general.rate',1),array('class'=>'col-sm-2 control-label')) !!}
                <div class="col-sm-10">
                    {!! Form::text('rate',$provision->rate, array('class' => 'form-control touchspin', 'placeholder'=>"",'required'=>'required')) !!}
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


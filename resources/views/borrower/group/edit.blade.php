@extends('layouts.master')
@section('title')
    {{ trans_choice('general.edit',1) }} {{ trans_choice('general.borrower',1) }} {{ trans_choice('general.group',1) }}
@endsection
@section('content')
    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title">{{ trans_choice('general.edit',1) }} {{ trans_choice('general.borrower',1) }} {{ trans_choice('general.group',1) }}</h3>

            <div class="box-tools pull-right">

            </div>
        </div>
        {!! Form::open(array('url' => url('borrower/group/'.$borrower_group->id.'/update'), 'method' => 'post', 'class' => 'form-horizontal')) !!}
        <div class="box-body">
            <div class="form-group">
                {!! Form::label('name',trans_choice('general.name',1),array('class'=>'col-sm-2 control-label')) !!}
                <div class="col-sm-10">
                    {!! Form::text('name',$borrower_group->name, array('class' => 'form-control', 'placeholder'=>"",'required'=>'required')) !!}
                </div>
            </div>
            <div class="form-group">
                {!! Form::label('notes',trans_choice('general.note',2),array('class'=>'col-sm-2 control-label')) !!}
                <div class="col-sm-10">
                    {!! Form::textarea('notes',$borrower_group->notes, array('class' => 'form-control', 'placeholder'=>"")) !!}
                </div>
            </div>
        </div>
        <!-- /.box-body -->
        <div class="box-footer">
            <button type="submit" class="btn btn-primary pull-right">{{ trans_choice('general.save',1) }}</button>
        </div>
        {!! Form::close() !!}
    </div>
    <!-- /.box -->
@endsection
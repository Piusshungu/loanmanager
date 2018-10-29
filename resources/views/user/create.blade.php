@extends('layouts.master')
@section('title')
    {{ trans_choice('general.add',1) }} {{ trans_choice('general.user',1) }}
@endsection
@section('content')
    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title">{{ trans_choice('general.add',1) }} {{ trans_choice('general.user',1) }}</h3>

            <div class="box-tools pull-right">

            </div>
        </div>
        {!! Form::open(array('url' => 'user/store','class'=>'',"enctype" => "multipart/form-data")) !!}
        <div class="box-body">
            <div class="col-md-12">
                <div class="form-group">
                    {!!  Form::label(trans('general.first_name'),null,array('class'=>'control-label')) !!}
                    {!! Form::text('first_name','',array('class'=>'form-control','required'=>'required')) !!}
                </div>
                <div class="form-group">
                    {!!  Form::label(trans('general.last_name'),null,array('class'=>'control-label')) !!}
                    {!! Form::text('last_name','',array('class'=>'form-control','required'=>'required')) !!}
                </div>
                <div class="form-group">
                    {!!  Form::label(trans('general.gender'),null,array('class'=>' control-label')) !!}
                    {!! Form::select('gender', array('Male' =>trans('general.Male'), 'Female' => trans('general.Female')),null,array('class'=>'form-control')) !!}
                </div>
                <div class="form-group">
                    {!!  Form::label(trans_choice('general.phone',1),null,array('class'=>'control-label')) !!}
                    {!! Form::text('phone',null,array('class'=>'form-control')) !!}
                </div>
                <div class="form-group ">
                    {!!  Form::label(trans_choice('general.email',1),null,array('class'=>'control-label')) !!}
                    {!! Form::email('email','',array('class'=>'form-control','required'=>'required')) !!}
                </div>
                <div class="form-group">
                    {!!  Form::label(trans('general.password'),null,array('class'=>'control-label')) !!}
                    {!! Form::password('password',array('class'=>'form-control','required'=>'required')) !!}
                </div>
                <div class="form-group">
                    {!!  Form::label(trans('general.repeat_password'),null,array('class'=>'control-label')) !!}
                    {!! Form::password('rpassword',array('class'=>'form-control','required'=>'required')) !!}
                </div>
                <div class="form-group">
                    {!!  Form::label(trans_choice('general.role',1),null,array('class'=>' control-label')) !!}
                    {!! Form::select('role', $role,'Client',array('class'=>'form-control')) !!}
                </div>
                <div class="form-group">
                    {!!  Form::label(trans('general.address'),null,array('class'=>'control-label')) !!}
                    {!! Form::textarea('address','',array('class'=>'form-control wysihtml5')) !!}
                </div>
                <div class="form-group">
                    {!!  Form::label(trans_choice('general.note',2),null,array('class'=>'control-label')) !!}

                    {!! Form::textarea('notes','',array('class'=>'form-control wysihtml5')) !!}
                </div>
            </div>
        </div>
        <!-- /.box-body -->
        <div class="box-footer">
            <button type="submit" class="btn btn-primary pull-right">{{trans_choice('general.save',1)}}</button>
        </div>
        {!! Form::close() !!}
    </div>
@endsection
@section('footer-scripts')
    <script src="{{ asset('assets/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js') }}"></script>
@endsection
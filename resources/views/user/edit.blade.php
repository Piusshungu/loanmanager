@extends('layouts.master')
@section('title')
    {{ trans_choice('general.edit',1) }} {{ trans_choice('general.user',1) }}
@endsection
@section('content')
    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title">{{ trans_choice('general.edit',1) }} {{ trans_choice('general.user',1) }}</h3>

            <div class="box-tools pull-right">

            </div>
        </div>
        {!! Form::open(array('url' => 'user/'.$user->id.'/update','class'=>'form-horizontal',"enctype" => "multipart/form-data")) !!}
        <div class="box-body">
            <div class="col-md-12">
                {!! Form::hidden('previous_role',$selected,array('class'=>'form-control','required'=>'required')) !!}
                <div class="form-group">
                    {!!  Form::label(trans('general.first_name'),null,array('class'=>'control-label')) !!}

                    {!! Form::text('first_name',$user->first_name,array('class'=>'form-control','required'=>'required')) !!}
                </div>
                <div class="form-group">
                    {!!  Form::label(trans('general.last_name'),null,array('class'=>'control-label')) !!}
                    {!! Form::text('last_name',$user->last_name,array('class'=>'form-control','required'=>'required')) !!}
                </div>
                <div class="form-group">
                    {!!  Form::label(trans('general.gender'),null,array('class'=>' control-label')) !!}
                    {!! Form::select('gender', array('Male' =>trans('general.Male'), 'Female' => trans('general.Female')),$user->gender,array('class'=>'form-control')) !!}
                </div>
                <div class="form-group">
                    {!!  Form::label(trans('general.phone'),null,array('class'=>'control-label')) !!}
                    {!! Form::text('phone',$user->phone,array('class'=>'form-control')) !!}
                </div>
                <div class="form-group ">
                    {!!  Form::label(trans_choice('general.email',1),null,array('class'=>'control-label')) !!}
                    {!! Form::email('email',$user->email,array('class'=>'form-control','required'=>'required')) !!}
                </div>
                <div class="form-group">
                    {!!  Form::label(trans('general.password'),null,array('class'=>'control-label')) !!}
                    {!! Form::password('password',array('class'=>'form-control')) !!}
                </div>
                <div class="form-group">
                    {!!  Form::label(trans('general.repeat_password'),null,array('class'=>'control-label')) !!}
                    {!! Form::password('rpassword',array('class'=>'form-control')) !!}
                </div>
                <div class="form-group">
                    {!!  Form::label(trans_choice('general.role',1),null,array('class'=>' control-label')) !!}
                    {!! Form::select('role',$role,$selected,array('class'=>'form-control')) !!}
                </div>
                <div class="form-group">
                    {!!  Form::label(trans('general.address'),null,array('class'=>'control-label')) !!}
                    {!! Form::textarea('address',$user->address,array('class'=>'form-control wysihtml5')) !!}
                </div>
                <div class="form-group">
                    {!!  Form::label(trans_choice('general.note',2),null,array('class'=>'control-label')) !!}

                    {!! Form::textarea('notes',$user->notes,array('class'=>'form-control wysihtml5')) !!}
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
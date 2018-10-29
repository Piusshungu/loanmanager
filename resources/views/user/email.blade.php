@extends('layouts.master')
@section('title')
    Email
@endsection
@section('current-page')
    Send Email
@endsection
@section('content')
    <div class="portlet light calendar ">
        <div class="portlet-title">
            <h2>Send Email</h2>
        </div>
        <div class="portlet-body form">
            @if (count($errors) > 0)
                <div class="alert alert-danger">
                    <ul>
                        @foreach ($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                </div>
            @endif
            <div class="inbox-content">
                {!! Form::open(array('url' => $url,'class'=>'inbox-compose form-horizontal form-bordered form-label-stripped',"enctype" => "multipart/form-data")) !!}
                {!! Form::hidden('user_id',Sentinel::getUser()->id,array('class'=>'form-control')) !!}
                <div class="inbox-compose-btn">
                    <button class="btn blue" type="submit"><i class="fa fa-check"></i>Send</button>
                    <button class="btn inbox-discard-btn">Discard</button>
                </div>
                <div class="inbox-form-group">
                    {!!  Form::label('Subject',null,array('class'=>'col-md-3 control-label')) !!}
                    <div class="controls">
                        {!! Form::text('subject','',array('class'=>'form-control','required'=>'required')) !!}
                    </div>
                </div>
                <div class="inbox-form-group">

                    {!! Form::textarea('message','',array('class'=>'inbox-editor inbox-wysihtml5 form-control wysihtml5 ','required'=>'required','placeholder'=>'Your message here')) !!}

                </div>
                <div class="inbox-compose-attachment">
                    <p>Attachements</p>
                    {!! Form::file('file1',null,array()) !!}
                    {!! Form::file('file2',null,array()) !!}
                    {!! Form::file('file3',null,array()) !!}

                </div>
            </div>
            <div class="inbox-compose-btn">
                <button class="btn blue" type="submit"><i class="fa fa-check"></i>Send</button>
                <button class="btn" type="reset">Discard</button>
            </div>
            {!! Form::close() !!}
        </div>
    </div>
@endsection

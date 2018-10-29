@extends('layouts.master')
@section('title')
    Create Permission
@endsection
@section('content')
    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title">Create Permission</h3>

        </div>
        {!! Form::open(array('url' => 'user/permission/store','class'=>'',"enctype" => "multipart/form-data")) !!}
        <div class="box-body">
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <div class="form-line">
                            {!!  Form::label('Type',null,array('class'=>' control-label')) !!}
                            {!! Form::select('type', array('0' => 'Parent Permission', '1' => 'Sub Permission'),null,array('class'=>'form-control','id'=>'type')) !!}
                        </div>
                    </div>
                    <div class="form-group" id="parent">
                        <div class="form-line">
                            {!!  Form::label('Parent',null,array('class'=>' control-label')) !!}
                            {!! Form::select('parent_id', $parent,null,array('class'=>' select2')) !!}
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="form-line">
                            {!!  Form::label('Name',null,array('class'=>'control-label')) !!}
                            {!! Form::text('name',null,array('class'=>'form-control')) !!}
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="form-line">
                            {!!  Form::label('Slug',null,array('class'=>'control-label')) !!}
                            {!! Form::text('slug',null,array('class'=>'form-control')) !!}
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="form-line">
                            {!!  Form::label('Description',null,array('class'=>'control-label')) !!}
                            {!! Form::textarea('description',null,array('class'=>'form-control')) !!}
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <!-- /.box-body -->
        <div class="box-footer">
            <button type="submit" class="btn btn-primary pull-right">Save</button>
        </div>
        {!! Form::close() !!}
    </div>
    <script>
        $(document).ready(function () {
            if ($('#type').val() == 0) {
                $('#parent').hide();
            } else {
                $('#parent').show();
            }
            $('#type').change(function(){
                if ($('#type').val() == 0) {
                    $('#parent').hide();
                } else {
                    $('#parent').show();
                }
            })
        })
    </script>
@endsection
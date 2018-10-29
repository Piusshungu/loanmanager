@extends('layouts.master')
@section('title')
    {{ trans('general.add') }} {{ trans_choice('general.role',1) }}
@endsection
@section('content')
    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title">{{ trans('general.add') }} {{ trans_choice('general.role',1) }}</h3>

        </div>
        {!! Form::open(array('url' => 'user/role/store','class'=>'',"enctype" => "multipart/form-data")) !!}
        <div class="box-body">
            <div class="row">
                <div class="col-md-12">
                    <div class="form-group">
                        <div class="form-line">
                            {!!  Form::label(trans_choice('general.name',1) ,null,array('class'=>'control-label')) !!}
                            {!! Form::text('name',null,array('class'=>'form-control')) !!}
                        </div>
                    </div>
                    <div class="form-group">
                        <hr>
                        <h4>{{trans_choice('general.manage',1)}} {{trans_choice('general.permission',2)}}</h4>

                        <div class="col-md-6">
                            <table class="table table-stripped table-hover">
                                @foreach($data as $permission)
                                    <tr>
                                        <td>
                                            @if($permission->parent_id==0)
                                                <strong>{{$permission->name}}</strong>
                                            @else
                                                {{$permission->name}}
                                            @endif
                                        </td>
                                        <td>
                                            @if(!empty($permission->description))
                                                <i class="fa fa-info" data-toggle="tooltip"
                                                   data-original-title="{{$permission->description}}"></i>
                                            @endif
                                        </td>
                                        <td>
                                            <input type="checkbox" data-parent="{{$permission->parent_id}}"
                                                   name="permission[]" value="{{$permission->slug}}"
                                                   id="{{$permission->id}}"
                                                   class="form-control pcheck">
                                            <label class="" for="{{$permission->id}}">

                                            </label>
                                        </td>
                                    </tr>
                                @endforeach
                            </table>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <!-- /.box-body -->
        <div class="box-footer">
            <button type="submit" class="btn btn-primary pull-right">{{trans_choice('general.save',1)}}</button>
        </div>
        {!! Form::close() !!}
    </div>
    <script>
        $(document).ready(function () {
            $(".pcheck").on('ifChecked', function (e) {
                if ($(this).attr('data-parent') == 0) {
                    var id = $(this).attr('id');
                    $(":checkbox[data-parent=" + id + "]").iCheck('check');

                }
            });
            $(".pcheck").on('ifUnchecked', function (e) {
                if ($(this).attr('data-parent') == 0) {
                    var id = $(this).attr('id');
                    $(":checkbox[data-parent=" + id + "]").iCheck('uncheck');

                }
            });
        })
    </script>
@endsection
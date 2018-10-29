@extends('layouts.master')
@section('title')
    {{ $branch->name }}
@endsection
@section('content')
    <div class="row">
        <div class="col-md-4">
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">{{ $branch->name }}</h3>

                    <div class="box-tools pull-right">

                    </div>
                </div>
                <div class="box-body">
                    {!! $branch->notes !!}
                </div>
                <!-- /.box-body -->
                <div class="box-footer">
                    {{ trans_choice('general.created_at',1) }}: {{$branch->created_at}}
                </div>
            </div>
            <!-- /.box -->
        </div>
        <div class="col-md-8">
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">{{ trans_choice('general.user',2) }}</h3>

                    <div class="box-tools pull-right">
                        @if(Sentinel::hasAccess('branches.assign'))
                            <a href="#" data-toggle="modal" data-target="#addUser"
                               class="btn btn-info btn-sm">{{trans_choice('general.add',1)}} {{trans_choice('general.user',1)}}</a>
                        @endif
                    </div>
                </div>
                <div class="box-body">
                    <div class="table-responsive">
                        <table id="data-table" class="table table-bordered table-condensed table-hover">
                            <thead>
                            <tr style="background-color: #D1F9FF">
                                <th>{{trans_choice('general.full_name',1)}}</th>
                                <th>{{trans_choice('general.id',1)}}#</th>
                                <th>{{trans_choice('general.phone',1)}}</th>
                                <th>{{trans_choice('general.email',1)}}</th>
                                <th>{{ trans_choice('general.action',1) }}</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($branch->users as $key)
                                @if(!empty($key->user))
                                    <tr>
                                        <td>{{ $key->user->first_name }} {{ $key->user->last_name }}</td>
                                        <td>{{ $key->user->id }}</td>
                                        <td>{{ $key->user->phone }}</td>
                                        <td>{{ $key->user->email }}</td>
                                        <td>
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-info btn-xs dropdown-toggle"
                                                        data-toggle="dropdown" aria-expanded="false">
                                                    {{ trans('general.choose') }} <span class="caret"></span>
                                                    <span class="sr-only">Toggle Dropdown</span>
                                                </button>
                                                <ul class="dropdown-menu dropdown-menu-right" role="menu">
                                                    @if(Sentinel::hasAccess('users.view'))
                                                        <li><a href="{{ url('user/'.$key->user->id.'/show') }}"><i
                                                                        class="fa fa-search"></i> {{trans_choice('general.detail',2)}}
                                                            </a></li>
                                                    @endif
                                                    @if(Sentinel::hasAccess('users.update'))
                                                        <li><a href="{{ url('user/'.$key->user->id.'/edit') }}"><i
                                                                        class="fa fa-edit"></i> {{ trans('general.edit') }}
                                                            </a>
                                                        </li>
                                                    @endif
                                                    @if(Sentinel::hasAccess('branches.assign'))
                                                        <li>
                                                            <a href="{{ url('branch/'.$key->id.'/remove_user') }}"
                                                               class="delete"><i
                                                                        class="fa fa-trash"></i> {{ trans('general.remove') }}
                                                            </a>
                                                        </li>
                                                    @endif
                                                </ul>
                                            </div>
                                        </td>
                                    </tr>
                                @endif
                            @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- /.box-body -->

            </div>
            <!-- /.box -->
        </div>
    </div>
    <div class="modal fade" id="addUser">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">*</span></button>
                    <h4 class="modal-title">{{trans_choice('general.add',1)}} {{trans_choice('general.user',1)}}</h4>
                </div>
                {!! Form::open(array('url' => url('branch/'.$branch->id.'/add_user'),'method'=>'post')) !!}
                <div class="modal-body">
                    <div class="form-group">
                        <div class="form-line">
                            {!!  Form::label('user_id',trans_choice('general.user',1),array('class'=>' control-label')) !!}
                            {!! Form::select('user_id',$users,null,array('class'=>' select2','placeholder'=>trans_choice('general.select',1),'required'=>'required')) !!}
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-info">{{trans_choice('general.save',1)}}</button>
                    <button type="button" class="btn default"
                            data-dismiss="modal">{{trans_choice('general.close',1)}}</button>
                </div>
                {!! Form::close() !!}
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
@endsection
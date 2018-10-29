@extends('layouts.master')
@section('title')
    {{trans_choice('general.role',2)}}
@endsection
@section('content')
    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title">{{trans_choice('general.role',2)}}</h3>

            <div class="box-tools pull-right">
                <a href="{{ url('user/role/create') }}" class="btn btn-info btn-xs">
                    {{trans_choice('general.add',1)}} {{trans_choice('general.role',1)}}
                </a>
            </div>
        </div>
        <div class="box-body">
            <table class="table responsive table-bordered table-hover table-stripped" id="">
                <thead>
                <tr>
                    <th>{{trans_choice('general.name',1)}}</th>
                    <th>{{trans('general.slug')}}</th>
                    <th>{{trans_choice('general.action',1)}}</th>
                </tr>
                </thead>

                <tbody>
                @foreach($data as $key)
                    <tr>
                        <td>{{ $key->name }}</td>
                        <td>{{ $key->slug}}</td>
                        <td>
                            <div class="btn-group">

                                <button class="btn bg-blue btn-xs dropdown-toggle" type="button"
                                        data-toggle="dropdown"
                                        aria-expanded="false">{{trans_choice('general.choose',1)}} <i
                                            class="fa fa-angle-down"></i></button>
                                <ul class="dropdown-menu" role="menu">
                                    <li>
                                        <a href="{{ url('user/role/'.$key->id.'/edit') }}"><i
                                                    class="fa fa-edit"></i>
                                            {{ trans('general.edit') }}</a>
                                    </li>

                                    <li>
                                        <a href="{{ url('user/role/'.$key->id.'/delete') }}"
                                           class="delete"><i
                                                    class="fa fa-trash"></i>
                                            {{ trans('general.delete') }}</a>
                                    </li>
                                </ul>
                            </div>
                        </td>
                    </tr>
                @endforeach
                </tbody>
            </table>
        </div>
    </div>
@endsection

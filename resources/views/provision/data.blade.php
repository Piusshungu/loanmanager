@extends('layouts.master')
@section('title'){{trans_choice('general.provision',1)}} {{trans_choice('general.rate',2)}}
@endsection

@section('content')
    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title">{{trans_choice('general.provision',1)}} {{trans_choice('general.rate',2)}}</h3>

            <div class="box-tools pull-right">
            </div>
        </div>
        <div class="box-body">
            <table id="" class="table table-bordered table-condensed table-hover">
                <thead>
                <tr>
                    <th>{{trans_choice('general.name',1)}}</th>
                    <th>{{trans_choice('general.rate',1)}}</th>
                    <th>{{ trans_choice('general.action',1) }}</th>
                </tr>
                </thead>
                <tbody>
                @foreach($data as $key)
                    <tr>
                        <td>{{ $key->name }}</td>
                        <td>{{ $key->rate }} %</td>
                        <td>
                            <div class="btn-group">
                                <button type="button" class="btn btn-info btn-flat dropdown-toggle"
                                        data-toggle="dropdown" aria-expanded="false">
                                    {{ trans('general.choose') }} <span class="caret"></span>
                                    <span class="sr-only">Toggle Dropdown</span>
                                </button>
                                <ul class="dropdown-menu" role="menu">
                                    @if(Sentinel::hasAccess('loans.update'))
                                        <li><a href="{{ url('loan/provision/'.$key->id.'/edit') }}"><i
                                                        class="fa fa-edit"></i> {{ trans('general.edit') }} </a></li>
                                    @endif
                                </ul>
                            </div>
                        </td>
                    </tr>
                @endforeach
                </tbody>
            </table>
        </div>
        <!-- /.box-body -->
    </div>
    <!-- /.box -->
@endsection
@section('footer-scripts')

@endsection

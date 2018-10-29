@extends('layouts.master')
@section('title')
    {{ trans_choice('general.user',2) }}
@endsection
@section('content')
    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title">{{ trans_choice('general.user',2) }}</h3>

            <div class="box-tools pull-right">
                @if(Sentinel::hasAccess('users.create'))
                    <a href="{{ url('user/create') }}" class="btn btn-info btn-xs">
                        {{ trans_choice('general.add',1) }} {{ trans_choice('general.user',1) }}
                    </a>
                @endif
            </div>
        </div>
        <div class="box-body table-responsive">
            <table class="table  table-bordered table-hover table-stripped" id="data-table">
                <thead>
                <tr>
                    <th>{{ trans('general.name') }}</th>
                    <th>{{ trans('general.gender') }}</th>
                    <th>{{ trans('general.phone') }}</th>
                    <th>{{ trans_choice('general.email',1) }}</th>
                    <th>{{ trans('general.address') }}</th>
                    <th>{{ trans_choice('general.role',1) }}</th>
                    <th>{{ trans_choice('general.action',1) }}</th>
                </tr>
                </thead>
                <tbody>
                @foreach($data as $key)
                    <tr>
                        <td>{{ $key->first_name }} {{ $key->last_name }}</td>
                        <td>{{ $key->gender }}</td>
                        <td>{{ $key->phone }}</td>
                        <td>{{ $key->email }}</td>
                        <td>{!!   $key->address !!}</td>
                        <td>
                            @if(!empty($key->roles))
                                <span class="label label-danger">{{ $key->roles->first()->name }} </span>
                            @endif
                        </td>
                        <td>
                            <div class="btn-group">
                                <button class="btn btn-info btn-sm dropdown-toggle" type="button" data-toggle="dropdown"
                                        aria-expanded="false">{{ trans('general.choose') }}...<i
                                            class="fa fa-angle-down"></i></button>
                                <ul class="dropdown-menu" role="menu">
                                    @if(Sentinel::hasAccess('users.view'))
                                        <li>
                                            <a href="{{ url('user/'.$key->id.'/show') }}"><i
                                                        class="fa fa-search"></i>
                                                {{ trans('general.detail') }}</a>
                                        </li>
                                    @endif
                                    @if(Sentinel::hasAccess('users.update'))
                                        <li>
                                            <a href="{{ url('user/'.$key->id.'/edit') }}"><i
                                                        class="fa fa-edit"></i>
                                                {{ trans('general.edit') }}</a>
                                        </li>
                                    @endif
                                    @if(Sentinel::hasAccess('users.delete'))
                                        <li>
                                            <a href="{{ url('user/'.$key->id.'/delete') }}"
                                               class="delete"><i
                                                        class="fa fa-trash"></i>
                                                {{ trans('general.delete') }}</a>
                                        </li>
                                    @endif
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
@section('footer-scripts')
    <script src="{{ asset('assets/plugins/datatable/media/js/jquery.dataTables.js')}}"></script>
    <script src="{{ asset('assets/plugins/datatable/media/js/dataTables.bootstrap.js')}}"></script>
    <script src="{{ asset('assets/plugins/datatable/extensions/Buttons/js/dataTables.buttons.min.js')}}"></script>
    <script src="{{ asset('assets/plugins/datatable/extensions/Buttons/js/buttons.html5.min.js')}}"></script>
    <script src="{{ asset('assets/plugins/datatable/extensions/Buttons/js/buttons.print.min.js')}}"></script>
    <script src="{{ asset('assets/plugins/datatable/extensions/Responsive/js/dataTables.responsive.min.js')}}"></script>
    <script src="{{ asset('assets/plugins/datatable/extensions/Buttons/js/buttons.colVis.min.js')}}"></script>
    <script>

        $('#data-table').DataTable({
            dom: 'frtip',
            "paging": true,
            "lengthChange": true,
            "displayLength": 15,
            "searching": true,
            "ordering": true,
            "info": true,
            "autoWidth": true,
            "order": [[0, "asc"]],
            "columnDefs": [
                {"orderable": false, "targets": [6]}
            ],
            "language": {
                "lengthMenu": "{{ trans('general.lengthMenu') }}",
                "zeroRecords": "{{ trans('general.zeroRecords') }}",
                "info": "{{ trans('general.info') }}",
                "infoEmpty": "{{ trans('general.infoEmpty') }}",
                "search": "{{ trans('general.search') }}",
                "infoFiltered": "{{ trans('general.infoFiltered') }}",
                "paginate": {
                    "first": "{{ trans('general.first') }}",
                    "last": "{{ trans('general.last') }}",
                    "next": "{{ trans('general.next') }}",
                    "previous": "{{ trans('general.previous') }}"
                }
            },
            responsive: false
        });
    </script>
@endsection

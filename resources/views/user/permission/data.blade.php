@extends('layouts.master')
@section('title')
    {{trans_choice('general.permission',2)}}
@endsection
@section('content')

    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title">{{trans_choice('general.permission',2)}}</h3>

            <div class="box-tools pull-right">
                <a href="{{ url('user/permission/create') }}" class="btn btn-info btn-xs">
                    <i class="fa fa-plus"></i>
                </a>
            </div>
        </div>
        <div class="box-body">
            <table class="table responsive table-bordered table-hover table-stripped" id="">
                <thead>
                <tr>
                    <th>{{trans('general.name')}}</th>
                    <th>{{trans('general.parent')}}</th>
                    <th>{{trans('general.slug')}}</th>
                    <th>{{trans('general.action')}}</th>
                </tr>
                </thead>

                <tbody>
                @foreach($data as $key)
                    <tr>
                        <td>
                            @if($key->parent_id!=0)
                                |___
                            @endif
                            {{ $key->name }}
                        </td>
                        <td>
                            @if(count($key->parent)>0)
                                {{ $key->parent->name }}
                            @else
                                {{trans('general.no_parent')}}
                            @endif
                        </td>
                        <td>{{ $key->slug}}</td>
                        <td>
                            <div class="btn-group">
                                <button class="btn bg-blue btn-xs dropdown-toggle" type="button"
                                        data-toggle="dropdown"
                                        aria-expanded="false">Choose...<i
                                            class="fa fa-angle-down"></i></button>
                                <ul class="dropdown-menu" role="menu">
                                    <li>
                                        <a href="{{ url('user/permission/'.$key->id.'/edit') }}"><i
                                                    class="fa fa-edit"></i>
                                            {{ trans('general.edit') }}</a>
                                    </li>

                                    <li>
                                        <a href="{{ url('user/permission/'.$key->id.'/delete') }}"
                                           data-toggle="confirmation"><i
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
@section('footer-scripts')
    <script src="{{ asset('assets/plugins/datatables/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('assets/plugins/datatables/dataTables.bootstrap.min.js') }}"></script>
    <script>
        $('#data-table').DataTable({
            "paging": true,
            "lengthChange": true,
            "searching": true,
            "ordering": true,
            "info": true,
            "autoWidth": true,
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
                },
                "columnDefs": [
                    {"orderable": false, "targets": 0}
                ]
            },
            responsive: true,
        });
    </script>
@endsection

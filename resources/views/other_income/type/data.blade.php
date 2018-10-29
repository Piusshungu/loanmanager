@extends('layouts.master')
@section('title'){{ trans_choice('general.other_income',1) }} {{ trans_choice('general.type',2) }}
@endsection
@section('content')
    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title">{{ trans_choice('general.other_income',1) }} {{ trans_choice('general.type',2) }}</h3>

            <div class="box-tools pull-right">
                <a href="{{ url('other_income/type/create') }}"
                   class="btn btn-info btn-sm">{{ trans_choice('general.add',1) }} {{ trans_choice('general.type',1) }}</a>
            </div>
        </div>
        <div class="box-body">
            <table id="" class="table table-bordered table-hover">
                <thead>
                <tr>
                    <th>{{ trans_choice('general.name',1) }}</th>
                    <th>{{ trans_choice('general.action',1) }}</th>
                </tr>
                </thead>
                <tbody>
                @foreach($data as $key)
                    <tr>
                        <td>{{ $key->name }}</td>
                        <td>
                            <div class="btn-group">
                                <button type="button" class="btn btn-info btn-flat dropdown-toggle"
                                        data-toggle="dropdown" aria-expanded="false">
                                    {{ trans('general.choose') }} <span class="caret"></span>
                                    <span class="sr-only">Toggle Dropdown</span>
                                </button>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="{{ url('other_income/type/'.$key->id.'/edit') }}"><i
                                                    class="fa fa-edit"></i> {{ trans('general.edit') }} </a></li>
                                    <li><a href="{{ url('other_income/type/'.$key->id.'/delete') }}"
                                           class="delete"><i
                                                    class="fa fa-trash"></i> {{ trans('general.delete') }} </a></li>
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
    <script src="{{ asset('assets/plugins/datatables/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('assets/plugins/datatables/dataTables.bootstrap.min.js') }}"></script>
    <script>
        $('#data-table').DataTable({
            "paging": true,
            "lengthChange": false,
            "searching": false,
            "ordering": true,
            "info": true,
            "autoWidth": false,
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
                    {"orderable": false, "targets": 2}
                ]
            },
        });
        $(document).ready(function () {
            $('.deleteType').on('click', function (e) {
                e.preventDefault();
                var href = $(this).attr('href');
                swal({
                    title: 'Are you sure?',
                    text: '',
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Ok',
                    cancelButtonText: 'Cancel'
                }).then(function () {
                    window.location = href;
                })
            });
        });
    </script>
@endsection

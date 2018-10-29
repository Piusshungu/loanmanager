@extends('layouts.master')
@section('title')
    {{trans_choice('general.borrower',2)}}
@endsection
@section('content')
    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title">{{trans_choice('general.borrower',2)}}</h3>

            <div class="box-tools pull-right">
                @if(Sentinel::hasAccess('borrowers.create'))
                    <a href="{{ url('borrower/create') }}"
                       class="btn btn-info btn-sm">{{trans_choice('general.add',1)}} {{trans_choice('general.borrower',1)}}</a>
                @endif
            </div>
        </div>
        <div class="box-body ">
            <div class="table-responsive">
                <table id="data-table" class="table table-bordered table-condensed table-hover">
                    <thead>
                    <tr style="background-color: #D1F9FF">
                        <th>{{trans_choice('general.full_name',1)}}</th>
                        <th>{{trans_choice('general.business',1)}}</th>
                        <th>{{trans_choice('general.unique',1)}}#</th>
                        <th>{{trans_choice('general.mobile',1)}}</th>
                        <th>{{trans_choice('general.email',1)}}</th>
                        <th>{{trans_choice('general.status',1)}}</th>
                        <th>{{ trans_choice('general.action',1) }}</th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach($data as $key)
                        <tr>
                            <td>{{ $key->first_name }} {{ $key->last_name }}</td>
                            <td>{{ $key->business_name }}</td>
                            <td>{{ $key->unique_number }}</td>
                            <td>{{ $key->mobile }}</td>
                            <td>{{ $key->email }}</td>
                            <td>
                                @if($key->active==1)
                                    <span class="label label-success">{{trans_choice('general.active',1)}}</span>
                                @endif
                                @if($key->active==0)
                                    <span class="label label-danger">{{trans_choice('general.pending',1)}}</span>
                                @endif
                            </td>
                            <td>
                                <div class="btn-group">
                                    <button type="button" class="btn btn-info btn-xs dropdown-toggle"
                                            data-toggle="dropdown" aria-expanded="false">
                                        {{ trans('general.choose') }} <span class="caret"></span>
                                        <span class="sr-only">Toggle Dropdown</span>
                                    </button>
                                    <ul class="dropdown-menu dropdown-menu-right" role="menu">
                                        @if($key->active==0)
                                            @if(Sentinel::hasAccess('borrowers.approve'))
                                                <li><a href="{{ url('borrower/'.$key->id.'/approve') }}"><i
                                                                class="fa fa-check"></i> {{trans_choice('general.approve',1)}}
                                                    </a></li>
                                            @endif
                                        @endif
                                        @if($key->active==1)
                                            @if(Sentinel::hasAccess('borrowers.approve'))
                                                <li><a href="{{ url('borrower/'.$key->id.'/decline') }}"><i
                                                                class="fa fa-minus-circle"></i> {{trans_choice('general.decline',1)}}
                                                    </a></li>
                                            @endif
                                        @endif
                                        @if(Sentinel::hasAccess('borrowers.blacklist'))
                                            @if($key->blacklisted==1)
                                                <li><a href="{{ url('borrower/'.$key->id.'/unblacklist') }}"
                                                       class="delete"><i
                                                                class="fa fa-check"></i>{{trans_choice('general.undo',1)}} {{trans_choice('general.blacklist',1)}}
                                                    </a>
                                                </li>
                                            @endif
                                            @if($key->blacklisted==0)
                                                <li>
                                                    <a href="{{ url('borrower/'.$key->id.'/blacklist') }}"
                                                       class="delete"><i
                                                                class="fa fa-minus-circle"></i> {{trans_choice('general.blacklist',1)}}
                                                    </a>
                                                </li>
                                            @endif
                                        @endif
                                        @if(Sentinel::hasAccess('borrowers.view'))
                                            <li><a href="{{ url('borrower/'.$key->id.'/show') }}"><i
                                                            class="fa fa-search"></i> {{trans_choice('general.detail',2)}}
                                                </a></li>
                                        @endif
                                        @if(Sentinel::hasAccess('borrowers.update'))
                                            <li><a href="{{ url('borrower/'.$key->id.'/edit') }}"><i
                                                            class="fa fa-edit"></i> {{ trans('general.edit') }} </a>
                                            </li>
                                        @endif
                                        @if(Sentinel::hasAccess('borrowers.delete'))
                                            <li><a href="{{ url('borrower/'.$key->id.'/delete') }}" class="delete"><i
                                                            class="fa fa-trash"></i> {{ trans('general.delete') }} </a>
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
        <!-- /.box-body -->
    </div>
    <!-- /.box -->
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
            dom: 'Bfrtip',
            buttons: [
                {extend: 'copy', 'text': '{{ trans('general.copy') }}'},
                {extend: 'excel', 'text': '{{ trans('general.excel') }}'},
                {extend: 'pdf', 'text': '{{ trans('general.pdf') }}'},
                {extend: 'print', 'text': '{{ trans('general.print') }}'},
                {extend: 'csv', 'text': '{{ trans('general.csv') }}'},
                {extend: 'colvis', 'text': '{{ trans('general.colvis') }}'}
            ],
            "paging": true,
            "lengthChange": true,
            "displayLength": 15,
            "searching": true,
            "ordering": true,
            "info": true,
            "autoWidth": true,
            "order": [[0, "asc"]],
            "columnDefs": [
                {"orderable": false, "targets": [5]}
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

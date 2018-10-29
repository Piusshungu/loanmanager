@extends('layouts.master')
@section('title')
    {{trans_choice('general.saving',2)}} {{trans_choice('general.product',2)}}
@endsection
@section('content')
    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title">{{trans_choice('general.saving',2)}} {{trans_choice('general.product',2)}}</h3>

            <div class="box-tools pull-right">
                @if(Sentinel::hasAccess('savings.products'))
                    <a href="{{ url('saving/savings_product/create') }}"
                       class="btn btn-info btn-sm">{{trans_choice('general.add',1)}} {{trans_choice('general.saving',2)}} {{trans_choice('general.product',1)}}</a>
                @endif
            </div>
        </div>
        <div class="box-body ">
            <div class="table-responsive">
                <table id="data-table" class="table table-bordered table-condensed table-hover">
                    <thead>
                    <tr style="background-color: #D1F9FF">
                        <th>{{trans_choice('general.product',1)}}</th>
                        <th>{{trans_choice('general.interest_rate_per_annum',1)}}</th>
                        <th>{{trans_choice('general.interest_posting_frequency',1)}}</th>
                        <th>{{trans_choice('general.minimum',1)}} {{trans_choice('general.balance',1)}}</th>
                        <th>{{ trans_choice('general.action',1) }}</th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach($data as $key)
                        <tr>
                            <td>{{ $key->name }}</td>
                            <td>{{ $key->interest_rate }}</td>
                            <td>
                                @if($key->interest_posting==1)
                                    {{trans_choice('general.every_1_month',1)}}
                                @endif
                                @if($key->interest_posting==2)
                                    {{trans_choice('general.every_2_month',1)}}
                                @endif
                                @if($key->interest_posting==3)
                                    {{trans_choice('general.every_3_month',1)}}
                                @endif
                                @if($key->interest_posting==4)
                                    {{trans_choice('general.every_4_month',1)}}
                                @endif
                                @if($key->interest_posting==5)
                                    {{trans_choice('general.every_6_month',1)}}
                                @endif
                                @if($key->interest_posting==6)
                                    {{trans_choice('general.every_12_month',1)}}

                                @endif
                            </td>
                            <td>{{ $key->minimum_balance }}</td>
                            <td>
                                <div class="btn-group">
                                    <button type="button" class="btn btn-info btn-xs dropdown-toggle"
                                            data-toggle="dropdown" aria-expanded="false">
                                        {{ trans('general.choose') }} <span class="caret"></span>
                                        <span class="sr-only">Toggle Dropdown</span>
                                    </button>
                                    <ul class="dropdown-menu dropdown-menu-right" role="menu">
                                        @if(Sentinel::hasAccess('savings.products'))
                                            <li><a href="{{ url('saving/savings_product/'.$key->id.'/edit') }}"><i
                                                            class="fa fa-edit"></i> {{ trans('general.edit') }} </a>
                                            </li>
                                        @endif
                                        @if(Sentinel::hasAccess('savings.products'))
                                            <li><a href="{{ url('saving/savings_product/'.$key->id.'/delete') }}"
                                                   class="delete"><i
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
                {"orderable": false, "targets": [4]}
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

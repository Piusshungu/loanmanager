@extends('layouts.master')
@section('title')
    {{trans_choice('general.asset',2)}}
@endsection
@section('content')
    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title">{{trans_choice('general.asset',2)}}</h3>

            <div class="box-tools pull-right">
                @if(Sentinel::hasAccess('assets.create'))
                    <a href="{{ url('asset/create') }}"
                       class="btn btn-info btn-sm">{{trans_choice('general.add',1)}} {{trans_choice('general.asset',1)}}</a>
                @endif
            </div>
        </div>
        <div class="box-body">
            <div class="table-responsive">
                <table id="data-table" class="table table-bordered table-condensed table-hover">
                    <thead>
                    <tr>
                        <th>{{trans_choice('general.type',1)}}</th>
                        <th>{{trans_choice('general.current',1)}} {{trans_choice('general.value',1)}}</th>
                        <th>{{trans_choice('general.category',1)}}</th>
                        <th>{{trans_choice('general.purchase',1)}} {{trans_choice('general.date',1)}}</th>
                        <th>{{trans_choice('general.description',1)}}</th>
                        <th>{{trans_choice('general.serial_number',1)}}</th>
                        <th>{{trans_choice('general.file',2)}}</th>
                        <th>{{ trans_choice('general.action',1) }}</th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach($data as $key)
                        <tr>
                            <td>
                                @if(!empty($key->asset_type))
                                    {{$key->asset_type->name}}
                                @endif
                            </td>
                            <td>
                                @foreach($key->valuations as $valuation)
                                <b>{{$valuation->date}}:</b> {{$valuation->amount}}<br>
                                @endforeach
                            </td>
                            <td>
                                @if(!empty($key->asset_type))
                                    @if($key->asset_type->type=="current")
                                        {{trans_choice('general.current',1)}} {{trans_choice('general.asset',1)}}
                                    @endif
                                    @if($key->asset_type->type=="fixed")
                                        {{trans_choice('general.fixed',1)}} {{trans_choice('general.asset',1)}}
                                    @endif
                                    @if($key->asset_type->type=="intangible")
                                        {{trans_choice('general.intangible',1)}} {{trans_choice('general.asset',1)}}
                                    @endif
                                    @if($key->asset_type->type=="investment")
                                        {{trans_choice('general.investment',1)}} {{trans_choice('general.asset',1)}}
                                    @endif
                                    @if($key->asset_type->type=="other")
                                        {{trans_choice('general.other',1)}} {{trans_choice('general.asset',1)}}
                                    @endif
                                @endif
                            </td>
                            <td>{{ $key->purchase_date }}</td>
                            <td>{{ $key->notes }}</td>
                            <td>{{ $key->serial_number }}</td>
                            <td>
                                <ul class="">
                                    @foreach(unserialize($key->files) as $k=>$value)
                                        <li><a href="{!!asset('uploads/'.$value)!!}"
                                               target="_blank">{!!  $value!!}</a></li>
                                    @endforeach
                                </ul>
                            </td>
                            <td>
                                <div class="btn-group">
                                    <button type="button" class="btn btn-info btn-xs dropdown-toggle"
                                            data-toggle="dropdown" aria-expanded="false">
                                        {{ trans('general.choose') }} <span class="caret"></span>
                                        <span class="sr-only">Toggle Dropdown</span>
                                    </button>
                                    <ul class="dropdown-menu dropdown-menu-right" role="menu">
                                        @if(Sentinel::hasAccess('assets.update'))
                                            <li><a href="{{ url('asset/'.$key->id.'/edit') }}"><i
                                                            class="fa fa-edit"></i> {{ trans('general.edit') }} </a>
                                            </li>
                                        @endif
                                        @if(Sentinel::hasAccess('assets.delete'))
                                            <li><a href="{{ url('asset/'.$key->id.'/delete') }}"
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
            "order": [[2, "desc"]],
            "columnDefs": [
                {"orderable": false, "targets": [7]}
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

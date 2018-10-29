@extends('layouts.master')
@section('title')
    {{trans_choice('general.collateral',1)}}
@endsection
@section('content')
    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title">{{trans_choice('general.collateral',1)}} </h3>

            <div class="box-tools pull-right">

            </div>
        </div>
        <div class="box-body">
            <div class="">
                <table id="data-table" class="table table-bordered table-condensed table-hover">
                    <thead>
                    <tr style="background-color: #D1F9FF">
                        <th>{{trans_choice('general.type',1)}}</th>
                        <th>{{trans_choice('general.name',1)}}</th>
                        <th>{{trans_choice('general.borrower',1)}}</th>
                        <th>{{trans_choice('general.loan',1)}}</th>
                        <th>{{trans_choice('general.value',1)}}</th>
                        <th>{{trans_choice('general.status',1)}}</th>
                        <th>{{trans_choice('general.date',1)}}</th>
                        <th>{{ trans_choice('general.action',1) }}</th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach($data as $key)
                        <tr>
                            <td>
                                @if(!empty($key->collateral_type))
                                    {{$key->collateral_type->name}}
                                @endif
                            </td>
                            <td>{{ $key->name }}</td>
                            <td>
                                @if(!empty($key->borrower))
                                    <a href="{{url('borrower/'.$key->borrower_id.'/show')}}"> {{$key->borrower->first_name}} {{$key->borrower->last_name}}</a>
                                @endif
                            </td>
                            <td><a href="{{url('loan/'.$key->loan_id.'/show')}}"># {{ $key->loan_id }}</a></td>
                            <td>{{ $key->value }}</td>
                            <td>
                                @if($key->status=='deposited_into_branch')
                                    {{trans_choice('general.deposited_into_branch',1)}}
                                @endif
                                @if($key->status=='collateral_with_borrower')
                                    {{trans_choice('general.collateral_with_borrower',1)}}
                                @endif
                                @if($key->status=='returned_to_borrower')
                                    {{trans_choice('general.returned_to_borrower',1)}}
                                @endif
                                @if($key->status=='repossession_initiated')
                                    {{trans_choice('general.repossession_initiated',1)}}
                                @endif
                                @if($key->status=='repossessed')
                                    {{trans_choice('general.repossessed',1)}}
                                @endif
                                @if($key->status=='sold')
                                    {{trans_choice('general.sold',1)}}
                                @endif
                                @if($key->status=='lost')
                                    {{trans_choice('general.lost',1)}}
                                @endif
                            </td>
                            <td>{{ $key->date }}</td>
                            <td>
                                <div class="btn-group">
                                    <button type="button" class="btn btn-info btn-xs dropdown-toggle"
                                            data-toggle="dropdown" aria-expanded="false">
                                        {{ trans('general.choose') }} <span class="caret"></span>
                                        <span class="sr-only">Toggle Dropdown</span>
                                    </button>
                                    <ul class="dropdown-menu" role="menu">
                                        @if(Sentinel::hasAccess('collateral.view'))
                                            <li><a href="{{ url('collateral/'.$key->id.'/show') }}"><i
                                                            class="fa fa-search"></i> {{ trans('general.view') }}
                                                </a></li>
                                        @endif
                                        @if(Sentinel::hasAccess('collateral.update'))
                                            <li><a href="{{ url('collateral/'.$key->id.'/edit') }}"><i
                                                            class="fa fa-edit"></i> {{ trans('general.edit') }} </a>
                                            </li>
                                        @endif
                                        @if(Sentinel::hasAccess('collateral.delete'))
                                            <li><a href="{{ url('collateral/'.$key->id.'/delete') }}"
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
            "order": [[6, "desc"]],
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

@extends('layouts.master')
@section('title'){{trans_choice('general.loan',1)}} {{trans_choice('general.application',2)}}
@endsection
@section('content')
    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title">{{trans_choice('general.loan',1)}} {{trans_choice('general.application',2)}}</h3>

            <div class="box-tools pull-right">

            </div>
        </div>
        <div class="box-body table-responsive">
            <table id="data-table" class="table table-bordered table-striped table-condensed table-hover">
                <thead>
                <tr style="background-color: #D1F9FF">
                    <th>{{trans_choice('general.borrower',1)}}</th>
                    <th>#</th>
                    <th>{{trans_choice('general.product',1)}}</th>
                    <th>{{trans_choice('general.amount',1)}}</th>
                    <th>{{trans_choice('general.status',1)}}</th>
                    <th>{{trans_choice('general.guarantor',2)}}</th>
                    <th>{{trans_choice('general.note',2)}}</th>
                    <th>{{trans_choice('general.date',1)}}</th>
                    <th>{{ trans_choice('general.action',1) }}</th>
                </tr>
                </thead>
                <tbody>
                @foreach($data as $key)
                    <tr>
                        <td>
                            @if(!empty($key->borrower))
                                <a href="{{url('borrower/'.$key->borrower_id.'/show')}}">{{$key->borrower->first_name}} {{$key->borrower->last_name}}</a>
                            @else
                                <span class="label label-danger">{{trans_choice('general.broken',1)}} <i
                                            class="fa fa-exclamation-triangle"></i> </span>
                            @endif
                        </td>
                        <td>{{$key->id}}</td>
                        <td>
                            @if(!empty($key->loan_product))
                                <a href="{{url('loan/loan_product/'.$key->loan_product_id.'/edit')}}">{{$key->loan_product->name}}</a>
                            @else
                                <span class="label label-danger">{{trans_choice('general.broken',1)}} <i
                                            class="fa fa-exclamation-triangle"></i> </span>
                            @endif
                        </td>
                        <td>{{round($key->amount,2)}}</td>
                        <td>
                            @if($key->status=='declined')
                                <span class="label label-danger">{{trans_choice('general.declined',1)}}</span>
                            @endif
                            @if($key->status=='approved')
                                <span class="label label-success">{{trans_choice('general.approved',1)}}</span>
                            @endif
                            @if($key->status=='pending')
                                <span class="label label-warning">{{trans_choice('general.pending',1)}}</span>
                            @endif
                        </td>
                        <td>
                            @foreach($key->guarantors as $guarantor)
                                @if(!empty($guarantor->guarantee))
                                    <a href="{{url('borrower/'.$guarantor->guarantor_id.'/show')}}">{{$guarantor->guarantee->first_name}} {{$guarantor->guarantee->last_name}}
                                        -{{$guarantor->amount}}</a><br>
                                @endif
                            @endforeach
                        </td>
                        <td>{!! $key->notes !!}</td>
                        <td>{!! $key->created_at !!}</td>
                        <td>
                            <div class="btn-group">
                                <button type="button" class="btn btn-info btn-xs dropdown-toggle"
                                        data-toggle="dropdown" aria-expanded="false">
                                    {{ trans('general.choose') }} <span class="caret"></span>
                                    <span class="sr-only">Toggle Dropdown</span>
                                </button>
                                <ul class="dropdown-menu" role="menu">

                                    @if($key->status=='pending' || $key->status=="declined")
                                        @if(Sentinel::hasAccess('loans.create'))
                                            <li><a href="{{ url('loan/loan_application/'.$key->id.'/approve') }}"><i
                                                            class="fa fa-check"></i> {{ trans('general.approve') }} </a>
                                            </li>
                                        @endif
                                    @endif
                                    @if( $key->status=="pending")
                                        @if(Sentinel::hasAccess('loans.update'))
                                            <li><a href="{{ url('loan/loan_application/'.$key->id.'/decline') }}"><i
                                                            class="fa fa-minus-circle"></i> {{ trans('general.decline') }}
                                                </a>
                                            </li>
                                        @endif
                                    @endif
                                    @if(Sentinel::hasAccess('loans.delete'))
                                        <li><a href="{{ url('loan/loan_application/'.$key->id.'/delete') }}"
                                               class="delete"><i
                                                        class="fa fa-trash"></i> {{ trans('general.delete') }} </a></li>
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
            "displayLength": 25,
            "searching": true,
            "ordering": true,
            "info": true,
            "autoWidth": true,
            "order": [[7, "desc"]],
            "columnDefs": [
                {"orderable": false, "targets": [8]}
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

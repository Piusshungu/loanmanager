@extends('layouts.master')
@section('title'){{trans_choice('general.repayment',2)}}
@endsection
@section('content')
<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">{{trans_choice('general.repayment',2)}}</h3>

        <div class="box-tools pull-right">

        </div>
    </div>
    <div class="box-body">
        <div class="table-responsive">
            <table id="view-repayments"
                   class="table table-bordered table-condensed table-hover dataTable no-footer">
                <thead>
                <tr style="background-color: #D1F9FF" role="row">
                    <th>
                        {{trans_choice('general.collection',1)}} {{trans_choice('general.date',1)}}
                    </th>
                    <th>
                        {{trans_choice('general.borrower',1)}}
                    </th>
                    <th>
                        {{trans_choice('general.collected_by',1)}}
                    </th>
                    <th>
                        {{trans_choice('general.method',1)}}
                    </th>
                    <th>
                        {{trans_choice('general.amount',1)}}
                    </th>
                    <th>
                        {{trans_choice('general.action',1)}}
                    </th>
                    <th>
                        {{trans_choice('general.receipt',1)}}
                    </th>
                </tr>
                </thead>
                <tbody>
                @foreach($data as $key)
                    <tr>
                        <td>{{$key->collection_date}}</td>
                        <td>
                            @if(!empty($key->borrower))
                                <a href="{{url('borrower/'.$key->borrower->id.'/show')}}"> {{$key->borrower->first_name}} {{$key->borrower->last_name}}</a>
                            @endif
                        </td>
                        <td>
                            @if(!empty($key->user))
                                {{$key->user->first_name}} {{$key->user->last_name}}
                            @endif
                        </td>
                        <td>
                            @if(!empty($key->loan_repayment_method))
                                {{$key->loan_repayment_method->name}}
                            @endif
                        </td>
                        <td>{{number_format($key->amount,2)}}</td>
                        <td>
                            <div class="btn-group-horizontal">
                                @if(Sentinel::hasAccess('repayments.update'))
                                    <a type="button" class="btn bg-white btn-xs text-bold"
                                       href="{{url('loan/'.$key->loan_id.'/repayment/'.$key->id.'/edit')}}">{{trans_choice('general.edit',1)}}</a>
                                @endif
                                @if(Sentinel::hasAccess('repayments.delete'))
                                    <a type="button"
                                       class="btn bg-white btn-xs text-bold deletePayment"
                                       href="{{url('loan/'.$key->loan_id.'/repayment/'.$key->id.'/delete')}}"
                                            >{{trans_choice('general.delete',1)}}</a>
                                @endif
                            </div>
                        </td>
                        <td>
                            <a type="button" class="btn btn-default btn-xs"
                               href="{{url('loan/'.$key->loan_id.'/repayment/'.$key->id.'/print')}}"
                               target="_blank">
                                                                <span class="glyphicon glyphicon-print"
                                                                      aria-hidden="true"></span>
                            </a>
                            <a type="button" class="btn btn-default btn-xs"
                               href="{{url('loan/'.$key->loan_id.'/repayment/'.$key->id.'/pdf')}}"
                               target="_blank">
                                                                <span class="glyphicon glyphicon-file"
                                                                      aria-hidden="true"></span>
                            </a></td>
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
    <script>
        $(document).ready(function () {
            $('.deletePayment').on('click', function (e) {
                e.preventDefault();
                var href = $(this).attr('href');
                swal({
                    title: '{{trans_choice('general.are_you_sure',1)}}',
                    text: '{{trans_choice('general.delete_payment_msg',1)}}',
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: '{{trans_choice('general.ok',1)}}',
                    cancelButtonText: '{{trans_choice('general.cancel',1)}}'
                }).then(function () {
                    window.location = href;
                })
            });
        });
    </script>
    <script src="{{ asset('assets/plugins/datatable/media/js/jquery.dataTables.js')}}"></script>
    <script src="{{ asset('assets/plugins/datatable/media/js/dataTables.bootstrap.js')}}"></script>
    <script src="{{ asset('assets/plugins/datatable/extensions/Buttons/js/dataTables.buttons.min.js')}}"></script>
    <script src="{{ asset('assets/plugins/datatable/extensions/Buttons/js/buttons.html5.min.js')}}"></script>
    <script src="{{ asset('assets/plugins/datatable/extensions/Buttons/js/buttons.print.min.js')}}"></script>
    <script src="{{ asset('assets/plugins/datatable/extensions/Responsive/js/dataTables.responsive.min.js')}}"></script>
    <script src="{{ asset('assets/plugins/datatable/extensions/Buttons/js/buttons.colVis.min.js')}}"></script>
    <script>

        $('#view-repayments').DataTable({
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
                {"orderable": false, "targets": [5, 6]}
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

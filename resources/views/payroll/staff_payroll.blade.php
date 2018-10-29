@extends('layouts.master')
@section('title'){{$user->first_name}} {{$user->last_name}}-{{trans_choice('general.payroll',1)}}
@endsection
@section('content')
    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title">{{$user->first_name}} {{$user->last_name}}-{{trans_choice('general.payroll',1)}}</h3>

            <div class="box-tools pull-right">

            </div>
        </div>
        <div class="box-body">
            <div class="table-responsive">
                <table id="view-repayments"
                       class="table table-bordered table-condensed table-hover dataTable no-footer">
                    <thead>
                    <tr style="background-color: #D1F9FF" role="row">
                        <th>{{trans_choice('general.pay',1)}} {{trans_choice('general.date',1)}}</th>
                        <th>
                            {{trans_choice('general.gross',1)}} {{trans_choice('general.amount',1)}}
                        </th>
                        <th>
                            {{trans_choice('general.total',1)}} {{trans_choice('general.deduction',2)}}
                        </th>
                        <th>
                            {{trans_choice('general.net',1)}} {{trans_choice('general.amount',1)}}
                        </th>
                        <th>
                            {{trans_choice('general.paid',1)}} {{trans_choice('general.amount',1)}}
                        </th>
                        <th>{{trans_choice('general.recurring',1)}}</th>
                        <th>
                            {{trans_choice('general.payslip',1)}}
                        </th>
                        <th>
                            {{trans_choice('general.action',1)}}
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach($user->payroll as $key)
                        <tr>
                            <td>
                                {{$key->date}}
                            </td>
                            <td>
                                {{\App\Helpers\GeneralHelper::single_payroll_total_pay($key->id)}}
                            </td>
                            <td>
                                {{\App\Helpers\GeneralHelper::single_payroll_total_deductions($key->id)}}
                            </td>
                            <td>
                                {{\App\Helpers\GeneralHelper::single_payroll_total_pay($key->id)-\App\Helpers\GeneralHelper::single_payroll_total_deductions($key->id)}}
                            </td>
                            <td>{{$key->paid_amount}}</td>
                            <td>
                                @if($key->recurring==1)
                                    {{trans_choice('general.yes',1)}}
                                @else
                                    {{trans_choice('general.no',1)}}
                                @endif
                            </td>
                            <td>
                                <div class="btn-group-horizontal">
                                    <a type="button" class="btn-xs bg-blue"
                                       href="{{url('payroll/'.$key->id.'/payslip')}}"
                                       target="_blank">{{trans_choice('general.generate_payslip',1)}}</a>
                                </div>
                            </td>
                            <td>
                                <div class="btn-group-horizontal">
                                    @if(Sentinel::hasAccess('payroll.delete'))
                                        <a type="button" class="btn-xs bg-purple"
                                           href="{{url('payroll/'.$key->id.'/edit')}}">{{trans_choice('general.view_modify',1)}}</a><a
                                                type="button" class="btn-xs bg-navy margin delete"
                                                href="{{url('payroll/'.$key->id.'/delete')}}">{{trans_choice('general.delete',1)}}</a>
                                    @endif
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
    <script>
        $(document).ready(function () {
            $('.deletePayroll').on('click', function (e) {
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
    <script src="{{ asset('assets/plugins/datatable/media/js/jquery.dataTables.js')}}"></script>
    <script src="{{ asset('assets/plugins/datatable/media/js/dataTables.bootstrap.js')}}"></script>
    <script src="{{ asset('assets/plugins/datatable/extensions/Buttons/js/dataTables.buttons.min.js')}}"></script>
    <script src="{{ asset('assets/plugins/datatable/extensions/Buttons/js/buttons.html5.min.js')}}"></script>
    <script src="{{ asset('assets/plugins/datatable/extensions/Buttons/js/buttons.print.min.js')}}"></script>
    <script src="{{ asset('assets/plugins/datatable/extensions/Responsive/js/dataTables.responsive.min.js')}}"></script>
    <script src="{{ asset('assets/plugins/datatable/extensions/Buttons/js/buttons.colVis.min.js')}}"></script>
    <script>

        $('#view-repayments').DataTable({
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
                {"orderable": false, "targets": [6, 7]}
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

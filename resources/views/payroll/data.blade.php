@extends('layouts.master')
@section('title'){{trans_choice('general.payroll',1)}}
@endsection
@section('content')
    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title">{{trans_choice('general.payroll',1)}}</h3>

            <div class="box-tools pull-right">

            </div>
        </div>
        <div class="box-body">
            <div class="table-responsive">
                <table id="view-repayments"
                       class="table table-bordered table-condensed table-hover no-footer">
                    <thead>
                    <tr style="background-color: #D1F9FF" role="row">
                        <th>
                            {{trans_choice('general.staff',1)}}
                        </th>
                        <th>{{trans_choice('general.last_pay_date',1)}}</th>
                        <th>
                            {{trans_choice('general.last_gross_amount',1)}}
                        </th>
                        <th>
                            {{trans_choice('general.last_total_deductions',1)}}
                        </th>
                        <th>
                            {{trans_choice('general.last_paid_amount',1)}}
                        </th>
                        <th>
                            {{trans_choice('general.last_payslip',1)}}
                        </th>
                        <th>
                            {{trans_choice('general.action',1)}}
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach($data as $key)
                        <tr>
                            <td>{{$key->first_name}} {{$key->last_name}}</td>
                            @if(!empty(\App\Models\Payroll::where('user_id',$key->id)->orderBy('created_at','desc')->first()))
                                <td>
                                    {{\App\Models\Payroll::where('user_id',$key->id)->orderBy('created_at','desc')->first()->date}}
                                </td>
                                <td>
                                    {{\App\Helpers\GeneralHelper::single_payroll_total_pay(\App\Models\Payroll::where('user_id',$key->id)->orderBy('created_at','desc')->first()->id)}}
                                </td>
                                <td>
                                    {{\App\Helpers\GeneralHelper::single_payroll_total_deductions(\App\Models\Payroll::where('user_id',$key->id)->orderBy('created_at','desc')->first()->id)}}
                                </td>
                                <td>{{\App\Models\Payroll::where('user_id',$key->id)->orderBy('created_at','desc')->first()->paid_amount}}</td>
                                <td>
                                    <div class="btn-group-horizontal">
                                        <a type="button" class="btn-xs bg-blue"
                                           href="{{url('payroll/'.\App\Models\Payroll::where('user_id',$key->id)->orderBy('created_at','desc')->first()->id.'/payslip')}}"
                                           target="_blank">{{trans_choice('general.generate_payslip',1)}}</a>
                                    </div>
                                </td>
                                <td>
                                    <div class="btn-group-horizontal">
                                        @if(Sentinel::hasAccess('payroll.create'))
                                            <a type="button" class="btn-xs bg-navy"
                                               href="{{url('payroll/'.$key->id.'/data')}}">{{trans_choice('general.view_all_payroll',1)}}</a>
                                        @endif
                                    </div>
                                </td>
                            @else
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td>
                                    <div class="btn-group-horizontal">
                                        @if(Sentinel::hasAccess('payroll.create'))
                                            <a type="button" class="btn-xs bg-navy"
                                               href="{{url('payroll/'.$key->id.'/data')}}">{{trans_choice('general.view_all_payroll',1)}}</a>
                                        @endif
                                    </div>
                                </td>
                            @endif
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
                    title: 'Are you sure?',
                    text: 'If you delete a payment, a fully paid loan may change status to open.',
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

@extends('layouts.master')
@section('title')
    {{ $user->first_name }} {{ $user->last_name }}
@endsection
@section('content')
    <div class="row">
        <div class="col-md-6">
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">{{ $user->first_name }} {{ $user->last_name }}</h3>
                    <div class="box-tools pull-right">

                    </div>
                </div>
                <div class="box-body">
                    <table class="table table-responsive table-hover">
                        <tr>
                            <td>{{ trans('general.gender') }}</td>
                            <td>{{ $user->gender }}</td>
                        </tr>
                        <tr>
                            <td>{{ trans_choice('general.email',1) }}</td>
                            <td>{{ $user->email }}</td>
                        </tr>
                        <tr>
                            <td>{{ trans('general.phone') }}</td>
                            <td>{{ $user->phone }}</td>
                        </tr>
                        <tr>
                            <td>{{ trans('general.address') }}</td>
                            <td>{!!   $user->address !!}</td>
                        </tr>
                        <tr>
                            <td>{{ trans('general.created_at') }}</td>
                            <td>{{ $user->created_at }}</td>
                        </tr>
                        <tr>
                            <td>{{ trans('general.updated_at') }}</td>
                            <td>{{ $user->updated_at }}</td>
                        </tr>
                        <tr>
                            <td>{{ trans('general.last_login') }}</td>
                            <td>{{ $user->last_login }}</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">{{ trans_choice('general.note',2) }}</h3>
                    <div class="box-tools pull-right">

                    </div>
                </div>
                <div class="box-body">
                    {!!   $user->notes !!}
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">{{ trans_choice('general.payroll',1) }}</h3>
                    <div class="box-tools pull-right">

                    </div>
                </div>
                <div class="box-body table-responsive">
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
                                        <a type="button" class="btn-xs bg-purple" href="{{url('payroll/'.$key->id.'/edit')}}">{{trans_choice('general.view_modify',1)}}</a><a
                                                type="button" class="btn-xs bg-navy margin delete"
                                                href="{{url('payroll/'.$key->id.'/delete')}}">{{trans_choice('general.delete',1)}}</a>
                                    </div>
                                </td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

@endsection
@section('footer-scripts')
    <script src="{{ asset('assets/plugins/datatables/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('assets/plugins/datatables/dataTables.bootstrap.min.js') }}"></script>
    <script>
        $('.data-table').DataTable({
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

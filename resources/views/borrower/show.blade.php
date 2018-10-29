@extends('layouts.master')
@section('title')
    {{trans_choice('general.borrower',1)}} {{trans_choice('general.detail',2)}}
@endsection
@section('content')
    <div class="box box-widget">
        <div class="box-header with-border">
            <div class="row">
                <div class="col-sm-3">
                    <div class="user-block">
                        @if(!empty($borrower->photo))
                            <a href="{{asset('uploads/'.$borrower->photo)}}" class="fancybox"> <img class="img-circle"
                                 src="{{asset('uploads/'.$borrower->photo)}}"
                                 alt="user image"/></a>
                        @else
                            <img class="img-circle"
                                 src="{{asset('assets/dist/img/user.png')}}"
                                 alt="user image"/>
                        @endif
                        <span class="username">
                                {{$borrower->title}}
                            . {{$borrower->first_name}} {{$borrower->last_name}}
                            </span>
                        <span class="description" style="font-size:13px; color:#000000">{{$borrower->unique_number}}
                            <br>
                                <a href="{{url('borrower/'.$borrower->id.'/edit')}}">{{trans_choice('general.edit',1)}}</a><br>
                            {{$borrower->business_name}}, {{$borrower->working_status}}
                            <br>{{$borrower->gender}}
                            , {{date("Y-m-d")-$borrower->dob}} {{trans_choice('general.year',2)}}
                            </span>
                    </div>
                    <!-- /.user-block -->
                </div>
                <!-- /.col -->
                <div class="col-sm-3">
                    <ul class="list-unstyled">
                        <li><b>{{trans_choice('general.address',1)}}:</b> {{$borrower->address}}</li>
                        <li><b>{{trans_choice('general.city',2)}}:</b> {{$borrower->city}}</li>
                        <li><b>{{trans_choice('general.state',2)}}:</b> {{$borrower->state}}</li>
                        <li><b>{{trans_choice('general.zip',2)}}:</b> {{$borrower->zip}}</li>
                        <li><b>{{trans_choice('general.blacklisted',1)}}:</b>
                            @if($borrower->blacklisted==1)
                                <span class="label label-danger">{{trans_choice('general.yes',1)}}</span>
                            @else
                                <span class="label label-success">{{trans_choice('general.no',1)}}</span>
                            @endif
                        </li>
                    </ul>
                </div>
                <div class="col-sm-3">
                    <ul class="list-unstyled">
                        <li><b>{{trans_choice('general.phone',1)}}:</b> {{$borrower->phone}}</li>
                        <li><b>{{trans_choice('general.email',1)}}:</b> <a
                                    onclick="javascript:window.open('mailto:{{$borrower->email}}', 'mail');event.preventDefault()"
                                    href="mailto:{{$borrower->email}}">{{$borrower->email}}</a>

                            <div class="btn-group-horizontal"><a type="button" class="btn-xs bg-red"
                                                                 href="{{url('communication/email/create?borrower_id='.$borrower->id)}}">{{trans_choice('general.send',1)}}
                                    {{trans_choice('general.email',1)}}</a></div>
                        </li>
                        <li><b>{{trans_choice('general.mobile',1)}}:</b> {{$borrower->mobile}}
                            <div class="btn-group-horizontal"><a type="button" class="btn-xs bg-red"
                                                                 href="{{url('communication/sms/create?borrower_id='.$borrower->id)}}">{{trans_choice('general.send',1)}}
                                    {{trans_choice('general.sms',1)}}</a></div>
                        </li>

                    </ul>
                </div>
                <div class="col-sm-3">
                    <ul class="list-unstyled">
                        <li><b>{{trans_choice('general.custom_field',2)}}</b></li>
                        @foreach($custom_fields as $key)
                            <li>
                                @if(!empty($key->custom_field))
                                    <strong>{{$key->custom_field->name}}:</strong>
                                @endif
                                {{$key->name}}
                            </li>
                        @endforeach

                    </ul>
                </div>
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-sm-9">
                    <div class="btn-group-horizontal"><a type="button" class="btn bg-olive margin"
                                                         href="{{url('loan/create?borrower_id='.$borrower->id)}}">{{trans_choice('general.add',1)}}
                            {{trans_choice('general.loan',1)}}</a></div>
                </div>
                <div class="col-sm-3">
                    <div class="pull-left">
                        <div class="input-group-btn">
                            <button type="button" class="btn btn-info dropdown-toggle margin" data-toggle="dropdown">
                                {{trans_choice('general.borrower',1)}} {{trans_choice('general.statement',1)}}
                                <span class="fa fa-caret-down"></span></button>
                            <ul class="dropdown-menu" role="menu">
                                <li>
                                    <a href="{{url('loan/'.$borrower->id.'/borrower_statement/print')}}"
                                       target="_blank">{{trans_choice('general.print',1)}} {{trans_choice('general.statement',1)}}</a>
                                </li>
                                <li>
                                    <a href="{{url('loan/'.$borrower->id.'/borrower_statement/pdf')}}"
                                       target="_blank">{{trans_choice('general.download',1)}} {{trans_choice('general.in',1)}} {{trans_choice('general.pdf',1)}}</a>
                                </li>
                                <li>
                                    <a href="{{url('loan/'.$borrower->id.'/borrower_statement/email')}}">{{trans_choice('general.email',1)}}
                                        {{trans_choice('general.statement',1)}}</a></li>
                            <!--<li>
                                    <a href="{{url('loan/'.$borrower->id.'/borrower_statement/excel')}}"
                                       target="_blank">{{trans_choice('general.download',1)}} {{trans_choice('general.in',1)}} {{trans_choice('general.excel',1)}}</a></li>

                                <li>
                                    <a href="{{url('loan/'.$borrower->id.'/borrower_statement/csv')}}"
                                       target="_blank">{{trans_choice('general.download',1)}} {{trans_choice('general.in',1)}} {{trans_choice('general.csv',1)}}</a></li>-->
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="box box-info">
        <div class="box-header with-border">
            <h3 class="box-title">{{trans_choice('general.loan',2)}}</h3>

            <div class="box-tools pull-right">

            </div>
        </div>
        <div class="box-body table-responsive ">
            <table id="data-table" class="table table-bordered table-condensed table-hover">
                <thead>
                <tr style="background-color: #D1F9FF">
                    <th>#</th>
                    <th>{{trans_choice('general.principal',1)}}</th>
                    <th>{{trans_choice('general.released',1)}}</th>
                    <th>{{trans_choice('general.interest',1)}}%</th>
                    <th>{{trans_choice('general.due',1)}}</th>
                    <th>{{trans_choice('general.paid',1)}}</th>
                    <th>{{trans_choice('general.balance',1)}}</th>
                    <th>{{trans_choice('general.status',1)}}</th>
                    <th>{{ trans_choice('general.action',1) }}</th>
                </tr>
                </thead>
                <tbody>
                @foreach($borrower->loans as $key)
                    <tr>

                        <td>{{$key->id}}</td>
                        <td>{{round($key->principal,2)}}</td>
                        <td>{{$key->release_date}}</td>
                        <td>
                            {{round($key->interest_rate,2)}}%/{{$key->interest_period}}
                        </td>
                        <td>{{round(\App\Helpers\GeneralHelper::loan_total_due_amount($key->id),2)}}</td>
                        <td>{{round(\App\Helpers\GeneralHelper::loan_total_paid($key->id),2)}}</td>
                        <td>{{round(\App\Helpers\GeneralHelper::loan_total_balance($key->id),2)}}</td>
                        <td>
                            @if($key->maturity_date<date("Y-m-d") && \App\Helpers\GeneralHelper::loan_total_balance($key->id)>0)
                                <span class="label label-danger">{{trans_choice('general.past_maturity',1)}}</span>
                            @else
                                @if($key->status=='pending')
                                    <span class="label label-warning">{{trans_choice('general.pending',1)}} {{trans_choice('general.approval',1)}}</span>
                                @endif
                                @if($key->status=='approved')
                                    <span class="label label-info">{{trans_choice('general.awaiting',1)}} {{trans_choice('general.disbursement',1)}}</span>
                                @endif
                                @if($key->status=='disbursed')
                                    <span class="label label-info">{{trans_choice('general.active',1)}}</span>
                                @endif
                                @if($key->status=='declined')
                                    <span class="label label-danger">{{trans_choice('general.declined',1)}}</span>
                                @endif
                                @if($key->status=='withdrawn')
                                    <span class="label label-danger">{{trans_choice('general.withdrawn',1)}}</span>
                                @endif
                                @if($key->status=='written_off')
                                    <span class="label label-danger">{{trans_choice('general.written_off',1)}}</span>
                                @endif
                                @if($key->status=='closed')
                                    <span class="label label-success">{{trans_choice('general.closed',1)}}</span>
                                @endif
                                @if($key->status=='pending_reschedule')
                                    <span class="label label-warning">{{trans_choice('general.pending',1)}} {{trans_choice('general.reschedule',1)}}</span>
                                @endif
                                @if($key->status=='rescheduled')
                                    <span class="label label-info">{{trans_choice('general.rescheduled',1)}}</span>
                                @endif
                            @endif
                        </td>
                        <td>
                            <div class="btn-group">
                                <button type="button" class="btn btn-info btn-flat dropdown-toggle"
                                        data-toggle="dropdown" aria-expanded="false">
                                    {{ trans('general.choose') }} <span class="caret"></span>
                                    <span class="sr-only">Toggle Dropdown</span>
                                </button>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="{{ url('loan/'.$key->id.'/show') }}"><i
                                                    class="fa fa-search"></i> {{ trans_choice('general.detail',2) }}
                                        </a></li>
                                    <li><a href="{{ url('loan/'.$key->id.'/edit') }}"><i
                                                    class="fa fa-edit"></i> {{ trans('general.edit') }} </a></li>
                                    <li><a href="{{ url('loan/'.$key->id.'/delete') }}"
                                           data-toggle="confirmation"><i
                                                    class="fa fa-trash"></i> {{ trans('general.delete') }} </a></li>
                                </ul>
                            </div>
                        </td>
                    </tr>
                @endforeach
                </tbody>
            </table>
        </div>
    </div>
    <div class="box box-info">
        <div class="box-header with-border">
            <h3 class="box-title">{{trans_choice('general.repayment',2)}}</h3>

            <div class="box-tools pull-right">

            </div>
        </div>
        <div class="box-body table-responsive">
            <table id="view-repayments"
                   class="table table-bordered table-condensed table-hover dataTable no-footer">
                <thead>
                <tr style="background-color: #D1F9FF" role="row">
                    <th>
                        {{trans_choice('general.collection',1)}} {{trans_choice('general.date',1)}}
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
                @foreach($borrower->payments as $key)


                    <tr>
                        <td>{{$key->collection_date}}</td>
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
                        <td>${{round($key->amount,2)}}</td>
                        <td>
                            <div class="btn-group-horizontal">
                                <a type="button" class="btn bg-white btn-xs text-bold"
                                   href="{{url('loan/'.$key->loan_id.'/repayment/'.$key->id.'/edit')}}">{{trans_choice('general.edit',1)}}</a>
                                <a type="button"
                                   class="btn bg-white btn-xs text-bold deletePayment"
                                   href="{{url('loan/'.$key->loan_id.'/repayment/'.$key->id.'/delete')}}"
                                >{{trans_choice('general.delete',1)}}</a>
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
            dom: 'frtip',
            "paging": true,
            "lengthChange": true,
            "displayLength": 15,
            "searching": true,
            "ordering": true,
            "info": true,
            "autoWidth": true,
            "order": [[2, "asc"]],
            "columnDefs": [
                {"orderable": false, "targets": [0, 8]}
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
                {"orderable": false, "targets": [4, 5]}
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
    <script>
        $(document).ready(function () {
            $('.deletePayment').on('click', function (e) {
                e.preventDefault();
                var href = $(this).attr('href');
                swal({
                    title: '{{trans_choice('general.are_you_sure',1)}}',
                    text: 'If you delete a payment, a fully paid loan may change status to open.',
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
@endsection
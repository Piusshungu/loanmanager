@extends('layouts.master')
@section('title')
    {{trans_choice('general.saving',2)}} {{trans_choice('general.detail',2)}}
@endsection
@section('content')
    <div class="box box-widget">
        <div class="box-header with-border">
            <div class="row">
                <div class="col-sm-3">
                    <div class="user-block">
                        <img class="img-circle"
                             src="{{asset('assets/dist/img/user.png')}}"
                             alt="user image"/>
                            <span class="username">
                                {{$saving->borrower->title}}
                                . {{$saving->borrower->first_name}} {{$saving->borrower->last_name}}
                            </span>
                            <span class="description" style="font-size:13px; color:#000000">{{$saving->borrower->unique_number}}
                                <br>
                                @if(Sentinel::hasAccess('borrowers.create'))
                                    <a href="{{url('borrower/'.$saving->borrower->id.'/edit')}}">{{trans_choice('general.edit',1)}}</a>
                                    <br>
                                @endif
                                {{$saving->borrower->business_name}}, {{$saving->borrower->working_status}}
                                <br>{{$saving->borrower->gender}}
                                , {{date("Y-m-d")-$saving->borrower->dob}} {{trans_choice('general.year',2)}}
                            </span>
                    </div>
                    <!-- /.user-block -->
                </div>
                <!-- /.col -->
                <div class="col-sm-3">
                    <ul class="list-unstyled">
                        <li><b>{{trans_choice('general.address',1)}}:</b> {{$saving->borrower->address}}</li>
                        <li><b>{{trans_choice('general.city',1)}}:</b> {{$saving->borrower->city}}</li>
                        <li><b>{{trans_choice('general.state',1)}}:</b> {{$saving->borrower->state}}</li>
                        <li><b>{{trans_choice('general.zip',1)}}:</b> {{$saving->borrower->zip}}</li>

                        <a data-toggle="collapse" data-parent="#accordion" href="#viewFiles">
                            {{trans_choice('general.view',1)}} {{trans_choice('general.borrower',1)}} {{trans_choice('general.file',2)}}
                        </a>

                        <div id="viewFiles" class="panel-collapse collapse">
                            <div class="box-body">
                                <ul class="no-margin" style="font-size:12px; padding-left:10px">

                                    @foreach(unserialize($saving->borrower->files) as $key=>$value)
                                        <li><a href="{!!asset('uploads/'.$value)!!}"
                                               target="_blank">{!!  $value!!}</a></li>
                                    @endforeach
                                </ul>
                            </div>
                        </div>
                    </ul>
                </div>
                <div class="col-sm-3">
                    <ul class="list-unstyled">
                        <li><b>{{trans_choice('general.phone',1)}}:</b> {{$saving->borrower->phone}}</li>
                        <li>
                            <b>{{trans_choice('general.email',1)}}:</b>
                            <a
                                    onclick="javascript:window.open('mailto:{{$saving->borrower->email}}', 'mail');event.preventDefault()"
                                    href="mailto:{{$saving->borrower->email}}">{{$saving->borrower->email}}</a>
                            @if(Sentinel::hasAccess('communication.create'))
                                <div class="btn-group-horizontal"><a type="button" class="btn-xs bg-red"
                                                                     href="{{url('communication/email/create?borrower_id='.$saving->borrower->id)}}">{{trans_choice('general.send',1)}}
                                        {{trans_choice('general.email',1)}}</a></div>
                            @endif
                        </li>
                        <li><b>Mobile:</b> {{$saving->borrower->mobile}}
                            @if(Sentinel::hasAccess('communication.create'))
                                <div class="btn-group-horizontal"><a type="button" class="btn-xs bg-red"
                                                                     href="{{url('communication/sms/create?borrower_id='.$saving->borrower->id)}}">{{trans_choice('general.send',1)}}
                                        {{trans_choice('general.sms',1)}}</a></div>
                            @endif
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
                    <div class="btn-group-horizontal">
                        @if(Sentinel::hasAccess('loan.create'))
                            <a type="button" class="btn bg-olive margin"
                               href="{{url('loan/create?borrower_id='.$saving->borrower_id)}}">{{trans_choice('general.add',1)}}
                                {{trans_choice('general.loan',1)}}</a>
                        @endif
                        <a type="button" class="btn bg-navy margin"
                           href="{{url('loan/data')}}">{{trans_choice('general.view',1)}}
                            {{trans_choice('general.loan',2)}}</a>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="pull-left">
                        <div class="input-group-btn">
                            <button type="button" class="btn btn-info dropdown-toggle margin" data-toggle="dropdown">
                                {{trans_choice('general.borrower',1)}} {{trans_choice('general.statement',1)}}
                                <span class="fa fa-caret-down"></span></button>
                            <ul class="dropdown-menu" role="menu">

                                <li>
                                    <a href="{{url('loan/'.$saving->borrower_id.'/borrower_statement/print')}}"
                                       target="_blank">{{trans_choice('general.print',1)}} {{trans_choice('general.statement',1)}}</a>
                                </li>
                                <li>
                                    <a href="{{url('loan/'.$saving->borrower_id.'/borrower_statement/pdf')}}"
                                       target="_blank">{{trans_choice('general.download',1)}} {{trans_choice('general.in',1)}} {{trans_choice('general.pdf',1)}}</a>
                                </li>
                                <li>
                                    <a href="{{url('loan/'.$saving->borrower_id.'/borrower_statement/email')}}"
                                       target="_blank">{{trans_choice('general.email',1)}} {{trans_choice('general.statement',1)}}</a>
                                </li>
                                <li>
                                    <!--<li>
                                    <a href="{{url('loan/'.$saving->borrower_id.'/borrower_statement/excel')}}"
                                       target="_blank">Download in Excel</a></li>

                                <li>
                                    <a href="{{url('loan/'.$saving->borrower_id.'/borrower_statement/csv')}}"
                                       target="_blank">Download in CSV</a></li>-->
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="box box-info">
        <div class="box-body table-responsive no-padding">
            <table id="" class="table table-bordered table-condensed table-hover">
                <thead>
                <tr style="background-color: #FFF8F2">
                    <th>{{trans_choice('general.account',1)}}#</th>
                    <th>{{trans_choice('general.product',1)}}</th>
                    <th>{{trans_choice('general.minimum',1)}} {{trans_choice('general.balance',1)}}</th>
                    <th>{{trans_choice('general.interest_rate_per_annum',1)}}</th>
                    <th>{{trans_choice('general.interest_posting_frequency',1)}}</th>
                    <th>{{trans_choice('general.current',1)}} {{trans_choice('general.balance',1)}}</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>{{$saving->id}}</td>
                    <td>
                        @if(!empty($saving->savings_product))
                            {{ $saving->savings_product->name }}
                        @endif
                    </td>
                    <td>{{$saving->savings_product->minimum_balance}}</td>
                    <td>{{$saving->savings_product->interest_rate}}</td>
                    <td>
                        @if($saving->savings_product->interest_posting==1)
                            {{trans_choice('general.every_1_month',1)}}
                        @endif
                        @if($saving->savings_product->interest_posting==2)
                            {{trans_choice('general.every_2_month',1)}}
                        @endif
                        @if($saving->savings_product->interest_posting==3)
                            {{trans_choice('general.every_3_month',1)}}
                        @endif
                        @if($saving->savings_product->interest_posting==4)
                            {{trans_choice('general.every_4_month',1)}}
                        @endif
                        @if($saving->savings_product->interest_posting==5)
                            {{trans_choice('general.every_6_month',1)}}
                        @endif
                        @if($saving->savings_product->interest_posting==6)
                            {{trans_choice('general.every_12_month',1)}}

                        @endif
                    </td>
                    <td>{{number_format(\App\Helpers\GeneralHelper::savings_account_balance($saving->id),2)}}</td>
                    <td>
                        <center>
                            <div class="btn-group-horizontal">
                                @if(Sentinel::hasAccess('savings.update'))
                                    <a type="button" class="btn bg-white btn-xs text-bold"
                                       href="{{ url('saving/'.$saving->id.'/edit') }}">{{ trans('general.edit') }}</a>
                                @endif
                                @if(Sentinel::hasAccess('savings.delete'))
                                    <a type="button" class="btn bg-white btn-xs text-bold delete"
                                       href="{{ url('saving/'.$saving->id.'/delete') }}">{{ trans('general.delete') }}</a>
                                @endif
                            </div>
                        </center>
                    </td>


                </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-4">

            <div class="input-group-btn">
                <button type="button" class="btn btn-sm btn-info margin-bottom dropdown-toggle" data-toggle="dropdown"
                        aria-expanded="false">{{trans_choice('general.saving',2)}} {{trans_choice('general.statement',1)}}
                    <span class="fa fa-caret-down"></span>
                </button>
                <ul class="dropdown-menu" role="menu">


                    <li><a href="{{url('saving/'.$saving->id.'/statement/print')}}"
                           target="_blank">{{trans_choice('general.print',1)}} {{trans_choice('general.statement',1)}}</a>
                    </li>

                    <li><a href="{{url('saving/'.$saving->id.'/statement/pdf')}}"
                           target="_blank">{{trans_choice('general.download',1)}} {{trans_choice('general.in',1)}} {{trans_choice('general.pdf',1)}}</a>
                    </li>

                </ul>
            </div>
        </div>
        <div class="col-sm-4">
            @if(Sentinel::hasAccess('savings.transactions.create'))
                <a type="button" class="btn btn-sm bg-olive margin-bottom"
                   href="{{url('saving/'.$saving->id.'/savings_transaction/create')}}">{{trans_choice('general.add',1)}} {{trans_choice('general.transaction',1)}}</a>
            @endif
        </div>
        <div class="col-sm-4">
            @if(Sentinel::hasAccess('savings.transactions.create'))
                <a type="button" class="btn btn-sm bg-blue margin-bottom"
                   href="{{url('saving/'.$saving->id.'/transfer/create')}}">{{trans_choice('general.transfer_money_to_loan_account',1)}}</a>
            @endif
        </div>
    </div>
    <div class="box box-warning">
        <div class="box-body table-responsive no-padding">
            <table class="table table-bordered table-condensed  table-hover">
                <tbody>
                <tr style="background-color: #FFF8F2">
                    <th><b>{{trans_choice('general.date',1)}}</b></th>
                    <th><b>{{trans_choice('general.transaction',1)}}</b></th>
                    <th><b>{{trans_choice('general.description',1)}}</b></th>
                    <th><b>{{trans_choice('general.staff',1)}}</b></th>
                    <th style="text-align:right"><b>{{trans_choice('general.debit',1)}}</b></th>
                    <th style="text-align:right"><b>{{trans_choice('general.credit',1)}}</b></th>
                    <th style="text-align:right"><b>{{trans_choice('general.balance',1)}}</b></th>
                    <th style="text-align:right"></th>
                </tr>
                @foreach($transactions as $key)
                    <tr>
                        <td>
                            {{$key['date']}}<br>
                            {{$key['time']}}
                        </td>
                        <td>
                            @if($key['type']=="deposit")
                                {{trans_choice('general.deposit',1)}}
                            @endif
                            @if($key['type']=="withdrawal")
                                {{trans_choice('general.withdrawal',1)}}
                            @endif
                            @if($key['type']=="bank_fees")
                                {{trans_choice('general.bank_fee',1)}}
                            @endif
                            @if($key['type']=="dividend")
                                {{trans_choice('general.dividend',1)}}
                            @endif
                            @if($key['type']=="interest")
                                {{trans_choice('general.interest',1)}}
                            @endif
                            @if($key['type']=="guarantee")
                                {{trans_choice('general.guarantee',1)}}
                            @endif
                            @if($key['type']=="guarantee_restored")
                                    {{trans_choice('general.guarantee',1)}} {{trans_choice('general.restored',1)}}
                            @endif
                        </td>
                        <td>
                            {!!  $key['notes']!!}
                        </td>
                        <td>
                            @if(!empty($key['user']))
                                {{$key['user']->first_name}} {{$key['user']->last_name}}
                            @endif
                        </td>
                        @if($key['type']=="deposit" || $key['type']=="dividend" || $key['type']=="interest"  || $key['type'] == 'guarantee_restored')
                            <td style="text-align:right">

                            </td>
                            <td style="text-align:right">
                                {{number_format($key['amount'],2)}}
                            </td>
                        @else
                            <td style="text-align:right">
                                {{number_format($key['amount'],2)}}
                            </td>
                            <td style="text-align:right">

                            </td>
                        @endif
                        <td style="text-align:right">
                            <b>{{number_format($key['balance'],2)}}</b>
                        </td>
                        <td style="text-align:right">

                            <div class="btn-group-horizontal">
                                @if(Sentinel::hasAccess('savings.transactions.update'))
                                    <a type="button" class="btn bg-white btn-xs text-bold"
                                       href="{{url('saving/'.$saving->id.'/savings_transaction/'.$key['id'].'/edit')}}">Edit</a>
                                @endif
                                @if(Sentinel::hasAccess('savings.transactions.delete'))
                                    <a type="button" class="btn bg-white btn-xs text-bold delete"
                                       href="{{url('saving/'.$saving->id.'/savings_transaction/'.$key['id'].'/delete')}}"
                                            >Delete</a>
                                @endif
                            </div>
                        </td>
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
            $('.deleteLoan').on('click', function (e) {
                e.preventDefault();
                var href = $(this).attr('href');
                swal({
                    title: '{{trans_choice('general.are_you_sure',1)}}',
                    text: '{{trans_choice('general.delete_loan_msg',1)}}',
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
            $('.deleteComment').on('click', function (e) {
                e.preventDefault();
                var href = $(this).attr('href');
                swal({
                    title: '{{trans_choice('general.are_you_sure',1)}}',
                    text: '',
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
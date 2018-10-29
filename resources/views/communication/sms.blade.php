@extends('layouts.master')
@section('title')Sent SMSs
@endsection
@section('content')
        <!-- Default box -->
<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title">Sent SMSs</h3>

        <div class="box-tools pull-right">
            @if(Sentinel::hasAccess('communication.create'))
                <a href="{{ url('communication/sms/create') }}"
                   class="btn btn-info btn-sm">Send SMSs</a>
            @endif
        </div>
    </div>
    <div class="box-body table-responsive">
        <table id="data-table" class="table table-bordered table-condensed table-hover">
            <thead>
            <tr style="background-color: #D1F9FF">
                <th>{{trans_choice('general.send_by',1)}}</th>
                <th>{{trans_choice('general.to',1)}}</th>
                <th>{{trans_choice('general.recipient',2)}}</th>
                <th>{{trans_choice('general.message',1)}}</th>
                <th>{{trans_choice('general.gateway',1)}}</th>
                <th>{{trans_choice('general.date',1)}}</th>
                <th>{{ trans_choice('general.action',1) }}</th>
            </tr>
            </thead>
            <tbody>
            @foreach($data as $key)
                <tr>
                    <td>
                        @if(!empty($key->user))
                            <a href="{{url('user/'.$key->user_id.'/show')}}">{{$key->user->first_name}} {{$key->user->last_name}}</a>
                        @else

                        @endif
                    </td>
                    <td>{{$key->send_to}}</td>
                    <td>{{$key->recipients}}</td>
                    <td>{!!$key->message!!}</td>
                    <td>{!!$key->gateway!!}</td>
                    <td>{{$key->created_at}}</td>
                    <td>
                        @if(Sentinel::hasAccess('communication.delete'))
                            <a href="{{ url('communication/sms/'.$key->id.'/delete') }}"
                               class="delete"><i
                                        class="fa fa-trash"></i> </a>
                        @endif
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
            "displayLength": 15,
            "searching": true,
            "ordering": true,
            "info": true,
            "autoWidth": true,
            "order": [[5, "desc"]],
            "columnDefs": [
                {"orderable": false, "targets": [6]}
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

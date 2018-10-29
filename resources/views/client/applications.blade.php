@extends('client.layout')
@section('title')
    {{ trans_choice('general.my',1) }} {{ trans_choice('general.application',2) }}
@endsection

@section('content')

    <div class="row">

        <div class="col-md-12">

            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">{{ trans_choice('general.my',1) }} {{ trans_choice('general.application',2) }}</h3>

                    <div class="box-tools pull-right">
                        <a href="{{ url('client/application/create') }}"
                           class="btn btn-info btn-sm">{{trans_choice('general.apply',1)}} {{trans_choice('general.loan',1)}}</a>
                    </div>
                </div>
                <div class="box-body table-responsive ">
                    <table id="data-table" class="table  table-condensed">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>{{trans_choice('general.product',1)}}</th>
                            <th>{{trans_choice('general.amount',1)}}</th>
                            <th>{{trans_choice('general.status',1)}}</th>
                            <th>{{trans_choice('general.date',1)}}</th>
                            <th>{{trans_choice('general.action',1)}}</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($data as $key)
                            <tr>

                                <td>{{$key->id}}</td>
                                <td>
                                    @if(!empty($key->loan_product))
                                        {{$key->loan_product->name}}
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
                                <td>{!! $key->created_at !!}</td>
                                <td>
                                    @if(\App\Models\Setting::where('setting_key','client_request_guarantor')->first()->setting_value==1)
                                        <a href="{{url('client/application/'.$key->id.'/show')}}"><i
                                                    class="fa fa-search"></i> </a>
                                    @endif
                                </td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function () {

        });
    </script>
@endsection

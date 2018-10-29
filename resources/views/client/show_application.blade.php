@extends('client.layout')
@section('title')
    {{ trans_choice('general.application',1) }} {{ trans_choice('general.detail',2) }}
@endsection

@section('content')
    <div class="row">
        <div class="col-md-4">
            <ul class="list-group">
                <li class="list-group-item">
                    {{trans_choice('general.product',1)}}
                    <span class="badge pull-right">
                         @if(!empty($loan_application->loan_product))
                            {{$loan_application->loan_product->name}}
                        @endif
                    </span>
                </li>
                <li class="list-group-item">
                    {{trans_choice('general.amount',1)}}
                    <span class="badge pull-right">
                        {{round($loan_application->amount,2)}}
                    </span>
                </li>
                <li class="list-group-item">
                    {{trans_choice('general.status',1)}}
                    <span class="">
                         @if($loan_application->status=='declined')
                            <span class="label label-danger pull-right">{{trans_choice('general.declined',1)}}</span>
                        @endif
                        @if($loan_application->status=='approved')
                            <span class="label label-success pull-right">{{trans_choice('general.approved',1)}}</span>
                        @endif
                        @if($loan_application->status=='pending')
                            <span class="label label-warning pull-right">{{trans_choice('general.pending',1)}}</span>
                        @endif

                    </span>
                </li>
                <li class="list-group-item">
                    {{trans_choice('general.date',1)}}
                    <span class="badge pull-right">
                         {!! $loan_application->created_at !!}
                    </span>
                </li>
            </ul>
        </div>
        <div class="col-md-8">

            <div class="box box-primary">
                <div class="box-header with-border">
                    <h3 class="box-title">{{trans_choice('general.guarantor',2)}}</h3>

                    <div class="box-tools pull-right">
                        <a href="{{ url('client/application/'.$loan_application->id.'/guarantor/create') }}"
                           class="btn btn-info btn-sm">{{trans_choice('general.add',1)}} {{trans_choice('general.guarantor',1)}}</a>
                    </div>
                </div>
                <div class="box-body table-responsive ">
                    <table id="data-table" class="table  table-condensed">
                        <thead>
                        <tr style="background-color: #D1F9FF">
                            <th>{{trans_choice('general.name',1)}}</th>
                            <th>{{trans_choice('general.status',1)}}</th>
                            <th>{{trans_choice('general.amount',1)}}</th>
                            <th>{{trans_choice('general.accepted',1)}} {{trans_choice('general.amount',1)}}</th>
                            <th>{{trans_choice('general.date',1)}}</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($loan_application->guarantors as $key)
                            <tr>

                                <td>
                                    @if(!empty($key->guarantee))
                                      {{$key->guarantee->first_name}} {{$key->guarantee->middle_name}} {{$key->guarantee->last_name}}
                                    @endif
                                </td>
                                <td>
                                    @if($key->status=='accepted')
                                        <span class="label label-success">{{trans_choice('general.accepted',1)}}</span>
                                    @endif
                                    @if($key->status=='pending')
                                        <span class="label label-warning">{{trans_choice('general.pending',1)}}</span>
                                    @endif
                                    @if($key->status=='declined')
                                        <span class="label label-danger">{{trans_choice('general.declined',1)}}</span>
                                    @endif
                                </td>
                                <td>{{ $key->amount }}</td>
                                <td>{{ $key->accepted_amount }}</td>
                                <td>{{ $key->date }}</td>

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

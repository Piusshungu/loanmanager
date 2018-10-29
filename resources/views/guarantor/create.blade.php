@extends('layouts.master')
@section('title')
    {{trans_choice('general.add',1)}} {{trans_choice('general.guarantor',1)}}
@endsection

@section('content')
    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title">{{trans_choice('general.add',1)}} {{trans_choice('general.guarantor',1)}}</h3>

            <div class="box-tools pull-right">

            </div>
        </div>
        {!! Form::open(array('url' => url('loan/'.$id.'/guarantor/store'), 'method' => 'post','class'=>'', 'name' => 'form',"enctype"=>"multipart/form-data")) !!}
        <div class="box-body">
            @if(isset($_REQUEST['return_url']))
                <input type="hidden" value="{{$_REQUEST['return_url']}}" name="return_url">
            @endif
            <p class="bg-navy disabled color-palette">{{trans_choice('general.required',1)}} {{trans_choice('general.field',2)}}</p>

            <div class="form-group">
                {!! Form::label('guarantor_id',trans_choice('general.guarantor',1),array('class'=>' control-label')) !!}
                {!! Form::select('guarantor_id',$borrowers,null, array('class' => 'form-control select2','required'=>'required')) !!}
            </div>
            <div class="form-group">
                {!! Form::label('amount',trans_choice('general.amount',1),array('class'=>'')) !!}
                {!! Form::text('amount',null, array('class' => 'form-control touchspin', 'id'=>"amount",'required'=>'required')) !!}
            </div>
            <div class="form-group">
                {!! Form::label('date',trans_choice('general.date',1),array('class'=>'')) !!}
                {!! Form::text('date',date("Y-m-d"), array('class' => 'form-control date-picker', 'placeholder'=>"",'required'=>'required')) !!}
            </div>
            <p class="bg-navy disabled color-palette">{{trans_choice('general.optional',1)}} {{trans_choice('general.field',2)}}</p>

            <div class="form-group">
                {!! Form::label('status',trans_choice('general.guarantor',1),array('class'=>' control-label')) !!}
                {!! Form::select('status',array('pending'=>trans_choice('general.pending',1),'accepted'=>trans_choice('general.accepted',1),'declined'=>trans_choice('general.declined',1)),'pending', array('class' => 'form-control','required'=>'required','id'=>'status')) !!}
            </div>
            <div class="form-group">
                {!! Form::label('accepted_amount',trans_choice('general.accepted',1).' '.trans_choice('general.amount',1),array('class'=>'')) !!}
                {!! Form::text('accepted_amount',null, array('class' => 'form-control touchspin', 'id'=>"accepted_amount")) !!}
            </div>
            <div class="form-group">
                {!! Form::label('notes',trans_choice('general.description',1),array('class'=>'')) !!}
                {!! Form::textarea('notes',null, array('class' => 'form-control')) !!}
            </div>

        </div>

        <div class="box-footer">
            <button type="submit" class="btn btn-primary pull-right">{{trans_choice('general.save',1)}}</button>
        </div>
        {!! Form::close() !!}
                <!-- /.box-body -->
    </div>
    <!-- /.box -->
@endsection
@section('footer-scripts')
    <script>

        $(document).ready(function (e) {
            if ($('#status').val() == "accepted") {
                $('#accepted_amount').val($('#amount').val());
                $('#accepted_amount').attr('required', 'required');

            }
            $('#status').change(function (e) {
                if ($('#status').val() == "accepted") {
                    $('#accepted_amount').val($('#amount').val());
                    $('#accepted_amount').attr('required', 'required');
                } else {
                    $('#accepted_amount').val("");
                    $('#accepted_amount').removeAttr('required');
                }
            })
        })

    </script>
@endsection


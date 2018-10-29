@extends('layouts.master')
@section('title')
    {{ trans_choice('general.edit',1) }} {{ trans_choice('general.other_income',1) }}
@endsection

@section('content')
    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title">{{ trans_choice('general.edit',1) }} {{ trans_choice('general.other_income',1) }}</h3>

            <div class="box-tools pull-right">

            </div>
        </div>
        {!! Form::open(array('url' => url('other_income/'.$other_income->id.'/update'), 'method' => 'post','class'=>'', 'name' => 'form',"enctype"=>"multipart/form-data")) !!}
        <div class="box-body">
            <p class="bg-navy disabled color-palette">{{ trans_choice('general.required',1) }} {{ trans_choice('general.field',2) }}</p>

            <div class="form-group">
                {!! Form::label('other_income_type_id',trans_choice('general.income',1).' '.trans_choice('general.type',1),array('class'=>' control-label')) !!}

                {!! Form::select('other_income_type_id',$types,$other_income->other_income_type_id, array('class' => 'form-control','required'=>'required')) !!}

            </div>
            <div class="form-group">
                {!! Form::label('amount',trans_choice('general.income',1).' '.trans_choice('general.amount',1),array('class'=>'')) !!}
                {!! Form::text('amount',$other_income->amount, array('class' => 'form-control touchspin', 'placeholder'=>"",'required'=>'required')) !!}
            </div>
            <div class="form-group">
                {!! Form::label('date',trans_choice('general.date',1),array('class'=>'')) !!}
                {!! Form::text('date',$other_income->date, array('class' => 'form-control date-picker', 'placeholder'=>"",'required'=>'required')) !!}
            </div>
            <p class="bg-navy disabled color-palette">{{ trans_choice('general.optional',1) }} {{ trans_choice('general.field',2) }}</p>

            <div class="form-group">
                {!! Form::label('notes',trans_choice('general.description',1),array('class'=>'')) !!}
                {!! Form::textarea('notes',$other_income->notes, array('class' => 'form-control')) !!}
            </div>
            <div class="form-group">
                {!! Form::label('files',trans_choice('general.file',2).'('.trans_choice('general.borrower_file_types',1).')',array('class'=>'')) !!}
                {!! Form::file('files[]', array('class' => 'form-control', 'multiple'=>"",'rows'=>'3')) !!}
                <div class="col-sm-12">{{trans_choice('general.select_thirty_files',1)}}<br>
                    @foreach(unserialize($other_income->files) as $key=>$value)
                        <span id="file_{{$key}}_span"><a href="{!!asset('uploads/'.$value)!!}"
                                                         target="_blank">{!!  $value!!}</a> <button value="{{$key}}"
                                                                                                    id="{{$key}}"
                                                                                                    onclick="delete_file(this)"
                                                                                                    type="button"
                                                                                                    class="btn btn-danger btn-xs">
                                <i class="fa fa-trash"></i></button> </span><br>
                    @endforeach
                </div>
            </div>
            <div class="form-group">
                <hr>
            </div>
            <p class="bg-navy disabled color-palette">{{trans_choice('general.custom_field',2)}}</p>
            @foreach($custom_fields as $key)
                <div class="form-group">
                    {!! Form::label($key->id,$key->name,array('class'=>'')) !!}
                    @if($key->field_type=="number")
                        <input type="number" class="form-control" name="{{$key->id}}"
                               @if($key->required==1) required
                               @endif value="@if(!empty(\App\Models\CustomFieldMeta::where('custom_field_id',$key->id)->where('parent_id',$other_income->id)->where('category','other_income')->first())){{\App\Models\CustomFieldMeta::where('custom_field_id',$key->id)->where('parent_id',$other_income->id)->where('category','other_income')->first()->name}} @endif">
                    @endif
                    @if($key->field_type=="textfield")
                        <input type="text" class="form-control" name="{{$key->id}}"
                               @if($key->required==1) required
                               @endif value="@if(!empty(\App\Models\CustomFieldMeta::where('custom_field_id',$key->id)->where('parent_id',$other_income->id)->where('category','other_income')->first())){{\App\Models\CustomFieldMeta::where('custom_field_id',$key->id)->where('parent_id',$other_income->id)->where('category','other_income')->first()->name}} @endif">
                    @endif
                    @if($key->field_type=="date")
                        <input type="text" class="form-control date-picker" name="{{$key->id}}"
                               @if($key->required==1) required
                               @endif value="@if(!empty(\App\Models\CustomFieldMeta::where('custom_field_id',$key->id)->where('parent_id',$other_income->id)->where('category','other_income')->first())){{\App\Models\CustomFieldMeta::where('custom_field_id',$key->id)->where('parent_id',$other_income->id)->where('category','other_income')->first()->name}} @endif">
                    @endif
                    @if($key->field_type=="textarea")
                        <textarea class="form-control" name="{{$key->id}}"
                                  @if($key->required==1) required @endif>@if(!empty(\App\Models\CustomFieldMeta::where('custom_field_id',$key->id)->where('parent_id',$other_income->id)->where('category','expenses')->first())){{\App\Models\CustomFieldMeta::where('custom_field_id',$key->id)->where('parent_id',$other_income->id)->where('category','other_income')->first()->name}} @endif</textarea>
                    @endif
                    @if($key->field_type=="decimal")
                        <input type="text" class="form-control touchspin" name="{{$key->id}}"
                               @if($key->required==1) required
                               @endif value="@if(!empty(\App\Models\CustomFieldMeta::where('custom_field_id',$key->id)->where('parent_id',$other_income->id)->where('category','other_income')->first())){{\App\Models\CustomFieldMeta::where('custom_field_id',$key->id)->where('parent_id',$other_income->id)->where('category','other_income')->first()->name}} @endif">
                    @endif
                </div>
            @endforeach
            <p style="text-align:center; font-weight:bold;">
                <small><a href="{{url('custom_field/create')}}" target="_blank">Click here to add custom fields on
                        this page</a></small>
            </p>

        </div>

        <div class="box-footer">
            <button type="submit" class="btn btn-primary">{{trans_choice('general.save',1)}}</button>
        </div>
        {!! Form::close() !!}
                <!-- /.box-body -->
    </div>
    <!-- /.box -->
@endsection
@section('footer-scripts')
    <script>

        function delete_file(e) {
            var id = e.id;
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
                $.ajax({
                    type: 'GET',
                    url: "{!!  url('other_income/'.$other_income->id) !!}/delete_file?id=" + id,
                    success: function (data) {
                        $("#file_" + id + "_span").remove();
                        swal({
                            title: 'Deleted',
                            text: 'File successfully deleted',
                            type: 'success',
                            showCancelButton: false,
                            confirmButtonColor: '#3085d6',
                            cancelButtonColor: '#d33',
                            confirmButtonText: 'Ok',
                            timer: 2000
                        })
                    }
                });
            })

        }

    </script>
@endsection


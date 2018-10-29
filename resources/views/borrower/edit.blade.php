@extends('layouts.master')
@section('title')
    {{trans_choice('general.edit',1)}} {{trans_choice('general.borrower',1)}}
@endsection
@section('content')
    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title">{{trans_choice('general.edit',1)}} {{trans_choice('general.borrower',1)}}</h3>

            <div class="box-tools pull-right">

            </div>
        </div>
        {!! Form::open(array('url' => url('borrower/'.$borrower->id.'/update'), 'method' => 'post', 'name' => 'form',"enctype"=>"multipart/form-data")) !!}
        <div class="box-body">
            <div class="col-md-12">
                <p class="bg-navy disabled color-palette">{{trans_choice('general.required',1)}} {{trans_choice('general.field',2)}}</p>

                <div class="form-group">
                    {!! Form::label('first_name',trans_choice('general.first_name',1),array('class'=>'')) !!}
                    {!! Form::text('first_name',$borrower->first_name, array('class' => 'form-control', 'placeholder'=>trans_choice('general.first_name',1),'required'=>'required')) !!}
                </div>
                <div class="form-group">
                    {!! Form::label('last_name',trans_choice('general.last_name',1),array('class'=>'')) !!}
                    {!! Form::text('last_name',$borrower->last_name, array('class' => 'form-control', 'placeholder'=>trans_choice('general.last_name',1),'required'=>'required')) !!}
                </div>
                <div class="form-group">
                    {!! Form::label('gender',trans_choice('general.gender',1),array('class'=>'')) !!}
                    {!! Form::select('gender',array('Male'=>trans_choice('general.Male',1),'Female'=>trans_choice('general.Female',1)),$borrower->gender, array('class' => 'form-control','required'=>'required')) !!}
                </div>
                <div class="form-group">
                    {!! Form::label('country',trans_choice('general.country',1),array('class'=>'')) !!}
                    {!! Form::text('country',$borrower->country, array('class' => 'form-control','required'=>'required')) !!}
                </div>
                <p class="bg-navy disabled color-palette">{{trans_choice('general.optional',1)}} {{trans_choice('general.field',2)}}</p>

                <div class="form-group">
                    {!! Form::label('title',trans_choice('general.title',1),array('class'=>'')) !!}
                    {!! Form::select('title',array('Mr'=>trans_choice('general.Mr',1),'Mrs'=>trans_choice('general.Mrs',1), 'Miss'=>trans_choice('general.Miss',1),'Ms'=>trans_choice('general.Ms',1),'Dr'=>trans_choice('general.Dr',1),'Prof'=>trans_choice('general.Prof',1),'Rev'=>trans_choice('general.Rev',1)),$borrower->title, array('class' => 'form-control',)) !!}
                </div>
                <div class="form-group">
                    {!! Form::label('mobile',trans_choice('general.mobile',1),array('class'=>'')) !!}
                    {!! Form::text('mobile',$borrower->mobile, array('class' => 'form-control', 'placeholder'=>trans_choice('general.numbers_only',1))) !!}
                </div>
                <div class="form-group">
                    {!! Form::label('email',trans_choice('general.email',1),array('class'=>'')) !!}
                    {!! Form::text('email',$borrower->email, array('class' => 'form-control', 'placeholder'=>trans_choice('general.email',1))) !!}
                </div>
                <div class="form-group">
                    {!! Form::label('unique_number',trans_choice('general.unique_number',1),array('class'=>'')) !!}
                    {!! Form::text('unique_number',$borrower->unique_number, array('class' => 'form-control', 'placeholder'=>trans_choice('general.unique_number',1))) !!}
                </div>
                <div class="form-group">
                    {!! Form::label('dob',trans_choice('general.dob',1),array('class'=>'')) !!}
                    {!! Form::text('dob',$borrower->dob, array('class' => 'form-control date-picker', 'placeholder'=>trans_choice('general.dob',1))) !!}
                </div>
                <div class="form-group">
                    {!! Form::label('address',trans_choice('general.address',1),array('class'=>'')) !!}
                    {!! Form::text('address',$borrower->address, array('class' => 'form-control', 'placeholder'=>"")) !!}
                </div>
                <div class="form-group">
                    {!! Form::label('city',trans_choice('general.city',1),array('class'=>'')) !!}
                    {!! Form::text('city',$borrower->city, array('class' => 'form-control', 'placeholder'=>"")) !!}
                </div>
                <div class="form-group">
                    {!! Form::label('state',trans_choice('general.state',1),array('class'=>'')) !!}
                    {!! Form::text('state',$borrower->state, array('class' => 'form-control', 'placeholder'=>"")) !!}
                </div>
                <div class="form-group">
                    {!! Form::label('zip',trans_choice('general.zip',1),array('class'=>'')) !!}
                    {!! Form::text('zip',$borrower->zip, array('class' => 'form-control', 'placeholder'=>"")) !!}
                </div>
                <div class="form-group">
                    {!! Form::label('phone',trans_choice('general.phone',1),array('class'=>'')) !!}
                    {!! Form::text('phone',$borrower->phone, array('class' => 'form-control', 'placeholder'=>"")) !!}
                </div>
                <div class="form-group">
                    {!! Form::label('business_name',trans_choice('general.business',1),array('class'=>'')) !!}
                    {!! Form::text('business_name',$borrower->business_name, array('class' => 'form-control', 'placeholder'=>"")) !!}
                </div>
                <div class="form-group">
                    {!! Form::label('working_status',trans_choice('general.working_status',1),array('class'=>'')) !!}
                    {!! Form::select('working_status',array('Employee'=>trans_choice('general.Employee',1),'Owner'=>trans_choice('general.Owner',1),'Student'=>trans_choice('general.Student',1),'Overseas Worker'=>trans_choice('general.Overseas Worker',1),'Pensioner'=>trans_choice('general.Pensioner',1),'Unemployed'=>trans_choice('general.Unemployed',1)),$borrower->working_status, array('class' => 'form-control')) !!}
                </div>
                <div class="form-group">
                    {!! Form::label('photo',trans_choice('general.photo',1),array('class'=>'')) !!}
                    {!! Form::file('photo', array('class' => 'form-control', 'placeholder'=>"")) !!}
                    @if(!empty($borrower->photo))
                        <a class="fancybox" rel="group" href="{{ url(asset('uploads/'.$borrower->photo)) }}"> <img
                                    src="{{ url(asset('uploads/'.$borrower->photo)) }}" width="120"/></a>
                    @endif
                </div>
                <div class="form-group">
                    {!! Form::label('notes',trans_choice('general.description',1),array('class'=>'')) !!}
                    {!! Form::textarea('notes',$borrower->notes, array('class' => 'form-control', 'placeholder'=>"")) !!}
                </div>
                <div class="form-group">
                    {!! Form::label('files',trans_choice('general.file',2). ' '.trans_choice('general.borrower_file_types',2),array('class'=>'')) !!}
                    {!! Form::file('files[]', array('class' => 'form-control', 'multiple'=>"")) !!}
                    <div class="col-sm-12">
                        {{trans_choice('general.select_thirty_files',2)}}<br>
                        @foreach(unserialize($borrower->files) as $key=>$value)
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
                <div class="form-group">
                    {!! Form::label('loan_officers',trans_choice('general.loan_officer_access',2),array('class'=>'')) !!}
                    {!! Form::select('loan_officers[]',$user,unserialize($borrower->loan_officers), array('class' => 'form-control select2','multiple'=>'')) !!}
                    <p>
                        <small>You can assign borrower to the above loan officers. This borrower will appear in the
                            <b><a
                                        href=""
                                        target="_blank">Daily Collection Sheet</a></b> and the <b><a
                                        href=""
                                        target="_blank">Past Maturity Date Loans Sheet</a></b> of the staff. This will
                            allow
                            you to download the daily collection sheet for each staff and the staff will know which
                            borrower
                            to chase for payment.
                        </small>
                    </p>
                </div>
                <p class="bg-navy disabled color-palette">{{trans_choice('general.login',2)}} {{trans_choice('general.detail',2)}}</p>
                <div class="form-group">
                    {!! Form::label('username',trans_choice('general.username',1),array('class'=>'')) !!}
                    {!! Form::text('username',$borrower->username, array('class' => 'form-control', 'placeholder'=>"")) !!}
                </div>
                <div class="form-group">
                    {!! Form::label('password',trans_choice('general.password',1),array('class'=>'')) !!}
                    {!! Form::password('password', array('class' => 'form-control', 'placeholder'=>"")) !!}
                </div>
                <div class="form-group">
                    {!! Form::label('repeatpassword',trans_choice('general.repeat_password',1),array('class'=>'')) !!}
                    {!! Form::password('repeatpassword', array('class' => 'form-control', 'placeholder'=>"")) !!}
                </div>
                <p class="bg-navy disabled color-palette">{{trans_choice('general.custom_field',2)}}</p>
                @foreach($custom_fields as $key)

                    <div class="form-group">
                        {!! Form::label($key->id,$key->name,array('class'=>'')) !!}
                        @if($key->field_type=="number")
                            <input type="number" class="form-control" name="{{$key->id}}"
                                   @if($key->required==1) required
                                   @endif value="@if(!empty(\App\Models\CustomFieldMeta::where('custom_field_id',$key->id)->where('parent_id',$borrower->id)->where('category','borrowers')->first())){{\App\Models\CustomFieldMeta::where('custom_field_id',$key->id)->where('parent_id',$borrower->id)->where('category','borrowers')->first()->name}} @endif">
                        @endif
                        @if($key->field_type=="textfield")
                            <input type="text" class="form-control" name="{{$key->id}}"
                                   @if($key->required==1) required
                                   @endif value="@if(!empty(\App\Models\CustomFieldMeta::where('custom_field_id',$key->id)->where('parent_id',$borrower->id)->where('category','borrowers')->first())){{\App\Models\CustomFieldMeta::where('custom_field_id',$key->id)->where('parent_id',$borrower->id)->where('category','borrowers')->first()->name}} @endif">
                        @endif
                        @if($key->field_type=="date")
                            <input type="text" class="form-control date-picker" name="{{$key->id}}"
                                   @if($key->required==1) required
                                   @endif value="@if(!empty(\App\Models\CustomFieldMeta::where('custom_field_id',$key->id)->where('parent_id',$borrower->id)->where('category','borrowers')->first())){{\App\Models\CustomFieldMeta::where('custom_field_id',$key->id)->where('parent_id',$borrower->id)->where('category','borrowers')->first()->name}} @endif">
                        @endif
                        @if($key->field_type=="textarea")
                            <textarea class="form-control" name="{{$key->id}}"
                                      @if($key->required==1) required @endif>@if(!empty(\App\Models\CustomFieldMeta::where('custom_field_id',$key->id)->where('parent_id',$borrower->id)->where('category','borrowers')->first())){{\App\Models\CustomFieldMeta::where('custom_field_id',$key->id)->where('parent_id',$borrower->id)->where('category','borrowers')->first()->name}} @endif</textarea>
                        @endif
                        @if($key->field_type=="decimal")
                            <input type="text" class="form-control touchspin" name="{{$key->id}}"
                                   @if($key->required==1) required
                                   @endif value="@if(!empty(\App\Models\CustomFieldMeta::where('custom_field_id',$key->id)->where('parent_id',$borrower->id)->where('category','borrowers')->first())){{\App\Models\CustomFieldMeta::where('custom_field_id',$key->id)->where('parent_id',$borrower->id)->where('category','borrowers')->first()->name}} @endif">
                        @endif

                    </div>
                @endforeach
                <p style="text-align:center; font-weight:bold;">
                    <small><a href="{{url('custom_field/create')}}" target="_blank">Click here to add custom fields
                            on this page</a></small>
                </p>

            </div>
        </div>
        <!-- /.box-body -->
        <div class="box-footer">
            <button type="submit" class="btn btn-primary pull-right">{{trans_choice('general.save',2)}}</button>
        </div>
        {!! Form::close() !!}
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
                    url: "{!!  url('borrower/'.$borrower->id) !!}/delete_file?id=" + id,
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
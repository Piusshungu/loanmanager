@extends('layouts.master')
@section('title'){{trans_choice('general.update_successful',2)}}
@endsection
@section('content')
    <div class="box box-default">
        <div class="box-header with-border">
            <h3 class="box-title">{{trans_choice('general.update_successful',2)}} </h3>

            <div class="box-tools pull-right">

            </div>
        </div>
        <div class="box-body">
                <div class="callout callout-success">
                    <h4>{{trans_choice('general.update_successful',1)}}</h4>

                    <p>System was updated successfully. If you encounter any problems you can <a href="mailto:info@webstudio.co.zw?subject=Problems after update">Contact Us</a> </p>
                </div>

        </div>
        <!-- /.box-body -->

    </div>
    <!-- /.box -->
@endsection

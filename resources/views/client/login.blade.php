@extends('themes.electric.client.auth')
@section('title')
    {{ trans('login.login') }}
@endsection

@section('content')
    <div class="acount-sec">
        <div class="container">
            <h3 style="font-family: Raleway;  font-weight: 900; color: #24252a;">
                Customer Portal</h3>

            <p style=" font-family: Raleway; color: #a1a8bd;">
                Please Use Your Credentials To Access Your Dashboard.<br> This is Private & Secure Area. Your Data Is
                Confidential.</p>

            <div class="row">
                <div class="col-md-6">
                    <div class="contact-sec" id="login-form">
                        <!-- Top Bar Chart -->
                        <!-- Widget title -->
                        <div class="account-form">
                            {!! Form::open(array('url' => url('client_login'), 'method' => 'post', 'name' => 'form','class'=>'login-form')) !!}
                            <div class="row">
                                <div class="feild col-md-12">
                                    {!! Form::text('username', null, array('class' => '', 'placeholder'=>trans_choice('general.username',1),'required'=>'required')) !!}
                                </div>
                                <div class="feild col-md-12">
                                    {!! Form::password('password', array('class' => '', 'placeholder'=>trans('login.password'),'required'=>'required')) !!}
                                </div>
                                <div class="feild col-md-6">
                                    <label>
                                        <input type="checkbox" name="remember"
                                               value="1"> {{ trans('login.remember') }}
                                    </label>
                                </div>
                                <div class="feild col-md-6">
                                    <label>
                                        <a href="{{url('/')}}" style="color:#fc464d">Forgot My Password?</a>
                                    </label>
                                </div>
                                <div class="feild col-md-12">
                                    <input type="submit" value="{{ trans('login.login') }}"/>
                                </div>
                            </div>
                            {!! Form::close() !!}
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <img src="{{asset('assets/themes/electric/images/keyhole.png')}}" class="img-responsive">
                </div>
            </div>
            <div class="contact-sec" id="forgot-form">
                <div class="row">
                    <div class="col-md-8">
                        <div class="widget-title">
                            <h3>Can't Signin? Forget your password?</h3>
                            <span>Enter your email address below & we will send you password reset instructions..</span>
                        </div>
                        <!-- Widget title -->
                        <div class="account-form">
                            {!! Form::open(array('url' => url('reset'), 'method' => 'post', 'name' => 'form','class'=>'forget-form ')) !!}
                            <div class="row">
                                <div class="col-md-6 feild">
                                    {!! Form::text('email', null, array('class' => '', 'placeholder'=>trans('login.email'),'required'=>'required')) !!}
                                </div>
                                <div class="feild col-md-12">
                                    <input type="submit" value="Send me reset intructions"/>
                                </div>
                            </div>
                            {!! Form::close() !!}
                        </div>
                        <div class="more-option">
                            <span>OR</span>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="creat-an-account">
                            <span>Do you have an account?</span>
                            <a id="login-btn" title="">Login Now</a>
                        </div>
                        <!-- Create an account -->
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function () {
            jQuery('#forgot-form').hide();
            jQuery('#forgot-btn').click(function () {
                jQuery('#login-form').hide();
                jQuery('#forgot-form').show();
            });
            jQuery('#register-btn').click(function () {
                jQuery('#login-form').hide();
                jQuery('#register-form').show();
            });

            jQuery('#login-btn').click(function () {
                jQuery('#login-form').show();
                jQuery('#forgot-form').hide();
            });
            jQuery('#register-back-btn').click(function () {
                jQuery('.login-form').show();
                jQuery('.register-form').hide();
            });
            $('#check_btn').click(function (e) {
                e.preventDefault();
                var repair = $('#repair_number').val();
                if (repair == '') {
                    toastr.warning('Repair Number can not be empty', 'Response Status')
                } else {
                    $.ajax({
                        url: '{!! url('check') !!}/' + repair,
                        success: function (data) {
                            toastr.success('Loading information', 'Response Status')
                            $('#status').find('.modal-body').html($(data));
                            $('#status').modal();
                        },
                        error: function () {
                            toastr.warning('There was an error processing the request', 'Response Status')
                        },
                        type: 'GET'
                    });
                }
            })
        });
    </script>
@endsection

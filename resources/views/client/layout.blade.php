<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title> @yield('title')</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="{{ asset('assets/bootstrap/css/bootstrap.min.css') }}">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="{{ asset('assets/dist/css/AdminLTE.min.css') }}">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="{{ asset('assets/dist/css/skins/_all-skins.min.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/dist/css/custom.css') }}">
    <link href="{{ asset('assets/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css') }}" rel="stylesheet"
          type="text/css"/>
    <link href="{{ asset('assets/plugins/font-awesome/css/font-awesome.min.css') }}" rel="stylesheet" type="text/css"/>
    <link href="{{ asset('assets/plugins/bootstrap-toastr/toastr.min.css') }}" rel="stylesheet" type="text/css"/>
    <link href="{{ asset('assets/plugins/bootstrap-touchspin/bootstrap.touchspin.min.css') }}" rel="stylesheet"
          type="text/css"/>
    <link href="{{ asset('assets/plugins/select2/select2.min.css') }}" rel="stylesheet" type="text/css"/>
    <link href="{{ asset('assets/plugins/select2/select2-bootstrap.min.css') }}" rel="stylesheet" type="text/css"/>
    <link href="{{ asset('assets/plugins/sweetalert2/sweetalert2.min.css') }}" rel="stylesheet" type="text/css"/>
    <link href="{{ asset('assets/plugins/datatable/media/css/dataTables.bootstrap.css') }}"
          rel="stylesheet" type="text/css"/>
    <link href="{{ asset('assets/plugins/datatable/extensions/Buttons/css/buttons.dataTables.css') }}"
          rel="stylesheet" type="text/css"/>
    <link href="{{ asset('assets/plugins/datatable/extensions/Buttons/css/buttons.bootstrap.css') }}"
          rel="stylesheet" type="text/css"/>
    <link href="{{ asset('assets/plugins/datatable/extensions/Responsive/css/responsive.bootstrap.css') }}"
          rel="stylesheet" type="text/css"/>
    <link href="{{ asset('assets/plugins/fancybox/jquery.fancybox.css') }}"
          rel="stylesheet" type="text/css"/>
    <link href="{{ asset('assets/plugins/datepicker/bootstrap-datepicker3.min.css') }}" rel="stylesheet"
          type="text/css"/>
    <link href="{{ asset('assets/plugins/iCheck/square/blue.css') }}" rel="stylesheet" type="text/css"/>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- jQuery 2.2.3 -->
    <script src="{{ asset('assets/plugins/jQuery/jquery-2.2.3.min.js') }}"></script>
    <!-- Bootstrap 3.3.6 -->
    <script src="{{ asset('assets/bootstrap/js/bootstrap.min.js') }}"></script>
    <script src="{{ asset('assets/plugins/bootstrap-toastr/toastr.min.js') }}" type="text/javascript"></script>
    <script src="{{ asset('assets/plugins/jQueryUi/jquery-ui.min.js') }}" type="text/javascript"></script>
    <script src="{{ asset('assets/plugins/datepicker/bootstrap-datepicker.min.js') }}"
            type="text/javascript"></script>
    {{--Start Page header level scripts--}}
    @yield('page-header-scripts')
    {{--End Page level scripts--}}
</head>
<body class="hold-transition skin-blue layout-top-nav">
<div class="wrapper">

    <header class="main-header">

        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top">
            <div class="container">
                <div class="navbar-header">
                    <a href="{{url('/')}}"
                       class="navbar-brand"><b>{{ \App\Models\Setting::where('setting_key','company_name')->first()->setting_value }}</b></a>
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                            data-target="#navbar-collapse">
                        <i class="fa fa-bars"></i>
                    </button>
                </div>
                <!-- Navbar Right Menu -->
                <div class="collapse navbar-collapse pull-left" id="navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li class="@if(Request::is('client_dashboard')) active @endif"><a
                                    href="{{url('client_dashboard')}}">{{trans_choice('general.dashboard',1)}}
                                <span class="sr-only">(current)</span></a>
                        </li>
                        @if(\App\Models\Setting::where('setting_key','allow_client_apply')->first()->setting_value==1)
                            <li class="dropdown @if(Request::is('client/application/*')) active @endif">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown"
                                   aria-expanded="false"> {{trans_choice('general.loan',1)}} {{trans_choice('general.application',2)}}
                                    <span class="caret"></span></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li>
                                        <a href="{{url('client/application/data')}}">{{trans_choice('general.my',1)}} {{trans_choice('general.application',2)}}</a>
                                    </li>
                                    <li>
                                        <a href="{{url('client/application/create')}}">{{trans_choice('general.apply',1)}}</a>
                                    </li>
                                </ul>
                            </li>
                        @endif
                        @if(\App\Models\Saving::where('borrower_id',$borrower->id)->count()>0)
                            <li class="@if(Request::is('client/saving/*')) active @endif"><a
                                        href="{{url('client/saving/show')}}">{{trans_choice('general.view',1)}} {{trans_choice('general.saving',2)}} {{trans_choice('general.account',1)}}
                                </a>
                            </li>
                        @endif
                        @if(\App\Models\Setting::where('setting_key','client_request_guarantor')->first()->setting_value==1)
                            <li class="@if(Request::is('client/guarantor/*')) active @endif"><a
                                        href="{{url('client/guarantor/data')}}">{{trans_choice('general.guarantee',1)}} {{trans_choice('general.request',2)}}
                                    <span class="badge badge-success pull-right">{{\App\Models\Guarantor::where('guarantor_id',$borrower->id)->where('status','pending')->count()}}</span></a>
                            </li>
                        @endif

                    </ul>

                </div>
                <div class="navbar-custom-menu">
                    <ul class="nav navbar-nav">

                        <!-- User Account: style can be found in dropdown.less -->
                        <li class="dropdown user user-menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-user"></i>
                                <span class="hidden-xs">{{ $borrower->first_name }} {{ $borrower->last_name }}</span>
                            </a>
                            <ul class="dropdown-menu">
                                <!-- User image -->
                                <li class="user-header">
                                    <i class="fa fa-user" style="font-size: 60px"></i>

                                    <p>
                                        {{ $borrower->first_name }} {{ $borrower->last_name }}
                                        <small>Member since {{ $borrower->created_at }}</small>
                                    </p>
                                </li>

                                <!-- Menu Footer-->
                                <li class="user-footer">
                                    <div class="pull-left">
                                        <a href="{{ url('client_profile') }}"
                                           class="btn btn-default btn-flat">Profile</a>
                                    </div>
                                    <div class="pull-right">
                                        <a href="{{ url('client_logout') }}" class="btn btn-default btn-flat">Sign
                                            out</a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>
    <!-- Left side column. contains the logo and sidebar -->


    <!-- end Left side column. contains the logo and sidebar -->
    <div class="content-wrapper">
        <div class="container">
            <!-- Content Header (Page header) -->
            <section class="content-header" style="min-height: 30px">
                <h1>
                    @yield('title')
                </h1>
                <ol class="breadcrumb">
                    <li><a href="{{ url('dashboard') }}"><i class="fa fa-dashboard"></i> Home</a></li>
                    <li class="active">@yield('title')</li>
                </ol>
            </section>
            <!-- Main content -->
            <section class="content">
                @if(Session::has('flash_notification.message'))
                    <script>toastr.{{ Session::get('flash_notification.level') }}('{{ Session::get("flash_notification.message") }}', 'Response Status')</script>
                @endif
                @if (isset($msg))
                    <div class="alert alert-success">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                        {{ $msg }}
                    </div>
                @endif
                @if (isset($error))
                    <div class="alert alert-error">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                        {{ $error }}
                    </div>
                @endif
                @if (count($errors) > 0)
                    <div class="alert alert-danger">
                        <ul>
                            @foreach ($errors->all() as $error)
                                <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                    </div>
                @endif
                @yield('content')
            </section>
            <!-- /.content -->
        </div>
    </div>
    <!-- /.content-wrapper -->
    <footer class="main-footer hidden-print">
        <div class="container">
            <div class="pull-right hidden-xs">
                <b>Version</b> {{ \App\Models\Setting::where('setting_key','system_version')->first()->setting_value }}
            </div>
            <strong>Copyright &copy; {{ date("Y") }} <a
                        href="{{ \App\Models\Setting::where('setting_key','company_website')->first()->setting_value }}">{{ \App\Models\Setting::where('setting_key','company_name')->first()->setting_value }}</a>.</strong>
            All rights
            reserved.
        </div>
    </footer>
</div>
<!-- ./wrapper -->

<!-- FastClick -->
<script src="{{ asset('assets/plugins/fastclick/fastclick.js') }}"></script>
<script src="{{ asset('assets/plugins/iCheck/icheck.min.js') }}"></script>
<script src="{{ asset('assets/plugins/sweetalert2/sweetalert2.min.js') }}"></script>
<script src="{{ asset('assets/plugins/bootstrap-confirmation/bootstrap-confirmation.min.js') }}"
        type="text/javascript"></script>
<script src="{{ asset('assets/plugins/bootstrap-touchspin/bootstrap.touchspin.min.js') }}"
        type="text/javascript"></script>
<script src="{{ asset('assets/plugins/tinymce/tinymce.min.js') }}"
        type="text/javascript"></script>
<script src="{{ asset('assets/plugins/fancybox/jquery.fancybox.js') }}"
        type="text/javascript"></script>
<!-- AdminLTE App -->
<script src="{{ asset('assets/dist/js/app.min.js') }}"></script>
<script src="{{ asset('assets/plugins/select2/select2.min.js') }}"></script>
<!-- SlimScroll 1.3.0 -->
<script src="{{ asset('assets/plugins/slimScroll/jquery.slimscroll.min.js') }}"></script>
@yield('footer-scripts')
        <!-- ChartJS 1.0.1 -->
<script>
    if (jQuery().iCheck) {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' // optional
        });
    }
    if (jQuery().wysihtml5) {
        $('.wysihtml5').wysihtml5({});
    }
    if (jQuery().datepicker) {
        $('.date-picker').datepicker({
            orientation: "left",
            autoclose: true,
            format: "yyyy-mm-dd"
        });
        //$('body').removeClass("modal-open"); // fix bug when inline picker is used in modal
    }
    if (jQuery().TouchSpin) {
        $(".touchspin").TouchSpin({
            buttondown_class: 'btn blue',
            buttonup_class: 'btn blue',
            min: 0,
            max: 10000000000,
            step: 0.01,
            decimals: 2,
            boostat: 5,
            maxboostedstep: 1,
            prefix: ''
        });
    }
    $('[data-toggle="confirmation"]').confirmation({
        popout: true
    });
    $('[data-toggle="tooltip"]').tooltip();
    if (jQuery().select2) {
        $(".select2").select2({
            theme: "bootstrap"
        });
    }
    $(".fancybox").fancybox();
    $('.delete').on('click', function (e) {
        e.preventDefault();
        var href = $(this).attr('href');
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
            window.location = href;
        })
    });
</script>

</body>
</html>
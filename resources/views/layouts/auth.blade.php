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
    <link rel="stylesheet" href="{{ asset('assets/dist/css/custom.css') }}">
    <link href="{{ asset('assets/plugins/font-awesome/css/font-awesome.min.css') }}" rel="stylesheet" type="text/css"/>
    <link href="{{ asset('assets/plugins/bootstrap-toastr/toastr.min.css') }}" rel="stylesheet" type="text/css"/>
    <link href="{{ asset('assets/plugins/iCheck/square/blue.css') }}" rel="stylesheet" type="text/css"/>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <link href="{{ asset('assets/plugins/datepicker/bootstrap-datepicker3.min.css') }}" rel="stylesheet"
          type="text/css"/>
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
    {{--Start Page header level scripts--}}
    @yield('page-header-scripts')
    {{--End Page level scripts--}}
</head>
<body class="hold-transition login-page">

@yield('content')

<!-- FastClick -->
<script src="{{ asset('assets/plugins/fastclick/fastclick.js') }}"></script>
<script src="{{ asset('assets/plugins/iCheck/icheck.min.js') }}"></script>
<!-- AdminLTE App -->
<script src="{{ asset('assets/dist/js/app.min.js') }}"></script>
<script src="{{ asset('assets/plugins/select2/select2.full.min.js') }}"></script>
<!-- SlimScroll 1.3.0 -->
<script src="{{ asset('assets/plugins/slimScroll/jquery.slimscroll.min.js') }}"></script>
<!-- ChartJS 1.0.1 -->
<script src="{{ asset('assets/plugins/datepicker/bootstrap-datepicker.min.js') }}"
        type="text/javascript"></script>
<script src="{{ asset('assets/dist/js/custom.js') }}"></script>

</body>
</html>
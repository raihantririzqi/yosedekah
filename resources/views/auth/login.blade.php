<!DOCTYPE html>
<html class="no-js css-menubar" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <meta name="description" content="bootstrap material admin template">
    <meta name="author" content="">

    <title>Login</title>

    <link rel="apple-touch-icon" href="{{ asset('material/base') }}/assets/images/apple-touch-icon.png">
    <link rel="shortcut icon" href="{{ asset('material/base') }}/assets/images/favicon.ico">

    <!-- Stylesheets -->
    <link rel="stylesheet" href="{{ asset('material') }}/global/css/bootstrap.min.css">
    <link rel="stylesheet" href="{{ asset('material') }}/global/css/bootstrap-extend.min.css">
    <link rel="stylesheet" href="{{ asset('material/base') }}/assets/css/site.min.css">

    <!-- Plugins -->
    <link rel="stylesheet" href="{{ asset('material') }}/global/vendor/animsition/animsition.css">
    <link rel="stylesheet" href="{{ asset('material') }}/global/vendor/asscrollable/asScrollable.css">
    <link rel="stylesheet" href="{{ asset('material') }}/global/vendor/switchery/switchery.css">
    <link rel="stylesheet" href="{{ asset('material') }}/global/vendor/intro-js/introjs.css">
    <link rel="stylesheet" href="{{ asset('material') }}/global/vendor/slidepanel/slidePanel.css">
    <link rel="stylesheet" href="{{ asset('material') }}/global/vendor/flag-icon-css/flag-icon.css">
    <link rel="stylesheet" href="{{ asset('material') }}/global/vendor/waves/waves.css">
    <link rel="stylesheet" href="{{ asset('material/base') }}/assets/examples/css/pages/login-v3.css">
        <link rel="stylesheet" href="{{ asset('material') }}/global/vendor/datatables.net-bs4/dataTables.bootstrap4.css">
        <link rel="stylesheet" href="{{ asset('material') }}/global/vendor/datatables.net-fixedheader-bs4/dataTables.fixedheader.bootstrap4.css">
        <link rel="stylesheet" href="{{ asset('material') }}/global/vendor/datatables.net-fixedcolumns-bs4/dataTables.fixedcolumns.bootstrap4.css">
        <link rel="stylesheet" href="{{ asset('material') }}/global/vendor/datatables.net-rowgroup-bs4/dataTables.rowgroup.bootstrap4.css">
        <link rel="stylesheet" href="{{ asset('material') }}/global/vendor/datatables.net-scroller-bs4/dataTables.scroller.bootstrap4.css">
        <link rel="stylesheet" href="{{ asset('material') }}/global/vendor/datatables.net-select-bs4/dataTables.select.bootstrap4.css">
        <link rel="stylesheet" href="{{ asset('material') }}/global/vendor/datatables.net-responsive-bs4/dataTables.responsive.bootstrap4.css">
        <link rel="stylesheet" href="{{ asset('material') }}/global/vendor/datatables.net-buttons-bs4/dataTables.buttons.bootstrap4.css">
        <link rel="stylesheet" href="{{ asset('material/base') }}/assets/examples/css/tables/datatable.css">


    <!-- Fonts -->
    <link rel="stylesheet" href="{{ asset('material') }}/global/fonts/material-design/material-design.min.css">
    <link rel="stylesheet" href="{{ asset('material') }}/global/fonts/brand-icons/brand-icons.min.css">
    <link rel='stylesheet' href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,300italic'>

    <!--[if lt IE 9]>
    <script src="{{ asset('material') }}/global/vendor/html5shiv/html5shiv.min.js"></script>
    <![endif]-->

    <!--[if lt IE 10]>
    <script src="{{ asset('material') }}/global/vendor/media-match/media.match.min.js"></script>
    <script src="{{ asset('material') }}/global/vendor/respond/respond.min.js"></script>
    <![endif]-->

    <!-- Scripts -->
    <script src="{{ asset('material') }}/global/vendor/breakpoints/breakpoints.js"></script>
    <script>
        Breakpoints();
    </script>
</head>

<body class="animsition page-login-v3 layout-full">
    <!--[if lt IE 8]>
        <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
    <![endif]-->


    <!-- Page -->
    <div class="page vertical-align text-center" data-animsition-in="fade-in" data-animsition-out="fade-out">>
        <div class="page-content vertical-align-middle">
            <div class="panel">
                <div class="panel-body">
                    <div class="brand">
                        <img class="brand-img" src="{{ asset('material/base') }}/assets//images/logo-colored.png"
                            alt="...">
                        <h2 class="brand-text font-size-18">Remark</h2>
                    </div>
                    {{-- @if (session('login_error'))

                    @endif --}}
                    @if (session('login_error'))
                        <div class="alert alert-danger">
                            {{ session('login_error') }}
                        </div>
                    @endif
                    <form method="post" action="{{ url('login') }}" autocomplete="off">
                        @csrf
                        <div class="form-group form-material floating" data-plugin="formMaterial">
                            <input type="email" class="form-control" name="email" />
                            <label class="floating-label">Email</label>
                        </div>
                        <div class="form-group form-material floating" data-plugin="formMaterial">
                            <input type="password" class="form-control" name="password" />
                            <label class="floating-label">Password</label>
                        </div>
                        <button type="submit" class="btn btn-primary btn-block btn-lg mt-40">Sign in</button>
                    </form>
                </div>
            </div>

            {{-- <footer class="page-copyright page-copyright-inverse">
                <p>WEBSITE BY Creation Studio</p>
                <p>© 2018. All RIGHT RESERVED.</p>
                <div class="social">
                    <a class="btn btn-icon btn-pure" href="javascript:void(0)">
                        <i class="icon bd-twitter" aria-hidden="true"></i>
                    </a>
                    <a class="btn btn-icon btn-pure" href="javascript:void(0)">
                        <i class="icon bd-facebook" aria-hidden="true"></i>
                    </a>
                    <a class="btn btn-icon btn-pure" href="javascript:void(0)">
                        <i class="icon bd-google-plus" aria-hidden="true"></i>
                    </a>
                </div>
            </footer> --}}
        </div>
    </div>
    <!-- End Page -->


    <!-- Core  -->
    <script src="{{ asset('material') }}/global/vendor/babel-external-helpers/babel-external-helpers.js"></script>
    <script src="{{ asset('material') }}/global/vendor/jquery/jquery.js"></script>
    <script src="{{ asset('material') }}/global/vendor/popper-js/umd/popper.min.js"></script>
    <script src="{{ asset('material') }}/global/vendor/bootstrap/bootstrap.js"></script>
    <script src="{{ asset('material') }}/global/vendor/animsition/animsition.js"></script>
    <script src="{{ asset('material') }}/global/vendor/mousewheel/jquery.mousewheel.js"></script>
    <script src="{{ asset('material') }}/global/vendor/asscrollbar/jquery-asScrollbar.js"></script>
    <script src="{{ asset('material') }}/global/vendor/asscrollable/jquery-asScrollable.js"></script>
    <script src="{{ asset('material') }}/global/vendor/waves/waves.js"></script>

    <!-- Plugins -->
    <script src="{{ asset('material') }}/global/vendor/switchery/switchery.js"></script>
    <script src="{{ asset('material') }}/global/vendor/intro-js/intro.js"></script>
    <script src="{{ asset('material') }}/global/vendor/screenfull/screenfull.js"></script>
    <script src="{{ asset('material') }}/global/vendor/slidepanel/jquery-slidePanel.js"></script>
    <script src="{{ asset('material') }}/global/vendor/jquery-placeholder/jquery.placeholder.js"></script>
        <script src="{{ asset('material') }}/global/vendor/datatables.net/jquery.dataTables.js"></script>
        <script src="{{ asset('material') }}/global/vendor/datatables.net-bs4/dataTables.bootstrap4.js"></script>
        <script src="{{ asset('material') }}/global/vendor/datatables.net-fixedheader/dataTables.fixedHeader.js"></script>
        <script src="{{ asset('material') }}/global/vendor/datatables.net-fixedcolumns/dataTables.fixedColumns.js"></script>
        <script src="{{ asset('material') }}/global/vendor/datatables.net-rowgroup/dataTables.rowGroup.js"></script>
        <script src="{{ asset('material') }}/global/vendor/datatables.net-scroller/dataTables.scroller.js"></script>
        <script src="{{ asset('material') }}/global/vendor/datatables.net-responsive/dataTables.responsive.js"></script>
        <script src="{{ asset('material') }}/global/vendor/datatables.net-responsive-bs4/responsive.bootstrap4.js"></script>
        <script src="{{ asset('material') }}/global/vendor/datatables.net-buttons/dataTables.buttons.js"></script>
        <script src="{{ asset('material') }}/global/vendor/datatables.net-buttons/buttons.html5.js"></script>
        <script src="{{ asset('material') }}/global/vendor/datatables.net-buttons/buttons.flash.js"></script>
        <script src="{{ asset('material') }}/global/vendor/datatables.net-buttons/buttons.print.js"></script>
        <script src="{{ asset('material') }}/global/vendor/datatables.net-buttons/buttons.colVis.js"></script>
        <script src="{{ asset('material') }}/global/vendor/datatables.net-buttons-bs4/buttons.bootstrap4.js"></script>
        <script src="{{ asset('material') }}/global/vendor/asrange/jquery-asRange.min.js"></script>
        <script src="{{ asset('material') }}/global/vendor/bootbox/bootbox.js"></script>

    <!-- Scripts -->
    <script src="{{ asset('material') }}/global/js/Component.js"></script>
    <script src="{{ asset('material') }}/global/js/Plugin.js"></script>
    <script src="{{ asset('material') }}/global/js/Base.js"></script>
    <script src="{{ asset('material') }}/global/js/Config.js"></script>

    <script src="{{ asset('material/base') }}/assets/js/Section/Menubar.js"></script>
    <script src="{{ asset('material/base') }}/assets/js/Section/Sidebar.js"></script>
    <script src="{{ asset('material/base') }}/assets/js/Section/PageAside.js"></script>
    <script src="{{ asset('material/base') }}/assets/js/Plugin/menu.js"></script>

    <!-- Config -->
    <script src="{{ asset('material') }}/global/js/config/colors.js"></script>
    <script src="{{ asset('material/base') }}/assets/js/config/tour.js"></script>
    <script>
        Config.set('assets', '{{ asset('material/base') }}/assets');
    </script>

    <!-- Page -->
    <script src="{{ asset('material/base') }}/assets/js/Site.js"></script>
    <script src="{{ asset('material') }}/global/js/Plugin/asscrollable.js"></script>
    <script src="{{ asset('material') }}/global/js/Plugin/slidepanel.js"></script>
    <script src="{{ asset('material') }}/global/js/Plugin/switchery.js"></script>
    <script src="{{ asset('material') }}/global/js/Plugin/jquery-placeholder.js"></script>
    <script src="{{ asset('material') }}/global/js/Plugin/material.js"></script>
        <script src="{{ asset('material') }}/global/js/Plugin/datatables.js"></script>

        <script src="{{ asset('material/base') }}/assets/examples/js/tables/datatable.js"></script>
        <script src="{{ asset('material/base') }}/assets/examples/js/uikit/icon.js"></script>

    <script>
        (function(document, window, $) {
            'use strict';

            var Site = window.Site;
            $(document).ready(function() {
                Site.run();
            });
        })(document, window, jQuery);
    </script>

</body>

</html>

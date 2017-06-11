<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Expense-Tracker</title>
    <asset:stylesheet src="bootstrap.min.css"/>
    <asset:stylesheet src="material.min.css"/>
    <asset:stylesheet src="animate.min.css"/>
    <asset:stylesheet src="light-bootstrap-dashboard.css"/>
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Roboto:400,700,300' rel='stylesheet' type='text/css'>
    <asset:stylesheet src="pe-icon-7-stroke.css"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
                                                        rel="stylesheet">
    <style>
        a {
            color: #ED2553;
        }
    </style>
    <g:layoutHead/>
</head>
<body>
    <div class="wrapper">
        <div class="sidebar" data-image="https://lh4.googleusercontent.com/-XplyTa1Za-I/VMSgIyAYkHI/AAAAAAAADxM/oL-rD6VP4ts/w1184-h666/Android-Lollipop-wallpapers-Google-Now-Wallpaper-2.png" data-color="red" data-image="assets/img/sidebar-5.jpg">

        <!--

            Tip 1: you can change the color of the sidebar using: data-color="blue | azure | green | orange | red | purple"
            Tip 2: you can also add an image using data-image tag

        -->

            <div class="sidebar-wrapper">
                <div class="logo">
                    <a href="/dashBoard/index" class="simple-text">
                        Expense Tracker
                    </a>
                </div>

                <ul class="nav">
                    <li class="${params.action == 'dashBoard' ? 'active':''}">
                        <a href="/dashBoard/index">
                            <i class="fa fa-fw fa-dashboard"></i>
                            <p>DashBoard</p>
                        </a>
                    </li>
                    <li class="${params.action == 'timeline' ? 'active':''}">
                        <a href="/timeline/index">
                            <i class="fa fa-fw fa-clock-o"></i>
                            <p>TimeLine</p>
                        </a>
                    </li>
                    <li class="${params.action == 'reminder' ? 'active':''}">
                        <a href="/reminder/index">
                            <i class="fa fa-fw fa-bell-o"></i>
                            <p>Reminder</p>
                        </a>
                    </li>
                    <li class="${params.action == 'settings' ? 'active':''}">
                        <a href="/settings/index">
                            <i class="fa fa-fw fa-cog"></i>
                            <p>Settings</p>
                        </a>
                    </li>

                </ul>
            </div>
        </div>

        <div class="main-panel">
            <nav class="navbar navbar-default navbar-fixed">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand text-capitalize" href="#">${params.controller}</a>
                    </div>
                    <div class="collapse navbar-collapse">

                        <ul class="nav navbar-nav navbar-right">
                            <li>
                               <a href="/logout">
                                   Logout
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>


            <div class="content">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-8">
                            <div class="jumbotron">
                                <div class="container">
                                    <g:pageProperty name="page.body"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="jumbotron">
                                <div class="container-fluid">
                                <h2 class="page-header"><b>Options</b></h2><hr>
                                    <ul class="demo-list-icon mdl-list">
                                      <li class="mdl-list__item">
                                        <span class="mdl-list__item-primary-content">
                                        <a href="/settings/profile">
                                        View Profile
                                        </a>
                                    </span>
                                      </li>
                                      <li class="mdl-list__item">
                                        <span class="mdl-list__item-primary-content">
                                        <a href="/settings/learn">
                                        Teach App</a>
                                    </span>
                                      </li>
                                      <li class="mdl-list__item">
                                        <span class="mdl-list__item-primary-content">
                                        <a href="/settings/password">
                                        Change Password</a>
                                    </span>
                                      </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <footer class="footer">
                <div class="container-fluid">
                    <nav class="pull-left">
                        <ul>
                            <li>
                                <a href="#">
                                    Home
                                </a>
                            </li>

                        </ul>
                    </nav>
                    <p class="copyright pull-right">
                        &copy; <script>document.write(new Date().getFullYear())</script> <b>Ankit Kumar Singh</b>, made with love for a better web
                    </p>
                </div>
            </footer>

        </div>
    </div>
</body>

<asset:javascript src="jquery-1.10.2.js"/>
<asset:javascript src="bootstrap.min.js"/>
<asset:javascript src="bootstrap-checkbox-radio.swith.js"/>
<asset:javascript src="chartist.js"/>
<asset:javascript src="bootstrap.notify.js"/>
<asset:javascript src="light-bootstrap-dashboard.js"/>
<asset:javascript src="demo.js"/>
<asset:javascript src="material.min.js"/>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
</html>
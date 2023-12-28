<!DOCTYPE html>
<html lang="en" class="body-full-height">

<head>
    <title>Login</title>

    <meta charset="utf-8">


    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="./view/admin/new/assets/img/favicon.ico">


    <link rel="stylesheet" type="text/css" id="theme" href="./css/vims-theme.css"/>
    <link rel="stylesheet" type="text/css"  href="./css/full_html.css"/>
    <link rel="stylesheet" type="text/css"  href="./css/custom_buttons.css"/>
    <!--           <link href="./css/style_home.css" rel="stylesheet" type="text/css"/>      -->
    <!--webfonts-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:600italic,400,300,600,700' rel='stylesheet' type='text/css'>
    <!--//webfonts-->


</head>

<body>

<!-----start-main---->
<div class="login-container">

    <div class="login-box animated fadeInDown">
        <div class="login-logo"></div>
        <div class="login-body">
            <div class="login-title"><strong>Welcome</strong>, Please Login</div>
            <form action="./controller/super/Login.php" name="f"  class="form-horizontal" method="post" onSubmit='return call()'>
                <div class="form-group">
                    <div class="col-md-12">
                        <input type="text" class="form-control" placeholder="Username" name="username"/>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-12">
                        <input type="password" class="form-control" placeholder="Password" name="password"/>
                    </div>
                </div>
                <div class="form-group">


                </div>

                <div class="form-group">


                    <div class="col-md-4">

                        <button type="submit" class="btn btn-facebook btn-block">Log In</button>
                    </div>
                </div>
            </form>
        </div>
        <div class="login-footer">

            <?php
            // set timezone
            date_default_timezone_set('Africa/Lusaka');

            // Then call the date functions
            $year = date('Y');

            ?>

            <div class="pull-left">
                &copy; <?php echo $year;  ?> S.T.M.S
            </div>

            <div class="pull-right">

                <a href="#">Privacy</a> |
                <a href="#">Contact Us</a>
            </div>
        </div>
    </div>

</div>


</body>
</html>
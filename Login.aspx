<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Login.aspx.vb" Inherits="WebMessenger.Login"  EnableEventValidation="false" EnableViewState="true"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Web Messenger | Log in</title>
    <!-- Le styles -->
    <%--<link href="Content/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/css/bootstrap-responsive.min.css" rel="stylesheet" />
    <link href="Content/css/signin.css" rel="stylesheet" type="text/css" />--%>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="Scripts/dist/css/adminlte.min.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="Scripts/iCheck/square/blue.css">
    <!-- Google Font: Source Sans Pro -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700" rel="stylesheet">
</head>
<body class="hold-transition login-page">
    <form runat="server">
        <div class="login-box">
        <div class="login-logo">
            <a href="../../index2.html"><b>Web</b>Messenger</a>
        </div>
        <!-- /.login-logo -->
        <div class="card">
            <div class="card-body login-card-body">
                <p class="login-box-msg">Sign in to start your session</p>

                <form method="post">
                    <div class="form-group has-feedback">
                        <input  class="form-control" type="text"  placeholder="User" id="txtUserName" runat="server" required="required" autofocus="autofocus" autocomplete="off">
                    </div>
                    <div class="form-group has-feedback">
                        <input type="password" class="form-control" placeholder="Password" id="txtUserPass" runat="server">
                    </div>
                    <div class="row">
                        <div class="col-8">
                            <div class="checkbox icheck">
                                <label>
                                    <input type="checkbox">
                                    Remember Me
                                </label>
                            </div>
                        </div>
                        <!-- /.col -->
                        <div class="col-4">
                            <asp:Button type="submit" Cssclass="btn btn-primary btn-block btn-flat" runat="server" Text="Sign In" OnClick="Button1_Click" ID="button1"/>
                        </div>
                        <!-- /.col -->
                    </div>
                    
                            <asp:Label ID="lblMsg" ForeColor="red" Font-Name="Verdana" Font-Size="10" runat="server" />
                </form>

            </div>
            <!-- /.login-card-body -->
        </div>
    </div>
    <!-- /.login-box -->
    </form>
    

    <!-- jQuery -->
    <script src="Scripts/jquery/jquery.min.js"></script>
    <!-- Bootstrap 4 -->
    <script src="Scripts/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- iCheck -->
    <script src="Scripts/iCheck/icheck.min.js"></script>
    <script>
        $(function () {
            $('input').iCheck({
                checkboxClass: 'icheckbox_square-blue',
                radioClass: 'iradio_square-blue',
                increaseArea: '20%' // optional
            })
        })
    </script>
</body>
</html>

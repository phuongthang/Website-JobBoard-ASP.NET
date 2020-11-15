<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="fRegisterUser.aspx.cs" Inherits="ITWork.Administrator.Account.fRegisterUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- Original URL: http://themedesigner.in/demo/admin-press/main/pages-register.html
    Date Downloaded: 11/30/2018 3:41:57 PM !-->
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <!-- Tell the browser to be responsive to screen width -->
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="../Template/assets/images/favicon.png" />
    <title>Admin Press Admin Template - The Ultimate Bootstrap 4 Admin Template</title>
    <!-- Bootstrap Core CSS -->
    <link href="../Template/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Custom CSS -->
    <link href="../Template/assets/css/style.css" rel="stylesheet" />
    <!-- You can change the theme colors from here -->
    <link href="../Template/assets/css/colors/blue.css" id="theme" rel="stylesheet" />
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    <form id="form1" runat="server">
        <!-- ============================================================== -->
    <!-- Preloader - style you can find in spinners.css -->
    <!-- ============================================================== -->
    <div class="preloader">
        <svg class="circular" viewbox="25 25 50 50">
            <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10"></circle> </svg>
    </div>
    <!-- ============================================================== -->
    <!-- Main wrapper - style you can find in pages.scss -->
    <!-- ============================================================== -->
    <section id="wrapper">
        <div class="login-register" style="background-image:url(../Template/assets/images/background/login-register.jpg);">
            <div class="login-box card">
                <div class="card-body">
                    <div class="form-horizontal form-material" id="loginform">
                        <h3 class="box-title m-b-20">Sign Up</h3>
                        <asp:Panel ID="pnError" runat="server">
                            <div class="alert alert-danger alert-rounded" style="font-size:14px">
                                <i class="ti-announcement" style="margin-right:7px"></i>Account registration failed
                                </div>
                        </asp:Panel>
                        <asp:Panel ID="pnExist" runat="server">
                            <div class="alert alert-danger alert-rounded" style="font-size:14px">
                                <i class="ti-announcement" style="margin-right:7px"></i>The account already exists
                                </div>
                        </asp:Panel>
                        <div class="form-group">
                            <div class="col-xs-12">
                                <asp:TextBox ID="txtusername" runat="server" class="form-control" required="" placeholder="Name"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group ">
                            <div class="col-xs-12">
                                <asp:TextBox ID="txtemail" runat="server" class="form-control" required="" placeholder="Email"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group ">
                            <div class="col-xs-12">
                                <asp:TextBox ID="txtpassword" runat="server" class="form-control" TextMode="Password" required="" placeholder="Password"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-12">
                                <asp:TextBox ID="txtpasswordConfirm" runat="server" class="form-control" TextMode="Password" required="" placeholder="Confirm Password"></asp:TextBox>
                                
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-12">
                                <asp:DropDownList ID="DropObject" runat="server" CssClass="form-control" >
                                    <asp:ListItem Text="Organizations" Value="Organizations" ></asp:ListItem>
                                    <asp:ListItem Text="Personal" Value="Personal" ></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-12">
                                <div class="checkbox checkbox-success">
                                    <input id="checkbox-signup" type="checkbox" />
                                    <label for="checkbox-signup"> I agree to all <a href="#">Terms</a></label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group text-center m-t-20">
                            <div class="col-xs-12">
                                <asp:Button ID="btnSignup" runat="server" Text="Sign Up" class="btn btn-block btn-outline-info" style="width:100%;font-weight:600" OnCommand="btnSignup_Command"/>
                            </div>
                        </div>
                        <div class="form-group m-b-0">
                            <div class="col-sm-12 text-center">
                                <div>Already have an account? <a href="fLoginUser.aspx" class="text-info m-l-5"><b>Sign In</b></a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    </form>
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
    <script src="../Template/assets/plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="../Template/assets/plugins/bootstrap/js/popper.min.js"></script>
    <script src="../Template/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
    <script src="../Template/assets/js/jquery.slimscroll.js"></script>
    <!--Wave Effects -->
    <script src="../Template/assets/js/waves.js"></script>
    <!--Menu sidebar -->
    <script src="../Template/assets/js/sidebarmenu.js"></script>
    <!--stickey kit -->
    <script src="../Template/assets/plugins/sticky-kit-master/dist/sticky-kit.min.js"></script>
    <script src="../Template/assets/plugins/sparkline/jquery.sparkline.min.js"></script>
    <!--Custom JavaScript -->
    <script src="../Template/assets/js/custom.min.js"></script>
    <!-- ============================================================== -->
    <!-- Style switcher -->
    <!-- ============================================================== -->
    <script src="../Template/assets/plugins/styleswitcher/jQuery.style.switcher.js"></script>
</body>
</html>

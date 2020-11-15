<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/Dashboard/SiteDashboard.Master" AutoEventWireup="true" CodeBehind="fProfileAdmin.aspx.cs" Inherits="ITWork.Administrator.Dashboard.fProfileAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="row page-titles">
                <div class="col-md-5 align-self-center">
                    <h3 class="text-themecolor">Profile</h3>
                </div>
                <div class="col-md-7 align-self-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                        <li class="breadcrumb-item">pages</li>
                        <li class="breadcrumb-item active">Profile</li>
                    </ol>
                </div>
            </div>
            <!-- ============================================================== -->
            <!-- End Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                <!-- Row -->
                <div class="row">
                    <!-- Column -->
                    <div class="col-lg-4 col-xlg-3 col-md-5">
                        <div class="card">
                            <div class="card-body">
                                <center class="m-t-30"> <asp:Image ID="imageAvt" runat="server" class="img-circle" width="150"></asp:Image>
                                    <h4 class="card-title m-t-10"><asp:Label ID="lbFullname" runat="server"></asp:Label></h4>
                                    <h6 class="card-subtitle">Administrator</h6>
                                    <div class="row text-center justify-content-md-center">
                                    </div>
                                </center>
                            </div>
                            <div>
                                <hr /> </div>
                            <div class="card-body"> 
                                <small class="text-muted">Email address </small>
                                <h6><asp:Label ID="lbEmail" runat="server"></asp:Label></h6> 
                                <small class="text-muted p-t-30 db">Phone</small>
                                <h6><asp:Label ID="lbPhone" runat="server"></asp:Label></h6> 
                                <small class="text-muted p-t-30 db">Address</small>
                                <h6><asp:Label ID="lbAddress" runat="server"></asp:Label></h6>
                                <br />
                                <div class="map-box">
                                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d470029.1604841957!2d72.29955005258641!3d23.019996818380896!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x395e848aba5bd449%3A0x4fcedd11614f6516!2sAhmedabad%2C+Gujarat!5e0!3m2!1sen!2sin!4v1493204785508" width="100%" height="150" frameborder="0" style="border:0" allowfullscreen=""></iframe>
                                </div> <small class="text-muted p-t-30 db">Social Profile</small>
                                <br />
                                <button class="btn btn-circle btn-secondary"><i class="fa fa-facebook"></i></button>
                                <button class="btn btn-circle btn-secondary"><i class="fa fa-twitter"></i></button>
                                <button class="btn btn-circle btn-secondary"><i class="fa fa-youtube"></i></button>
                            </div>
                        </div>
                    </div>
                    <!-- Column -->
                    <!-- Column -->
                    <div class="col-lg-8 col-xlg-9 col-md-7">
                        <div class="card">
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs profile-tab" role="tablist">
                                <li class="nav-item"> <a class="nav-link active" data-toggle="tab" href="#profile" role="tab">Profile</a> </li>
                                <li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#settings" role="tab">Settings</a> </li>
                            </ul>
                            <!-- Tab panes -->
                            <div class="tab-content">
                                <!--second tab-->
                                <div class="tab-pane active" id="profile" role="tabpanel">
                                    <div class="card-body">
                                        <p class="btn btn-danger ">Description :</p>
                                        <p class="m-t-30"><asp:Label ID="lbDetail" runat="server"></asp:Label></p>
                                        
                                    </div>
                                </div>
                                <div class="tab-pane" id="settings" role="tabpanel">
                                    <div class="card-body">
                                        <div class="form-horizontal form-material">
                                            <div class="form-group">
                                                <label class="col-md-12">Full Name :</label>
                                                <div class="col-md-12">
                                                    <asp:TextBox ID="txtfullnameedit" runat="server" class="form-control form-control-line"></asp:TextBox>
                                                    
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="example-email" class="col-md-12">Address :</label>
                                                <div class="col-md-12">
                                                    <asp:TextBox ID="txtaddressedit" runat="server"  class="form-control form-control-line" ></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-12">Phone Number :</label>
                                                <div class="col-md-12">
                                                    <asp:TextBox ID="txtphonenumberedit" runat="server" class="form-control form-control-line"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-12">Description :</label>
                                                <div class="col-md-12">
                                                    <asp:TextBox ID="txtdetailedit" runat="server" rows="5" TextMode="MultiLine" class="form-control form-control-line"></asp:TextBox>
                                                    
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-12">Avatar :</label>
                                                <div class="col-md-12">
                                                    <br />
                                                    <asp:FileUpload ID="FuAvt" runat="server" />
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="col-sm-12">
                                                    <asp:Button ID="btnUpdate" runat="server" Text="Update Profile" class="btn btn-success" OnCommand="btnUpdate_Command" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Column -->
                </div>
                <!-- Row -->
                <!-- ============================================================== -->
                <!-- End PAge Content -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Right sidebar -->
                <!-- ============================================================== -->
                <!-- .right-sidebar -->
                <!-- ============================================================== -->
                <!-- End Right sidebar -->
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>

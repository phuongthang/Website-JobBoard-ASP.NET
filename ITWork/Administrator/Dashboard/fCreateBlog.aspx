<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/Dashboard/SiteDashboard.Master" AutoEventWireup="true" CodeBehind="fCreateBlog.aspx.cs" Inherits="ITWork.Administrator.Dashboard.fCreateBlog" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="row page-titles">
                <div class="col-md-5 align-self-center">
                    <h3 class="text-themecolor">Create Blog</h3>
                </div>
                <div class="col-md-7 align-self-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                        <li class="breadcrumb-item">Blog</li>
                        <li class="breadcrumb-item active">Create Blog</li>
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
                    <div class="col-lg-12">
                        <div class="card card-outline-info">
                            <div class="card-header">
                                <h4 class="m-b-0 text-white">Create Blog</h4>
                            </div>
                            <div class="card-body">
                                <div>
                                    <div class="form-body">
                                        <asp:Panel ID="pnError" runat="server">
                            <div class="alert alert-danger alert-rounded" style="font-size:14px">
                                <i class="ti-announcement" style="margin-right:7px"></i>Job repair failed 
                                </div>
                        </asp:Panel>
                        <asp:Panel ID="pnSuccess" runat="server">
                            <div class="alert alert-success alert-rounded" style="font-size:14px">
                                <i class="ti-announcement" style="margin-right:7px"></i>Repair job successfully
                                </div>
                        </asp:Panel>
                                        <hr />
                                        <div class="row p-t-20">
                                            <div class="col-md-12">
                                                <div class="form-group has-success">
                                                    <label class="control-label">Title :</label>
                                                    <asp:TextBox ID="txtTitle" runat="server" class="form-control" required=""></asp:TextBox>
                                                   </div>
                                            </div>
                                            <!--/span-->
                                            
                                            <!--/span-->
                                        </div>

                                        <div class="row p-t-20">
                                            <div class="col-md-12">
                                                <div class="form-group has-success">
                                                    <label class="control-label">Avatar :</label>
                                                    <br />
                                                    <asp:FileUpload ID="FUAvatar" runat="server" />
                                                   </div>
                                            </div>
                                            <!--/span-->
                                            
                                            <!--/span-->
                                        </div>
                                         <!--/row-->
                                        <div class="row">
                                            
                                            <div class="col-lg-12">
                                                
                                                <div class="form-group has-success">
                                                    <label class="control-label">Content :</label>
                                                    <asp:TextBox ID="txtcontent" runat="server" TextMode="MultiLine" class="ckeditor"  Rows="40"></asp:TextBox>
                                               
                                                   </div>
                                            </div>
                                            
                                            <!--/span-->
                                        </div>
                                        <!--/row-->
                                        <div class="row">
                                            
                      
                                        </div>
                                        <div class="row">
                                            
                                            </div>
                                    <div class="form-actions">
                                        <asp:Button ID="btnSave" runat="server" Text="Save" class="btn btn-success" OnCommand="btnSave_Command" />
                                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" class="btn btn-inverse"  />
                                    </div>
                                </div>
                            </div>
                                </div>
                        </div>
                    </div>
                </div>
                </div>
                <!-- Row -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
    <script src="../../Scripts/ckeditor/ckeditor.js"></script>
</asp:Content>

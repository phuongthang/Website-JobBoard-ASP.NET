<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/Dashboard/SiteDashboard.Master" AutoEventWireup="true" CodeBehind="fEditCV.aspx.cs" Inherits="ITWork.Administrator.Dashboard.fEditCV" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
           <div class="row page-titles">
                <div class="col-md-5 align-self-center">
                    <h3 class="text-themecolor">Job Create</h3>
                </div>
                <div class="col-md-7 align-self-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Organizations</a></li>
                        <li class="breadcrumb-item">Job</li>
                        <li class="breadcrumb-item active">Job Create</li>
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
                <div class="col-lg-12 col-xlg-12 col-md-12">
                        <div class="card">
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs profile-tab" role="tablist">
                                <li class="nav-item"> <a class="nav-link active" data-toggle="tab" href="#profile" role="tab">Content</a> </li>
                                <li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#settings" role="tab">CV</a> </li>
                            </ul>
                            <!-- Tab panes -->
                            <div class="tab-content">
                                <!--second tab-->
                                <div class="tab-pane active" id="profile" role="tabpanel">
                                    <div class="card-body">
                                        <div class="row">
                    <div class="col-lg-12">
                        <div class="card card-outline-info">
                            <div class="card-header">
                                <h4 class="m-b-0 text-white">Job Create</h4>
                            </div>
                            <div class="card-body">
                                <div>
                                    <div class="form-body">
                                        <asp:Panel ID="pnError" runat="server">
                            <div class="alert alert-danger alert-rounded" style="font-size:14px">
                                <i class="ti-announcement" style="margin-right:7px"></i>CV creation failed
                                </div>
                        </asp:Panel>
                        <asp:Panel ID="pnSuccess" runat="server">
                            <div class="alert alert-success alert-rounded" style="font-size:14px">
                                <i class="ti-announcement" style="margin-right:7px"></i>Create a successful CV
                                </div>
                        </asp:Panel>
                                        <hr />
                                        <div class="row p-t-20">
                                            <!--/span-->
            
                                            <!--/span-->
                                        </div>
                                        <!--/row-->
                                        <div class="row">
                                            <div class="col-md-3">
                                                <div class="form-group has-success">
                                                    <label class="control-label">Birthday :</label>
                                                    <asp:TextBox ID="txtBirthday" runat="server" class="form-control" TextMode="Date" required=""></asp:TextBox>
                                                     </div>
                                            </div>
                                            <!--/span-->
                                            <div class="col-md-3">
                                                <div class="form-group has-success">
                                                    <label class="control-label">Position :</label>
                                                    <asp:TextBox ID="txtPosition" runat="server" class="form-control" required="" ></asp:TextBox>
                                                <small class="form-control-feedback"> ex : Backend Developer </small></div>
                                            </div>

                                   
                                            <!--/span-->

                                            <div class="col-md-3">
                                                <div class="form-group has-success">
                                                    <label class="control-label">Location :</label>
                                                    <asp:DropDownList ID="DropLocation" runat="server" class="form-control">
                                                        
                                                    </asp:DropDownList>
                                                    </div>
                                                </div>
                                            <div class="col-md-3">
                                                <div class="form-group has-success">
                                                    <label class="control-label">Language :</label>
                                                    <asp:DropDownList ID="DropLanguage" runat="server" class="form-control">
                                                        
               
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>
                                        <!--/row-->

                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group has-success">
                                                    <label class="control-label">Experience :</label>
                                                    <asp:TextBox ID="txtExperience" runat="server" TextMode="MultiLine" class="form-control ckeditor" Rows="10" required=""></asp:TextBox>
                                                </div>
                                            </div>
                      
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group has-success">
                                                    <label class="control-label">Skill :</label>
                                                    <asp:TextBox ID="txtSkill" runat="server" TextMode="MultiLine" class="form-control ckeditor" Rows="10" required=""></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-md-12">Link CV :</label>
                                                <div class="col-md-12">
                                                    <asp:FileUpload ID="FuCV" runat="server" />
                                                </div>
                                            </div>
                                            </div>
                                        
                                    <div class="form-actions">
                                        <asp:Button ID="btnSave" runat="server" Text="Save" class="btn btn-success" OnCommand="btnSave_Command"  />
                                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" class="btn btn-inverse" OnCommand="btnCancel_Command" />
                                    </div>
                                </div>
                            </div>
                                </div>
                        </div>
                    </div>
                </div>
                                        
                                    </div>
                                </div>
                                <div class="tab-pane" id="settings" role="tabpanel">
                                    <div class="card-body" >
                                        <div class="row">
                                            <div class="col-lg-3"></div>
                                            <div class="col-lg-8">
                                                <asp:Image ID="imgCV" runat="server" />
                                            </div>
                                            <div class="col-lg-1"></div>
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                <!-- Row -->
                
                </div>
                <!-- Row -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
    <script src="../../Scripts/ckeditor/ckeditor.js"></script>
</asp:Content>

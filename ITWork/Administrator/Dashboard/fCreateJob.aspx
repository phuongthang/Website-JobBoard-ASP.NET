<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/Dashboard/SiteDashboard.Master" AutoEventWireup="true" CodeBehind="fCreateJob.aspx.cs" Inherits="ITWork.Administrator.Dashboard.fCreateJob" %>
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
                <!-- Row -->
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
                                <i class="ti-announcement" style="margin-right:7px"></i>Job creation failed
                                </div>
                        </asp:Panel>
                        <asp:Panel ID="pnSuccess" runat="server">
                            <div class="alert alert-success alert-rounded" style="font-size:14px">
                                <i class="ti-announcement" style="margin-right:7px"></i>Create a successful job
                                </div>
                        </asp:Panel>
                                        <hr />
                                        <div class="row p-t-20">
                                            <div class="col-md-12">
                                                <div class="form-group has-success">
                                                    <label class="control-label">Job Title :</label>
                                                    <asp:TextBox ID="txtJobTitle" runat="server" class="form-control" required=""></asp:TextBox>
                                                   </div>
                                            </div>
                                            <!--/span-->
            
                                            <!--/span-->
                                        </div>
                                        <!--/row-->
                                        <div class="row">
                                            <div class="col-md-3">
                                                <div class="form-group has-success">
                                                    <label class="control-label">Date Start :</label>
                                                    <asp:TextBox ID="txtDateStart" runat="server" class="form-control" TextMode="Date" required=""></asp:TextBox>
                                                     </div>
                                            </div>
                                            <!--/span-->
                                            <div class="col-md-3">
                                                <div class="form-group has-success">
                                                    <label class="control-label">Date End :</label>
                                                    <asp:TextBox ID="txtDateEnd" runat="server" class="form-control" TextMode="Date" required=""></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group has-success">
                                                    <label class="control-label">Position :</label>
                                                    <asp:TextBox ID="txtPosition" runat="server" class="form-control" required="" ></asp:TextBox>
                                                <small class="form-control-feedback"> ex : Backend Developer </small></div>
                                            </div>

                                   
                                            <!--/span-->
                                        </div>
                                        <!--/row-->

                                         <!--/row-->
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group has-success">
                                                    <label class="control-label">Location :</label>
                                                    <asp:DropDownList ID="DropLocation" runat="server" class="form-control">
    
                                                    </asp:DropDownList>
                                                    </div>
                                            </div>
                                            <!--/span-->
                                            <div class="col-md-4">
                                                <div class="form-group has-success">
                                                    <label class="control-label">Salary :</label>
                                                    <asp:TextBox ID="txtSalary" runat="server" class="form-control" required=""></asp:TextBox>
                                                    <small class="form-control-feedback"> ex : 1000 USD </small>
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="form-group has-success">
                                                    <label class="control-label">Language :</label>
                                                    <asp:DropDownList ID="DropLanguage" runat="server" class="form-control">
               
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="form-group has-success">
                                                    <label class="control-label">Numbers :</label>
                                                    <asp:TextBox ID="txtNumber" runat="server" class="form-control" required="" TextMode="Number" value="1"  ></asp:TextBox>
                                                </div>
                                            </div>
                                            <!--/span-->
                                        </div>
                                        <!--/row-->
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group has-success">
                                                    <label class="control-label">Description :</label>
                                                    <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" class="form-control" Rows="10" required=""></asp:TextBox>
                                                </div>
                                            </div>
                      
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group has-success">
                                                    <label class="control-label">Required Skill :</label>
                                                    <asp:TextBox ID="txtRequiredSkill" runat="server" TextMode="MultiLine" class="form-control" Rows="10" required=""></asp:TextBox>
                                                </div>
                                            </div>
                                            </div>
                                    <div>
                                        <asp:Button ID="btnSave" runat="server" Text="Save" class="btn btn-success" OnCommand="btnSave_Command"/>
                                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" class="btn btn-inverse" OnCommand="btnCancel_Command"  />
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
</asp:Content>

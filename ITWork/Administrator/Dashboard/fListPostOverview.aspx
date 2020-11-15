<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/Dashboard/SiteDashboard.Master" AutoEventWireup="true" CodeBehind="fListPostOverview.aspx.cs" Inherits="ITWork.Administrator.Dashboard.fListPostOverview" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
         <!-- ============================================================== -->
            <!-- Bread crumb and right sidebar toggle -->
            <!-- ============================================================== -->
            <div class="row page-titles">
    <div class="col-md-5 align-self-center">
                    <h3 class="text-themecolor">View</h3>
                </div>
                <div class="col-md-7 align-self-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                        <li class="breadcrumb-item">Apps</li>
                        <li class="breadcrumb-item active">View</li>
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
                <!-- .row -->
                <div class="row">
                    <!-- .col -->
                    <asp:Repeater ID="rpPostOverview" runat="server">
                        <ItemTemplate>
                            <div class="col-md-6 col-lg-6 col-xlg-4">
                        <div class="card card-body">
                            <div class="row">
                                <div class="col-md-4 col-lg-3 text-center">
                                    <a href="#"> <asp:Image ID="imgAvatar" runat="server" ImageUrl='<%# "../Template/assets/images/blog/" + Eval("Avatar").ToString() %>' alt="user" class="img-circle img-responsive" /></a>
                                </div>
                                <div class="col-md-8 col-lg-9">
                                    <h3 class="box-title m-b-0"><asp:Label ID="lbTitle" runat="server" Text='<%# Eval("Title").ToString() %>'></asp:Label></h3>
                                    <br />
     
                                    <h5>
                                    <asp:HyperLink ID="linkEdit" runat="server" NavigateUrl='<%# "fEditBlog.aspx?ID="+ Eval("ID").ToString() %>' class="btn-sm btn btn-info" >Edit</asp:HyperLink>
                                    <asp:Label ID="status" runat="server" class="checkstatus" Text='<%# getStatus(Eval("ID").ToString()) %>'></asp:Label>
                                    </h5>
                                    
                                    <asp:HyperLink ID="linkJobDetail" runat="server" NavigateUrl='<%# "fViewDetailBlog.aspx?ID="+ Eval("ID").ToString() %>' class="btn btn-outline-info" style="width:100%;font-weight:600">View</asp:HyperLink>
                                </div>
                               
                            </div>
                             
                        </div>
                        </div>
                        </ItemTemplate>
                        
                    </asp:Repeater>
                    
                    <!-- /.col -->
                    <!-- .col -->
                    </div>
                    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
    <script>
        function activestatus() {
            $n = $('.checkstatus').length;
            $check = $('.checkstatus');
            for ($i = 0; $i < $n; $i = $i + 1) {
                if ($check[$i].textContent == "Active") {
                    $('#content_rpPostOverview_status_' + $i).removeClass('btn-sm btn btn-danger').addClass('btn-sm btn btn-info');
                }
                if ($check[$i].textContent == "Processing") {
                    $('#content_rpPostOverview_status_' + $i).removeClass('btn-sm btn btn-info').addClass('btn-sm btn btn-danger');
                }
            }
        }
        

        $(document).ready(function () {
            activestatus();
        });
        
    </script>
</asp:Content>

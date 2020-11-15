<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/Dashboard/SiteDashboard.Master" AutoEventWireup="true" CodeBehind="fListJobOverview.aspx.cs" Inherits="ITWork.Administrator.Dashboard.fListJobOverview" %>
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
                    <asp:Repeater ID="rpJobOverview" runat="server">
                        <ItemTemplate>
                            <div class="col-md-6 col-lg-6 col-xlg-4">
                        <div class="card card-body">
                            <div class="row">
                                <div class="col-md-4 col-lg-3 text-center">
                                    <a href="#"> <asp:Image ID="imgLogo" runat="server" ImageUrl='<%# "../Template/assets/images/organization/" + getImg(Eval("Username").ToString()) %>' alt="user" class="img-circle img-responsive" /></a>
                                </div>
                                <div class="col-md-8 col-lg-9">
                                    <h3 class="box-title m-b-0"><asp:Label ID="lbJobTitle" runat="server" Text='<%# getJobTitle(Convert.ToInt32(Eval("ID").ToString())) %>'></asp:Label></h3>
                                    <br />
     
                                    <h5><asp:Label ID="Label1" runat="server" Text='<%# getJobPosition(Convert.ToInt32(Eval("ID").ToString())) %>'></asp:Label>
                                    <asp:HyperLink ID="linkEdit" runat="server" NavigateUrl='<%# "fEditJob.aspx?ID="+ Eval("ID").ToString()+"&&Username="+Eval("Username").ToString() %>' class="btn-sm btn btn-info" style="margin-left:115px">Edit</asp:HyperLink>
                                    <asp:Label ID="status" runat="server" class="checkstatus" Text='<%# getStatus(Convert.ToInt32(Eval("ID").ToString())) %>'></asp:Label>
                                    </h5>
                                    <i class="fa fa-bitcoin text-warning" style="margin-right:10px"></i>
                                    <asp:Label ID="Label2" runat="server" Text='<%# string.Format("{0:#,0}",Convert.ToInt32(getJobSalary(Convert.ToInt32(Eval("ID").ToString())))) + " USD"  %>'></asp:Label>
                                    <br />
                                    <i class="fa fa-phone text-success" style="margin-right:10px"></i><asp:Label ID="Label3" runat="server" Text='<%# getPhone(Eval("Username").ToString()) %>'></asp:Label>
                                    <br />
                                    <i class="fa fa-map-marker text-danger" style="margin-right:15px"></i><asp:Label ID="Label4" runat="server" Text='<%# getLocation(Convert.ToInt32(Eval("ID").ToString())) %>'></asp:Label>
                                    <br />
                                    <br />
                                    <asp:HyperLink ID="linkJobDetail" runat="server" NavigateUrl='<%# "fJobDetail.aspx?ID="+ Eval("ID").ToString()+"&&Username="+Eval("Username").ToString() %>' class="btn btn-outline-info" style="width:100%;font-weight:600">View</asp:HyperLink>
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
                    $('#content_rpJobOverview_status_' + $i).removeClass('btn-sm btn btn-danger').removeClass('btn-sm btn btn-warning').addClass('btn-sm btn btn-info');
                }
                if ($check[$i].textContent == "Processing") {
                    $('#content_rpJobOverview_status_' + $i).removeClass('btn-sm btn btn-info').removeClass('btn-sm btn btn-warning').addClass('btn-sm btn btn-danger');
                }
                if ($check[$i].textContent == "Expired") {
                    $('#content_rpJobOverview_status_' + $i).removeClass('btn-sm btn btn-info').removeClass('btn-sm btn btn-danger').addClass('btn-sm btn btn-warning');
                }
            }
        }
        

        $(document).ready(function () {
            activestatus();
        });
        
    </script>
</asp:Content>

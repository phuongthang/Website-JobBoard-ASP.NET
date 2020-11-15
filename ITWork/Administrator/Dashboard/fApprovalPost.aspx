<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/Dashboard/SiteDashboard.Master" AutoEventWireup="true" CodeBehind="fApprovalPost.aspx.cs" Inherits="ITWork.Administrator.Dashboard.fApprovalPost" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
<div class="row page-titles">
                <div class="col-md-5 align-self-center">
                    <h3 class="text-themecolor">Approval Post</h3>
                </div>
                <div class="col-md-7 align-self-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                        <li class="breadcrumb-item">Approval</li>
                        <li class="breadcrumb-item active">Approval Post</li>
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
                <div class="row">
                    <!-- column -->
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">Search :</h4>
                                <div class="table-responsive">
                                    <div class="row">
                                        <div class="col-lg-2">
                                            <div class="form-group">
                                    <div class="col-xs-12">
                                        <asp:DropDownList ID="DropObject" runat="server" class="form-control" OnSelectedIndexChanged="DropObject_SelectedIndexChanged" AutoPostBack="true" >
                                        <asp:ListItem Text="All" Value="All"></asp:ListItem>
                                        <asp:ListItem Text="Active" Value="Active"></asp:ListItem>
                                        <asp:ListItem Text="Processing" Value="Processing"></asp:ListItem>
                                    </asp:DropDownList>
                                    </div>
                                </div>
                                        </div>
                                    </div>
                                    
                                    <asp:GridView ID="dgvApprovalPost" runat="server" class="table table-bordered" AutoGenerateColumns="false" HeaderStyle-HorizontalAlign="Center" AlternatingRowStyle-BackColor="#eff2f7" AlternatingRowStyle-ForeColor="#495057" OnPageIndexChanging="dgvApprovalPost_PageIndexChanging"  AllowPaging="true"  PageSize="5" >
                                        <PagerStyle  HorizontalAlign="Right" ForeColor="#FFF"></PagerStyle>
                                        <Columns>
                                                    <asp:TemplateField HeaderText="#" ItemStyle-HorizontalAlign="Center" >
                                                        <ItemTemplate >
                                                            <%# Container.DataItemIndex + 1 %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                         </Columns>
                                        <Columns >
                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" >
                                                        <HeaderTemplate>
                                                            Action
                                                        </HeaderTemplate>
                                                        <ItemTemplate >
                                                            <asp:HyperLink ID="linkJobDetail" runat="server" NavigateUrl='<%# "fViewDetailBlog.aspx?ID="+ Eval("ID").ToString() %>' data-toggle="tooltip" data-original-title="View"><i class="fa fa-info text-info  m-r-10"></i></asp:HyperLink>
                                                            
                                                            <asp:LinkButton ID="linkDelete" runat="server"  CommandArgument='<%# Eval("ID").ToString() %>'  data-toggle="tooltip" data-original-title="Delete" OnCommand="linkDelete_Command" OnClientClick="return checkValid()"  ><i class="fa fa-close text-danger"></i></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                        <Columns>
                                            <asp:TemplateField HeaderText="Logo" ItemStyle-HorizontalAlign="Center" >
                                                        <ItemTemplate >
                                                            <asp:Image ID="imgAvt" runat="server" width="40" class="img-circle" ImageUrl='<%# "../Template/assets/images/" + getImage(Eval("Username").ToString())  %>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                        </Columns>
                                        <Columns>
                                                    <asp:BoundField DataField="Title" HeaderText="Title" ItemStyle-HorizontalAlign="Center"  />
                                                    
         
                                       </Columns>
                                        <Columns>
                                            <asp:TemplateField HeaderText="Date" ItemStyle-HorizontalAlign="Center" >
                                                        <ItemTemplate >
                                                            <asp:Label ID="Label1" runat="server" Text='<%# getDate(Eval("Date").ToString()) %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                        </Columns>
                                       <Columns>
                                           <asp:TemplateField HeaderText="Status" ItemStyle-HorizontalAlign="Center" >
                                                        <ItemTemplate >
                                                            <asp:Label ID="lbStatus" runat="server" Text='<%# getStatus(Eval("ID").ToString()) %>' class="checkstatus"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                       </Columns>
                                        <Columns>
                                           <asp:TemplateField HeaderText="Main" ItemStyle-HorizontalAlign="Center" >
                                                        <ItemTemplate >
                                                            <asp:Label ID="lbMain" runat="server" Text='<%# getMain(Eval("ID").ToString()) %>' class="checkmain"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                       </Columns>

                                        <Columns >
                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" >
                                                        <HeaderTemplate>
                                                            Edit
                                                        </HeaderTemplate>
                                                        <ItemTemplate >
                                                            <asp:LinkButton ID="linkApproval" runat="server"  CommandArgument='<%# Eval("ID").ToString() %>' data-toggle="tooltip" data-original-title="Active" OnCommand="linkApproval_Command"  OnClientClick="return checkValid() " ><i class="fa fa-refresh text-sucess  m-r-10"></i></asp:LinkButton>
                                                            <asp:LinkButton ID="linkMain" runat="server"  CommandArgument='<%# Eval("ID").ToString() %>'  data-toggle="tooltip" data-original-title="Pin to start" OnCommand="linkMain_Command" OnClientClick="return checkValid_1()"  ><i class="fa fa-thumb-tack text-info"></i></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                    </div>
                 </div>
             </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
    <script>
        function checkValid() {
            if (confirm("Bạn có chắc là muốn thay đổi trạng thái ??") == true) {
                return true;
            }
            return false;
        }
        function checkValid_1() {
            if (confirm("Bạn có chắc là muốn thay đổi trạng thái ??") == true) {
                return true;
            }
            return false;
        }
    </script>
    <script>
        function activestatus() {
            $n = $('.checkstatus').length;
            $check = $('.checkstatus');
            for ($i = 0; $i < $n; $i = $i + 1) {
                if ($check[$i].textContent == "Active") {
                    $('#content_dgvApprovalPost_lbStatus_' + $i).removeClass('btn-sm btn btn-danger').addClass('btn-sm btn btn-success');
                }
                if ($check[$i].textContent == "Processing") {
                    $('#content_dgvApprovalPost_lbStatus_' + $i).removeClass('btn-sm btn btn-success').addClass('btn-sm btn btn-danger');
                }
            }
        }

        function activemain() {
            $n = $('.checkmain').length;
            $check = $('.checkmain');
            for ($i = 0; $i < $n; $i = $i + 1) {
                if ($check[$i].textContent == "Yes") {
                    $('#content_dgvApprovalPost_lbMain_' + $i).removeClass('btn-sm btn btn-danger').addClass('btn-sm btn btn-info');
                }
                if ($check[$i].textContent == "No") {
                    $('#content_dgvApprovalPost_lbMain_' + $i).removeClass('btn-sm btn btn-info').addClass('btn-sm btn btn-danger');
                }
            }
        }

        $(document).ready(function () {
            activestatus();
            activemain();
        });

    </script>
</asp:Content>

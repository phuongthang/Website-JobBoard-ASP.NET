<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/Dashboard/SiteDashboard.Master" AutoEventWireup="true" CodeBehind="fAccountPersonal.aspx.cs" Inherits="ITWork.Administrator.Dashboard.fAccountPersonal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="row page-titles">
                <div class="col-md-5 align-self-center">
                    <h3 class="text-themecolor">Account Managers</h3>
                </div>
                <div class="col-md-7 align-self-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                        <li class="breadcrumb-item">Account Managers</li>
                        <li class="breadcrumb-item active">Account Personal</li>
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
                                <h4 class="card-title">Account Personal</h4>
                                <asp:Panel ID="pnThongbao" runat="server">
                                <div class="alert alert-success alert-rounded" style="font-size:13px">
                                <i class="ti-announcement" style="margin-right:7px"></i>Successfully reset password
                                </div>
                                </asp:Panel>
                                <div class="table-responsive">
                                    <asp:GridView ID="dgvAccountPerson" runat="server" class="table table-bordered" AutoGenerateColumns="false" HeaderStyle-HorizontalAlign="Center" AlternatingRowStyle-BackColor="#eff2f7" AlternatingRowStyle-ForeColor="#495057" AllowPaging="true" OnPageIndexChanging="dgvAccountPerson_PageIndexChanging" PageSize="5" >
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
                                                            <asp:LinkButton ID="linkEdit" runat="server"  CommandArgument='<%# Eval("Username").ToString() %>' data-toggle="tooltip" data-original-title="Reset" OnCommand="linkEdit_Command" OnClientClick="return checkReset()" ><i class="fa fa-refresh text-info  m-r-10 "></i></asp:LinkButton>
                                                            <asp:LinkButton ID="linkDelete" runat="server"  CommandArgument='<%# Eval("Username").ToString() %>'  data-toggle="tooltip" data-original-title="Delete" OnClientClick="return checkValid()" OnCommand="linkDelete_Command" ><i class="fa fa-close text-danger"></i></asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                        <Columns>
                                            <asp:TemplateField HeaderText="Avatar" ItemStyle-HorizontalAlign="Center" >
                                                        <ItemTemplate >
                                                            <asp:Image ID="imgAvt" runat="server" width="40" class="img-circle" ImageUrl='<%# "../Template/assets/images/" + getImage(Eval("Username").ToString())  %>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                        </Columns>
                                        <Columns>
                                                    <asp:BoundField DataField="Username" HeaderText="Username" ItemStyle-HorizontalAlign="Center"  />
                                                    <asp:BoundField DataField="Fullname" HeaderText="Full Name" ItemStyle-HorizontalAlign="Center"  />
                                                    <asp:BoundField DataField="Phone" HeaderText="Phone" ItemStyle-HorizontalAlign="Center" />
                                                    <asp:BoundField DataField="Position" HeaderText="Position" ItemStyle-HorizontalAlign="Center" />
         
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
            if (confirm("Bạn có chắc muốn xóa tài khoản này không ??") == true) {
                return true;
            }
            return false;
        }

        function checkReset() {
            if (confirm("Bạn có chắc muốn reset tài khoản này không ??") == true) {
                return true;
            }
            return false;
        }
    </script>
</asp:Content>

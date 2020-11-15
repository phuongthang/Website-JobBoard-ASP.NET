<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/Dashboard/SiteDashboard.Master" AutoEventWireup="true" CodeBehind="fApprovalCV.aspx.cs" Inherits="ITWork.Administrator.Dashboard.fApprovalCV" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="row page-titles">
                <div class="col-md-5 align-self-center">
                    <h3 class="text-themecolor">Approval CV</h3>
                </div>
                <div class="col-md-7 align-self-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                        <li class="breadcrumb-item">Approval</li>
                        <li class="breadcrumb-item active">Approval CV</li>
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
                                        <asp:DropDownList ID="DropObject" runat="server" class="form-control" OnSelectedIndexChanged="DropObject_SelectedIndexChanged" AutoPostBack="true">
                                        <asp:ListItem Text="All" Value="All"></asp:ListItem>
                                        <asp:ListItem Text="Pin" Value="Pin"></asp:ListItem>
                                        <asp:ListItem Text="No Pin" Value="NoPin"></asp:ListItem>
                                    </asp:DropDownList>
                                    </div>
                                </div>
                                        </div>
                                    </div>
                                    
                                    <asp:GridView ID="dgvApprovalCV" runat="server" class="table table-bordered" AutoGenerateColumns="false" HeaderStyle-HorizontalAlign="Center" AlternatingRowStyle-BackColor="#eff2f7" AlternatingRowStyle-ForeColor="#495057"  AllowPaging="true"  PageSize="5" OnPageIndexChanging="dgvApprovalCV_PageIndexChanging" >
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
                                                            <asp:HyperLink ID="linkJobDetail" runat="server" NavigateUrl='<%# "fDetailCV.aspx?ID="+ Eval("ID").ToString()+"&&Username="+Eval("Username").ToString() %>' data-toggle="tooltip" data-original-title="View"><i class="fa fa-info text-info  m-r-10"></i></asp:HyperLink>
                                                            
                                                            <asp:LinkButton ID="linkDelete" runat="server"  CommandArgument='<%# Eval("ID").ToString() %>'  data-toggle="tooltip" data-original-title="Delete" OnClientClick="return checkValid()"  ><i class="fa fa-close text-danger"></i></asp:LinkButton>
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
                                                    <asp:BoundField DataField="FullName" HeaderText="Full Name" ItemStyle-HorizontalAlign="Center"  />
                                                    <asp:BoundField DataField="Position" HeaderText="Position" ItemStyle-HorizontalAlign="Center" />
         
                                       </Columns>
                                        <Columns>
                                           <asp:TemplateField HeaderText="Pin" ItemStyle-HorizontalAlign="Center" >
                                                        <ItemTemplate >
                                                            <asp:Label ID="lbPin" runat="server" Text='<%# getPin(Eval("ID").ToString()) %>' class="checkmain"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                       </Columns>

                                        <Columns >
                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" >
                                                        <HeaderTemplate>
                                                            Edit
                                                        </HeaderTemplate>
                                                        <ItemTemplate >
                                                            <asp:LinkButton ID="linkPin" runat="server"  CommandArgument='<%# Eval("ID").ToString() %>'  data-toggle="tooltip" data-original-title="Pin to start" OnClientClick="return checkValid_1()" OnCommand="linkPin_Command"   ><i class="fa fa-thumb-tack text-info"></i></asp:LinkButton>
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
        function activemain() {
            $n = $('.checkmain').length;
            $check = $('.checkmain');
            for ($i = 0; $i < $n; $i = $i + 1) {
                if ($check[$i].textContent == "Yes") {
                    $('#content_dgvApprovalCV_lbPin_' + $i).removeClass('btn-sm btn btn-danger').addClass('btn-sm btn btn-info');
                }
                if ($check[$i].textContent == "No") {
                    $('#content_dgvApprovalCV_lbPin_' + $i).removeClass('btn-sm btn btn-info').addClass('btn-sm btn btn-danger');
                }
            }
        }

        $(document).ready(function () {
            activemain();
        });
    </script>
</asp:Content>

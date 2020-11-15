<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/Dashboard/SiteDashboard.Master" AutoEventWireup="true" CodeBehind="fViewApply.aspx.cs" Inherits="ITWork.Administrator.Dashboard.fViewApply" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
        <div class="row page-titles">
                <div class="col-md-5 align-self-center">
                    <h3 class="text-themecolor">Job Confirm</h3>
                </div>
                <div class="col-md-7 align-self-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                        <li class="breadcrumb-item">Job Confirm</li>
                        <li class="breadcrumb-item active">Confirm</li>
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
                                        <asp:ListItem Text="Pending" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="Accept" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="Eject" Value="0"></asp:ListItem>
                                    </asp:DropDownList>
                                    </div>
                                </div>
                                        </div>
                                        <div class="col-lg-3">
                                            <div class="form-group">
                                    <div class="col-xs-12">
                                        <asp:DropDownList ID="DropJob" runat="server" class="form-control" OnSelectedIndexChanged="DropJob_SelectedIndexChanged" AutoPostBack="true">
                                    </asp:DropDownList>
                                    </div>
                                </div>
                                        </div>
                                    </div>
                                    
                                    <asp:GridView ID="dgvApprovalJob" runat="server" class="table table-bordered" AutoGenerateColumns="false" HeaderStyle-HorizontalAlign="Center" AlternatingRowStyle-BackColor="#eff2f7" AlternatingRowStyle-ForeColor="#495057"  AllowPaging="true" PageSize="5" >
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
                                                            Info
                                                        </HeaderTemplate>
                                                        <ItemTemplate >
                                                            <asp:HyperLink ID="linkJobDetaill" runat="server" NavigateUrl='<%# "fDetailCV.aspx?ID="+ (getID(Eval("UsernameU").ToString())).ToString() +"&&Username="+Eval("UsernameU").ToString() %>' data-toggle="tooltip" data-original-title="View"><i class="fa fa-info text-info  m-r-10"></i></asp:HyperLink>

                                                            
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                        <Columns >
                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" >
                                                        <HeaderTemplate>
                                                            Action
                                                        </HeaderTemplate>
                                                        <ItemTemplate >
                                                            <asp:LinkButton ID="linkAccept" runat="server"  CommandArgument='<%# Eval("ID").ToString() %>'  data-toggle="tooltip" data-original-title="Accept" OnClientClick="return checkValid_1()" OnCommand="linkAccept_Command" ><i class="fa fa-check text-success m-r-10"></i></asp:LinkButton>
                                                            <asp:LinkButton ID="linkDelete" runat="server"  CommandArgument='<%# Eval("ID").ToString() %>'  data-toggle="tooltip" data-original-title="Eject" OnClientClick="return checkValid()" OnCommand="linkDelete_Command"  ><i class="fa fa-close text-danger"></i></asp:LinkButton>

                                                            
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                        
                                        <Columns>
                                            <asp:TemplateField HeaderText="Avatar" ItemStyle-HorizontalAlign="Center" >
                                                        <ItemTemplate >
                                                            <asp:HyperLink ID="linkJobDetail" runat="server" NavigateUrl='<%# "fDetailCV.aspx?ID="+ (getID(Eval("UsernameU").ToString())).ToString() +"&&Username="+Eval("UsernameU").ToString() %>' data-toggle="tooltip" data-original-title="View"><asp:Image ID="imgAvt" runat="server" width="40" class="img-circle" ImageUrl='<%# "../Template/assets/images/" + getImage(Eval("UsernameU").ToString())  %>' /></asp:HyperLink>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                        </Columns>
                                       <Columns>
                                           <asp:TemplateField HeaderText="Full Name" ItemStyle-HorizontalAlign="Center" >
                                                        
                                                        <ItemTemplate >
                                                            <asp:Label ID="lbMain" runat="server" Text='<%# getFullName(Eval("UsernameU").ToString()) %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                       </Columns>
                                        <Columns>
                                           <asp:TemplateField HeaderText="Job Title" ItemStyle-HorizontalAlign="Center" >
                                                        <ItemTemplate >
                                                            <asp:Label ID="lbIDJob" runat="server" Text='<%# getJobtitle(Eval("IDJob").ToString()) %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                       </Columns>
                                        <Columns>
                                           <asp:TemplateField HeaderText="Phone" ItemStyle-HorizontalAlign="Center" >
                                                        <ItemTemplate >
                                                            <asp:Label ID="lbPhone" runat="server" Text='<%# getPhone(Eval("UsernameU").ToString()) %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                       </Columns>
                                        <Columns>
                                           <asp:BoundField HeaderText="Email" DataField="Email" ItemStyle-HorizontalAlign="Center" />
                                       </Columns>
                                        <Columns>
                                           <asp:TemplateField HeaderText="Status" ItemStyle-HorizontalAlign="Center" >
                                                        <ItemTemplate >
                                                            <asp:Label ID="lbStatuss" runat="server" Text='<%# getStatus(Eval("ID").ToString()) %>' class="checkstatus"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                       </Columns>
                                        <Columns >
                                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center" >
                                                        <HeaderTemplate>
                                                            View CV
                                                        </HeaderTemplate>
                                                        <ItemTemplate >
                                                            <asp:HyperLink ID="linkCVdetail" runat="server" NavigateUrl='<%# "fViewCV.aspx?ID="+ (getID1(Eval("UsernameU").ToString(),(Eval("IDJob").ToString())).ToString()) %>' data-toggle="tooltip" data-original-title="View CV"><i class="fa fa-paperclip text-info  m-r-10"></i>CV</asp:HyperLink>
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
            if (confirm("Bạn có chắc là muốn từ chối CV này ??") == true) {
                return true;
            }
            return false;
        }
        function checkValid_1() {
            if (confirm("Bạn có chắc là muốn chấp nhận CV này ??") == true) {
                return true;
            }
            return false;
        }
        function activestatus() {
            $n = $('.checkstatus').length;
            $check = $('.checkstatus');
            for ($i = 0; $i < $n; $i = $i + 1) {
                if ($check[$i].textContent == "Accept") {
                    $('#content_dgvApprovalJob_lbStatuss_' + $i).removeClass('btn-sm btn btn-danger').removeClass('btn-sm btn btn-info').addClass('btn-sm btn btn-success');
                }
                if ($check[$i].textContent == "Pending") {
                    $('#content_dgvApprovalJob_lbStatuss_' + $i).removeClass('btn-sm btn btn-info').removeClass('btn-sm btn btn-success').addClass('btn-sm btn btn-danger');
                }
                if ($check[$i].textContent == "Eject") {
                    $('#content_dgvApprovalJob_lbStatuss_' + $i).removeClass('btn-sm btn btn-info').removeClass('btn-sm btn btn-success').addClass('btn-sm btn btn-danger');
                }

            }
        }
        $(document).ready(function () {
            activestatus();
        });
    </script>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/Dashboard/SiteDashboard.Master" AutoEventWireup="true" CodeBehind="fSearchPerson.aspx.cs" Inherits="ITWork.Administrator.Dashboard.fSearchPerson" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <asp:Panel ID="Panel2" runat="server">
            <div class="row page-titles">
                <div class="col-md-5 align-self-center">
                    <h3 class="text-themecolor">CV</h3>
                </div>
                <div class="col-md-7 align-self-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                        <li class="breadcrumb-item">CV</li>
                        <li class="breadcrumb-item active">New CV</li>
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
                                <div class="row">
                                    <div class="col-lg-2 col-xlg-2">
                                        <asp:DropDownList ID="DropChooseCV"  runat="server" class="form-control" OnSelectedIndexChanged="DropChooseCV_SelectedIndexChanged" AutoPostBack="true" >
                                                        <asp:ListItem>All</asp:ListItem>
                                                        <asp:ListItem>Language</asp:ListItem>
                                                        <asp:ListItem>Location</asp:ListItem>
                                         </asp:DropDownList>
                                    </div>
                                    <div class="col-lg-3 col-xlg-2">
                                        <asp:DropDownList ID="DropChooseeCV"  runat="server" class="form-control" OnSelectedIndexChanged="DropChooseeCV_SelectedIndexChanged" AutoPostBack="true" >
                                                <asp:ListItem>All</asp:ListItem>
                                         </asp:DropDownList>
                                    </div>
                                    <div class="col-lg-1 col-xlg-4">
                                    </div>
                                    <div class="col-lg-4 col-xlg-3">
                                        <asp:TextBox ID="txtsearchCV" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-lg-2 col-xlg-1">
                                        <asp:Button ID="btnSearchCV" runat="server" class="btn-rounded btn btn-outline-info" style="width:100%;font-weight:600" Text="Search" OnCommand="btnSearchCV_Command" />
                                    </div>
                                </div>
                                <div style="height:20px">

                                </div>
                                <div class="table-responsive" id="slimtest3">
                                    <asp:GridView ID="dgvCV" runat="server" class="table table-bordered" AutoGenerateColumns="false" HeaderStyle-HorizontalAlign="Center" AlternatingRowStyle-BackColor="#eff2f7" AlternatingRowStyle-ForeColor="#495057">
                                <Columns>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                                                       
                                        <HeaderTemplate><asp:Label runat="server" Text="Avatar"></asp:Label></HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:HyperLink ID="linkCVDetail" runat="server" NavigateUrl='<%# "fDetailCV.aspx?ID="+ Eval("ID").ToString()+"&&Username="+Eval("Username").ToString() %>'><asp:Image ID="imgAvt" runat="server" width="40" class="img-circle" ImageUrl='<%# "../Template/assets/images/person/" + getImgCVU(Eval("Username").ToString())  %>' /></asp:HyperLink>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                </Columns>


                                <Columns>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                            <HeaderTemplate>
                                                <p style="text-align:center"><i class="fa fa-spinner text-info" style="margin-right:10px"></i><asp:Label runat="server" Text="Full Name"></asp:Label></p>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# getFullNameCVU(Eval("Username").ToString())  %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>

                                <Columns>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                            <HeaderTemplate>
                                                <p style="text-align:center"><i class="fa fa-address-card text-info" style="margin-right:10px"></i><asp:Label runat="server" Text="Position"></asp:Label></p>
                                            </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# getPositionCVU(Convert.ToInt32(Eval("ID").ToString()))  %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>

                                <Columns>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                            <HeaderTemplate>
                                                <p style="text-align:center"><i class="fa  fa-stack-overflow text-warning" style="margin-right:10px"></i><asp:Label runat="server" Text="Language"></asp:Label></p>
                                            </HeaderTemplate>
                                         <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# getLanguageCVU(Convert.ToInt32(Eval("ID").ToString()))  %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                </Columns>


                                <Columns>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                            <HeaderTemplate>
                                                <p style="text-align:center"><i class="fa fa-map-marker text-danger" style="margin-right:10px"></i><asp:Label runat="server" Text="Location"></asp:Label></p>
                                            </HeaderTemplate>
                                         <ItemTemplate >
                                            <asp:Label runat="server" Text='<%# getLocationCVU(Convert.ToInt32(Eval("ID").ToString()))  %>'></asp:Label>
                                            
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                </Columns>


                                <Columns>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                            <HeaderTemplate>
                                                <asp:Label runat="server" Text="View"></asp:Label>
                                            </HeaderTemplate>
                                         <ItemTemplate >
                                            <asp:HyperLink ID="linkJobDetail" runat="server" NavigateUrl='<%# "fDetailCV.aspx?ID="+ Eval("ID").ToString()+"&&Username="+Eval("Username").ToString() %>' class="btn-sm btn btn-outline-info" style="width:100%;font-weight:600">View</asp:HyperLink>
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
    </asp:Panel> 
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
    <script type="text/javascript">
    $('#slimtest3').slimScroll({
            height: '600px'
    });
    </script>
</asp:Content>

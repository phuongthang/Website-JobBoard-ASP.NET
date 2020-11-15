<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/Dashboard/SiteDashboard.Master" AutoEventWireup="true" CodeBehind="fSearchOrganization.aspx.cs" Inherits="ITWork.Administrator.Dashboard.fSearchOrganization" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <asp:Panel ID="pnFillter" runat="server">
            <div class="row page-titles">
                <div class="col-md-5 align-self-center">
                    <h3 class="text-themecolor">Job</h3>
                </div>
                <div class="col-md-7 align-self-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                        <li class="breadcrumb-item">Job</li>
                        <li class="breadcrumb-item active">New Job</li>
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
                                        <asp:DropDownList ID="DropChoose"  runat="server" class="form-control" OnSelectedIndexChanged="DropChoose_SelectedIndexChanged" AutoPostBack="true" >
                                                        <asp:ListItem>All</asp:ListItem>
                                                        <asp:ListItem>Language</asp:ListItem>
                                                        <asp:ListItem>Location</asp:ListItem>
                                                        <asp:ListItem>Salary</asp:ListItem>
               
                                         </asp:DropDownList>
                                    </div>
                                    <div class="col-lg-3 col-xlg-2">
                                        <asp:DropDownList ID="DropChoosee"  runat="server" class="form-control" OnSelectedIndexChanged="DropChoosee_SelectedIndexChanged" AutoPostBack="true">
                                                <asp:ListItem>All</asp:ListItem>
                                         </asp:DropDownList>
                                    </div>
                                    <div class="col-lg-1 col-xlg-4">
                                    </div>
                                    <div class="col-lg-4 col-xlg-3">
                                        <asp:TextBox ID="txtsearch" runat="server" class="form-control"></asp:TextBox>
                                    </div>
                                    <div class="col-lg-2 col-xlg-1">
                                        <asp:Button ID="btnSearch" runat="server" class="btn-rounded btn btn-outline-info" style="width:100%;font-weight:600" Text="Search" OnCommand="btnSearch_Command" />
                                    </div>
                                </div>
                                <div style="height:20px">

                                </div>
                                <div class="table-responsive" id="slimtest2">
                                    <asp:GridView ID="dgvJob" runat="server" class="table table-bordered" AutoGenerateColumns="false" HeaderStyle-HorizontalAlign="Center" AlternatingRowStyle-BackColor="#eff2f7" AlternatingRowStyle-ForeColor="#495057">
                                <Columns>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                                                       
                                        <HeaderTemplate><asp:Label runat="server" Text="Logo"></asp:Label></HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:HyperLink ID="linkPersonView" runat="server" NavigateUrl='<%# "fPersonView.aspx?Username="+Eval("Username").ToString() %>'><asp:Image ID="imgAvt" runat="server" width="40" class="img-circle" ImageUrl='<%# "../Template/assets/images/organization/" + getImgJob(Eval("Username").ToString())  %>' /></asp:HyperLink>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                </Columns>


                                <Columns>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                            <HeaderTemplate>
                                                <p style="text-align:center"><i class="fa fa-spinner text-info" style="margin-right:10px"></i><asp:Label runat="server" Text="Job Title"></asp:Label></p>
                                                
                                                <hr />
                                                <asp:DropDownList  runat="server" class="form-control" >
                                                        <asp:ListItem>All</asp:ListItem>
                                                        <asp:ListItem>Business Analyst 1</asp:ListItem>
                                                        <asp:ListItem>Senior/ Team-lead Java</asp:ListItem>
                                                        <asp:ListItem>[HN] PHP Leader</asp:ListItem>
                                                        <asp:ListItem>.NET Technical Leader</asp:ListItem>
               
                                                 </asp:DropDownList>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# getJobTitleJob(Convert.ToInt32(Eval("ID").ToString()))  %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>

                                <Columns>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                            <HeaderTemplate>
                                                <p style="text-align:center"><i class="fa fa-address-card text-info" style="margin-right:10px"></i><asp:Label runat="server" Text="Position"></asp:Label></p>
                                                
                                                <hr />
                                                <asp:DropDownList runat="server" class="form-control" >
                                                        <asp:ListItem>All</asp:ListItem>
                                                        <asp:ListItem>Backend Developer</asp:ListItem>
                                                        <asp:ListItem>Senior/ Team-lead</asp:ListItem>
                                                        <asp:ListItem>PHP Leader</asp:ListItem>
                                                        <asp:ListItem>Technical Leader</asp:ListItem>
               
                                                 </asp:DropDownList>
                                            </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# getPositionJob(Convert.ToInt32(Eval("ID").ToString()))  %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>

                                <Columns>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                            <HeaderTemplate>
                                                <p style="text-align:center"><i class="fa  fa-stack-overflow text-warning" style="margin-right:10px"></i><asp:Label runat="server" Text="Language"></asp:Label></p>
                                                
                                                <hr />
                                                <asp:DropDownList  runat="server" class="form-control" >
                                                        <asp:ListItem>All</asp:ListItem>
                                                        <asp:ListItem>C</asp:ListItem>
                                                        <asp:ListItem>C++</asp:ListItem>
                                                        <asp:ListItem>C#</asp:ListItem>
                                                        <asp:ListItem>Java</asp:ListItem>
                                                        <asp:ListItem>Python</asp:ListItem>
                                                        <asp:ListItem>Javascript</asp:ListItem>
                                                        <asp:ListItem>Ruby</asp:ListItem>
                                                        <asp:ListItem>Php</asp:ListItem>
                                                        <asp:ListItem>Node JS</asp:ListItem>
               
                                                 </asp:DropDownList>
                                            </HeaderTemplate>
                                         <ItemTemplate>
                                            <asp:Label runat="server" Text='<%# getLanguageJob(Convert.ToInt32(Eval("ID").ToString()))  %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                </Columns>


                                <Columns>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                            <HeaderTemplate>
                                                <p style="text-align:center"><i class="fa fa-map-marker text-danger" style="margin-right:10px"></i><asp:Label runat="server" Text="Location"></asp:Label></p>
                                                
                                                <hr />
                                                <asp:DropDownList runat="server" class="form-control" >
                                                        <asp:ListItem>All</asp:ListItem>
                                                        <asp:ListItem>Ha Noi</asp:ListItem>
                                                        <asp:ListItem>Da Nang</asp:ListItem>
                                                        <asp:ListItem>TP. Ho Chi Minh</asp:ListItem>
                                                        <asp:ListItem>Nghe An</asp:ListItem>
                                                        <asp:ListItem>Quang Ninh</asp:ListItem>
                                                        <asp:ListItem>Hai Phong</asp:ListItem>
                                                        <asp:ListItem>Binh Duong</asp:ListItem>
                                                        <asp:ListItem>Ha Nam</asp:ListItem>
                                                        <asp:ListItem>Nam Dinh</asp:ListItem>
                                                    </asp:DropDownList>
                                            </HeaderTemplate>
                                         <ItemTemplate >
                                            <asp:Label runat="server" Text='<%# getLocationJob(Convert.ToInt32(Eval("ID").ToString()))  %>'></asp:Label>
                                            
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                </Columns>

                                <Columns>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                            <HeaderTemplate>
                                                <p style="text-align:center"><i class="fa fa-bitcoin text-warning" style="margin-right:10px"></i><asp:Label runat="server" Text="Salary"></asp:Label></p>
                                                
                                                <hr />
                                                <asp:DropDownList  runat="server" class="form-control"  >
                                                        <asp:ListItem>< 499</asp:ListItem>
                                                        <asp:ListItem>500 - 999</asp:ListItem>
                                                        <asp:ListItem>1000 - 1499</asp:ListItem>
                                                        <asp:ListItem>1500 - 1999</asp:ListItem>
                                                        <asp:ListItem>2000 - 2999</asp:ListItem>
                                                        <asp:ListItem>3000 - 4999</asp:ListItem>
                                                        <asp:ListItem>> 5000</asp:ListItem>
               
                                                    </asp:DropDownList>
                                            </HeaderTemplate>
                                         <ItemTemplate >
                                            <asp:Label runat="server" Text='<%#string.Format("{0:#,0}",Convert.ToInt32(getJobSalaryJob(Convert.ToInt32(Eval("ID").ToString())))) + " USD"   %>'></asp:Label>
                                            
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                </Columns>

                                <Columns>
                                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                            <HeaderTemplate>
                                                <asp:Label runat="server" Text="View"></asp:Label>
                                            </HeaderTemplate>
                                         <ItemTemplate >
                                            <asp:HyperLink ID="linkJobDetail" runat="server" NavigateUrl='<%# "fJobDetail.aspx?ID="+ Eval("ID").ToString()+"&&Username="+Eval("Username").ToString() %>' class="btn-sm btn btn-outline-info" style="width:100%;font-weight:600">View</asp:HyperLink>
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
    $('#slimtest2').slimScroll({
        height: '600px'
    });
    </script>
</asp:Content>

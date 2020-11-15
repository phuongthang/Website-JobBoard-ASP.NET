<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/Dashboard/SiteDashboard.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="ITWork.Administrator.Dashboard.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="row page-titles">
                <div class="col-md-5 align-self-center">
                    <h3 class="text-themecolor">Hot</h3>
                </div>
                <div class="col-md-7 align-self-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                        <li class="breadcrumb-item">pages</li>
                        <li class="breadcrumb-item active">News</li>
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
                    <div class="col-lg-12 col-xlg-12 col-md-12">
                        <div class="card">
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs profile-tab" role="tablist">
                                <li class="nav-item"> <a class="nav-link active" data-toggle="tab" href="#profile" role="tab">Job</a> </li>
                                <li class="nav-item"> <a class="nav-link" data-toggle="tab" href="#settings" role="tab">CV</a> </li>
                            </ul>
                            <!-- Tab panes -->
                            <div class="tab-content" style="background-color:#EEF5F9">
                                <!--second tab-->
                                <div class="tab-pane active" id="profile" role="tabpanel">
                                    <asp:Panel ID="pnPintoStart" runat="server">
        
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
                    <div class="col-12">
                        <!-- Row -->
                        <div class="row">
                    <asp:Repeater ID="rpJobhot" runat="server">
                        <ItemTemplate>
                         
                            <!-- column -->
                            <div class=" col-md-3 col-lg-4 col-xlg-3">
                                <!-- Card -->
                                <div class="card" style="margin-top:25px">
                                    <asp:Image ID="Image1" class="card-img-top img-responsive img-circle" runat="server" alt="Card image cap" ImageUrl='<%# "../Template/assets/images/organization/" + getImgJob(Eval("Username").ToString()) %>' />
                                    <div class="card-body">
                                        <h4 class="card-title"><asp:Label ID="lbJobTitle" runat="server" Text='<%# getJobTitleJob(Convert.ToInt32(Eval("ID").ToString())) %>'></asp:Label></h4>
                                        <p class="card-text"><i class="fa fa-address-card text-info" style="margin-right:15px"></i><asp:Label ID="Label1" runat="server" Text='<%# getPositionJob(Convert.ToInt32(Eval("ID").ToString())) %>'></asp:Label></p>
                                        <p class="card-text"><i class="fa  fa-stack-overflow text-warning" style="margin-right:15px"></i><asp:Label ID="status" runat="server" Text='<%# getLanguageJob(Convert.ToInt32(Eval("ID").ToString())) %>'></asp:Label></p>
                                        <p class="card-text"> <i class="fa fa-map-marker text-danger" style="margin-right:15px"></i><asp:Label ID="Label2" runat="server"  Text='<%# getLocationJob(Convert.ToInt32(Eval("ID").ToString())) %>'></asp:Label></p>
                                        <asp:HyperLink ID="linkJobDetail" runat="server" NavigateUrl='<%# "fJobDetail.aspx?ID="+ Eval("ID").ToString()+"&&Username="+Eval("Username").ToString() %>' class="btn btn-outline-info" style="width:100%;font-weight:600">View</asp:HyperLink>
                                    </div>
                                </div>
                                <!-- Card -->
                            </div>
                            
                        </ItemTemplate>
                        
                    </asp:Repeater>
                            </div>
                        </div>
                    </div>
                </div>
    </asp:Panel>
                                </div>
                                <div class="tab-pane" id="settings" role="tabpanel">
                                    <asp:Panel ID="Panel1" runat="server">
                            
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
                    <div class="col-12">
                        <!-- Row -->
                        <div class="row ">
                    <asp:Repeater ID="rpCVhot" runat="server">
                        <ItemTemplate>
                         
                            <!-- column -->
                            <div class=" col-md-3 col-lg-4 col-xlg-3">
                                <!-- Card -->
                                <div class="card" style="margin-top:25px">
                                    <asp:Image ID="ImgAvt" class="card-img-top img-responsive img-circle" runat="server" alt="Card image cap" ImageUrl='<%# "../Template/assets/images/person/" + getImgCV(Eval("Username").ToString()) %>' />
                                    <div class="card-body">
                                        <h4 class="card-title"><asp:Label ID="lbJobTitle" runat="server" Text='<%# getFullNameCV(Eval("Username").ToString()) %>'></asp:Label></h4>
                                        <p class="card-text"><i class="fa fa-address-card text-info" style="margin-right:15px"></i><asp:Label ID="Label1" runat="server" Text='<%# getPositionCV(Convert.ToInt32(Eval("ID").ToString())) %>'></asp:Label></p>
                                        <p class="card-text"><i class="fa  fa-stack-overflow text-warning" style="margin-right:15px"></i><asp:Label ID="status" runat="server" Text='<%# getLanguageCV(Convert.ToInt32(Eval("ID").ToString())) %>'></asp:Label></p>
                                        <p class="card-text"> <i class="fa fa-map-marker text-danger" style="margin-right:15px"></i><asp:Label ID="Label2" runat="server"  Text='<%# getLocationCV(Convert.ToInt32(Eval("ID").ToString())) %>'></asp:Label></p>
                                        <asp:HyperLink ID="linkJobDetail" runat="server" NavigateUrl='<%# "fDetailCV.aspx?ID="+ Eval("ID").ToString()+"&&Username="+Eval("Username").ToString() %>' class="btn btn-outline-info" style="width:100%;font-weight:600">View</asp:HyperLink>
                                    </div>
                                </div>
                                <!-- Card -->
                            </div>
                            
                        </ItemTemplate>
                        
                    </asp:Repeater>
                            </div>
                        </div>
                    </div>
                </div>
    </asp:Panel>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Column -->
                </div>
                <!-- Row -->
                <!-- ============================================================== -->
                <!-- End PAge Content -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Right sidebar -->
                <!-- ============================================================== -->
                <!-- .right-sidebar -->
                <!-- ============================================================== -->
                <!-- End Right sidebar -->
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
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
    $('#slimtest2').slimScroll({
        height: '500px'
    });
    $('#slimtest3').slimScroll({
            height: '500px'
    });
    </script>
</asp:Content>

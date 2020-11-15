<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/Dashboard/SiteDashboard.Master" AutoEventWireup="true" CodeBehind="fViewBlog.aspx.cs" Inherits="ITWork.Administrator.Dashboard.fViewBlog" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="content" runat="server">
    <div class="row page-titles">
                <div class="col-md-5 align-self-center">
                    <h3 class="text-themecolor">Post</h3>
                </div>
                <div class="col-md-7 align-self-center">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                        <li class="breadcrumb-item">Blog</li>
                        <li class="breadcrumb-item active">View Blog</li>
                    </ol>
                </div>
            </div>

    <div class="container-fluid">
        <asp:Repeater ID="RpPin" runat="server">
            <ItemTemplate>
                <div class="row">
                    <div class="col-lg-12 col-xlg-12 col-md-12">
                        <div class="card">
                            <!-- Nav tabs -->
                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div class="tab-pane active" id="home" role="tabpanel">
                                    <div class="card-body">
                                        <div class="profiletimeline">
                                            <hr />
                                            <div class="sl-item">
                                                <div class="sl-left"> <asp:Image ID="imgUser" runat="server" alt="user" ImageUrl='<%# "../Template/assets/images/" + getImgUser(Eval("Username").ToString()) %>' class="img-circle" /> </div>
                                                <div class="sl-right">
                                                    <div> <a href="#" class="link"><asp:Label ID="lbUsername" runat="server" Text='<%# Eval("Username").ToString() %>'></asp:Label></a> <span class="sl-date m-l-15">
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Getdate(Eval("Date").ToString()) %>'></asp:Label>
                                                                                                                                                                                        </span>
                                                        <div class="m-t-20 row">
                                                            <div class="col-md-3 col-xs-12"><asp:Image ID="Image1" runat="server" alt="user" ImageUrl='<%# "../Template/assets/images/blog/" + Eval("Avatar").ToString() %>' class="img-responsive radius" /></div>
                                                            <div class="col-md-9 col-xs-12">
                                                                <asp:Label ID="lbTitle" runat="server" Text='<%# Eval("Title").ToString() %>' style="font-weight:600;font-size:25px" ></asp:Label> <i class="fa fa-thumb-tack text-info m-l-10"></i>
                                                                <br />
                                                                <div style="height:50px;overflow:hidden">
                                                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("ContentBlog").ToString() %>'></asp:Label>
                                                                </div>
                                                                
                                                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "fViewDetailBlog.aspx?ID="+ Eval("ID").ToString() %>' class="btn btn-sm btn-info m-t-20">View Detail</asp:HyperLink>
                                                                
                                                                </div>
                                                        </div>
                                                        <div class="like-comm m-t-20"> <a href="javascript:void(0)" class="link m-r-10">2 comment</a> <a href="javascript:void(0)" class="link m-r-10"><i class="fa fa-heart text-danger"></i> 5 Love</a> </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <hr />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Column -->
                </div>
            </ItemTemplate>
            
        </asp:Repeater>
        <asp:Repeater ID="RepPost" runat="server">
            <ItemTemplate>
                <div class="row">
                    <div class="col-lg-12 col-xlg-12 col-md-12">
                        <div class="card">
                            <!-- Nav tabs -->
                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div class="tab-pane active" id="home" role="tabpanel">
                                    <div class="card-body">
                                        <div class="profiletimeline">
                                            <hr />
                                            <div class="sl-item">
                                                <div class="sl-left"> <asp:Image ID="imgUser" runat="server" alt="user" ImageUrl='<%# "../Template/assets/images/" + getImgUser(Eval("Username").ToString()) %>' class="img-circle" /> </div>
                                                <div class="sl-right">
                                                    <div> <a href="#" class="link"><asp:Label ID="lbUsername" runat="server" Text='<%# Eval("Username").ToString() %>'></asp:Label></a> <span class="sl-date m-l-15">
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Getdate(Eval("Date").ToString()) %>'></asp:Label>
                                                                                                                                                                                        </span>
                                                        <div class="m-t-20 row">
                                                            <div class="col-md-3 col-xs-12"><asp:Image ID="Image1" runat="server" alt="user" ImageUrl='<%# "../Template/assets/images/blog/" + Eval("Avatar").ToString() %>' class="img-responsive radius" /></div>
                                                            <div class="col-md-9 col-xs-12">
                                                                <asp:Label ID="lbTitle" runat="server" Text='<%# Eval("Title").ToString() %>' style="font-weight:600;font-size:25px" ></asp:Label>
                                                                <br />
                                                                <div style="height:50px;overflow:hidden">
                                                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("ContentBlog").ToString() %>'></asp:Label>
                                                                </div>
                                                                
                                                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "fViewDetailBlog.aspx?ID="+ Eval("ID").ToString() %>' class="btn btn-sm btn-info m-t-20">View Detail</asp:HyperLink>
                                                                
                                                                </div>
                                                        </div>
                                                        <div class="like-comm m-t-20"> <a href="javascript:void(0)" class="link m-r-10">2 comment</a> <a href="javascript:void(0)" class="link m-r-10"><i class="fa fa-heart text-danger"></i> 5 Love</a> </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <hr />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Column -->
                </div>
            </ItemTemplate>
            
        </asp:Repeater>
                
        </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>

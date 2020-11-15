<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/Dashboard/SiteDashboard.Master" AutoEventWireup="true" CodeBehind="fViewDetailBlog.aspx.cs" Inherits="ITWork.Administrator.Dashboard.fViewDetailBlog" %>
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
        <div class="row">
            <div class="col-lg-12" style="background:#ffffff">
                <div class="col-lg-12 text-center">
                    <hr />
                    <h1 style="font-weight:700;font-size:35px"><asp:Label ID="lbTitle" runat="server" ></asp:Label></h1>
                    <hr />
                </div>
                
                 <div class="col-lg-12 text-center">
                     <div class="row">
                         <div class="col-lg-3">
                             <asp:Image ID="imgAvatar" runat="server" class="img-fluid" />
                             <h4 class="m-t-15"><asp:Label ID="lbTitlesmall" runat="server" ></asp:Label></h4>
                             
                         </div>
                         <div class="col-lg-9">
                             <asp:Label ID="lbContent" runat="server"></asp:Label>
                         </div>
                     </div>
                    
                </div> 
            </div>
        </div>  
        
        
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12">
                 <asp:Repeater ID="RpComment" runat="server">
                    <ItemTemplate>
                 <div class="row">
                    <div class="col-lg-12 col-xlg-12 col-md-12">
                        <div class="card">
                            <div class="tab-content">
                                <div class="tab-pane active">
                                    <div class="card-body">
                                        <div class="profiletimeline">
                                            <hr />
                                            <div class="sl-item">
                                                <div class="sl-left"> <asp:Image ID="imgUser" runat="server" alt="user" ImageUrl='<%# "../Template/assets/images/" + getImgUser(Eval("Username").ToString()) %>' class="img-circle" /> </div>
                                                <div class="sl-right">
                                                    <div><a href="#" class="link"><asp:Label ID="lbUsername" runat="server" Text='<%# Eval("Username").ToString() %>'></asp:Label></a> <span class="sl-date m-l-15"><asp:Label ID="Label1" runat="server" Text='<%# Getdate(Eval("Date").ToString()) %>'></asp:Label></span>
                                                        <blockquote class="m-t-10">
                                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Comment1").ToString() %>'></asp:Label>
                                                        </blockquote>
                                                    </div>
                                                </div>
                                            </div>
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
          <div class="row">
            <div class="col-lg-12">
                <asp:TextBox ID="txtComment" runat="server" TextMode="MultiLine" class="form-control"></asp:TextBox>
            </div>
            <div class="col-lg-2">
                <asp:Button ID="btnComment" runat="server" Text="Submit" class="btn btn-info m-t-15" OnCommand="btnComment_Command" />
            </div>
            
         </div>
            </div>
        </div>
       
    </div>

    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="foot" runat="server">
</asp:Content>

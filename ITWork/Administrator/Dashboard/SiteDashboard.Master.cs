using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ITWork.Administrator.Dashboard
{
    public partial class SiteDashboard : System.Web.UI.MasterPage
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {

                string role = (string) Session["role"];
                string username = (string) Session["username"];
                if(username != null || role != null)
                {
                    
                    if (role == "admin")
                    {
                        pnOrganization.Visible = false;
                        pnPersonal.Visible = false;
                        WorkITEntities db = new WorkITEntities();
                        AccountAdministrator acc = db.AccountAdministrators.FirstOrDefault(x => x.Username == username);
                        if (acc != null)
                        {
                            if (acc.Url == null)
                            {
                                imgProfile.ImageUrl = "../Template/assets/images/users/unknow.jpg";
                                imgAccount.ImageUrl = "../Template/assets/images/users/unknow.jpg";
                                imgAccount1.ImageUrl = "../Template/assets/images/users/unknow.jpg";
                            }
                            else
                            {
                                imgProfile.ImageUrl = "../Template/assets/images/administrator/" + acc.Url;
                                imgAccount.ImageUrl = "../Template/assets/images/administrator/" + acc.Url;
                                imgAccount1.ImageUrl = "../Template/assets/images/administrator/" + acc.Url;
                            }
                            lbusername.Text = acc.Username;
                            
                            if(acc.Fullname == null)
                            {
                                lbFullname.Text = "Unknown";
                            }
                            else
                            {
                                lbFullname.Text = acc.Fullname;
                            }    
                        }
                    }
                    if (role == "organization")
                    {
                        pnAdministrators.Visible = false;
                        pnPersonal.Visible = false;
                        WorkITEntities db = new WorkITEntities();
                        AccountOrganization acc = db.AccountOrganizations.FirstOrDefault(x => x.Username == username);
                        if (acc != null)
                        {
                            if (acc.Url == null)
                            {
                                imgProfile.ImageUrl = "../Template/assets/images/users/unknow.jpg";
                                imgAccount.ImageUrl = "../Template/assets/images/users/unknow.jpg";
                                imgAccount1.ImageUrl = "../Template/assets/images/users/unknow.jpg";
                            }
                            else
                            {
                                imgProfile.ImageUrl = "../Template/assets/images/organization/" + acc.Url;
                                imgAccount.ImageUrl = "../Template/assets/images/organization/" + acc.Url;
                                imgAccount1.ImageUrl = "../Template/assets/images/organization/" + acc.Url;
                            }
                            lbusername.Text = acc.Username;

                            if (acc.NameOrganization == null)
                            {
                                lbFullname.Text = "Unknown";
                            }
                            else
                            {
                                lbFullname.Text = acc.NameOrganization;
                            }
                        }
                    }
                    if (role == "personal")
                    {
                        pnAdministrators.Visible = false;
                        pnOrganization.Visible = false;
                        WorkITEntities db = new WorkITEntities();
                        AccountPerson acc = db.AccountPersons.FirstOrDefault(x => x.Username == username);
                        if (acc != null)
                        {
                            if (acc.Url == null)
                            {
                                imgProfile.ImageUrl = "../Template/assets/images/users/unknow.jpg";
                                imgAccount.ImageUrl = "../Template/assets/images/users/unknow.jpg";
                                imgAccount1.ImageUrl = "../Template/assets/images/users/unknow.jpg";
                            }
                            else
                            {
                                imgProfile.ImageUrl = "../Template/assets/images/person/" + acc.Url;
                                imgAccount.ImageUrl = "../Template/assets/images/person/" + acc.Url;
                                imgAccount1.ImageUrl = "../Template/assets/images/person/" + acc.Url;
                            }
                            lbusername.Text = acc.Username;

                            if (acc.Fullname == null)
                            {
                                lbFullname.Text = "Unknown";
                            }
                            else
                            {
                                lbFullname.Text = acc.Fullname;
                            }
                        }
                        CV cv = db.CVs.FirstOrDefault(x => x.Username == username);
                        if(cv == null)
                        {
                            pnCreateCV.Visible = true;
                        }
                        else
                        {
                            pnCreateCV.Visible = false;
                        }    
                    }


                }
                else
                {
                    Response.Redirect("../Account/fLoginUser.aspx");
                }    
                   
                    
                
            }    
        }
        protected void LinkLogout2_Command(object sender, CommandEventArgs e)
        {
            string role = Session["role"].ToString();
            if (role == "admin")
            {
                Response.Redirect("../Account/fLoginAdmin.aspx");
            }
            else
            {
                Response.Redirect("../Account/fLoginUser.aspx");
            }
        }

        protected void LinkLogout1_Command(object sender, CommandEventArgs e)
        {
            string role = Session["role"].ToString();
            if (role == "admin")
            {
                Response.Redirect("../Account/fLoginAdmin.aspx");
            }
            else
            {
                Response.Redirect("../Account/fLoginUser.aspx");
            }
        }

        protected void LinkLogout3_Command(object sender, CommandEventArgs e)
        {
            string role = Session["role"].ToString();
            if (role == "admin")
            {
                Response.Redirect("../Account/fLoginAdmin.aspx");
            }
            else
            {
                Response.Redirect("../Account/fLoginUser.aspx");
            }
        }

        protected void LinkLogout4_Command(object sender, CommandEventArgs e)
        {
            string role = Session["role"].ToString();
            if (role == "admin")
            {
                Response.Redirect("../Account/fLoginAdmin.aspx");
            }
            else
            {
                Response.Redirect("../Account/fLoginUser.aspx");
            }
        }

        protected void linkProf_Command(object sender, CommandEventArgs e)
        {
            string role = (string)Session["Role"];
            if(role == "personal")
            {
                Response.Redirect("fProfilePerson.aspx");
            }
            else if(role == "admin")
            {
                Response.Redirect("fProfileAdmin.aspx");
            }
            else
            {
                Response.Redirect("fProfileOrganization.aspx");
            }    
        }
    }
}
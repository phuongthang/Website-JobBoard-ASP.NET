using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ITWork.Administrator.Account
{
    public partial class fChangePasswordUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                pnError.Visible = false;
                pnSuccess.Visible = false;
                txtusername.ReadOnly = true;
                string username = (string)Session["username"];
                string role = (string)Session["role"];
                if (username != null && role != null)
                {
                    if(role == "organization")
                    {
                        WorkITEntities db = new WorkITEntities();
                        AccountOrganization obj = db.AccountOrganizations.FirstOrDefault(x => x.Username == username);
                        if (obj != null)
                        {
                            txtusername.Text = obj.Username;
                        }
                    }
                    else if(role == "personal")
                    {
                        WorkITEntities db = new WorkITEntities();
                        AccountPerson obj = db.AccountPersons.FirstOrDefault(x => x.Username == username);
                        if (obj != null)
                        {
                            txtusername.Text = obj.Username;
                        }
                    }    
                }
                else
                {
                    Response.Redirect("fLoginUser.aspx");
                }    
                
            }
        }
        public static string GetMD5(string str)
        {

            MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();

            byte[] bHash = md5.ComputeHash(Encoding.UTF8.GetBytes(str));

            StringBuilder sbHash = new StringBuilder();

            foreach (byte b in bHash)
            {

                sbHash.Append(String.Format("{0:x2}", b));

            }

            return sbHash.ToString();

        }
        protected void btnChangePassword_Command(object sender, CommandEventArgs e)
        {
            string role = (string)Session["role"];
            if(role == "organization")
            {
                string username = txtusername.Text;
                string pass1 = txtpasswordOld.Text;
                string pass2 = txtpassword.Text;
                string pass3 = txtpasswordConfirm.Text;
                WorkITEntities db = new WorkITEntities();
                AccountOrganization obj = db.AccountOrganizations.FirstOrDefault(x => x.Username == username);
                if (obj != null)
                {
                    if (obj.Password == GetMD5(pass1))
                    {
                        if (pass2 == pass3 && pass2 != pass1)
                        {
                            obj.Password = GetMD5(pass2);
                            db.SaveChanges();
                            pnError.Visible = false;
                            pnSuccess.Visible = true;
                        }
                        else
                        {
                            pnError.Visible = true;
                            pnSuccess.Visible = false;
                        }
                    }
                    else
                    {
                        pnError.Visible = true;
                        pnSuccess.Visible = false;
                    }
                }
            }
            else
            {
                string username = txtusername.Text;
                string pass1 = txtpasswordOld.Text;
                string pass2 = txtpassword.Text;
                string pass3 = txtpasswordConfirm.Text;
                WorkITEntities db = new WorkITEntities();
                AccountPerson obj = db.AccountPersons.FirstOrDefault(x => x.Username == username);
                if (obj != null)
                {
                    if (obj.Password == GetMD5(pass1))
                    {
                        if (pass2 == pass3 && pass2 != pass1)
                        {
                            obj.Password = GetMD5(pass2);
                            db.SaveChanges();
                            pnSuccess.Visible = true;
                        }
                        else
                        {
                            pnError.Visible = true;
                        }
                    }
                    else
                    {
                        pnError.Visible = true;
                    }
                }
            }    
        }
    }
}
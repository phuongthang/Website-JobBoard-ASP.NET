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
    public partial class fRegisterUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                pnExist.Visible = false;
                pnError.Visible = false;
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
        protected void btnSignup_Command(object sender, CommandEventArgs e)
        {
            string obje = DropObject.SelectedValue;
            if(obje == "Organizations")
            {
                string username = txtusername.Text;
                string email = txtemail.Text;
                string pass1 = txtpassword.Text;
                string pass2 = txtpasswordConfirm.Text;
                WorkITEntities db = new WorkITEntities();
                AccountOrganization acc = db.AccountOrganizations.FirstOrDefault(x => x.Username == username || x.Email == email);
                if (acc == null)
                {
                    if (pass1 == pass2)
                    {
                        string password = GetMD5(pass1);
                        AccountOrganization obj = new AccountOrganization();
                        obj.Username = username;
                        obj.Email = email;
                        obj.Password = password;
                        obj.Role = "organization";
                        db.AccountOrganizations.Add(obj);
                        db.SaveChanges();
                        Response.Redirect("fLoginUser.aspx");
                    }
                    else
                    {
                        pnError.Visible = true;
                    }

                }
                else
                {
                    pnExist.Visible = true;
                }
            }
            if(obje == "Personal")
            {
                string username = txtusername.Text;
                string email = txtemail.Text;
                string pass1 = txtpassword.Text;
                string pass2 = txtpasswordConfirm.Text;
                WorkITEntities db = new WorkITEntities();
                AccountPerson acc = db.AccountPersons.FirstOrDefault(x => x.Username == username || x.Email == email);
                if (acc == null)
                {
                    if (pass1 == pass2)
                    {
                        string password = GetMD5(pass1);
                        AccountPerson obj = new AccountPerson();
                        obj.Username = username;
                        obj.Email = email;
                        obj.Password = password;
                        obj.Role = "personal";
                        db.AccountPersons.Add(obj);
                        db.SaveChanges();
                        Response.Redirect("fLoginUser.aspx");
                    }
                    else
                    {
                        pnError.Visible = true;
                    }

                }
                else
                {
                    pnExist.Visible = true;
                }
            }    
        }
    }
}
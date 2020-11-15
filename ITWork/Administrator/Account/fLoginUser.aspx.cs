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
    public partial class fLoginUser : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                pnThongbao.Visible = false;
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
        protected void btnLogin_Command(object sender, CommandEventArgs e)
        {
            string obj = DropObject.SelectedValue;
            if (obj == "Personal")
            {
                WorkITEntities db = new WorkITEntities();
                string username = txtusername.Text;
                string password = GetMD5(txtpassword.Text);
                AccountPerson acc = db.AccountPersons.FirstOrDefault(x => x.Username == username && x.Password == password);
                if (acc != null)
                {
                    string role = acc.Role;
                    Session["username"] = username;
                    Session["role"] = role;

                    Response.Redirect("../Dashboard/Home.aspx");
                }
                else
                {
                    pnThongbao.Visible = true;
                }
            }
            if (obj == "Organizations")
            {
                WorkITEntities db = new WorkITEntities();
                string username = txtusername.Text;
                string password = GetMD5(txtpassword.Text);
                AccountOrganization acc = db.AccountOrganizations.FirstOrDefault(x => x.Username == username && x.Password == password);
                if (acc != null)
                {
                    string role = acc.Role;
                    Session["role"] = role;
                    Session["username"] = username;

                    Response.Redirect("../Dashboard/Home.aspx");
                }
                else
                {
                    pnThongbao.Visible = true;
                }

            }
            
        }
    }
}
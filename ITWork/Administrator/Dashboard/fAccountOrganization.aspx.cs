using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ITWork.Administrator.Dashboard
{
    public partial class fAccountOrganization : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                getData();
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
        public void getData()
        {
            WorkITEntities db = new WorkITEntities();
            var obj = (from acc in db.AccountOrganizations
                       select acc).ToList();
            dgvAccountOrganization.DataSource = obj;
            dgvAccountOrganization.DataBind();
        }
        public string getImage(string username)
        {
            WorkITEntities db = new WorkITEntities();
            AccountOrganization obj = db.AccountOrganizations.FirstOrDefault(x => x.Username == username);
            if(obj != null)
            {
                if(obj.Url == null)
                {
                    return "users/unknow.jpg";
                }
                else
                {
                    return "organization/" + obj.Url;
                }    
            }
            else
            {
                return "";
            }    
        }

        protected void dgvAccountOrganization_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvAccountOrganization.PageIndex = e.NewPageIndex;
            getData();
        }

        protected void linkDelete_Command(object sender, CommandEventArgs e)
        {
            string username = e.CommandArgument.ToString();
            WorkITEntities db = new WorkITEntities();
            AccountOrganization obj = db.AccountOrganizations.FirstOrDefault(x => x.Username == username);
            if(obj != null)
            {
                db.AccountOrganizations.Remove(obj);
                db.SaveChanges();
                getData();
            }    
        }

        protected void linkEdit_Command(object sender, CommandEventArgs e)
        {
            string username = e.CommandArgument.ToString();
            WorkITEntities db = new WorkITEntities();
            AccountOrganization obj = db.AccountOrganizations.FirstOrDefault(x => x.Username == username);
            if (obj != null)
            {
                obj.Password = GetMD5("123456");
                db.SaveChanges();
                getData();
                pnThongbao.Visible = true;
            }
        }
    }
}
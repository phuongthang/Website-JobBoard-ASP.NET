using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ITWork.Administrator.Dashboard
{
    public partial class fCreateBlog : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                pnError.Visible = false;
                pnSuccess.Visible = false;
            }    
        }

        protected void btnSave_Command(object sender, CommandEventArgs e)
        {
            string username = (string)Session["Username"];
            WorkITEntities db = new WorkITEntities();
            Blog obj = new Blog();
            obj.Title = txtTitle.Text;
            obj.Username = username;
            obj.Date = DateTime.Now;
            obj.ContentBlog = txtcontent.Text;
            if (FUAvatar.HasFile)
            {
                string ext = Path.GetFileName(FUAvatar.FileName);
                ext = ext.Split('.')[ext.Split('.').Length - 1];
                string fileName = DateTime.Now.ToString("yyyyMMddhhmmssffff") + "." + ext;
                FUAvatar.SaveAs(Server.MapPath("../Template/assets/images/blog/" + fileName));
                obj.Avatar = fileName;
            }
            else
            {
                obj.Avatar = "default.jpg";
            }    
            string role = (string)Session["Role"];
            if(role == "admin")
            {
                obj.Status = "1";
            }
            else
            {
                obj.Status = "0";
            }
            obj.Main = "0";
            db.Blogs.Add(obj);
            db.SaveChanges();
            Response.Redirect("fListPostOverview.aspx");
        }
    }
}
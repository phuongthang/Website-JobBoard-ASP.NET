using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ITWork.Administrator.Dashboard
{
    public partial class fEditBlog : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if (Request.QueryString["ID"] == null)
                {

                }
                else
                {
                    string id = Request.QueryString["ID"];
                    getData(id);
                    pnError.Visible = false;
                    pnSuccess.Visible = false;
                }
            }    
        }

        public void getData(string id)
        {
            int index = Convert.ToInt32(id);
            WorkITEntities db = new WorkITEntities();
            Blog obj = db.Blogs.FirstOrDefault(x => x.ID == index);
            if(obj != null)
            {
                txtTitle.Text = obj.Title;
                txtcontent.Text = obj.ContentBlog;
            }    
        }
        protected void btnSave_Command(object sender, CommandEventArgs e)
        {
            string id = Request.QueryString["ID"];
            int index = Convert.ToInt32(id);
            WorkITEntities db = new WorkITEntities();
            Blog obj = db.Blogs.FirstOrDefault(x => x.ID == index);
            if (obj != null)
            {
                obj.Title = txtTitle.Text;
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
                string role = (string)Session["Role"];
                if (role == "admin")
                {
                    obj.Status = "1";
                }
                else
                {
                    obj.Status = "0";
                }
                obj.Main = "0";
                db.SaveChanges();
                Response.Redirect("fListPostOverview.aspx");
                pnError.Visible = false;
                pnSuccess.Visible = true;
            }
            else
            {
                pnError.Visible = true;
            }    
        }
    }
}
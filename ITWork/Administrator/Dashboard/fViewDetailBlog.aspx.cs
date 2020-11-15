using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ITWork.Administrator.Dashboard
{
    public partial class fViewDetailBlog : System.Web.UI.Page
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
                    getDataComment(id);
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
                lbTitle.Text = obj.Title;
                lbTitlesmall.Text = obj.Title;
                imgAvatar.ImageUrl = "../Template/assets/images/blog/" + obj.Avatar;
                lbContent.Text = obj.ContentBlog;
            }    
        }
        public void getDataComment(string id)
        {
            int index = Convert.ToInt32(id);
            WorkITEntities db = new WorkITEntities();
            var obj = (from comm in db.Comments
                       where comm.IDBlog == index
                       orderby comm.IDComment descending
                       select comm).ToList();
            RpComment.DataSource = obj;
            RpComment.DataBind();
        }
        public string getImgUser(string username)
        {
            WorkITEntities db = new WorkITEntities();
            AccountAdministrator objA = db.AccountAdministrators.FirstOrDefault(x => x.Username == username);
            if (objA != null)
            {
                return "administrator/" + objA.Url;
            }
            AccountOrganization objO = db.AccountOrganizations.FirstOrDefault(x => x.Username == username);
            if (objO != null)
            {
                return "organization/" + objO.Url;
            }
            AccountPerson objU = db.AccountPersons.FirstOrDefault(x => x.Username == username);
            if (objU != null)
            {
                return "person/" + objU.Url;
            }
            return "";
        }

        public string Getdate(string date)
        {
            DateTime datee = Convert.ToDateTime(date);
            return String.Format("{0:dd-MM-yyyy}", datee);
        }

        protected void btnComment_Command(object sender, CommandEventArgs e)
        {
            string id = Request.QueryString["ID"];
            int idblog = Convert.ToInt32(id);
            string username = (string)Session["Username"];
            string comment = txtComment.Text;
            DateTime date = DateTime.Now;
            WorkITEntities db = new WorkITEntities();
            Comment obj = new Comment();
            obj.IDBlog = idblog;
            obj.Username = username;
            obj.Comment1 = comment;
            obj.Date = date;
            db.Comments.Add(obj);
            db.SaveChanges();
            txtComment.Text = "";
            getDataComment(id);
        }
    }
}
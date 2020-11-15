using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ITWork.Administrator.Dashboard
{
    public partial class fApprovalPost : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getData();
            }
        }
        public void getData()
        {
            WorkITEntities db = new WorkITEntities();
            var obj = (from blog in db.Blogs
                       where blog.Status == "1" || blog.Status == "0"
                       orderby blog.ID descending
                       select blog).ToList();
            dgvApprovalPost.DataSource = obj;
            dgvApprovalPost.DataBind();
        }
        public void getDataActive()
        {
            WorkITEntities db = new WorkITEntities();
            var obj = (from blog in db.Blogs
                       where blog.Status == "1"
                       orderby blog.ID descending
                       select blog).ToList();
            dgvApprovalPost.DataSource = obj;
            dgvApprovalPost.DataBind();
        }
        public void getDataProcessing()
        {
            WorkITEntities db = new WorkITEntities();
            var obj = (from blog in db.Blogs
                       where blog.Status == "0"
                       orderby blog.ID descending
                       select blog).ToList();
            dgvApprovalPost.DataSource = obj;
            dgvApprovalPost.DataBind();
        }
        
        public string getImage(string username)
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
        public string getStatus(string id)
        {
            int index = Convert.ToInt32(id);
            WorkITEntities db = new WorkITEntities();
            Blog obj = db.Blogs.FirstOrDefault(x => x.ID == index);
            if (obj != null)
            {
                if (obj.Status == "0")
                {
                    return "Processing";
                }
                else
                {
                    return "Active";
                }
            }
            else
            {
                return "";
            }
        }
        public string getMain(string id)
        {
            int index = Convert.ToInt32(id);
            WorkITEntities db = new WorkITEntities();
            Blog obj = db.Blogs.FirstOrDefault(x => x.ID == index);
            if (obj != null)
            {
                if (obj.Main == "0")
                {
                    return "No";
                }
                else
                {
                    return "Yes";
                }
            }
            else
            {
                return "";
            }
        }

        protected void linkApproval_Command(object sender, CommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument.ToString());
            WorkITEntities db = new WorkITEntities();
            Blog obj = db.Blogs.FirstOrDefault(x => x.ID == id);
            if (obj != null)
            {
                if (obj.Status == "0")
                {
                    obj.Status = "1";
                }
                else
                {
                    obj.Status = "0";
                }
            }
            db.SaveChanges();
            getData();
        }

        protected void linkMain_Command(object sender, CommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument.ToString());
            WorkITEntities db = new WorkITEntities();
            Blog obj = db.Blogs.FirstOrDefault(x => x.ID == id);
            if (obj != null)
            {
                if (obj.Main == "0")
                {
                    obj.Main = "1";
                }
                else
                {
                    obj.Main = "0";
                }
            }
            db.SaveChanges();
            getData();
        }

        protected void linkDelete_Command(object sender, CommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument.ToString());
            WorkITEntities db = new WorkITEntities();
            Blog obj = db.Blogs.FirstOrDefault(x => x.ID == id);
            if (obj != null)
            {
                db.Blogs.Remove(obj);
            }
            db.SaveChanges();
            getData();
        }

        protected void dgvApprovalPost_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvApprovalPost.PageIndex = e.NewPageIndex;
            getData();
        }

        protected void DropObject_SelectedIndexChanged(object sender, EventArgs e)
        {
            string obje = DropObject.SelectedValue;
            if (obje == "All")
            {
                getData();
            }
            if (obje == "Active")
            {
                getDataActive();
            }
            if (obje == "Processing")
            {
                getDataProcessing();
            }
        }
        public string getDate(string date)
        {
            DateTime datee = Convert.ToDateTime(date);
            return String.Format("{0:dd-MM-yyyy}", datee);
        }
    }
}
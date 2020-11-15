using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ITWork.Administrator.Dashboard
{
    public partial class fViewConfirm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string username = (string)Session["Username"];
                if (username != null)
                {
                    getData(username);
                }

            }
        }
        public void getData(string username)
        {
            WorkITEntities db = new WorkITEntities();
            var obj = (from app in db.Applies
                       where app.UsernameU == username && app.Status == "1"
                       select new { ID = app.ID, UsernameU = app.UsernameU, UsernameO = app.UsernameO, IDJob = app.IDJob }).ToList();
            dgvApprovalCV.DataSource = obj;
            dgvApprovalCV.DataBind();
        }
        public string getStatus(string index)
        {
            int id = Convert.ToInt32(index);
            WorkITEntities db = new WorkITEntities();
            Apply obj = db.Applies.FirstOrDefault(x => x.ID == id);
            if (obj != null)
            {
                if (obj.Status == "0")
                {
                    return "Eject";
                }
                else if (obj.Status == "1")
                {
                    return "Pending";
                }
                else
                {
                    return "Accept";
                }
            }
            return "";
        }
        public string getImage(string username)
        {
            WorkITEntities db = new WorkITEntities();
            AccountOrganization obj = db.AccountOrganizations.FirstOrDefault(x => x.Username == username);
            if (obj != null)
            {
                if (obj.Url == null)
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
        public string getJobtitle(string id)
        {
            int index = Convert.ToInt32(id);
            WorkITEntities db = new WorkITEntities();
            Job obj = db.Jobs.FirstOrDefault(x => x.ID == index);
            if (obj != null)
            {
                return obj.JobTitle;
            }
            else
            {
                return "";
            }
        }

        public string getFullName(string username)
        {
            WorkITEntities db = new WorkITEntities();
            AccountOrganization obj = db.AccountOrganizations.FirstOrDefault(x => x.Username == username);
            if (obj != null)
            {
                return obj.NameOrganization;
            }
            else
            {
                return "";
            }
        }       

        protected void linkDelete_Command(object sender, CommandEventArgs e)
        {
            string index = e.CommandArgument.ToString();
            int idd = Convert.ToInt32(index);
            WorkITEntities db = new WorkITEntities();
            Apply obj = db.Applies.FirstOrDefault(x => x.ID == idd);
            if (obj != null)
            {
                obj.Status = "0";
                db.Applies.AddOrUpdate(obj);
                db.SaveChanges();
                string username = (string)Session["Username"];
                getData(username);
            }
        }

        protected void DropObject_SelectedIndexChanged(object sender, EventArgs e)
        {
            string val = DropObject.SelectedValue;
            string username = (string)Session["Username"];
            if(val == "0")
            {
                WorkITEntities db = new WorkITEntities();
                var obj = (from app in db.Applies
                           where app.UsernameU == username && app.Status == "0"
                           select new { ID = app.ID, UsernameU = app.UsernameU, UsernameO = app.UsernameO, IDJob = app.IDJob }).ToList();
                dgvApprovalCV.DataSource = obj;
                dgvApprovalCV.DataBind();
            }
            else if(val == "1")
            {
                WorkITEntities db = new WorkITEntities();
                var obj = (from app in db.Applies
                           where app.UsernameU == username && app.Status == "1"
                           select new { ID = app.ID, UsernameU = app.UsernameU, UsernameO = app.UsernameO, IDJob = app.IDJob }).ToList();
                dgvApprovalCV.DataSource = obj;
                dgvApprovalCV.DataBind();
            }
            else
            {
                WorkITEntities db = new WorkITEntities();
                var obj = (from app in db.Applies
                           where app.UsernameU == username && app.Status == "2"
                           select new { ID = app.ID, UsernameU = app.UsernameU, UsernameO = app.UsernameO, IDJob = app.IDJob }).ToList();
                dgvApprovalCV.DataSource = obj;
                dgvApprovalCV.DataBind();
            }    
        }
    }
}
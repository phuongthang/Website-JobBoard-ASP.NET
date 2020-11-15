using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ITWork.Administrator.Dashboard
{
    public partial class fApprovalJob : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                getData();
            }    
        }
        public void getData()
        {
            WorkITEntities db = new WorkITEntities();
            var obj = (from job in db.Jobs
                       join user in db.AccountOrganizations
                       on job.Username equals user.Username
                       where job.Active == "1" || job.Active == "0"
                       orderby job.ID descending
                       select new { Username = job.Username, ID = job.ID, NameOrganization = user.NameOrganization, Field = user.Field }).ToList();
            dgvApprovalJob.DataSource = obj;
            dgvApprovalJob.DataBind();
        }
        public void getDataActive()
        {
            WorkITEntities db = new WorkITEntities();
            var obj = (from job in db.Jobs
                       join user in db.AccountOrganizations
                       on job.Username equals user.Username
                       where job.Active == "1"
                       orderby job.ID descending
                       select new { Username = job.Username, ID = job.ID, NameOrganization = user.NameOrganization, Field = user.Field }).ToList();
            dgvApprovalJob.DataSource = obj;
            dgvApprovalJob.DataBind();
        }
        public void getDataProcessing()
        {
            WorkITEntities db = new WorkITEntities();
            var obj = (from job in db.Jobs
                       join user in db.AccountOrganizations
                       on job.Username equals user.Username
                       where job.Active == "0"
                       orderby job.ID descending
                       select new { Username = job.Username, ID = job.ID, NameOrganization = user.NameOrganization, Field = user.Field }).ToList();
            dgvApprovalJob.DataSource = obj;
            dgvApprovalJob.DataBind();
        }
        protected void dgvAccountOrganization_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvApprovalJob.PageIndex = e.NewPageIndex;
            getData();
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
        public string getStatus(string id)
        {
            int index = Convert.ToInt32(id);
            WorkITEntities db = new WorkITEntities();
            Job obj = db.Jobs.FirstOrDefault(x => x.ID == index);
            if (obj != null)
            {
                if (obj.Active == "0")
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
            Job obj = db.Jobs.FirstOrDefault(x => x.ID == index);
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
            Job obj = db.Jobs.FirstOrDefault(x => x.ID == id);
            if(obj != null)
            {
                if(obj.Active == "0")
                {
                    obj.Active = "1";
                }
                else
                {
                    obj.Active = "0";
                }    
            }
            db.SaveChanges();
            getData();
        }

        protected void linkMain_Command(object sender, CommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument.ToString());
            WorkITEntities db = new WorkITEntities();
            Job obj = db.Jobs.FirstOrDefault(x => x.ID == id);
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

        protected void DropObject_SelectedIndexChanged(object sender, EventArgs e)
        {
            string obje = DropObject.SelectedValue;
            if(obje == "All")
            {
                getData();
            }
            if(obje == "Active")
            {
                getDataActive();
            }
            if(obje == "Processing")
            {
                getDataProcessing();
            }    
        }
    }
}
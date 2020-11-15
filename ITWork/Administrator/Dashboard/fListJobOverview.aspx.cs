using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ITWork.Administrator.Dashboard
{
    public partial class fListJobOverview : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                getOverview();
                
            }   
        }
        public double Datediff(DateTime d1, DateTime d2)
        {
            TimeSpan t = d1 - d2;
            double diff = t.TotalDays;
            return diff;
        }
        public string getImg(string username)
        {
            WorkITEntities db = new WorkITEntities();
            AccountOrganization acc = db.AccountOrganizations.FirstOrDefault(x => x.Username == username);
            if(acc != null)
            {
                return acc.Url;
            }
            else
            {
                return "";
            }    
        }
        public string getPhone(string username)
        {
            WorkITEntities db = new WorkITEntities();
            AccountOrganization acc = db.AccountOrganizations.FirstOrDefault(x => x.Username == username);
            if (acc != null)
            {
                return acc.Phone;
            }
            else
            {
                return "";
            }
        }

        public string getJobTitle(int id)
        {
            WorkITEntities db = new WorkITEntities();
            Job obj = db.Jobs.FirstOrDefault(x => x.ID == id);
            if (obj != null)
            {
                return obj.JobTitle;
            }
            else
            {
                return "";
            }
        }

        public string getJobSalary(int id)
        {
            WorkITEntities db = new WorkITEntities();
            Job obj = db.Jobs.FirstOrDefault(x => x.ID == id);
            if (obj != null)
            {
                return obj.Salary.ToString();
            }
            else
            {
                return "";
            }
        }

        public string getJobPosition(int id)
        {
            WorkITEntities db = new WorkITEntities();
            Job obj = db.Jobs.FirstOrDefault(x => x.ID == id);
            if (obj != null)
            {
                return obj.JobPosition;
            }
            else
            {
                return "";
            }
        }
        public string getLocation(int id)
        {
            WorkITEntities db = new WorkITEntities();
            Job obj = db.Jobs.FirstOrDefault(x => x.ID == id);
            if (obj != null)
            {
                return obj.Location;
            }
            else
            {
                return "";
            }
        }
        public string getStatus(int id)
        {
            WorkITEntities db = new WorkITEntities();
            Job obj = db.Jobs.FirstOrDefault(x => x.ID == id);
            if (obj != null)
            {
                if(obj.Active == "0")
                {
                    return "Processing";
                }
                else if(obj.Active == "1")
                {
                    return "Active";
                }
                else
                {
                    return "Expired";
                }    
            }
            else
            {
                return "";
            }
        }

        public void getOverview()
        {
            string username = (string)Session["username"];
            WorkITEntities db = new WorkITEntities();
            var Listjob = (from job in db.Jobs
                           where job.Username == username
                           orderby job.ID descending
                           select job).ToList();
            rpJobOverview.DataSource = Listjob;
            rpJobOverview.DataBind();
        }
    }
}
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ITWork.Administrator.Dashboard
{
    public partial class fListCVOverview : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                getOverview();

            }
        }
        public string getImg(string username)
        {
            WorkITEntities db = new WorkITEntities();
            AccountPerson acc = db.AccountPersons.FirstOrDefault(x => x.Username == username);
            if (acc != null)
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
            AccountPerson acc = db.AccountPersons.FirstOrDefault(x => x.Username == username);
            if (acc != null)
            {
                return acc.Phone;
            }
            else
            {
                return "";
            }
        }

        public string getFullName(string username)
        {
            WorkITEntities db = new WorkITEntities();
            AccountPerson obj = db.AccountPersons.FirstOrDefault(x => x.Username == username);
            if (obj != null)
            {
                return obj.Fullname;
            }
            else
            {
                return "";
            }
        }
        public string getJobPosition(int id)
        {
            WorkITEntities db = new WorkITEntities();
            CV obj = db.CVs.FirstOrDefault(x => x.ID == id);
            if (obj != null)
            {
                return obj.Position;
            }
            else
            {
                return "";
            }
        }
        public string getLocation(int id)
        {
            WorkITEntities db = new WorkITEntities();
            CV obj = db.CVs.FirstOrDefault(x => x.ID == id);
            if (obj != null)
            {
                return obj.Location;
            }
            else
            {
                return "";
            }
        }
        public string getLanguage(int id)
        {
            WorkITEntities db = new WorkITEntities();
            CV obj = db.CVs.FirstOrDefault(x => x.ID == id);
            if (obj != null)
            {
                return obj.Language;
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
            var Listjob = (from cv in db.CVs
                           where cv.Username == username
                           orderby cv.ID descending
                           select cv).ToList();
            rpCVOverview.DataSource = Listjob;
            rpCVOverview.DataBind();
        }
    }
}
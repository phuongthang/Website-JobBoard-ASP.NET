using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ITWork.Administrator.Dashboard
{
    public partial class fApprovalCV : System.Web.UI.Page
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
            var obj = (from cv in db.CVs
                       join user in db.AccountPersons
                       on cv.Username equals user.Username
                       orderby cv.ID descending
                       select new { Username = cv.Username, ID = cv.ID, FullName = user.Fullname, Position = user.Position }).ToList();
            dgvApprovalCV.DataSource = obj;
            dgvApprovalCV.DataBind();
        }
        public string getImage(string username)
        {
            WorkITEntities db = new WorkITEntities();
            AccountPerson obj = db.AccountPersons.FirstOrDefault(x => x.Username == username);
            if (obj != null)
            {
                if (obj.Url == null)
                {
                    return "users/unknow.jpg";
                }
                else
                {
                    return "person/" + obj.Url;
                }
            }
            else
            {
                return "";
            }
        }
        public string getPin(string id)
        {
            int index = Convert.ToInt32(id);
            WorkITEntities db = new WorkITEntities();
            CV obj = db.CVs.FirstOrDefault(x => x.ID == index);
            if (obj != null)
            {
                if (obj.Pin == "0")
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
        protected void linkPin_Command(object sender, CommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument.ToString());
            WorkITEntities db = new WorkITEntities();
            CV obj = db.CVs.FirstOrDefault(x => x.ID == id);
            if (obj != null)
            {
                if (obj.Pin == "0")
                {
                    obj.Pin = "1";
                }
                else
                {
                    obj.Pin = "0";
                }
            }
            db.SaveChanges();
            getData();
        }
        public void getPinn()
        {
            WorkITEntities db = new WorkITEntities();
            var obj = (from cv in db.CVs
                       join user in db.AccountPersons
                       on cv.Username equals user.Username
                       where cv.Pin == "1"
                       orderby cv.ID descending
                       select new { Username = cv.Username, ID = cv.ID, FullName = user.Fullname, Position = user.Position }).ToList();
            dgvApprovalCV.DataSource = obj;
            dgvApprovalCV.DataBind();
        }
        public void getNopinn()
        {
            WorkITEntities db = new WorkITEntities();
            var obj = (from cv in db.CVs
                       join user in db.AccountPersons
                       on cv.Username equals user.Username
                       where cv.Pin == "0"
                       orderby cv.ID descending
                       select new { Username = cv.Username, ID = cv.ID, FullName = user.Fullname, Position = user.Position }).ToList();
            dgvApprovalCV.DataSource = obj;
            dgvApprovalCV.DataBind();
        }
        protected void DropObject_SelectedIndexChanged(object sender, EventArgs e)
        {
            string obje = DropObject.SelectedValue;
            if (obje == "All")
            {
                getData();
            }
            if (obje == "Pin")
            {
                getPinn();
            }
            if (obje == "NoPin")
            {
                getNopinn();
            }
        }

        protected void dgvApprovalCV_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dgvApprovalCV.PageIndex = e.NewPageIndex;
            getData();
        }
    }
}
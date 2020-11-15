using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ITWork.Administrator.Dashboard
{
    public partial class fViewBlog : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                getData();
                getDataPin();
            }    
        }
        public void getData()
        {
            WorkITEntities db = new WorkITEntities();
            var obj = (from blog in db.Blogs
                        where blog.Status == "1"
                        orderby blog.ID descending
                        select blog).ToList();
            RepPost.DataSource = obj;
            RepPost.DataBind();
        }
        public void getDataPin()
        {
            WorkITEntities db = new WorkITEntities();
            var obj = (from blog in db.Blogs
                       where blog.Status == "1" && blog.Main == "1"
                       orderby blog.ID descending
                       select blog).ToList();
            RpPin.DataSource = obj;
            RpPin.DataBind();
        }
        public string getImgUser(string username)
        {
            WorkITEntities db = new WorkITEntities();
            AccountAdministrator objA = db.AccountAdministrators.FirstOrDefault(x => x.Username == username);
            if(objA != null)
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
                return "person/" +objU.Url;
            }
            return "";
        }
        public string Getdate(string date)
        {
            DateTime datee = Convert.ToDateTime(date);
            return String.Format("{0:dd-MM-yyyy}", datee);
        }
    }
}
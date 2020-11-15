using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ITWork.Administrator.Dashboard
{
    public partial class fListPostOverview : System.Web.UI.Page
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
            string username = (string)Session["Username"];
            WorkITEntities db = new WorkITEntities();
            var listblog = (from blog in db.Blogs
                            where blog.Username == username
                            orderby blog.ID descending
                            select blog).ToList();
            rpPostOverview.DataSource = listblog;
            rpPostOverview.DataBind();
        }
        public string getStatus(string index)
        {
            int id = Convert.ToInt32(index);
            WorkITEntities db = new WorkITEntities();
            Blog obj = db.Blogs.FirstOrDefault(x => x.ID == id);
            if(obj != null)
            {
                if(obj.Status == "1")
                {
                    return "Active";
                }
                else
                {
                    return "Processing";
                }    
            }
            else
            {
                return "";
            }
        }    
    }
}
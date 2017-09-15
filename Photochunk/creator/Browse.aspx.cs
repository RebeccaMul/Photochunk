using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

                     if (Session["user"] == null)
        {
                      Response.Redirect("../Login.aspx");
        }
        else if (Session["user"] != null)
        {
            string usern = Session["user"].ToString();
            
                    }

        if (Session["userrole"] != null)
        {
            string role = Session["userrole"].ToString();
        }

        if (Session["id"] != null)
        {
            string id = Session["id"].ToString();
        }

        if ((int)Session["userrole"] == 2)
        {
            Response.Redirect("../registered/default.aspx");
        }
                if ((int)Session["userrole"] == 4)
        {
            Response.Redirect("../superadmin/default.aspx");
        }

        }
  
    protected void PhotoList_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
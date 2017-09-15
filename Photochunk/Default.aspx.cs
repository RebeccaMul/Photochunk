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
      

    }

    protected void Search_Click(object sender, EventArgs e)
    {
        String stext = searchtitle.Text;

        Response.Redirect("search.aspx?searchquery=" + stext);
    }
}
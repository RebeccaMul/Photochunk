using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void loginbtn_Click(object sender, EventArgs e)
    {
        string user = userdata.Text;
        string pass = passdata.Text;
        
        string connectionString = WebConfigurationManager.ConnectionStrings["photocatconnection"].ConnectionString;

        SqlConnection myConnection = new SqlConnection(connectionString);

        myConnection.Open();

        string query = "SELECT * FROM Users WHERE Username=@usern AND Password=@passw";
        

        SqlCommand myCommand = new SqlCommand(query, myConnection);

        myCommand.Parameters.AddWithValue("@usern", user);
        myCommand.Parameters.AddWithValue("@passw", pass);

        SqlDataReader rdr = myCommand.ExecuteReader();

        if (rdr.HasRows)
        {
            rdr.Read();
            Session["user"] = rdr["Username"].ToString();
            Session["userrole"] = rdr["TypeId"];
            Session["id"] = rdr["UserId"];

            if ((int)Session["userrole"] == 3)
            {
                Response.Redirect("creator/Welcome.aspx");
            }
            if ((int)Session["userrole"] == 2)
            {
                Response.Redirect("registered/welcome.aspx");
            }
            if ((int)Session["userrole"] == 4)
            {
                Response.Redirect("superadmin/welcome.aspx");
            }
       
        }
        else
        {
            failed.Text = "Your username or password is incorrect.";
        }

        myConnection.Close();
    }
}
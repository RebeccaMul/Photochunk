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

public partial class _Default : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {



        //It is not a postback / on page load / do not perfrm when save button pressed
        if (!IsPostBack)
        {
            //Hiding comment section
            //LoggedIn.Visible = false;

            //Get the querystring data from your URL and store it in a variable, this will be used in the SQL select statement
            int row = 0;
            if (Request.QueryString["photoID"] != null)
            {
                //if it does exist in URL then do this..
                row = int.Parse(Request.QueryString["photoID"]);
            }
            else
            {
                //if there is no querystring in URL then redirect page..
                Response.Redirect("browse.aspx");
            }

            //set-up object to use the web.config file
            string connectionString = WebConfigurationManager.ConnectionStrings["photocatconnection"].ConnectionString;

            //set-up connection object called 'myConnection'
            SqlConnection myConnection = new SqlConnection(connectionString);

            //open database communication
            myConnection.Open();

            //create the SQL statement
            string query = "SELECT * FROM Photos where PhotoID=@rowID";

            //set up SQL command and use the SQL and myConnection object
            SqlCommand myCommand = new SqlCommand(query, myConnection);

            //create a parameterised object

            myCommand.Parameters.AddWithValue("@rowid", row);

        }
    }

    protected void PhotoList_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}

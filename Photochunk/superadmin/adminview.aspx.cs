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

public partial class about : System.Web.UI.Page
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
        if ((int)Session["userrole"] == 3)
        {
            Response.Redirect("../creator/default.aspx");
        }

        //It is not a postback / on page load / do not perfrm when save button pressed
        if (!IsPostBack)
        {
            //Get the querystring data from your URL and store it in a variable, this will be used in the SQL select statement
            int row = 0;
            if (Request.QueryString["cmtID"] != null)
            {
                //if it does exist in URL then do this..
                row = int.Parse(Request.QueryString["cmtID"]);
            }
            else
            {
                //if there is no querystring in URL then redirect page..
                Response.Redirect("Browse.aspx");
            }

            //set-up object to use the web.config file
            string connectionString = WebConfigurationManager.ConnectionStrings["photocatconnection"].ConnectionString;

            //set-up connection object called 'myConnection'
            SqlConnection myConnection = new SqlConnection(connectionString);

            //open database communication
            myConnection.Open();

            //create the SQL statement
            string query = "SELECT * FROM Comments where CmtID=@rowID";
            
            //set up SQL command and use the SQL and myConnection object
            SqlCommand myCommand = new SqlCommand(query, myConnection);

            //create a parameterised object
            
         myCommand.Parameters.AddWithValue("@rowid", row);

            //create a sqldatareader object that asks for data from a table
            SqlDataReader rdr = myCommand.ExecuteReader();

            
            //when in read mode ask for data
            while (rdr.Read())
            {
                //put field data from 'location' into variable
                string mycmt = rdr["cmtText"].ToString();

              

                //put variable value into textbox
                cmt.Text = mycmt;
                
            }
        }
    }
 

 
  
    protected void updatebutton_Click(object sender, EventArgs e)
    {
        //Save form changes
        //set up object to use the web.config file
        string connectionString = WebConfigurationManager.ConnectionStrings["photocatconnection"].ConnectionString;

        //set up connection object called 'myConnection'
        SqlConnection myConnection = new SqlConnection(connectionString);

        //open database communication
        myConnection.Open();

        string cmtupdate = cmt.Text;

        int row = int.Parse(Request.QueryString["CmtID"]);

        string query = "UPDATE Comments SET CmtText = @newcmt WHERE CmtID = @id";

        SqlCommand myCommand = new SqlCommand(query, myConnection);
        //parameterised object
        myCommand.Parameters.AddWithValue("@newcmt", cmtupdate);

        myCommand.Parameters.AddWithValue("@id", row);


        myCommand.ExecuteNonQuery();

        myConnection.Close();
        
        Response.Redirect("Browse.aspx");
    }
    protected void DeleteBtn_Click(object sender, EventArgs e)
    {


        //set up object to use the web.config file
        string connectionString = WebConfigurationManager.ConnectionStrings["photocatconnection"].ConnectionString;

        //set up connection object called 'myConnection'
        SqlConnection myConnection = new SqlConnection(connectionString);

        //open database communication
        myConnection.Open();

        int row = int.Parse(Request.QueryString["CmtID"]);

        string query = "DELETE FROM Comments WHERE CmtID = @id";

        SqlCommand myCommand = new SqlCommand(query, myConnection);

        myCommand.Parameters.AddWithValue("@id", row);

        myCommand.ExecuteNonQuery();

        myConnection.Close();

        Response.Redirect("Browse.aspx");


    }
}
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

public partial class registered_manageaccount : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        UpdateDetails.Visible = false;

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

        if ((int)Session["userrole"] == 3)
        {
            Response.Redirect("../creator/default.aspx");
        }
        if ((int)Session["userrole"] == 4)
        {
            Response.Redirect("../superadmin/default.aspx");
        }

        //It is not a postback / on page load / do not perfrm when save button pressed
        if (!IsPostBack)
        {
            //Get the querystring data from your URL and store it in a variable, this will be used in the SQL select statement
            int row = 0;
            if (Request.QueryString["userID"] != null)
            {
                //if it does exist in URL then do this..
                row = int.Parse(Request.QueryString["userID"]);
            }
            else
            {
                //if there is no querystring in URL then redirect page..
                Response.Redirect("welcome.aspx");
            }

            //set-up object to use the web.config file
            string connectionString = WebConfigurationManager.ConnectionStrings["photocatconnection"].ConnectionString;

            //set-up connection object called 'myConnection'
            SqlConnection myConnection = new SqlConnection(connectionString);

            //open database communication
            myConnection.Open();

            //create the SQL statement
            string query = "SELECT * FROM Users where UserId=@userID";

            //set up SQL command and use the SQL and myConnection object
            SqlCommand myCommand = new SqlCommand(query, myConnection);

            //create a parameterised object

            myCommand.Parameters.AddWithValue("@useriD", row);

            //create a sqldatareader object that asks for data from a table
            SqlDataReader rdr = myCommand.ExecuteReader();

            //when in read mode ask for data
            while (rdr.Read())
            {
                //put field data from 'location' into variable
                string myfname = rdr["Forename"].ToString();

                string mysname = rdr["Surname"].ToString();

                string myemail = rdr["Email"].ToString();

                string mypass = rdr["password"].ToString();


                //put variable value into textbox
                fnameedit.Text = myfname;
                snameedit.Text = mysname;
                emailedit.Text = myemail;
                passedit.Text = mypass;


            }
        }
    }


    protected void ChangeDet_Click(object sender, EventArgs e)
    {
        DetailsPanels.Visible = false;
        UpdateDetails.Visible = true;
    }
    protected void Update_Click(object sender, EventArgs e)
    {
        DetailsPanels.DataBind();
        DetailsPanels.Visible = true;
        UpdateDetails.Visible = false;

        //set up object to use the web.config file
        string connectionString = WebConfigurationManager.ConnectionStrings["photocatconnection"].ConnectionString;

        //set up connection object called 'myConnection'
        SqlConnection myConnection = new SqlConnection(connectionString);

        //open database communication
        myConnection.Open();

        string fupdate = fnameedit.Text;
               string supdate = snameedit.Text;
        string eupdate = emailedit.Text;
        string pupdate = passedit.Text;
        
        int row = int.Parse(Request.QueryString["UserID"]);

        string query = "UPDATE Users SET Forename = @newf, Surname = @news, Email = @newe, Password = @newp WHERE UserID = @id";

        SqlCommand myCommand = new SqlCommand(query, myConnection);
        //parameterised object
        myCommand.Parameters.AddWithValue("@newf", fupdate);
        myCommand.Parameters.AddWithValue("@news", supdate);
        myCommand.Parameters.AddWithValue("@newe", eupdate);
               myCommand.Parameters.AddWithValue("@newp", pupdate);
        myCommand.Parameters.AddWithValue("@id", row);

        myCommand.ExecuteNonQuery();

        Details.DataBind();

        myConnection.Close();
               

    }
}
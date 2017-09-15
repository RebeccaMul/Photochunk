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

        Access.Visible = false;

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
            if (Request.QueryString["userID"] != null)
            {
                //if it does exist in URL then do this..
                row = int.Parse(Request.QueryString["userID"]);
            }
            else
            {
                //if there is no querystring in URL then redirect page..
                Response.Redirect("adminaccounts.aspx");
            }

            //set-up object to use the web.config file
            string connectionString = WebConfigurationManager.ConnectionStrings["photocatconnection"].ConnectionString;

            //set-up connection object called 'myConnection'
            SqlConnection myConnection = new SqlConnection(connectionString);

            //open database communication
            myConnection.Open();

            //create the SQL statement
            string query = "SELECT * FROM Users where UserID=@rowID";
            
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
                string myuser = rdr["username"].ToString();

                string myemail = rdr["Email"].ToString();

                string myfname = rdr["forename"].ToString();

                string mysname = rdr["surname"].ToString();

                //put variable value into textbox
                useredit.Text = myuser;
               emedit.Text = myemail;
               fedit.Text = myfname;
               Sedit.Text = mysname;

               string utype;
               utype = Request.QueryString["TypeID"];
                AccessList.SelectedValue = utype; 

              

                
            }
        }
    }
 

    protected void Resetpass_Click(object sender, EventArgs e)
    {
        // Update password to email

        //set up object to use the web.config file
        string connectionString = WebConfigurationManager.ConnectionStrings["photocatconnection"].ConnectionString;

        //set up connection object called 'myConnection'
        SqlConnection myConnection = new SqlConnection(connectionString);

        //open database communication
        myConnection.Open();

        int row = int.Parse(Request.QueryString["UserID"]);
        string newpass = emedit.Text;

        string query = "UPDATE Users SET Password=@replacepass WHERE UserId = @id";

        SqlCommand myCommand = new SqlCommand(query, myConnection);

        myCommand.Parameters.AddWithValue("@id", row);
        myCommand.Parameters.AddWithValue("@replacepass", newpass);

        myCommand.ExecuteNonQuery();

        myConnection.Close();

        Response.Redirect("adminaccounts.aspx");

    }
    protected void updatebutton_Click1(object sender, EventArgs e)
    {
        //Save form changes
        //set up object to use the web.config file
        string connectionString = WebConfigurationManager.ConnectionStrings["photocatconnection"].ConnectionString;

        //set up connection object called 'myConnection'
        SqlConnection myConnection = new SqlConnection(connectionString);

        //open database communication
        myConnection.Open();

        string uupdate = useredit.Text;
        string eupdate = emedit.Text;
        string fupdate = fedit.Text;
        string supdate = Sedit.Text;
        int row = int.Parse(Request.QueryString["UserID"]);

        string query = "UPDATE Users SET Username = @newuser, Email = @newmail, Forename = @newf, surname = @news WHERE UserID = @id";

        SqlCommand myCommand = new SqlCommand(query, myConnection);
        //parameterised object
        myCommand.Parameters.AddWithValue("@newuser", uupdate);
        myCommand.Parameters.AddWithValue("@newmail", eupdate);
        myCommand.Parameters.AddWithValue("@newf", fupdate);
        myCommand.Parameters.AddWithValue("@news", supdate);
        myCommand.Parameters.AddWithValue("@id", row);

        myCommand.ExecuteNonQuery();

        myConnection.Close();

        Response.Redirect("adminaccounts.aspx");

    }
    protected void DeleteBtn_Click1(object sender, EventArgs e)
    {
        //Delete user from table

        //set up object to use the web.config file
        string connectionString = WebConfigurationManager.ConnectionStrings["photocatconnection"].ConnectionString;

        //set up connection object called 'myConnection'
        SqlConnection myConnection = new SqlConnection(connectionString);

        //open database communication
        myConnection.Open();

        int row = int.Parse(Request.QueryString["UserID"]);

        string query = "DELETE FROM Users WHERE UserID = @id";

        SqlCommand myCommand = new SqlCommand(query, myConnection);

        myCommand.Parameters.AddWithValue("@id", row);

        myCommand.ExecuteNonQuery();

        myConnection.Close();

        Response.Redirect("adminaccounts.aspx");


    }
    protected void Levelbtn_Click(object sender, EventArgs e)
    {

        //Change user's access
        Access.Visible = true;
 Access.DataBind();
        
    }
    protected void ChangeAccess_Click(object sender, EventArgs e)
    {

        //set up object to use the web.config file
        string connectionString = WebConfigurationManager.ConnectionStrings["photocatconnection"].ConnectionString;

        //set up connection object called 'myConnection'
        SqlConnection myConnection = new SqlConnection(connectionString);

        //open database communication
        myConnection.Open();

        string myaccess = AccessList.SelectedValue;

        int row = int.Parse(Request.QueryString["UserID"]);

        string query = "UPDATE Users SET TypeId = @newaccess WHERE UserID = @id";

        SqlCommand myCommand = new SqlCommand(query, myConnection);
        //parameterised object
        myCommand.Parameters.AddWithValue("@newaccess", myaccess);

        myCommand.Parameters.AddWithValue("@id", row);

        myCommand.ExecuteNonQuery();

        myConnection.Close();

        Response.Redirect("adminaccounts.aspx");


    }
}
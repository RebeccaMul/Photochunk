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
    protected void Like_Click(object sender, EventArgs e)
    {

        //set up object to use the web.config file
        string connectionString = WebConfigurationManager.ConnectionStrings["photocatconnection"].ConnectionString;

        //set up connection object called 'myConnection'
        SqlConnection myConnection = new SqlConnection(connectionString);

        //open database communication
        myConnection.Open();

        //intialising values with URL        
        int row = int.Parse(Request.QueryString["photoID"]);
        int beforelikes = int.Parse(Request.QueryString["Likes"]);

        int likes;

        //Increment likes value
            likes = beforelikes;
            likes += 1;
            Like.Text = "    ♥    ";
        
            int likeupdate;
            likeupdate = likes;
        
        //Disable button after use
            Like.Enabled = false;
        

            string query = "UPDATE Photos SET Likes = @newlikes WHERE photoID=@id";

            SqlCommand myCommand = new SqlCommand(query, myConnection);

            myCommand.Parameters.AddWithValue("@newlikes", likeupdate);
            myCommand.Parameters.AddWithValue("@id", row);

            myCommand.ExecuteNonQuery();

            ViewPhotos.DataBind();
            ViewData.DataBind();
        

            myConnection.Close();

        

    }
    protected void Post_Click(object sender, EventArgs e)
    {
        string connectionString = WebConfigurationManager.ConnectionStrings["photocatconnection"].ConnectionString;
        SqlConnection myConnection = new SqlConnection(connectionString);

        myConnection.Open();

        string commentdata = CommentBox.Text;
        int photodata = int.Parse(Request.QueryString["photoID"]);
      

        DateTime dateNow = DateTime.Now;
    
        int id = (int)Session["id"];

        string query = "INSERT INTO Comments (CmtText, PhotoId, UserId) VALUES ('" + commentdata + "', '" + photodata + "', '"+ id +"')";

        SqlCommand myCommand = new SqlCommand(query, myConnection);

        myCommand.ExecuteNonQuery();

        CommentBox.Text = "";
        CommentsList.DataBind();

        myConnection.Close();
    }
}

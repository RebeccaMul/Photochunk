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
        if ((int)Session["userrole"] == 4)
        {
            Response.Redirect("../superadmin/default.aspx");
        }

        //It is not a postback / on page load / do not perfrm when save button pressed
        if (!IsPostBack)
        {
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
                Response.Redirect("updateimg.aspx");
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

            //create a sqldatareader object that asks for data from a table
            SqlDataReader rdr = myCommand.ExecuteReader();

            string catselect = Request.QueryString["CatID"];

            CatList.SelectedValue = catselect;
            string img = "../" + Request.QueryString["ImagePath"];
            Photo.ImageUrl = img;
            
            //when in read mode ask for data
            while (rdr.Read())
            {
                //put field data from 'location' into variable
                string myloc = rdr["location"].ToString();

                string mydesc = rdr["description"].ToString();


                
                
                
                
                string pub = "Y";
                
                if (publishlist.SelectedValue == "Y") {
                    pub = "Y";
                } 
                else
                {
                    pub = "N";
                }

               //Category
                //put variable value into textbox
                locationedit.Text = myloc;
                descedit.Text = mydesc;
               
                
               
            }
        }
    }
    protected void updatebutton_Click(object sender, EventArgs e)
    {

        

        //set up object to use the web.config file
        string connectionString = WebConfigurationManager.ConnectionStrings["photocatconnection"].ConnectionString;

        //set up connection object called 'myConnection'
        SqlConnection myConnection = new SqlConnection(connectionString);

        //open database communication
        myConnection.Open();

        string locationupdate = locationedit.Text;
        string pubupdate = publishlist.SelectedValue;
        string descupdate = descedit.Text;
       
        string catupdate = CatList.SelectedValue;

        int row = int.Parse(Request.QueryString["PhotoID"]);
        string newimage = Request.QueryString["ImagePath"];
        string query;
        
       

            query = "UPDATE Photos SET Location = @newlocation, Published = @newpub, Description = @newdesc,  CatId = @newcat WHERE PhotoID = @id";

            

        
        SqlCommand myCommand = new SqlCommand(query, myConnection);
        //parameterised object
        myCommand.Parameters.AddWithValue("@newlocation", locationupdate);
        myCommand.Parameters.AddWithValue("@newpub", pubupdate);
        myCommand.Parameters.AddWithValue("@newdesc", descupdate);
     
        myCommand.Parameters.AddWithValue("@newcat", catupdate);
        myCommand.Parameters.AddWithValue("@image", newimage);
        myCommand.Parameters.AddWithValue("@id", row);

        myCommand.ExecuteNonQuery();

        myConnection.Close();

        Response.Redirect("updateimg.aspx");
    }
    protected void DeleteBtn_Click(object sender, EventArgs e)
    {

        //set up object to use the web.config file
        string connectionString = WebConfigurationManager.ConnectionStrings["photocatconnection"].ConnectionString;

        //set up connection object called 'myConnection'
        SqlConnection myConnection = new SqlConnection(connectionString);

        //open database communication
        myConnection.Open();

        int row = int.Parse(Request.QueryString["PhotoID"]);

        string query = "DELETE FROM Photos WHERE PhotoID = @id";

        SqlCommand myCommand = new SqlCommand(query, myConnection);

        myCommand.Parameters.AddWithValue("@id", row);

        myCommand.ExecuteNonQuery();

        myConnection.Close();

        Response.Redirect("updateimg.aspx");

        
    }
}
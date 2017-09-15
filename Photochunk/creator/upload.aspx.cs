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
        if (this.IsPostBack)
        {
            UploadPanel.Visible = false;
            Preview.Visible = false;
            info.Text = "<h3>Your Image has been uploaded.</h3> <br/>You can now <a href='browse.aspx'>view</a> or <a href='updateimg.aspx'>edit</a> your images";

        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string UpPath = Server.MapPath("~/creator");

        Random r = new Random();
        int rInt = r.Next(0, 10000);

        if (!Directory.Exists(UpPath))
        {
            Directory.CreateDirectory(UpPath);
            info.Text = UpPath + " folder does not exist";
        }
        else
        {

            int imgSize = FileUpload1.PostedFile.ContentLength;
            string imgName = FileUpload1.FileName;
            string imgPath = "uploaded/" + rInt + imgName;

            if (FileUpload1.PostedFile.ContentLength > 1000000)
            {
                Page.ClientScript.RegisterClientScriptBlock(typeof(Page), "Alert", "alert('File is too big.')", true);
            }
            else
            {
                //then save it to the folder
                FileUpload1.SaveAs(Server.MapPath(imgPath));
            
            }
        }

        string connectionString = WebConfigurationManager.ConnectionStrings["photocatconnection"].ConnectionString;
        SqlConnection myConnection = new SqlConnection(connectionString);

        //myConnection.ConnectionString is now set to connectionString.
        myConnection.Open();

        string img = "creator/uploaded/" + rInt + FileUpload1.FileName;

        DateTime dateNow = DateTime.Now;

        string locat = locationtext.Text;

        string pub = PublishList.SelectedValue;

        string desc = desctext.Text;

        int cat = CatList.SelectedIndex;
        if (CatList.SelectedIndex == 0)
        {

            UploadPanel.Visible = true;
            Preview.Visible = true;

            ScriptManager.RegisterStartupScript(this, GetType(), "catconfirm", "catconfirm();", true);   
        }
        else
        {

            int id = (int)Session["id"];

            string query = "INSERT INTO Photos (ImagePath, Location, Published, Description,   Likes, UserId, CatId) VALUES ('" + img + "', '" + locat + "', '" + pub + "', '" + desc + "',  '0', '"+ id +"', '" + cat + "')";


            SqlCommand myCommand = new SqlCommand(query, myConnection);

            myCommand.ExecuteNonQuery();
        }
        //info.Text = "connection to db made";
        myConnection.Close();

      

    }
}
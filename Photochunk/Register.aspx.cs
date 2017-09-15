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
  
    protected void regbtn_Click(object sender, EventArgs e)
    {

       
        string user = reguser.Text;
        string pass = regpass.Text;
        string forename = Fname.Text;
        string surname = Sname.Text;
        string email = regemail.Text;

       
        string connectionString = WebConfigurationManager.ConnectionStrings["photocatconnection"].ConnectionString;

        SqlConnection myConnection = new SqlConnection(connectionString);

        myConnection.Open();

        
            string query = "INSERT INTO Users (Username, Password, Email, TypeId, Forename, Surname) VALUES (@usern, @passw, @emailadd, '2', @Name, @Sname)";


            SqlCommand myCommand = new SqlCommand(query, myConnection);

            myCommand.Parameters.AddWithValue("@usern", user);
            myCommand.Parameters.AddWithValue("@passw", pass);
            myCommand.Parameters.AddWithValue("@emailadd", email);
            myCommand.Parameters.AddWithValue("@Name", forename);
            myCommand.Parameters.AddWithValue("@Sname", surname);

            myCommand.ExecuteNonQuery();

        
        myConnection.Close();

        failed.Text = "Your account has been created. You can now <a href='Login.aspx'><b>Login</b></a>";
        reguser.Text = "";
        regpass.Text = "";
        Fname.Text = "";
        Sname.Text = "";
        regemail.Text = "";
    }
    }
    
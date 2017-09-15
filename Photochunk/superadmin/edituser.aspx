<%@ Page Language="C#" AutoEventWireup="true" CodeFile="edituser.aspx.cs" Inherits="about" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<html class="no-js" lang="en">
<!--head-->
<head runat="server">
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>Photochunk</title>
<meta name="description" content="About us">

<!-- css stylesheet -->
<link href="../css/hawthorne_type2_color3.css" rel="stylesheet">

<link href="../css/font-awesome.min.css" rel="stylesheet">
<script src="../js/vendor/modernizr.js"></script>
</head>

    <!--Body-->
<body>
    <form id="form1" runat="server">
    <div>
  
<div class="top-border"></div>

<div class="row">
	<div class="small-12 medium-12 large-12 small-centered columns">
		<header>		
			<div class="logo">
				<a href="Default.aspx"><img src="../img/Potential logo.png" /></a>
                
			</div>
		</header>
	</div>
    <!-- Links -->
	<div class="small-12 medium-12 large-12 small-centered columns">
		<nav>
			<ul class="inline-list-custom">
				<li><a href="Default.aspx" >Categories</a></li>
				<li><a href="browse.aspx">Browse</a></li>
                       	  <li><a href="UpdateImg.aspx" >Edit</a></li>
                <li><a href="adminaccounts.aspx">Manage Users</a></li>	
                <li><a href="../Logout.aspx">Log out</a></li>
             		
			</ul>
		</nav>
	</div>
</div>

        <!--Main Content-->
      
        <div class="row">
            <div class="small-12 medium-7 large-7 columns">
    <h3>Edit a User's Details</h3><br /><br />

    <b>Username:</b> <asp:TextBox ID="useredit" runat="server" ToolTip="User's user name - Can be changed if inappropriate."></asp:TextBox><br />

    
   <b>Email:</b><br />
            <asp:TextBox ID="emedit" runat="server" ToolTip="User's email address." ></asp:TextBox><br />

                
   <b>Forename:</b><br />
            <asp:TextBox ID="fedit" runat="server" ToolTip="User's Forename." ></asp:TextBox><br />

                
   <b>Surname:</b><br />
            <asp:TextBox ID="Sedit" runat="server" ToolTip="User's Surname" ></asp:TextBox><br />


        <asp:Button ID="updatebutton" runat="server" Text="Save Changes" OnClick="updatebutton_Click1" OnClientClick="return confirm('Are you sure you want to change these user details?');"  style="height:40px;"/><br /><br />

              <br /> 
               
    </div>

            <b><h3> Additonal Options:</h3></b><br /><br />
    
                             

                <asp:Button ID="Resetpass" runat="server" Text="Reset Password" OnClick="Resetpass_Click" OnClientClick="return confirm('Are you sure you want to reset this users password? This action cannot be undone.');"  ToolTip="Reset the account's password." style="height:40px;"/>

                <asp:Button ID="Levelbtn" runat="server" Text="Change User's Access" ToolTip="Change the user's access level, e.g. Registered, Creator, Admin." OnClick="Levelbtn_Click" style="height:40px;"/>

                   <asp:Button ID="DeleteBtn" runat="server" Text="Delete User"  OnClientClick="return confirm('Are you sure you want to delete this user? This action cannot be undone.');" OnClick="DeleteBtn_Click1" ToolTip="Delete the account, this action cannot be undone."  style="height:40px;" /><br /><br />

               <br /><asp:Panel ID="Access" runat="server">
            <b>User Access Level:</b><br />
            <asp:DropDownList ID="AccessList" runat="server" style="width:35%" ToolTip="Level of access the user has to the site.">
                <asp:ListItem Value="2">Registered</asp:ListItem>
                <asp:ListItem Value="3">Creator</asp:ListItem>
                <asp:ListItem Value="4">SuperAdmin</asp:ListItem>
            </asp:DropDownList>
                                     
                   <asp:Button ID="ChangeAccess" runat="server" Text="Change Access" OnClientClick="return confirm('Are you sure you want to change this users access? Please ensure you have selected the correct Access Level.');" style="height:40px;" OnClick="ChangeAccess_Click"/>

        </asp:Panel>
     </div>

     

<div class="row">
	<div class="small-12 medium-12 large-12 columns">
		<footer>
			<ul>
				<li>&copy; 2014 <a href="Default.aspx">Photochunk</a>. All rights reserved.</li>
				<li><a href="mailto:contact@photochunk.com"><i class="fa fa-envelope-o"></i> contact@photochunk.com</a></li>
				
				<!-- *****************************************************************************************
				The "Powered by Type & Grids" link in the footer is required in the Free version
				typeandgrids.com/pirates -->
				<li>Powered by <a href="http://www.typeandgrids.com" target="_blank">Type &amp; Grids</a></li>
				<!--  ************************************************************************************ -->
				
			</ul>
		</footer>
	</div>
</div>

<script src="js/vendor/jquery.min.js"></script>
<script src="js/foundation.min.js"></script>
<script src="js/hawthorne.js"></script>


    
    </div>
    </form>
</body>
</html>

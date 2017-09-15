<%@ Page Language="C#" AutoEventWireup="true" CodeFile="adminview.aspx.cs" Inherits="about" %>

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
    <h3>Moderate a comment</h3><br /><br />

    <b>Comment text:</b><br /> <asp:TextBox ID="cmt" runat="server" ToolTip="Edit a comment if inaccurate or inappropriate." TextMode="MultiLine"></asp:TextBox><br />

    
        <asp:Button ID="updatebutton" runat="server" Text="Save Changes" 
            OnClientClick="return confirm('Are you sure you want to edit this comment?');"  style="height:40px;" OnClick="updatebutton_Click"/><br /><br />

              <br /> 
               
    </div>

            <b><h3> Additonal Options:</h3></b><br /><br />
    
                             
                   <asp:Button ID="DeleteBtn" runat="server" Text="Delete Comment"  OnClientClick="return confirm('Are you sure you want to delete this comment? This action cannot be undone.');"  ToolTip="Delete the comment, this action cannot be undone."  style="height:40px;" OnClick="DeleteBtn_Click" /><br /><br />

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

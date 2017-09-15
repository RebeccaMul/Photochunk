<%@ Page Language="C#" AutoEventWireup="true" CodeFile="edit.aspx.cs" Inherits="about" %>

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
                	<li><a href="Upload.aspx" >Upload</a></li>
                <li><a href="UpdateImg.aspx" >Edit</a></li>
                <li><a href="manageaccount.aspx">My Profile</a></li>				
                <li><a href="../Logout.aspx">Log out</a></li>
             		
			</ul>
		</nav>
	</div>
</div>

        <!--Main Content-->
      
        <div class="row">
            <div class="small-12 medium-7 large-7 columns">
    <h2>Edit an Image</h2><br /><br />

    Location: <asp:TextBox ID="locationedit" runat="server" ToolTip="Where was the photo was taken?"></asp:TextBox><br />

    Description:<br />
            <asp:TextBox ID="descedit" runat="server" ToolTip="Describe the photo" TextMode="MultiLine"></asp:TextBox><br>

  
           Category: <br />
            <asp:DropDownList ID="CatList" runat="server" style="width: 70%;" ToolTip="What category does the photo fall under?">
                <asp:ListItem>Please Select a Category</asp:ListItem>
                <asp:ListItem Value="1">Nature</asp:ListItem>
                <asp:ListItem Value="2">Attraction</asp:ListItem>
                <asp:ListItem Value="3">Activity</asp:ListItem>
                <asp:ListItem Value="4">Tourist Area</asp:ListItem>
                <asp:ListItem Value="5">Village/Town</asp:ListItem>
                <asp:ListItem Value="6">Belfast</asp:ListItem>
            </asp:DropDownList> <br />


                 Published:<br />
    <asp:DropDownList ID="publishlist" runat="server" ToolTip="Do you want the photo published on the site?" Style="width:30%">
        <asp:ListItem Value="Y">Yes</asp:ListItem>
        <asp:ListItem Value="N">No</asp:ListItem>
    </asp:DropDownList><br />

     
  <br />

        <asp:Button ID="updatebutton" runat="server" Text="Save Changes" OnClick="updatebutton_Click" />
                    <asp:Button ID="DeleteBtn" runat="server" Text="Delete Photo" OnClick="DeleteBtn_Click" OnClientClick="return confirm('Are you sure you want to delete this photo?');"  />
             

    </div>
            <h3>Current Image:</h3>
            <asp:Image ID="Photo" runat="server" Style="width: 270px; height: 250px;" />

    
</script>
                 
   
    <asp:Label ID="info" runat="server" Text="" Width="500px"></asp:Label>


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

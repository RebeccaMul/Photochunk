<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Welcome.aspx.cs" Inherits="registered_manageaccount" %>

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
				<li><a href="browse.aspx" >Browse</a></li>
                	<li><a href="Upload.aspx" >Upload</a></li>
                <li><a href="UpdateImg.aspx" >Edit</a></li>

                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:photocatconnection %>' SelectCommand="SELECT [UserId] FROM [Users] WHERE ([UserId] = @UserId)">
            <SelectParameters>
                <asp:SessionParameter SessionField="id" Name="UserId" Type="Int32"></asp:SessionParameter>
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" DataKeyNames="UserId">
            
            <EditItemTemplate>
                <span style="">UserId:
                    <asp:Label Text='<%# Eval("UserId") %>' runat="server" ID="UserIdLabel1" /><br />
                    <asp:Button runat="server" CommandName="Update" Text="Update" ID="UpdateButton" /><asp:Button runat="server" CommandName="Cancel" Text="Cancel" ID="CancelButton" /><br />
                    <br />
                </span>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <span>No data was returned.</span>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <span style="">
                    <asp:Button runat="server" CommandName="Insert" Text="Insert" ID="InsertButton" /><asp:Button runat="server" CommandName="Cancel" Text="Clear" ID="CancelButton" /><br />
                    <br />
                </span>
            </InsertItemTemplate>
            <ItemTemplate>
                
                     <li><asp:HyperLink ID="Myprofile" runat="server" NavigateUrl='<%# "manageaccount.aspx?userID=" + Eval("UserId") %>'>My Profile</asp:HyperLink></li>

                				
                <li><a href="../Logout.aspx">Log out</a></li>
             		
			</ul>
		</nav>

            </ItemTemplate>
            <LayoutTemplate>
                <div runat="server" id="itemPlaceholderContainer" style=""><span runat="server" id="itemPlaceholder" /></div>
                <div style="">
                </div>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <span style="">UserId:
                    <asp:Label Text='<%# Eval("UserId") %>' runat="server" ID="UserIdLabel" /><br />
                    <br />
                </span>
            </SelectedItemTemplate>
        </asp:ListView>
              
	</div>
</div>

        <!--Main Content-->
      
        <div class="row">
            
   <h2 style="margin-left:5%;">Welcome <asp:Label ID="username" runat="server" Text="" Style="margin"></asp:Label>!</h2><br />
            
            <div id="help" style="background-color:darkgray; color:white; margin-left:5%; margin-right:10%; padding:10px;">
                <h3 style="color:darkred">Getting Started</h3>
                <p> Here a few tips on using <b>PhotoChunk</b> as a Creator.<br /><br />
                    <u>Navigation bar guide:</u><br /><br /> 
                    <a href="Default.aspx"><b>Home Page</b></a> - where you can select a Category or type of photos to view or search for a specific photo.<br /> 
                    <b><a href="Browse.aspx">Browse</a></b> photos - you can <b>comment</b> on and <b>like</b> your favourites!<br />
                    <b><a href="regaccount.aspx">My Profile</a></b>- here you'll find your account information, and you can update your details. <br />
                    <b><a href="logout.aspx">Log out</a></b>- will log you out of your account. <br />
                      </p><br />

<u>Creator Functionality:</u><br /><br />
                <b><a href="Upload.aspx">Upload</a></b>- here you can upload and store your photos. You can enter details such as a name, description, photo category.<br />  You can also choose whether or not to publish your images for the public and other users who can comment on and like your images. <br /><br /> 
                <b><a href="updateimages.aspx">Edit</a></b>- here you can edit the details of your previous photos and change any image you uploaded.

                </div>

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

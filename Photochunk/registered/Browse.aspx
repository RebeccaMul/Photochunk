<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Browse.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<html class="no-js" lang="en">
 <!--head-->
<head runat="server">
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>Photochunk</title>
<img src=""/>
<meta name="description" content="Home">

 <!-- css stylesheet -->
<link href="../css/hawthorne_type2_color3.css" rel="stylesheet">

<link href="../css/font-awesome.min.css" rel="stylesheet">
<script src="js/vendor/modernizr.js"></script>

</head>

    <!--Body-->
<body>
    <form id="form1" runat="server">
    <div>
    
        <!--Template start-->
        
<div class="top-border"></div>

<div class="row">
	<div class="small-12 medium-12 large-12 small-centered columns">
		<header>
             <div class="logo">
				<a href="Default.aspx"><img src="../img/Potential logo.png" /></a>
			</div>
          
            <h2>
            </h2>
		</header>
	</div>
	<div class="small-12 medium-12 large-12 small-centered columns">
		<nav> <!-- Links -->
			<ul class="inline-list-custom">
				<li><a href="Default.aspx" >Categories</a></li>
				<li><a href="browse.aspx"class="current">Browse</a></li>
                       	                  <li><a href="regaccount.aspx">My Profile</a></li>	
                <li><a href="../Logout.aspx">Log out</a></li>
                
			</ul>
            
		</nav>
        
				
			
	</div>
</div>

<div class="row">
	<div class="small-12 medium-12 large-12 columns">
		<ul class="small-block-grid-1 medium-block-grid-3 large-block-grid-3 inline-list-custom">

            <asp:SqlDataSource ID="PhotoData" runat="server" ConnectionString='<%$ ConnectionStrings:photocatconnection %>' SelectCommand="SELECT Photos.PhotoID, Photos.ImagePath, Photos.Location, Photos.Description, Photos.Date, Photos.Likes, Users.Username, Category.Category FROM
Photos INNER JOIN
Users ON Photos.UserId = Users.UserId 
INNER JOIN Category ON 
Photos.CatId=Category.CatId
WHERE Photos.Published LIKE 'Y'"></asp:SqlDataSource>

            <asp:ListView ID="BrowseList" runat="server" DataSourceID="PhotoData" DataKeyNames="PhotoID" GroupItemCount="3">
                <EditItemTemplate>
                    <td runat="server" style="">PhotoID:
                        <asp:Label Text='<%# Eval("PhotoID") %>' runat="server" ID="PhotoIDLabel1" /><br />
                        ImagePath:
                        <asp:TextBox Text='<%# Bind("ImagePath") %>' runat="server" ID="ImagePathTextBox" /><br />
                        Location:
                        <asp:TextBox Text='<%# Bind("Location") %>' runat="server" ID="LocationTextBox" /><br />
                        Description:
                        <asp:TextBox Text='<%# Bind("Description") %>' runat="server" ID="DescriptionTextBox" /><br />
                        Date:
                        <asp:TextBox Text='<%# Bind("Date") %>' runat="server" ID="DateTextBox" /><br />
                        Likes:
                        <asp:TextBox Text='<%# Bind("Likes") %>' runat="server" ID="LikesTextBox" /><br />
                        Username:
                        <asp:TextBox Text='<%# Bind("Username") %>' runat="server" ID="UsernameTextBox" /><br />
                        Category:
                        <asp:TextBox Text='<%# Bind("Category") %>' runat="server" ID="CategoryTextBox" /><br />
                        <asp:Button runat="server" CommandName="Update" Text="Update" ID="UpdateButton" /><br />
                        <asp:Button runat="server" CommandName="Cancel" Text="Cancel" ID="CancelButton" /><br />
                    </td>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <EmptyItemTemplate>
                    <td runat="server" />
                </EmptyItemTemplate>
                <GroupTemplate>
                    <tr runat="server" id="itemPlaceholderContainer">
                        <td runat="server" id="itemPlaceholder"></td>
                    </tr>
                </GroupTemplate>
                <InsertItemTemplate>
                    <td runat="server" style="">ImagePath:
                        <asp:TextBox Text='<%# Bind("ImagePath") %>' runat="server" ID="ImagePathTextBox" /><br />
                        Location:
                        <asp:TextBox Text='<%# Bind("Location") %>' runat="server" ID="LocationTextBox" /><br />
                        Description:
                        <asp:TextBox Text='<%# Bind("Description") %>' runat="server" ID="DescriptionTextBox" /><br />
                        Date:
                        <asp:TextBox Text='<%# Bind("Date") %>' runat="server" ID="DateTextBox" /><br />
                        Likes:
                        <asp:TextBox Text='<%# Bind("Likes") %>' runat="server" ID="LikesTextBox" /><br />
                        Username:
                        <asp:TextBox Text='<%# Bind("Username") %>' runat="server" ID="UsernameTextBox" /><br />
                        Category:
                        <asp:TextBox Text='<%# Bind("Category") %>' runat="server" ID="CategoryTextBox" /><br />
                        <asp:Button runat="server" CommandName="Insert" Text="Insert" ID="InsertButton" /><br />
                        <asp:Button runat="server" CommandName="Cancel" Text="Clear" ID="CancelButton" /><br />
                    </td>
                </InsertItemTemplate>
                 <ItemTemplate>
                    <td runat="server" style="">
                        <asp:Image ID="listimage" runat="server" ImageUrl='<%# "../"+Eval("ImagePath") %>' Width="400px" Height="300px"  />

                        <br /><br />
                        <div class="editbutton">
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "view.aspx?photoID=" + Eval("PhotoID") +"&Likes=" + Eval("Likes")   %>'>View</asp:HyperLink>
                        </div>
                        Location:
                        <asp:Label Text='<%# Eval("Location") %>' runat="server" ID="LocationLabel" /><br />
                        
                        Uploaded by:
                        <asp:Label Text='<%# Eval("Username") %>' runat="server" ID="UsernameLabel" /><br />
                        Category:
                        <asp:Label Text='<%# Eval("Category") %>' runat="server" ID="CategoryLabel" /><br />
                        <br />
                        
                    </td>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table runat="server" id="groupPlaceholderContainer" style="" border="0">
                                    <tr runat="server" id="groupPlaceholder"></tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style=""></td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <td runat="server" style="">PhotoID:
                        <asp:Label Text='<%# Eval("PhotoID") %>' runat="server" ID="PhotoIDLabel" /><br />
                        ImagePath:
                        <asp:Label Text='<%# Eval("ImagePath") %>' runat="server" ID="ImagePathLabel" /><br />
                        Location:
                        <asp:Label Text='<%# Eval("Location") %>' runat="server" ID="LocationLabel" /><br />
                        Description:
                        <asp:Label Text='<%# Eval("Description") %>' runat="server" ID="DescriptionLabel" /><br />
                        Date:
                        <asp:Label Text='<%# Eval("Date") %>' runat="server" ID="DateLabel" /><br />
                        Likes:
                        <asp:Label Text='<%# Eval("Likes") %>' runat="server" ID="LikesLabel" /><br />
                        Username:
                        <asp:Label Text='<%# Eval("Username") %>' runat="server" ID="UsernameLabel" /><br />
                        Category:
                        <asp:Label Text='<%# Eval("Category") %>' runat="server" ID="CategoryLabel" /><br />
                    </td>
                </SelectedItemTemplate>
            </asp:ListView>

		</ul>
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

        <!--Template end-->


    </div>
    </form>
</body>
</html>

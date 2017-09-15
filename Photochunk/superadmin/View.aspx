<%@ Page Language="C#" AutoEventWireup="true" CodeFile="View.aspx.cs" Inherits="_Default" %>

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
				<li><a href="browse.aspx">Browse</a></li>
                       	  <li><a href="UpdateImg.aspx" >Edit</a></li>
                <li><a href="adminaccounts.aspx">Manage Users</a></li>	
                <li><a href="../Logout.aspx">Log out</a></li>
						
			</ul>
		</nav>
	</div>
</div>
        
            
<div class="row">
	<div class="small-12 medium-12 large-12 columns">
		<ul class="small-block-grid-1 medium-block-grid-3 large-block-grid-3 inline-list-custom">
           
            <asp:SqlDataSource ID="ViewData" runat="server" ConnectionString='<%$ ConnectionStrings:photocatconnection %>' SelectCommand="SELECT Photos.PhotoID, Photos.ImagePath, Photos.Location, Photos.Description, Photos.Date, Photos.Likes, Users.Username, Category.Category FROM
Photos INNER JOIN
Users ON Photos.UserId = Users.UserId 
INNER JOIN Category ON 
Photos.CatId=Category.CatId
WHERE PhotoID=@PhotoID">
                <SelectParameters>
                    <asp:QueryStringParameter QueryStringField="PhotoID" Name="PhotoID"></asp:QueryStringParameter>
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:ListView ID="ViewPhotos" runat="server" DataSourceID="ViewData" DataKeyNames="PhotoID">
<EditItemTemplate>
                    <span style="">PhotoID:
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
                        <asp:Button runat="server" CommandName="Update" Text="Update" ID="UpdateButton" /><asp:Button runat="server" CommandName="Cancel" Text="Cancel" ID="CancelButton" /><br />
                        <br />
                    </span>

                </EditItemTemplate>
                <EmptyDataTemplate>
                    <span>No data was returned.</span>

                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <span style="">ImagePath:
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
                        <asp:Button runat="server" CommandName="Insert" Text="Insert" ID="InsertButton" /><asp:Button runat="server" CommandName="Cancel" Text="Clear" ID="CancelButton" /><br />
                        <br />
                    </span>

                </InsertItemTemplate>
                
                <ItemTemplate>
                    <span style="">
                        <div class="viewimg" style="float:left;"> 
                         <asp:Image ID="listimage" runat="server" ImageUrl='<%# "../"+Eval("ImagePath") %>' Width="630px" Height="550px" Style="padding-right:10px; padding-bottom:10px;"   />
                           </div>
                       <div class="lined-list" > <h3> Details:</h3>
                        <li><strong> <asp:Label Text='<%# Eval("Location") %>' runat="server" ID="LocationLabel" /><br /></strong></li>
                       <li><strong> 
                        <asp:Label Text='<%# Eval("Description") %>' runat="server" ID="DescriptionLabel" /></li></strong>
                        <li><strong>
                            
                        <asp:Label Text='<%# Eval("Category") %>' runat="server" ID="CategoryLabel" /></li></strong>
                       <li><strong> <asp:Label Text='<%# Eval("Likes") %>' runat="server" ID="LikesLabel" /> likes<br /></li></strong>
                           
                         <li><strong>  Uploaded by: 
                        <asp:Label Text='<%# Eval("Username") %>' runat="server" ID="UsernameLabel" /><br /></li></strong>
                        
                           
                        <br />
                    </span>

                </ItemTemplate>
                
                <LayoutTemplate>
                    <div runat="server" id="itemPlaceholderContainer" style=""><span runat="server" id="itemPlaceholder" /></div>
                    <div style="">
                    </div>

                </LayoutTemplate>
                <SelectedItemTemplate>
                    <span style="">PhotoID:
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
                        <br />
                    </span>

                </SelectedItemTemplate>
            </asp:ListView>
                
             
        
            <asp:Panel ID="LoggedIn" runat="server">
        <br /><asp:Button ID="Like" runat="server" Text="    ♡    " OnClick="Like_Click" Style="float:right; font-size:x-large; font-weight:700;" />
            
             <div class="AddComment">
                 <h3>Add a comment:</h3>
                   <br /><asp:TextBox ID="CommentBox" runat="server" Style="width:44%; height:100px;" TextMode="MultiLine"></asp:TextBox> 
                 <asp:Button ID="Post" runat="server" Text="Post Comment" OnClick="Post_Click" /></div></asp:Panel>
            </div>
	    <asp:SqlDataSource ID="CommentData" runat="server" ConnectionString='<%$ ConnectionStrings:photocatconnection %>' SelectCommand="SELECT Photos.PhotoId, Comments.CmtId, Comments.CmtText, Comments.PhotoId, Comments.UserId, Comments.Date, Users.UserID, Users.Username, UserType.UserType
FROM Comments INNER JOIN Photos ON
Photos.PhotoId = Comments.PhotoId
INNER JOIN Users ON Users.UserID = Comments.UserId
INNER JOIN UserType ON UserType.typeId = Users.TypeId
WHERE Comments.PhotoId=@PhotoID">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="photoID" Name="PhotoID"></asp:QueryStringParameter>
        </SelectParameters>
    </asp:SqlDataSource>

    <div id="CommentSection">
        <br /><h3>Comments:</h3>
    <asp:ListView ID="CommentsList" runat="server" DataSourceID="CommentData" DataKeyNames="PhotoId,CmtId,UserID1">
        <EditItemTemplate>
            <span style="">PhotoId:
                <asp:Label Text='<%# Eval("PhotoId") %>' runat="server" ID="PhotoIdLabel1" /><br />
                CmtId:
                <asp:Label Text='<%# Eval("CmtId") %>' runat="server" ID="CmtIdLabel1" /><br />
                CmtText:
                <asp:TextBox Text='<%# Bind("CmtText") %>' runat="server" ID="CmtTextTextBox" /><br />
                PhotoId1:
                <asp:TextBox Text='<%# Bind("PhotoId1") %>' runat="server" ID="PhotoId1TextBox" /><br />
                UserId:
                <asp:TextBox Text='<%# Bind("UserId") %>' runat="server" ID="UserIdTextBox" /><br />
                Date:
                <asp:TextBox Text='<%# Bind("Date") %>' runat="server" ID="DateTextBox" /><br />
                UserID1:
                <asp:Label Text='<%# Eval("UserID1") %>' runat="server" ID="UserID1Label1" /><br />
                Username:
                <asp:TextBox Text='<%# Bind("Username") %>' runat="server" ID="UsernameTextBox" /><br />
                <asp:Button runat="server" CommandName="Update" Text="Update" ID="UpdateButton" /><asp:Button runat="server" CommandName="Cancel" Text="Cancel" ID="CancelButton" /><br />
                <br />
            </span>
        </EditItemTemplate>
        <EmptyDataTemplate>
            No comments yet.
        </EmptyDataTemplate>
        <InsertItemTemplate>

            <span style="">CmtText:
                <asp:TextBox Text='<%# Bind("CmtText") %>' runat="server" ID="CmtTextTextBox" /><br />
                PhotoId1:
                <asp:TextBox Text='<%# Bind("PhotoId1") %>' runat="server" ID="PhotoId1TextBox" /><br />
                UserId:
                <asp:TextBox Text='<%# Bind("UserId") %>' runat="server" ID="UserIdTextBox" /><br />
                Date:
                <asp:TextBox Text='<%# Bind("Date") %>' runat="server" ID="DateTextBox" /><br />
                Username:
                <asp:TextBox Text='<%# Bind("Username") %>' runat="server" ID="UsernameTextBox" /><br />
                <asp:Button runat="server" CommandName="Insert" Text="Insert" ID="InsertButton" /><asp:Button runat="server" CommandName="Cancel" Text="Clear" ID="CancelButton" /><br />
                <br />
            </span>
        </InsertItemTemplate>
        <ItemTemplate>
            <span style="">
                
                <div id="Comment" style="background: -webkit-gradient(linear, left top, right top, color-stop(0%,rgba(114,114,114,0.65)), color-stop(2%,rgba(58,58,58,0.64)), color-stop(100%,rgba(0,0,0,0))); margin-left:10px; padding-left:10px; padding-bottom:20px; margin-bottom:10px;">

                <asp:Label Text='<%# Eval("Username") %>' runat="server" ID="UsernameLabel" Style="font-weight:800; color:#C00000;"/>

             
                                said:
                    <asp:Label Text='<%# Eval("UserType") %>' runat="server" ID="UserTypeLabel" Style="float:right; font-size:10px; color:darkred;" /><br />

                    <br />
               <div id="comment text" style="font-size:18px;">"<asp:Label Text='<%# Eval("CmtText") %>' runat="server" ID="CmtTextLabel" />"</div>

                    <b><asp:HyperLink ID="Moderate" runat="server" NavigateUrl='<%# "adminview.aspx?cmtID=" + Eval("CmtID")  %>' Style="float:right;  font-size:13px;">Moderate</asp:HyperLink></b></div>
                     

                    </div>
            </span>
        </ItemTemplate>
        <LayoutTemplate>
            <div runat="server" id="itemPlaceholderContainer" style=""><span runat="server" id="itemPlaceholder" /></div>
            <div style="">
            </div>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <span style="">PhotoId:
                <asp:Label Text='<%# Eval("PhotoId") %>' runat="server" ID="PhotoIdLabel" /><br />
                CmtId:
                <asp:Label Text='<%# Eval("CmtId") %>' runat="server" ID="CmtIdLabel" /><br />
                CmtText:
                <asp:Label Text='<%# Eval("CmtText") %>' runat="server" ID="CmtTextLabel" /><br />
                PhotoId1:
                <asp:Label Text='<%# Eval("PhotoId1") %>' runat="server" ID="PhotoId1Label" /><br />
                UserId:
                <asp:Label Text='<%# Eval("UserId") %>' runat="server" ID="UserIdLabel" /><br />
                Date:
                <asp:Label Text='<%# Eval("Date") %>' runat="server" ID="DateLabel" /><br />
                UserID1:
                <asp:Label Text='<%# Eval("UserID1") %>' runat="server" ID="UserID1Label" /><br />
                Username:
                <asp:Label Text='<%# Eval("Username") %>' runat="server" ID="UsernameLabel" /><br />
                <br />
            </span>
        </SelectedItemTemplate>
    </asp:ListView>
        </div>

   
		
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

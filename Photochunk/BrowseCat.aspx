<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BrowseCat.aspx.cs" Inherits="_Default" %>

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
<link href="css/hawthorne_type2_color3.css" rel="stylesheet">

<link href="css/font-awesome.min.css" rel="stylesheet">
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
				<a href="Default.aspx"><img src="img/Potential logo.png" /></a>
			</div>
          
            <h2>
            </h2>
		</header>
	</div>
	<div class="small-12 medium-12 large-12 small-centered columns">
		<nav> <!-- Links -->
			<ul class="inline-list-custom">
				<li><a href="Default.aspx" class="current">Categories</a></li>
				<li><a href="browse.aspx" >Browse</a></li>
                <li><a href="login.aspx">Login</a></li>
                <!--Category links -->
                <br /><b>                <li><a href="browseCat.aspx?CatId=1">Nature</a></li>
           <li><a href="browseCat.aspx?CatId=2">Attractions</a></li>
                <li><a href="browseCat.aspx?CatId=3">Activities</a></li>
                <li><a href="browseCat.aspx?CatId=4">Tourist Spots</a></li>
                <li><a href="browseCat.aspx?CatId=5">Villages & Towns</a></li>
                <li><a href="browseCat.aspx?CatId=6">Belfast</a></li></b>
						
			</ul>
            
		</nav>
        
				
			
	</div>
</div>

<div class="row">
	<div class="small-12 medium-12 large-12 columns">
		<ul class="small-block-grid-1 medium-block-grid-3 large-block-grid-3 inline-list-custom">

            <asp:SqlDataSource ID="Catresult" runat="server" ConnectionString='<%$ ConnectionStrings:photocatconnection %>' SelectCommand="SELECT * FROM [Photos] WHERE ([CatId] = @CatId) AND Published LIKE 'Y'">
                <SelectParameters>
                    <asp:QueryStringParameter QueryStringField="CatId" Name="CatId" Type="Int32"></asp:QueryStringParameter>
                </SelectParameters>
            </asp:SqlDataSource>

            <asp:ListView ID="CatPhotoList" runat="server" DataSourceID="Catresult" DataKeyNames="PhotoId" GroupItemCount="3">
                <EditItemTemplate>
                    <td runat="server" style="">PhotoId:
                        <asp:Label Text='<%# Eval("PhotoId") %>' runat="server" ID="PhotoIdLabel1" /><br />
                        ImagePath:
                        <asp:TextBox Text='<%# Bind("ImagePath") %>' runat="server" ID="ImagePathTextBox" /><br />
                        Location:
                        <asp:TextBox Text='<%# Bind("Location") %>' runat="server" ID="LocationTextBox" /><br />
                        Published:
                        <asp:TextBox Text='<%# Bind("Published") %>' runat="server" ID="PublishedTextBox" /><br />
                        Description:
                        <asp:TextBox Text='<%# Bind("Description") %>' runat="server" ID="DescriptionTextBox" /><br />
                        Date:
                        <asp:TextBox Text='<%# Bind("Date") %>' runat="server" ID="DateTextBox" /><br />
                        Likes:
                        <asp:TextBox Text='<%# Bind("Likes") %>' runat="server" ID="LikesTextBox" /><br />
                        UserId:
                        <asp:TextBox Text='<%# Bind("UserId") %>' runat="server" ID="UserIdTextBox" /><br />
                        CatId:
                        <asp:TextBox Text='<%# Bind("CatId") %>' runat="server" ID="CatIdTextBox" /><br />
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
                        Published:
                        <asp:TextBox Text='<%# Bind("Published") %>' runat="server" ID="PublishedTextBox" /><br />
                        Description:
                        <asp:TextBox Text='<%# Bind("Description") %>' runat="server" ID="DescriptionTextBox" /><br />
                        Date:
                        <asp:TextBox Text='<%# Bind("Date") %>' runat="server" ID="DateTextBox" /><br />
                        Likes:
                        <asp:TextBox Text='<%# Bind("Likes") %>' runat="server" ID="LikesTextBox" /><br />
                        UserId:
                        <asp:TextBox Text='<%# Bind("UserId") %>' runat="server" ID="UserIdTextBox" /><br />
                        CatId:
                        <asp:TextBox Text='<%# Bind("CatId") %>' runat="server" ID="CatIdTextBox" /><br />
                        <asp:Button runat="server" CommandName="Insert" Text="Insert" ID="InsertButton" /><br />
                        <asp:Button runat="server" CommandName="Cancel" Text="Clear" ID="CancelButton" /><br />
                    </td>
                </InsertItemTemplate>
               <ItemTemplate>
                    <td runat="server" style="">
                        <asp:Image ID="listimage" runat="server" ImageUrl='<%# Eval("ImagePath") %>' Width="400px" Height="300px"  />

                        <br /><br />
                        <div class="editbutton">
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "view.aspx?photoID=" + Eval("PhotoID") +"&Likes=" + Eval("Likes")  %>'>View</asp:HyperLink>
                        </div>
                        <asp:Label Text='<%# Eval("Description") %>' runat="server" ID="DescriptionLabel" />,<br />
                        
                        <asp:Label Text='<%# Eval("Location") %>' runat="server" ID="LocationLabel" /><br />
                                                                  <asp:Label Text='<%# Eval("Likes") %>' runat="server" ID="Label1" /> Likes
                        <br />
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
                    <td runat="server" style="">PhotoId:
                        <asp:Label Text='<%# Eval("PhotoId") %>' runat="server" ID="PhotoIdLabel" /><br />
                        ImagePath:
                        <asp:Label Text='<%# Eval("ImagePath") %>' runat="server" ID="ImagePathLabel" /><br />
                        Location:
                        <asp:Label Text='<%# Eval("Location") %>' runat="server" ID="LocationLabel" /><br />
                        Published:
                        <asp:Label Text='<%# Eval("Published") %>' runat="server" ID="PublishedLabel" /><br />
                        Description:
                        <asp:Label Text='<%# Eval("Description") %>' runat="server" ID="DescriptionLabel" /><br />
                        Date:
                        <asp:Label Text='<%# Eval("Date") %>' runat="server" ID="DateLabel" /><br />
                        Likes:
                        <asp:Label Text='<%# Eval("Likes") %>' runat="server" ID="LikesLabel" /><br />
                        UserId:
                        <asp:Label Text='<%# Eval("UserId") %>' runat="server" ID="UserIdLabel" /><br />
                        CatId:
                        <asp:Label Text='<%# Eval("CatId") %>' runat="server" ID="CatIdLabel" /><br />
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

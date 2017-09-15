<%@ Page Language="C#" AutoEventWireup="true" CodeFile="upload.aspx.cs" Inherits="about" %>

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
                	<li><a href="Upload.aspx" class="current">Upload</a></li>
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

         <asp:Panel ID="UploadPanel" runat="server">
	<h3>Upload a photo</h3><p>
       
        <span>Location:
            <asp:TextBox ID="locationtext" runat="server" ToolTip="Where was the photo was taken?" style="width:70%;"></asp:TextBox>
        </span>
        <span>Description:
            <asp:TextBox ID="desctext" runat="server" style="width:70%;" TextMode="MultiLine" ToolTip="Describe the photo"></asp:TextBox>
        </span>
        <span>Category:<br />
            <asp:DropDownList ID="CatList" runat="server" style="width: 70%;" ToolTip="What category does the photo fall under?">
                <asp:ListItem>Please Select a Category</asp:ListItem>
                <asp:ListItem Value="1">Nature</asp:ListItem>
                <asp:ListItem Value="2">Attraction</asp:ListItem>
                <asp:ListItem Value="3">Activity</asp:ListItem>
                <asp:ListItem Value="4">Tourist Area</asp:ListItem>
                <asp:ListItem Value="5">Village/Town</asp:ListItem>
                <asp:ListItem Value="6">City</asp:ListItem>
            </asp:DropDownList></span>
                <span><br />Publish?<br />             <asp:DropDownList ID="PublishList" runat="server" style="width:100px;">
                <asp:ListItem Value="Y">Yes</asp:ListItem>
                <asp:ListItem Value="N">No</asp:ListItem>
            </asp:DropDownList>
        <br /></span>

    <asp:FileUpload ID="FileUpload1" runat="server" onchange="PreviewImage();" /><br /><br />
         
    <asp:Button ID="Button1" runat="server" Text="Upload photo" OnClick="Button1_Click" /><br /><br />

			</p>
             </asp:Panel>

	</div>
  <asp:Panel ID="Preview" runat="server">
      <!-- Image preview box -->
    <h3>Preview:</h3><br />
	<img id="uploadPreview" style="width: 270px; height: 250px;" />
    </asp:Panel>
<!-- Preview image script -->
<script type="text/javascript">

    function PreviewImage() {
        var oFReader = new FileReader();
        oFReader.readAsDataURL(document.getElementById("FileUpload1").files[0]);

        oFReader.onload = function (oFREvent) {
            document.getElementById("uploadPreview").src = oFREvent.target.result;
        };
    };
</script>

    <script type="text/javascript">

        function catconfirm() {
            alert('Please select a category.')
        }

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

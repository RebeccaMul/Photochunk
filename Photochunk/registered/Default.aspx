<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

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
            <div id="Searchbar" style="margin-left:33%; margin-right:33%;">
                            <br /><asp:TextBox ID="searchtitle" runat="server" Text="Search" OnClick="this.value=''"></asp:TextBox>
                <asp:Button ID="Search" runat="server" Text=" Search " style="margin-left:40%; margin-right:33%;" OnClick="Search_Click"/>
            </div>
            
		</header>
	</div>
	<div class="small-12 medium-12 large-12 small-centered columns">
		<nav> <!-- Links -->
			<ul class="inline-list-custom">
				<li><a href="Default.aspx" class="current">Categories</a></li>
				<li><a href="browse.aspx">Browse</a></li>
                <li><a href="regaccount.aspx">My Profile</a></li>	
                <li><a href="../Logout.aspx">Log out</a></li>
                
						
			</ul>
		</nav>
	</div>
</div>

           <asp:SqlDataSource ID="test" runat="server" ConnectionString='<%$ ConnectionStrings:photocatconnection %>' SelectCommand="SELECT Photos.ImagePath, Photos.Location, Photos.Likes, Category.Category FROM
Photos INNER JOIN
Category ON Photos.CatId = Category.CatId">

        </asp:SqlDataSource>
    <asp:SqlDataSource ID="connectionString" runat="server"></asp:SqlDataSource>

<div class="row">
	<div class="small-12 medium-12 large-12 columns">
		<ul class="small-block-grid-1 medium-block-grid-3 large-block-grid-3 inline-list-custom">
			
			<!-- Begin project -->
			<li>
				<div class="thumbnail">
					<div class="thumbnail-img">
						<div class="thumbnail-hover"><a href="browsecat.aspx?CatId=1"></a></div>
						<a href="browsecat.aspx?CatId=1"><img src="../img/Nature.jpg" style="height:200px;" /></a>
					</div>
					<div class="thumbnail-caption"><a class="caption-link" href="browsecat.aspx?CatId=1">Nature</a>

          
					</div>
				</div>
			</li>
			<!-- End project -->
			
			<!-- Begin project -->
			<li>
				<div class="thumbnail">
					<div class="thumbnail-img">
						<div class="thumbnail-hover"><a href="browsecat.aspx?CatId=2"></a></div>
						<a href="browsecat.aspx?CatId=2"><img src="../img/Attractions.jpg" style="height:200px;" /></a>
					</div>
					<div class="thumbnail-caption"><a class="caption-link" href="browsecat.aspx?CatId=2">Attractions</a></div>
				</div>
			</li>
			<!-- End project -->
			
			<!-- Begin project -->
			<li>
				<div class="thumbnail">
					<div class="thumbnail-img">
						<div class="thumbnail-hover"><a href="browsecat.aspx?CatId=3"></a></div>
						<a href="browsecat.aspx?CatId=3"><img src="../img/Activities.jpeg" style="height:200px;"  /></a>
					</div>
					<div class="thumbnail-caption"><a class="caption-link" href="browsecat.aspx?CatId=3">Activities</a></div>
				</div>
			</li>
			<!-- End project -->
			
			<!-- Begin project -->
			<li>
				<div class="thumbnail">
					<div class="thumbnail-img">
						<div class="thumbnail-hover"><a href="browsecat.aspx?CatId=4"></a></div>
						<a href="browsecat.aspx?CatId=4"><img src="../img/Tourist.jpg" style="height:200px;" /></a>
					</div>
					<div class="thumbnail-caption"><a class="caption-link" href="browsecat.aspx?CatId=4">Tourist Spots</a></div>
				</div>
			</li>
			<!-- End project -->
			
			<!-- Begin project -->
			<li>
				<div class="thumbnail">
					<div class="thumbnail-img">
						<div class="thumbnail-hover"><a href="browsecat.aspx?CatId=5"></a></div>
						<a href="browsecat.aspx?CatId=5"><img src="../img/Villages.jpg" style="height:200px;"  /></a>
					</div>
					<div class="thumbnail-caption"><a class="caption-link" href="browsecat.aspx?CatId=5">Villages & Towns</a></div>
				</div>
			</li>
			<!-- End project -->
			
			<!-- Begin project -->
			<li>
				<div class="thumbnail">
					<div class="thumbnail-img">
						<div class="thumbnail-hover"><a href="browsecat.aspx?CatId=6"></a></div>
						<a href="browsecat.aspx?CatId=6"><img src="../img/Belfast.jpg" style="height:200px;"  /></a>
					</div>
					<div class="thumbnail-caption"><a class="caption-link" href="browsecat.aspx?CatId=6">Belfast</a></div>
				</div>
			</li>
			<!-- End project -->
			
			
						
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

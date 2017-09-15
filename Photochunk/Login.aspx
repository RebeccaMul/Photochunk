<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

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
            
		</header>
	</div>
	<div class="small-12 medium-12 large-12 small-centered columns">
		<nav> <!-- Links -->
			<ul class="inline-list-custom">
				<li><a href="Default.aspx" >Categories</a></li>
				<li><a href="browse.aspx">Browse</a></li>
                <li><a href="login.aspx">Login</a></li>
						
			</ul>
		</nav>
	</div>
</div>

<div class="row">
	<div class="small-12 medium-12 large-12 columns">
		
        
        <div id="form" style="margin-left:33%; margin-right:33%;">
            <h3 style="margin-left:40%; margin-right:33%;">Login:</h3><br />


        <p>Username:<asp:TextBox ID="userdata" runat="server" ToolTip="Your account username" ></asp:TextBox></p>

        <p>Password:<asp:TextBox ID="passdata" runat="server" ToolTip="Your account password" TextMode="Password"></asp:TextBox></p>


        <asp:Button ID="loginbtn" runat="server" Text="Login" style="margin-left:40%; margin-right:33%;" OnClick="loginbtn_Click" />

            
            <br /><br /><asp:Label ID="failed" runat="server" Text="" Style="color:darkred;"></asp:Label>
            
        <p><br />Don't have an account? <a href="register.aspx">Sign up here</a></p></div>

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

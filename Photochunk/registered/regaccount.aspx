<%@ Page Language="C#" AutoEventWireup="true" CodeFile="regaccount.aspx.cs" Inherits="registered_manageaccount" %>

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
                <li><a href="regaccount.aspx" class="current">My Profile</a></li>				
                <li><a href="../Logout.aspx">Log out</a></li>
             		
			</ul>
		</nav>
	</div>
</div>

        <!--Main Content-->
      
        <div class="row">
            
               
                <asp:SqlDataSource ID="UserDetails" runat="server" ConnectionString='<%$ ConnectionStrings:photocatconnection %>' SelectCommand="SELECT * FROM [Users] WHERE ([UserId] = @UserId)">
                    <SelectParameters>
                        <asp:SessionParameter SessionField="id" Name="UserId" Type="Int32"></asp:SessionParameter>
                    </SelectParameters>
                </asp:SqlDataSource>

                <asp:Panel ID="DetailsPanels" runat="server">

                    <div id="help" style="background-color:darkgray; color:white; margin-left:5%; margin-right:10%; padding:5%;">
                            <h2>My Profile</h2><br />

            
                    <asp:ListView ID="Details" runat="server" DataSourceID="UserDetails" DataKeyNames="UserId">
                       
                        <EditItemTemplate>
                            <span style="">UserId:
                                <asp:Label Text='<%# Eval("UserId") %>' runat="server" ID="UserIdLabel1" /><br />
                                Username:
                                <asp:TextBox Text='<%# Bind("Username") %>' runat="server" ID="UsernameTextBox" /><br />
                                Password:
                                <asp:TextBox Text='<%# Bind("Password") %>' runat="server" ID="PasswordTextBox" /><br />
                                Email:
                                <asp:TextBox Text='<%# Bind("Email") %>' runat="server" ID="EmailTextBox" /><br />
                                TypeId:
                                <asp:TextBox Text='<%# Bind("TypeId") %>' runat="server" ID="TypeIdTextBox" /><br />
                                Forename:
                                <asp:TextBox Text='<%# Bind("Forename") %>' runat="server" ID="ForenameTextBox" /><br />
                                Surname:
                                <asp:TextBox Text='<%# Bind("Surname") %>' runat="server" ID="SurnameTextBox" /><br />
                                <asp:Button runat="server" CommandName="Update" Text="Update" ID="UpdateButton" /><asp:Button runat="server" CommandName="Cancel" Text="Cancel" ID="CancelButton" /><br />
                                <br />
                            </span>
                        </EditItemTemplate>
                        <EmptyDataTemplate>
                            <span>No data was returned.</span>
                        </EmptyDataTemplate>
                        <InsertItemTemplate>
                            <span style="">Username:
                                <asp:TextBox Text='<%# Bind("Username") %>' runat="server" ID="UsernameTextBox" /><br />
                                Password:
                                <asp:TextBox Text='<%# Bind("Password") %>' runat="server" ID="PasswordTextBox" /><br />
                                Email:
                                <asp:TextBox Text='<%# Bind("Email") %>' runat="server" ID="EmailTextBox" /><br />
                                TypeId:
                                <asp:TextBox Text='<%# Bind("TypeId") %>' runat="server" ID="TypeIdTextBox" /><br />
                                Forename:
                                <asp:TextBox Text='<%# Bind("Forename") %>' runat="server" ID="ForenameTextBox" /><br />
                                Surname:
                                <asp:TextBox Text='<%# Bind("Surname") %>' runat="server" ID="SurnameTextBox" /><br />
                                <asp:Button runat="server" CommandName="Insert" Text="Insert" ID="InsertButton" /><asp:Button runat="server" CommandName="Cancel" Text="Clear" ID="CancelButton" /><br />
                                <br />
                            </span>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <span style=""><h3>
                                <b>Username:</b>
                                <asp:Label Text='<%# Eval("Username") %>' runat="server" ID="UsernameLabel" /><br />
                                
                                Email:
                                <asp:Label Text='<%# Eval("Email") %>' runat="server" ID="EmailLabel" /><br />
                                
                                Forename:
                                <asp:Label Text='<%# Eval("Forename") %>' runat="server" ID="ForenameLabel" /><br />
                                Surname:
                                <asp:Label Text='<%# Eval("Surname") %>' runat="server" ID="SurnameLabel" /><br />
                                <br />
                            </span></h3>
                        </ItemTemplate>
                        <LayoutTemplate>
                            <div runat="server" id="itemPlaceholderContainer" style=""><span runat="server" id="itemPlaceholder" /></div>
                            <div style="">
                            </div>
                        </LayoutTemplate>
                        <SelectedItemTemplate>
                            <span style="">UserId:
                                <asp:Label Text='<%# Eval("UserId") %>' runat="server" ID="UserIdLabel" /><br />
                                Username:
                                <asp:Label Text='<%# Eval("Username") %>' runat="server" ID="UsernameLabel" /><br />
                                Password:
                                <asp:Label Text='<%# Eval("Password") %>' runat="server" ID="PasswordLabel" /><br />
                                Email:
                                <asp:Label Text='<%# Eval("Email") %>' runat="server" ID="EmailLabel" /><br />
                                TypeId:
                                <asp:Label Text='<%# Eval("TypeId") %>' runat="server" ID="TypeIdLabel" /><br />
                                Forename:
                                <asp:Label Text='<%# Eval("Forename") %>' runat="server" ID="ForenameLabel" /><br />
                                Surname:
                                <asp:Label Text='<%# Eval("Surname") %>' runat="server" ID="SurnameLabel" /><br />
                                <br />
                            </span>
                        </SelectedItemTemplate>
                    </asp:ListView>
                       
                        <asp:Button ID="ChangeDet" runat="server" Text="Change Account Details" OnClick="ChangeDet_Click" />
                         </div>

                    

                </asp:Panel>

                <asp:Panel ID="UpdateDetails" runat="server" >

                    <div id="update" style="background-color:darkgray; color:white; margin-left:5%; margin-right:10%; padding:5%;">
                            <h2>My Profile</h2><br />
                        Forename:<br />
            <asp:TextBox ID="fnameedit" runat="server" ToolTip="Your first name." ></asp:TextBox><br>

                        Surname:<br />
            <asp:TextBox ID="snameedit" runat="server" ToolTip="Your second name." ></asp:TextBox><br>

                         Email:<br />
            <asp:TextBox ID="emailedit" runat="server" ToolTip="Your email address" ></asp:TextBox><br>

                         Password:<br />
            <asp:TextBox ID="passedit" runat="server" ToolTip="Your second name." ></asp:TextBox><br>

                    <asp:Button ID="Update" runat="server" Text="Save Changes" OnClick="Update_Click" />
                        </div>
                </asp:Panel>

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

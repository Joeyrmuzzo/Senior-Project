<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Main.aspx.cs" Inherits="Main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: justify;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="auto-style1">
    
        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/Logo.png" PostBackUrl="~/Main.aspx" />
        &nbsp;
        <asp:ImageButton ID="btnLogout" runat="server" Height="53px" ImageAlign="Top" ImageUrl="~/images/LogOut.png" Visible="False" Width="171px" OnClick="btnLogout_Click" PostBackUrl="~/LogIn.aspx" />
        <asp:ImageButton ID="btnLogin" runat="server" Height="59px" ImageAlign="Top" ImageUrl="~/images/LogIn.png" PostBackUrl="~/LogIn.aspx" Visible="False" Width="157px" OnClick="btnLogin_Click" />
        <br />
        <br />
        <asp:ImageButton ID="btnViewCatalog" runat="server" ImageUrl="~/images/Catalog.png" PostBackUrl="~/Catalog.aspx" Width="195px" Height="55px" />
    
    &nbsp;&nbsp;
        <br />
        <asp:ImageButton ID="btnPlaceOrder" runat="server" ImageUrl="~/images/PlaceOrder.png" Width="197px" PostBackUrl="~/PlaceOrder.aspx" />
    
        <br />
    
    &nbsp;
    
        <br />
        <asp:ImageButton ID="btnMyAccount" runat="server" Height="56px" ImageUrl="~/images/MyAccount.png" PostBackUrl="~/MyAccount.aspx" Width="197px" />
    
        <br />
    
        &nbsp;<br />
        <asp:ImageButton ID="btnOrderInfo" runat="server" ImageUrl="~/images/OrderInformation.png" PostBackUrl="~/OrderInformation.aspx" Width="183px" />
    
        <br />
        <br />
    
        <asp:ImageButton ID="btnCreateUser" runat="server" ImageUrl="~/images/CreateUser.png" Width="182px" Height="37px" PostBackUrl="~/CreateUser.aspx" />
    
        <br />
        <br />
    
        <br />
    
    &nbsp;&nbsp;&nbsp;
            
    </div>
    </form>
</body>
</html>

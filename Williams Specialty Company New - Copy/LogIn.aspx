<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LogIn.aspx.cs" Inherits="Catalog" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align: left; background-color: #FFFFFF">
    
        <asp:ImageButton ID="btnLogo" runat="server" ImageUrl="~/images/Logo.png" PostBackUrl="~/LogIn.aspx" />
    
        <br />
        &nbsp;<asp:Login ID="Login1" runat="server" BackColor="#FFFBD6" BorderColor="#FFDFAD" BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" DestinationPageUrl="~/Main.aspx" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#333333" Height="152px" OnAuthenticate="Login1_Authenticate" TextLayout="TextOnTop" Width="217px">
            <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
            <LoginButtonStyle BackColor="White" BorderColor="#CC9966" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#990000" />
            <TextBoxStyle Font-Size="0.8em" />
            <TitleTextStyle BackColor="#990000" Font-Bold="True" Font-Size="0.9em" ForeColor="White" />
        </asp:Login>
        <asp:Label ID="lblStatus" runat="server"></asp:Label>
        <br />
        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/CreateUser.png" PostBackUrl="~/CreateUser.aspx" Width="226px" />
        <br />
        
    
    </div>
    </form>
</body>
</html>

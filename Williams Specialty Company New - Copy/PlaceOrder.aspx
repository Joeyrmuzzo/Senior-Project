<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PlaceOrder.aspx.cs" Inherits="PlaceOrder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/Logo.png" PostBackUrl="~/Main.aspx" />
    
        <br />
        <asp:Label ID="Label1" runat="server" Text="This is the PlaceOrder page"></asp:Label>
    
        <br />
        <br />
&nbsp;<br />
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [EFName], [ELName], [EmployeeID] FROM [Employee]"></asp:SqlDataSource>
        <br />
        <asp:Label ID="Label2" runat="server" Text="Product ID:"></asp:Label>
&nbsp;
        <asp:DropDownList ID="drpProductID" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" DataSourceID="SqlDataSource1" DataTextField="ProdName" DataValueField="ProdID">
            <asp:ListItem Value="1"></asp:ListItem>
            <asp:ListItem Value="2"></asp:ListItem>
            <asp:ListItem Value="3"></asp:ListItem>
        </asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [ProdName], [ProdID] FROM [Product]"></asp:SqlDataSource>
        <br />
        <br />
        <asp:CheckBox ID="chkPoD" runat="server" Text="Pay on Delivery?" />
        <br />
        <br />
        <asp:Label ID="Label4" runat="server" Text="Quantity:"></asp:Label>
&nbsp;
        <asp:TextBox ID="txtQuantity" runat="server" Width="34px"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text="Message to be printed or engraved:"></asp:Label>
&nbsp;
        <asp:TextBox ID="txtMessage" runat="server"></asp:TextBox>
        &nbsp;<br />
        <br />
        Sales Person:&nbsp; <asp:DropDownList ID="drpEmployeeID" runat="server" DataSourceID="SqlDataSource4" DataTextField="EFName" DataValueField="EmployeeID">
        </asp:DropDownList>
        <br />
        <asp:Label ID="lblDisplayOrder" runat="server" ForeColor="Red"></asp:Label>
&nbsp;
        <asp:Label ID="lblOrderSuccess" runat="server"></asp:Label>
        <br />
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:ImageButton ID="btnPlaceOrder" runat="server" Height="64px" ImageUrl="~/images/PlaceOrder.png" Width="175px" OnClick="btnPlaceOrder_Click" />
        <br />
&nbsp;
    
    </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CreateUser.aspx.cs" Inherits="CreateUser" %>

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
        <asp:Label ID="lblCreateUserForm" runat="server" Text="This is the Create User form"></asp:Label>
        <br />
        <br />
        <asp:Label ID="lblUserName" runat="server" Text="Username"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblAddress" runat="server" Text="Address:"></asp:Label>
&nbsp;
        <asp:TextBox ID="txtAddressLine" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblStateCode" runat="server" Text="State:"></asp:Label>
&nbsp;
        <asp:TextBox ID="txtStateCode" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblCFName" runat="server" Text="First Name:"></asp:Label>
&nbsp;
        <asp:TextBox ID="txtCFName" runat="server"></asp:TextBox>
&nbsp;&nbsp;
        <asp:Label ID="lblCCNum" runat="server" Text="Credit Card Number:"></asp:Label>
&nbsp;
        <asp:TextBox ID="txtCCNum" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblCCPin" runat="server" Text="Credit Card Pin:"></asp:Label>
&nbsp;
        <asp:TextBox ID="txtCCPin" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblCity" runat="server" Text="City:"></asp:Label>
&nbsp;
        <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblPostalCode" runat="server" Text="Zip Code:"></asp:Label>
&nbsp;
        <asp:TextBox ID="txtPostalCode" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label5" runat="server" Text="Last Name:"></asp:Label>
&nbsp;
        <asp:TextBox ID="txtCLName" runat="server"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblCCExp" runat="server" Text="Expiration Date:"></asp:Label>
&nbsp;
        <asp:TextBox ID="txtCCExp" runat="server"></asp:TextBox>
&nbsp;&nbsp;
        <asp:Label ID="Label6" runat="server" Text="Credit Card  Type:"></asp:Label>
&nbsp;<asp:TextBox ID="txtCCType" runat="server"></asp:TextBox>
        <br />
        <br />
&nbsp;
        <asp:Label ID="lblSecurityLevel" runat="server" Text="Security Level" Visible="False"></asp:Label>
&nbsp;&nbsp;
        <asp:DropDownList ID="drpSecurityLevel" runat="server" Width="28px" Visible="False">
            <asp:ListItem>C</asp:ListItem>
            <asp:ListItem>S</asp:ListItem>
            <asp:ListItem>O</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Create User" />
&nbsp;
        <asp:Label ID="lblDisplay" runat="server" ForeColor="Red"></asp:Label>
        <asp:Label ID="lblDisplaySuccess" runat="server"></asp:Label>
        <br />
        <br />
        <asp:GridView ID="grdUsers" runat="server" AutoGenerateColumns="False" DataKeyNames="UserID" DataSourceID="SqlDataSource1" Visible="False" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="UserID" HeaderText="UserID" InsertVisible="False" ReadOnly="True" SortExpression="UserID" />
                <asp:BoundField DataField="UserLogon" HeaderText="UserLogon" SortExpression="UserLogon" />
                <asp:BoundField DataField="UserPassword" HeaderText="UserPassword" SortExpression="UserPassword" />
                <asp:BoundField DataField="UserSecLevel" HeaderText="UserSecLevel" SortExpression="UserSecLevel" />
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Users] WHERE [UserID] = ?" InsertCommand="INSERT INTO [Users] ([UserID], [UserLogon], [UserPassword], [UserSecLevel]) VALUES (?, ?, ?, ?)" OldValuesParameterFormatString="original_{0}" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Users]" UpdateCommand="UPDATE [Users] SET [UserLogon] = ?, [UserPassword] = ?, [UserSecLevel] = ? WHERE [UserID] = ?">
            <DeleteParameters>
                <asp:Parameter Name="original_UserID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="UserID" Type="Int32" />
                <asp:Parameter Name="UserLogon" Type="String" />
                <asp:Parameter Name="UserPassword" Type="String" />
                <asp:Parameter Name="UserSecLevel" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="UserLogon" Type="String" />
                <asp:Parameter Name="UserPassword" Type="String" />
                <asp:Parameter Name="UserSecLevel" Type="String" />
                <asp:Parameter Name="original_UserID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>

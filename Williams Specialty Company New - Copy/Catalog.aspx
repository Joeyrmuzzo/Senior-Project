<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Catalog.aspx.cs" Inherits="Catalog" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align: left; background-color: #FFFFFF">
    
        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/images/Logo.png" PostBackUrl="~/Main.aspx" />
    
        <br />
        <asp:Label ID="lblCatalog" runat="server" Text="This is the Catalog page"></asp:Label>
    
        <asp:GridView ID="grdCatalogCustomer" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ProdID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:ImageField DataImageUrlField="ProdImage" DataImageUrlFormatString="~\Images\{0}">
                    <ControlStyle Height="100px" Width="75px" />
                </asp:ImageField>
                <asp:BoundField DataField="ProdID" HeaderText="ProdID" InsertVisible="False" ReadOnly="True" SortExpression="ProdID" />
                <asp:BoundField DataField="ProdName" HeaderText="ProdName" SortExpression="ProdName" />
                <asp:BoundField DataField="ProdDescription" HeaderText="ProdDescription" SortExpression="ProdDescription" />
                <asp:BoundField DataField="JobType" HeaderText="JobType" SortExpression="JobType" />
                <asp:BoundField DataField="MediaType" HeaderText="MediaType" SortExpression="MediaType" />
                <asp:BoundField DataField="ListPrice" HeaderText="ListPrice" SortExpression="ListPrice" DataFormatString="{0:c}" />
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
    
        <br />
        &nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblProductName" runat="server" Text="Product Name:" Visible="False"></asp:Label>
&nbsp;&nbsp;
        <asp:TextBox ID="txtProductName" runat="server" Visible="False"></asp:TextBox>
        <br />
        <br />
&nbsp;
        <asp:Label ID="lblProductDescription" runat="server" Text="Product Description:" Visible="False"></asp:Label>
&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtProductDescription" runat="server" Visible="False"></asp:TextBox>
        <br />
&nbsp;&nbsp;&nbsp;
        <br />
&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblJobType" runat="server" Text="Job Type:" Visible="False"></asp:Label>
&nbsp;&nbsp;
        <asp:DropDownList ID="drpJobType" runat="server" Visible="False">
            <asp:ListItem>Engraved</asp:ListItem>
            <asp:ListItem>Print</asp:ListItem>
        </asp:DropDownList>
        <br />
&nbsp;&nbsp;&nbsp;
        <br />
        &nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblMediaType" runat="server" Text="Media Type:" Visible="False"></asp:Label>
&nbsp;
        <asp:DropDownList ID="drpMediaType" runat="server" Visible="False">
            <asp:ListItem>Clothing</asp:ListItem>
            <asp:ListItem>Plaque</asp:ListItem>
            <asp:ListItem>Trophy</asp:ListItem>
        </asp:DropDownList>
        <br />
        <br />
&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblListPrice" runat="server" Text="List Price: " Visible="False"></asp:Label>
&nbsp;
        <asp:TextBox ID="txtListPrice" runat="server" Visible="False"></asp:TextBox>
        <br />
        <br />
        <br />
        <asp:ImageButton ID="btnUpdateCatalog" runat="server" Height="61px" ImageUrl="~/images/UpdateCatalog.png" OnClick="ImageButton2_Click" Visible="False" Width="179px" />
        <br />
        <br />
&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblDisplayCatalog" runat="server" ForeColor="Red"></asp:Label>
&nbsp;<asp:Label ID="lblUpdateCatalogSuccess" runat="server"></asp:Label>
        <br />
        <asp:GridView ID="grdCatalog" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="ProdID" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="grdCatalog_SelectedIndexChanged" Visible="False">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:ImageField DataImageUrlField="ProdImage" DataImageUrlFormatString="~\Images\{0}">
                    <ControlStyle Height="100px" Width="75px" />
                </asp:ImageField>
                <asp:BoundField DataField="ProdID" HeaderText="ProdID" InsertVisible="False" ReadOnly="True" SortExpression="ProdID" />
                <asp:BoundField DataField="ProdName" HeaderText="ProdName" SortExpression="ProdName" />
                <asp:BoundField DataField="ProdDescription" HeaderText="ProdDescription" SortExpression="ProdDescription" />
                <asp:BoundField DataField="JobType" HeaderText="JobType" SortExpression="JobType" />
                <asp:BoundField DataField="MediaType" HeaderText="MediaType" SortExpression="MediaType" />
                <asp:BoundField DataField="ListPrice" HeaderText="ListPrice" SortExpression="ListPrice" DataFormatString="{0:c}" />
                <asp:CommandField ShowEditButton="True" />
                <asp:CommandField ShowDeleteButton="True" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Product] WHERE [ProdID] = ?" InsertCommand="INSERT INTO [Product] ([ProdID], [ProdName], [ProdDescription], [ProdImage], [JobType], [MediaType], [ListPrice]) VALUES (?, ?, ?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Product]" UpdateCommand="UPDATE [Product] SET [ProdName] = ?, [ProdDescription] = ?, [ProdImage] = ?, [JobType] = ?, [MediaType] = ?, [ListPrice] = ? WHERE [ProdID] = ?">
            <DeleteParameters>
                <asp:Parameter Name="ProdID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="ProdID" Type="Int32" />
                <asp:Parameter Name="ProdName" Type="String" />
                <asp:Parameter Name="ProdDescription" Type="String" />
                <asp:Parameter Name="ProdImage" Type="String" />
                <asp:Parameter Name="JobType" Type="String" />
                <asp:Parameter Name="MediaType" Type="String" />
                <asp:Parameter Name="ListPrice" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="ProdName" Type="String" />
                <asp:Parameter Name="ProdDescription" Type="String" />
                <asp:Parameter Name="ProdImage" Type="String" />
                <asp:Parameter Name="JobType" Type="String" />
                <asp:Parameter Name="MediaType" Type="String" />
                <asp:Parameter Name="ListPrice" Type="Int32" />
                <asp:Parameter Name="ProdID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
    
    </div>
    </form>
</body>
</html>

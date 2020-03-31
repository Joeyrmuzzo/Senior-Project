<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MyAccount.aspx.cs" Inherits="MyAccount" %>

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
        <asp:Label ID="Label1" runat="server" Text="This is the MyAccount page"></asp:Label>
    
        <br />
        <br />
    
        <br />
        <br />
        <asp:GridView ID="grdCustomer" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" DataKeyNames="CustID" style="margin-top: 0px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="CustID" HeaderText="CustID" SortExpression="CustID" InsertVisible="False" ReadOnly="True" />
                <asp:BoundField DataField="CFName" HeaderText="CFName" SortExpression="CFName" />
                <asp:BoundField DataField="CLName" HeaderText="CLName" SortExpression="CLName" />
                <asp:BoundField DataField="CCNum" HeaderText="CCNum" SortExpression="CCNum" />
                <asp:BoundField DataField="CCExp" HeaderText="CCExp" SortExpression="CCExp" />
                <asp:BoundField DataField="CCPin" HeaderText="CCPin" SortExpression="CCPin" />
                <asp:BoundField DataField="CCType" HeaderText="CCType" SortExpression="CCType" />
                <asp:BoundField DataField="AddressID" HeaderText="AddressID" SortExpression="AddressID" ReadOnly="True" />
                <asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" ReadOnly="True" />
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
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Customer] WHERE [CustID] = ?" DeleteCommand="DELETE FROM Customer WHERE (CustID = ?)" InsertCommand="INSERT INTO [Customer] ([CFName],[CLName], [CCNum], [CCExp], [CCPin], [CCType]) VALUES (?, ?, ?, ?,?,?)" UpdateCommand="UPDATE [Customer] SET [CFName] = ?, [CLName] = ?, [CCNum] = ?, [CCExp] = ?, [CCPin] = ?, [CCType] = ? WHERE [CustID] = ?" OnSelecting="SqlDataSource1_Selecting">
            <DeleteParameters>
                <asp:Parameter Name="CustID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="CustID" Type="Int32" />
                <asp:Parameter Name="CFName" Type="String" />
                <asp:Parameter Name="CLName" Type="String" />
                <asp:Parameter Name="CCNum" Type="String" />
                <asp:Parameter Name="CCExp" Type="String" />
                <asp:Parameter Name="CCPin" Type="String" />
                <asp:Parameter Name="CCType" Type="String" />
                <asp:Parameter Name="AddressID" Type="Int32" />
                <asp:Parameter Name="UserID" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="?" SessionField="CustID" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="CFName" Type="String" />
                <asp:Parameter Name="CLName" Type="String" />
                <asp:Parameter Name="CCNum" Type="String" />
                <asp:Parameter Name="CCExp" Type="String" />
                <asp:Parameter Name="CCPin" Type="String" />
                <asp:Parameter Name="CCType" Type="String" />
                
                <asp:Parameter Name="CustID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
        <br />
    
    &nbsp;&nbsp;&nbsp;
    
        <asp:GridView ID="grdAddress" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="AddressID" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="AddressID" HeaderText="AddressID" InsertVisible="False" ReadOnly="True" SortExpression="AddressID" />
                <asp:BoundField DataField="AddressLine1" HeaderText="AddressLine1" SortExpression="AddressLine1" />
                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                <asp:BoundField DataField="StateCode" HeaderText="StateCode" SortExpression="StateCode" />
                <asp:BoundField DataField="PostalCode" HeaderText="PostalCode" SortExpression="PostalCode" />
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
        <br />
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Address] WHERE [AddressID] = ?" InsertCommand="INSERT INTO [Address] ([AddressID], [AddressLine1], [AddressLine2], [City], [StateCode], [PostalCode]) VALUES (?, ?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Address] WHERE [AddressID] = ?" UpdateCommand="UPDATE [Address] SET [AddressLine1] = ?, [AddressLine2] = ?, [City] = ?, [StateCode] = ?, [PostalCode] = ? WHERE [AddressID] = ?">
            <DeleteParameters>
                <asp:Parameter Name="AddressID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="AddressID" Type="Int32" />
                <asp:Parameter Name="AddressLine1" Type="String" />
                <asp:Parameter Name="AddressLine2" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="StateCode" Type="String" />
                <asp:Parameter Name="PostalCode" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="?" SessionField="AddressID" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="AddressLine1" Type="String" />
                <asp:Parameter Name="AddressLine2" Type="String" />
                <asp:Parameter Name="City" Type="String" />
                <asp:Parameter Name="StateCode" Type="String" />
                <asp:Parameter Name="PostalCode" Type="String" />
                <asp:Parameter Name="AddressID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
        <br />
        <br />
        <asp:GridView ID="grdOrders" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="OrderID,OrderDetailID" DataSourceID="SqlDataSource3" OnSelectedIndexChanged="grdOrders_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="OrderID" HeaderText="OrderID" ReadOnly="True" SortExpression="OrderID" />
                <asp:BoundField DataField="OrderDetailID" HeaderText="OrderDetailID" InsertVisible="False" ReadOnly="True" SortExpression="OrderDetailID" />
                <asp:BoundField DataField="OrderQty" HeaderText="OrderQty" InsertVisible="False" ReadOnly ="True" SortExpression="OrderQty" />
                <asp:BoundField DataField="ProdID" HeaderText="ProdID" InsertVisible="False" ReadOnly ="True" SortExpression="ProdID"  />
                <asp:BoundField DataField="Message" HeaderText="Message" SortExpression="Message" />
                <asp:BoundField DataField="ProdTotal" DataFormatString="{0:c}" HeaderText="ProdTotal" ReadOnly ="True" SortExpression="ProdTotal" InsertVisible="False"  />
                <asp:BoundField DataField="CustID" HeaderText="CustID" ReadOnly ="True" SortExpression="CustID" InsertVisible="False" />
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
    
        <br />
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [PurchaseOrderDetail] WHERE [OrderID] = ? AND [OrderDetailID] = ?" InsertCommand="INSERT INTO [PurchaseOrderDetail] ([OrderID], [OrderDetailID], [OrderQty], [ProdID], [Message], [ProdTotal]) VALUES (?, ?, ?, ?, ?, ?)" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT OrderID, OrderDetailID, OrderQty, ProdID, Message, ProdTotal, CustID FROM PurchaseOrderDetail WHERE (CustID = ?)" UpdateCommand="UPDATE PurchaseOrderDetail SET Message = ? WHERE (OrderID = ?) AND (OrderDetailID = ?)">
            <DeleteParameters>
                <asp:Parameter Name="OrderID" Type="Int32" />
                <asp:Parameter Name="OrderDetailID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="OrderID" Type="Int32" />
                <asp:Parameter Name="OrderDetailID" Type="Int32" />
                <asp:Parameter Name="OrderQty" Type="Int32" />
                <asp:Parameter Name="ProdID" Type="Int32" />
                <asp:Parameter Name="Message" Type="String" />
                <asp:Parameter Name="ProdTotal" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="?" SessionField="CustID" />
            </SelectParameters>
            <UpdateParameters> 
                
                <asp:Parameter Name="Message" Type="String" />
            
            </UpdateParameters>
        </asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>

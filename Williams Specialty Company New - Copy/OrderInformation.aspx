<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrderInformation.aspx.cs" Inherits="OrderInformation" %>

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
        <asp:Label ID="lblOrderInformation" runat="server" Text="This is the OrderInformation page for operations managers and sales staff"></asp:Label>
    
        <br />
    
        <br />
        <asp:Label ID="lblOrderRequestInfo" runat="server" Text="Order Request Information"></asp:Label>
        <br />
        <asp:GridView ID="grdOrderInformation" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" DataKeyNames ="SalesOrderForm.OrderID">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="SalesOrderID" HeaderText="SalesOrderID" InsertVisible="False" SortExpression="SalesOrderID" ReadOnly="True" />
                <asp:BoundField DataField="PaidAmt" HeaderText="PaidAmt" SortExpression="PaidAmt" DataFormatString="{0:C}" ReadOnly="True" />
                <asp:BoundField DataField="RemainingAmt" HeaderText="RemainingAmt" SortExpression="RemainingAmt" DataFormatString="{0:C}" ReadOnly="True" />
                <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" SortExpression="EmployeeID" ReadOnly="True" />
                <asp:BoundField DataField="SalesOrderForm.OrderID" HeaderText="SalesOrderForm.OrderID" SortExpression="SalesOrderForm.OrderID" ReadOnly="True" />
                <asp:BoundField DataField="ProdID" HeaderText="ProdID" SortExpression="ProdID" ReadOnly="True" />
                <asp:BoundField DataField="OrderQty" HeaderText="OrderQty" SortExpression="OrderQty" ReadOnly="True" />
                <asp:BoundField DataField="Message" HeaderText="Message" SortExpression="Message" ReadOnly="True" />
                <asp:BoundField DataField="Customer.CustID" HeaderText="Customer.CustID" InsertVisible="False" SortExpression="Customer.CustID" ReadOnly="True" />
                <asp:BoundField DataField="CFName" HeaderText="CFName" SortExpression="CFName" ReadOnly="True" />
                <asp:BoundField DataField="CLName" HeaderText="CLName" SortExpression="CLName" ReadOnly="True" />
                <asp:CheckBoxField DataField="PayOnDel" HeaderText="PayOnDel" SortExpression="PayOnDel" ReadOnly="True" />
                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                <asp:BoundField DataField="OrderDate" HeaderText="OrderDate" SortExpression="OrderDate" ReadOnly="True" />
                <asp:CommandField ShowEditButton="True"  />
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
            
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
            SelectCommand="SELECT SalesOrderForm.*, PurchaseOrderDetail.*, Customer.*, Users.*, PurchaseOrderForm.* FROM ((((SalesOrderForm INNER JOIN PurchaseOrderForm ON SalesOrderForm.OrderID = PurchaseOrderForm.OrderID) INNER JOIN PurchaseOrderDetail ON PurchaseOrderForm.OrderID = PurchaseOrderDetail.OrderID) INNER JOIN Customer ON SalesOrderForm.CustID = Customer.CustID AND PurchaseOrderForm.CustID = Customer.CustID) INNER JOIN Users ON Customer.UserID = Users.UserID) WHERE PurchaseOrderForm.Status = 'Not Validated'" 
            UpdateCommand="UPDATE [PurchaseOrderForm] SET [Status] = @Status WHERE [OrderID] = @SalesOrderForm.OrderID" 
            OnUpdated="SqlDataSource1_Updated">
            <UpdateParameters>
                <asp:Parameter Name="Status" Type="String" />
                <asp:Parameter Name="SalesOrderForm.OrderID" Type="Int16" />                
            </UpdateParameters>
        </asp:SqlDataSource>
        
        <asp:Label ID="lblPurchaseOrderInfo" runat="server" Text="Purchase Order Information"></asp:Label>
        
        <br />
        <asp:GridView ID="grdValidated" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="SalesOrderID" HeaderText="SalesOrderID" InsertVisible="False" SortExpression="SalesOrderID" />
                <asp:BoundField DataField="PaidAmt" HeaderText="PaidAmt" SortExpression="PaidAmt" />
                <asp:BoundField DataField="RemainingAmt" HeaderText="RemainingAmt" SortExpression="RemainingAmt" />
                <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" SortExpression="EmployeeID" />
                <asp:BoundField DataField="SalesOrderForm.CustID" HeaderText="SalesOrderForm.CustID" SortExpression="SalesOrderForm.CustID" Visible="False" />
                <asp:BoundField DataField="SalesOrderForm.OrderID" HeaderText="SalesOrderForm.OrderID" SortExpression="SalesOrderForm.OrderID" />
                <asp:BoundField DataField="PurchaseOrderDetail.OrderID" HeaderText="PurchaseOrderDetail.OrderID" SortExpression="PurchaseOrderDetail.OrderID" Visible="False" />
                <asp:BoundField DataField="OrderDetailID" HeaderText="OrderDetailID" InsertVisible="False" SortExpression="OrderDetailID" Visible="False" />
                <asp:BoundField DataField="OrderQty" HeaderText="OrderQty" SortExpression="OrderQty" />
                <asp:BoundField DataField="ProdID" HeaderText="ProdID" SortExpression="ProdID" />
                <asp:BoundField DataField="Message" HeaderText="Message" SortExpression="Message" />
                <asp:BoundField DataField="ProdTotal" HeaderText="ProdTotal" SortExpression="ProdTotal" Visible="False" />
                <asp:BoundField DataField="PurchaseOrderDetail.CustID" HeaderText="PurchaseOrderDetail.CustID" SortExpression="PurchaseOrderDetail.CustID" Visible="False" />
                <asp:BoundField DataField="Customer.CustID" HeaderText="Customer.CustID" InsertVisible="False" SortExpression="Customer.CustID" />
                <asp:BoundField DataField="CFName" HeaderText="CFName" SortExpression="CFName" />
                <asp:BoundField DataField="CLName" HeaderText="CLName" SortExpression="CLName" />
                <asp:BoundField DataField="CCNum" HeaderText="CCNum" SortExpression="CCNum" Visible="False" />
                <asp:BoundField DataField="CCExp" HeaderText="CCExp" SortExpression="CCExp" Visible="False" />
                <asp:BoundField DataField="CCPin" HeaderText="CCPin" SortExpression="CCPin" Visible="False" />
                <asp:BoundField DataField="CCType" HeaderText="CCType" SortExpression="CCType" Visible="False" />
                <asp:BoundField DataField="AddressID" HeaderText="AddressID" SortExpression="AddressID" Visible="False" />
                <asp:BoundField DataField="Customer.UserID" HeaderText="Customer.UserID" SortExpression="Customer.UserID" Visible="False" />
                <asp:BoundField DataField="Users.UserID" HeaderText="Users.UserID" InsertVisible="False" SortExpression="Users.UserID" Visible="False" />
                <asp:BoundField DataField="UserLogon" HeaderText="UserLogon" SortExpression="UserLogon" Visible="False" />
                <asp:BoundField DataField="UserPassword" HeaderText="UserPassword" SortExpression="UserPassword" Visible="False" />
                <asp:BoundField DataField="UserSecLevel" HeaderText="UserSecLevel" SortExpression="UserSecLevel" Visible="False" />
                <asp:BoundField DataField="PurchaseOrderForm.OrderID" HeaderText="PurchaseOrderForm.OrderID" InsertVisible="False" SortExpression="PurchaseOrderForm.OrderID" Visible="False" />
                <asp:CheckBoxField DataField="PayOnDel" HeaderText="PayOnDel" SortExpression="PayOnDel" />
                <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                <asp:BoundField DataField="OrderDate" HeaderText="OrderDate" SortExpression="OrderDate" />
                <asp:BoundField DataField="TotalDue" HeaderText="TotalDue" SortExpression="TotalDue" Visible="False" />
                <asp:BoundField DataField="PurchaseOrderForm.CustID" HeaderText="PurchaseOrderForm.CustID" SortExpression="PurchaseOrderForm.CustID" Visible="False" />
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
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT SalesOrderForm.*, PurchaseOrderDetail.*, Customer.*, Users.*, PurchaseOrderForm.* FROM ((((SalesOrderForm INNER JOIN PurchaseOrderForm ON SalesOrderForm.OrderID = PurchaseOrderForm.OrderID) INNER JOIN PurchaseOrderDetail ON PurchaseOrderForm.OrderID = PurchaseOrderDetail.OrderID) INNER JOIN Customer ON SalesOrderForm.CustID = Customer.CustID AND PurchaseOrderForm.CustID = Customer.CustID) INNER JOIN Users ON Customer.UserID = Users.UserID) WHERE PurchaseOrderForm.Status &lt;&gt; 'Not Validated'"></asp:SqlDataSource>
        
    </div>
    </form>
</body>
</html>

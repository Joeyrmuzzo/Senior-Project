using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.OleDb;
using System.Net;
using System.Data;
using System.Configuration;

/*--------------------------------------------
Program name: Williams Specialty Company (WSC)
eCommerce Web Site
Developer: Joey Muzzo, Dianel Crowder
Date Written: November 5, 2019

    CHANGE LOG.
11/5/2019 Started project. added webforms. added navigation via image and link buttons - Joey Muzzo

11/6/2019 Added Log In and Log out buttons.  Added Log In web form.  Login button visible by defaut
          Log out button not visible by default.  Program will handle this when loaded.
		  When you click the log in button, it should take you to either the My Account page if secLvl 
		  is low, else it takes you to Order info page - Daniel Crowder

11/11/2019 added image and link buttons for clothing, plaque engraving, and trophy's on catalog webform - not sure if this is the design we want or just temporary idea - Joey Muzzo 
11/11/2019 added microsoft access database file named Group4DB. Added a data set named dsCustomers. -Joey Muzzo

11/14/2019 added ability to create, edit, and delete a user. - Joey Muzzo

11/18/2019 added VerifyUser class for login - Joey Muzzo

11/19/2019 added GetAddressInfo class to retireve customer address information for the MyAccount webform - Joey Muzzo
11/19/2019 added session states for user validation - Joey Muzzo
11/19/2019 added switch statement SecurityLevel with FormsAuthentication and cases for user security levels - Joey Muzzo
11/19/2019 added dsCustomerInfo for user authentication - Joey Muzzo

11/20/2019 added session UserNameID session state to track users - Joey Muzzo

11/21/2019 added if statement to hide grdUsers, drop down security level, and security label unless user security level == "O" so customers cant edits users - Joey Muzzo
11/21/2019 added if statement to redirect user to Login if they select PlaceOrder on Main and are not signed in - Joey Muzzo
11/21/2019 added if statement to redirect user to Login if they select MyAccount on Main and are not signed in - Joey Muzzo
11/21/2019 added grdCatalog to Catalog webform to display product catalog - Joey Muzzo

11/23/2019 added labels and textboxes to accept customer and address information on CreateUser webform - Joey Muzzo
11/23/2019 added grdOrders to MyAccount webfrom to display customers oders - Joey Muzzo
11/23/2019 updated SaveUser class to accept new customers - Joey Muzzo, Daniel Crowder

11/26/2019 added textbox validation for CreateUser webfrom - Joey Muzzo
11/26/2019 added dsOrders dataset with PurchaseOrderDetail and PurchaseOrderForm tables. they are connected using the OrderID key - Joey Muzzo
11/26/2019 updated grdCatalog and added SQL datasource to create connection to Product table. - Joey Muzzo
11/26/2019 added lblDisplaySuccess to display the create user success message in black font - Joey Muzzo
11/26/2019 added login case statement S for salepersons - Joey Muzzo

11/27/2019 added SaveOrder function to save a cutsomers orders - Joey Muzzo
11/27/2019 added catch exception to Catalog.cs page to catch errors - Joey Muzzo

11/29/2019 added CalculateTotal to calculate the customers order total - Joey Muzzo

11/30/2019 added UpdateCatalog function that allows operations managers to update the product catalog - Joey Muzzo
11/30/2019 added SecurityLevel if statement that sets visibility of lables and text boxes to visible if the security level is equal to operations manager - Joey Muzzo
11/30/2019 added input validation for UpdateCatalog. Makes sure all input fields are entered correctly. - Joey Muzzo

12/4/2019 updated the update statement for grdOrders to only allow customers to edit the message to be printed field - Joey Muzzo
12/4/2019 updated the update statement for grdCustomer to not allow customers to update their AddressID or UserID - Joey Muzzo
12/4/2019 updated visibility for gridview on Catalog web from to not allow customers to edit the product catalog - Joey Muzzo

12/6/2019 added grdOrderInformation which draws from SalesOrderForm, PurchaseOrderDetail, Customer, Users, and PurchaseOrderForm tables - Joey Muzzo
12/6/2019 added drpEmployeeID dropdown list to PlaceOrder web form to allow customers to select the name of the employee helping them so they can recieve the 10% deposit - Joey Muzzo
12/6/2019 updated SaveOrder function adds data to Purchase Order Form table after the original order information is sent.  -Daniel Crowder 

12/9/2019 added if statements to hide gridview on OrderInformation web form unless security level is O or S - Joey Muzzo
12/9/2019 updated SaveOrder function insert into SalesOrderForm statement - Daniel Crowder
12/9/2019 updated SaveUser function insert into  Employee statement - Daniel Crowder
12/9/2019 updated grdOrderInformation changed the visibility fo some fields and changes the editable status of certain fields - Joey Muzzo, Daniel Crowder
12/9/2019 updated CreateUser field validation IF statements to account for creating Employee - Daniel Crowder

12/10/2019 added IF statement to make btnOrderInfo visible = false if security level = C on Main web form - Joey Muzzo

12/11/2019 updated the clsDataLayer save order function to be dynamic depending on what products are added - Daniel Crowder
12/11/2019 updated the Place order design to not include the OrderID.  Order ID is now filled out by the database - Daniel Crowder
12/11/2019 updated dropdown on Order Product page to reflect the name of the product, instead of the prodID - Daniel Crowder

12/13/2019 added second gridview to OrderInformation web form to show order validation status - Daniel Crowder, Joey Muzzo
12/13/2019 added SqlDataSource1_Updated statement to reload page when datasource is updated - Daniel Crowder, Joey Muzzo

12/14/2019 added error message to show if a user already exists when trying to create a new user - Joey Muzzo
12/14/2019 hid the image buttons for Place Order, My Account, and Order Informtion if the user security level is equal to null - Joey Muzzo
 
--------------------------------------------*/
public class clsDataLayer
{
   

    public clsDataLayer()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    //Added 11/19/19 GetAddressInfo retrieves customer address info - Joey Muzzo
    public static dsCustomers GetAddressInfo(string Database, string UserLogon)
    {
        dsCustomers DS;
        OleDbConnection sqlConn;
        OleDbDataAdapter sqlDA;


        sqlConn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" +
        "Data Source=" + Database); 

        sqlDA = new OleDbDataAdapter("SELECT Customer.* FROM Users INNER JOIN Customer ON Users.UserID = Customer.UserID WHERE (((Users.UserLogon)= '" + UserLogon + "'))", sqlConn);

        DS = new dsCustomers();
        sqlDA.Fill(DS.Customer);
        return DS;
    }

    //Added 11/18/19 VerifyUser verifys the user name and password of the person logging in - Jowy Muzzo
    public static dsUser VerifyUser(string Database, string UserName, string UserPassword)
    {

        dsUser DS;
        OleDbConnection sqlConn;
        OleDbDataAdapter sqlDA;

        // creates new connection to database
        sqlConn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" +
        "Data Source=" + Database);

        //Select statement to verify user
        sqlDA = new OleDbDataAdapter("Select UserSecLevel from Users " +
                                      "where UserLogon like '" + UserName + "' " +
                                      "and UserPassword like '" + UserPassword + "'", sqlConn);


        DS = new dsUser();
        sqlDA.Fill(DS.Users);
        return DS;

    }
 //end 11/18/19 addition

    // 11/23/2019  SaveUser saves a new user to the database - Joey Muzzo
    public static bool SaveUser(string Database, string UserLogon, string UserPassword, string UserSecLevel, string AddressLine1, string City, string StateCode, string PostalCode, string CFName, string CLName, string CCNum, string CCExp, string CCPin, string CCType)
    {
        bool recordSaved;

        try
        {
            // creates new connection to database
            OleDbConnection conn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" +
            "Data Source=" + Database);
            conn.Open();
            OleDbCommand command = conn.CreateCommand();
            string strSQL;
            string strSQLID = "Select @@Identity";

            if (UserSecLevel == "C")
            {
                //inserts data into Users table
                strSQL = "Insert into Users " +
                "(UserLogon, UserPassword, UserSecLevel) values ('" +
                UserLogon + "', '" + UserPassword + "', '" + UserSecLevel + "')";
                // issues a SQl string command type for users
                command.CommandType = CommandType.Text;
                command.CommandText = strSQL;
                command.ExecuteNonQuery();

                command.CommandText = strSQLID;
                int userID = (int)command.ExecuteScalar();

                //Insert nto Address table
                strSQL = "Insert into Address " + "(AddressLine1, City, StateCode, PostalCode) values ('" + AddressLine1 + "','" + City + "','" + StateCode + "','" + PostalCode + "')";
                //Issues a SQl string command type for address
                command.CommandType = CommandType.Text;
                command.CommandText = strSQL;
                command.ExecuteNonQuery();

                command.CommandText = strSQLID;
                int addressID = (int)command.ExecuteScalar();

                //Inserts into Customer table
                strSQL = "Insert into Customer " + "(CFName,CLName, CCNum, CCExp,CCPin, CCType, AddressID, UserID) values ('" + CFName + "','" + CLName + "','" + CCNum + "','" + CCExp + "','" +
                CCPin + "','" + CCType + "'," + addressID + "," + userID + ")";
                command.CommandType = CommandType.Text;
                command.CommandText = strSQL;
                command.ExecuteNonQuery();
            }
            else
            {
                strSQL = "Insert into Users " +
                "(UserLogon, UserPassword, UserSecLevel) values ('" +
                UserLogon + "', '" + UserPassword + "', '" + UserSecLevel + "')";
                // issues a SQl string command type for users
                command.CommandType = CommandType.Text;
                command.CommandText = strSQL;
                command.ExecuteNonQuery();

                command.CommandText = strSQLID;
                int userID = (int)command.ExecuteScalar();

                //Inserts into Employee table
                strSQL = "Insert into Employee " + "(EFName, ELName, UserID) values ('" + CFName + "', '" + CLName + "', " + userID + ")";
                // issues a SQl string command type
                command.CommandType = CommandType.Text;
                command.CommandText = strSQL;
                command.ExecuteNonQuery();
            }
            

            

            // closes the connection to the data source
            conn.Close();

            recordSaved = true;
        }
        catch (Exception ex)
        {
            // catches the new data input if incorrect and rollsback to the previous dataset
            // myTransaction.Rollback();
            recordSaved = false;
        }
        return recordSaved;

    }
    
    public static bool SaveUser(string v, string text1, string text2, object p)
    {
        throw new NotImplementedException();
    }

    // added 11/27/2019 This function saves the customers order - Joey Muzzo
    public static bool SaveOrder(string Database, /*int OrderID,*/ int OrderQty, int ProdID, string Message, object CustID, int employeeID, bool PoD)
    {
        bool recordSaved;
        // represents an SQL transaction to be made at a data source
        OleDbTransaction myTransaction = null;
        try
        {
            //Changed all variables to doubles to account for cents of a dollar.  Dan Crowder 12/11/2019
            double ProdTotal = 0;
            double trophyPrice = 20.00;
            double clothPrice = 25.00;
            double plaquePrice = 35.00;
            double paidAmt = 0;
            double remainAmt = 0;
            
            
            // creates new connection to database
            OleDbConnection conn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" +
            "Data Source=" + Database);
            conn.Open();
            OleDbCommand command = conn.CreateCommand();
            string strSQL;
            string strSQLID = "Select @@Identity";
            // begins the SQl transaction to the data source
            myTransaction = conn.BeginTransaction();
            command.Transaction = myTransaction;

            //get price where prodID is equal to what is selected.  Daniel Crowder 12/11/2019 
            strSQL = "SELECT ListPrice FROM Product WHERE ProdID=" + @ProdID + "";
            command.CommandType = CommandType.Text;
            command.CommandText = strSQL;
            //Saves result of SQL command to object ProdPrice and converts it to a double for use in math below. Daniel Crowder 12/11/2019
            object ProdPrice = command.ExecuteScalar();
            double productPrice = Convert.ToDouble(ProdPrice); //convert object to double. Daniel Crowder 12/11/2019
            //Takes place of switch case in previous version. Daniel Crowder 12/11/2019
            if (PoD)
            {
                paidAmt = productPrice / 10 * OrderQty;
                ProdTotal = productPrice * OrderQty;
                remainAmt = ProdTotal - paidAmt;
            }
            else
            {
                ProdTotal = productPrice * OrderQty;
                remainAmt = ProdTotal - paidAmt;
            }
            
            // adds data to Purchase Order Form table after the original order information is sent.  -Daniel Crowder 12/6/2019
            strSQL = "Insert into PurchaseOrderForm " +
                "(PayOnDel, TotalDue, CustID) values (" + PoD + ", '" + ProdTotal + "', '" + CustID + "')";
            //"(OrderID, PayOnDel, TotalDue, CustID) values ('" + OrderID + "', " + PoD + ", '" + ProdTotal + "', '" + CustID + "')";
            command.CommandText = strSQL;
            command.ExecuteNonQuery();
            //Takes OrderID for use later in other tables. Daniel Crowder 12/11/2019
            command.CommandText = strSQLID;
            int orderID = (int)command.ExecuteScalar();

            // creates a SQL string to be inserted into the PurchaseOrderDetail table
            strSQL = "Insert into PurchaseOrderDetail " +
            "(OrderID, OrderQty, ProdID, Message, ProdTotal, CustID) values ('" + orderID + "', '" + OrderQty + "', '" + ProdID + "', '" + Message + "', '" + ProdTotal + "', '" + CustID + "')";

            // strSQL = "Insert into PurchaseOrderDetail " +
            //"(OrderID, OrderQty, ProdID, Message, ProdTotal, CustID) values ('" + OrderID + "', '" + OrderQty + "', '" + ProdID + "', '" + Message + "', '" + ProdTotal + "', '" + CustID + "')";


            // issues a SQl string command type
            command.CommandType = CommandType.Text;
            command.CommandText = strSQL;
            // executes an SQL statement
            command.ExecuteNonQuery();


            
            strSQL = "Insert into SalesOrderForm " +
                "(PaidAmt, RemainingAmt, EmployeeID, CustID, OrderID) values ('" + paidAmt + "', '" + remainAmt + "', '" + employeeID + "', '" + CustID + "', " + orderID + ")";
            command.CommandText = strSQL;
            command.ExecuteNonQuery();

            // commits the new input to the data source
            myTransaction.Commit();
            // closes the connection to the data source
            conn.Close();

           
            recordSaved = true;
        }
        catch (Exception ex)
        {
            // catches the new data input if incorrect and rollsback to the previous dataset
            myTransaction.Rollback();
            recordSaved = false;
        }
        return recordSaved;
    }


    // added 11/30/2019 This function updates the product catalog - Joey Muzzo
    public static bool UpdateCatalog(string Database, string ProductName, string ProductDescription, string JobType, string MediaType, double ListPrice)
    {
        bool recordSaved;
        // represents an SQL transaction to be made at a data source
        OleDbTransaction myTransaction = null;
        try
        {
            // creates new connection to database
            OleDbConnection conn = new OleDbConnection("PROVIDER=Microsoft.ACE.OLEDB.12.0;" +
            "Data Source=" + Database);
            conn.Open();
            OleDbCommand command = conn.CreateCommand();
            string strSQL;
            // begins the SQl transaction to the data source
            myTransaction = conn.BeginTransaction();
            command.Transaction = myTransaction;
            strSQL = "Insert into Product " +
            "(ProdName, ProdDescription, JobType, MediaType, ListPrice) values ('" + ProductName + "', '" + ProductDescription + "', '" + JobType + "', '" + MediaType + "', " + ListPrice + ")";
           

            // issues a SQl string command type
            command.CommandType = CommandType.Text;
            command.CommandText = strSQL;
            // executes an SQL statement
            command.ExecuteNonQuery();

            // commits the new input to the data source
            myTransaction.Commit();
            // closes the connection to the data source
            conn.Close();


            recordSaved = true;
        }
        catch (Exception ex)
        {
            // catches the new data input if incorrect and rollsback to the previous dataset
            myTransaction.Rollback();
            recordSaved = false;
        }
        return recordSaved;
    }
    //11/29/2019 CalculateTotal will calculate the total for customers orders - Joey Muzzo
    public static int CalculateTotal(string quantity, string value)
    {
        int total;
        int qty = int.Parse(quantity);
        int val = int.Parse(value);
        total = qty * val;
        return total;
    }
}
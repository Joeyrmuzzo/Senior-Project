using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Catalog : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["SecurityLevel"] = null;
        Session["CustID"] = null;
        Session["AddressID"] = null;
        Session["UserNameID"] = null;
    }

    protected void btnLogin_Click(object sender, ImageClickEventArgs e)
    {
        
    }

    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {
        
        // creates a local variable for the data set
        dsUser dsUserLogon;
        dsCustomers dsCustomerInfo;//added 11/19/19
        // creates a local string variable 
        string SecurityLevel;
        // checks the data set dsUserLogin to see if it is = to the VerifyUser method in the clsDataLayer page
        dsUserLogon = clsDataLayer.VerifyUser(Server.MapPath("~/Database/Group4DB.accdb"), Login1.UserName, Login1.Password);

        if (dsUserLogon.Users.Count < 1)
        {
            //If not valid login redirect back to login page.


            lblStatus.Text = ("Invalid Login!");


        }


        else
        { 
        // takes the security level and changes it to a string variable
        SecurityLevel = dsUserLogon.Users[0].UserSecLevel.ToString();
            // switch statement that checks security level 
            switch (SecurityLevel)
            {
                case "O":
                    // this is the case for an administrator security level 
                    e.Authenticated = true;
                    FormsAuthentication.RedirectFromLoginPage(Login1.UserName, false);
                    Session["SecurityLevel"] = "O";
                  
                    break;
                case "C":
                    // this is the case for a user security level
                    e.Authenticated = true;
                    FormsAuthentication.RedirectFromLoginPage(Login1.UserName, false);
                    Session["UserNameID"] = Login1.UserName;//added 11/20/19
                    Session["SecurityLevel"] = "C";
                    dsCustomerInfo = clsDataLayer.GetAddressInfo(Server.MapPath("~/Database/Group4DB.accdb"), Login1.UserName); //added 11/19/19
                    int AddressID = dsCustomerInfo.Customer[0].AddressID;
                    Session["AddressID"] = AddressID;
                    dsCustomerInfo = clsDataLayer.GetAddressInfo(Server.MapPath("~/Database/Group4DB.accdb"), Login1.UserName);//added 11/19/19
                    int CustID = dsCustomerInfo.Customer[0].CustID;
                    Session["CustID"] = CustID;
                    break;
                case "S"://added 11/26/2019 case statement for sales man. - Joey Muzzo
                    FormsAuthentication.RedirectFromLoginPage(Login1.UserName, false);
                    Session["SecurityLevel"] = "S";
                    Session["UserNameID"] =  Login1.UserName;
                    Response.Redirect("Main.aspx");
                    break;
                default:
                    e.Authenticated = false;
                    break;
            }
                    
            }
        
    }
}
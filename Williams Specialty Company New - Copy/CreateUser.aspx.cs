using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CreateUser : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["SecurityLevel"] == "O")//added 11/21/19 hides the user grid view, security drop down, and security level label unless security lvl is ops manager - Joey Muzzo
        {
            grdUsers.Visible = true;
            drpSecurityLevel.Visible = true;
            lblSecurityLevel.Visible = true;
        }
      
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        bool allOK = true;
        bool employeeOK = true;
        string errorMessage = "";// added 11/26/2019 input validation for CreateUser. Makes sure all inout fields are entered correctly. - Joey Muzzo
        try
        {
            if (drpSecurityLevel.SelectedValue == "C")
            {

                if (Request["txtUserName"].ToString().Trim() == "")
                {
                    txtUserName.BackColor = System.Drawing.Color.Yellow;
                    errorMessage = errorMessage + " User name may not be empty. ";
                    allOK = false;
                }
                else
                {
                    txtUserName.BackColor = System.Drawing.Color.White;

                }
                if (Request["txtPassword"].ToString().Trim() == "")
                {
                    txtPassword.BackColor = System.Drawing.Color.Yellow;
                    errorMessage = errorMessage + " Password may not be empty. ";
                    allOK = false;
                }
                else
                {
                    txtPassword.BackColor = System.Drawing.Color.White;

                }
                if (Request["txtAddressLine"].ToString().Trim() == "")
                {
                    txtAddressLine.BackColor = System.Drawing.Color.Yellow;
                    errorMessage = errorMessage + " Address may not be empty. ";
                    allOK = false;
                }
                else
                {
                    txtAddressLine.BackColor = System.Drawing.Color.White;

                }
                if (Request["txtCity"].ToString().Trim() == "")
                {
                    txtCity.BackColor = System.Drawing.Color.Yellow;
                    errorMessage = errorMessage + " City may not be empty. ";
                    allOK = false;
                }
                else
                {
                    txtCity.BackColor = System.Drawing.Color.White;

                }
                if (Request["txtStateCode"].ToString().Trim() == "")
                {
                    txtStateCode.BackColor = System.Drawing.Color.Yellow;
                    errorMessage = errorMessage + " State may not be empty. ";
                    allOK = false;
                }
                else
                {
                    txtStateCode.BackColor = System.Drawing.Color.White;

                }
                if (Request["txtPostalCode"].ToString().Trim() == "")
                {
                    txtPostalCode.BackColor = System.Drawing.Color.Yellow;
                    errorMessage = errorMessage + " Zip code may not be empty. ";
                    allOK = false;
                }
                else
                {
                    txtPostalCode.BackColor = System.Drawing.Color.White;

                }
                if (Request["txtCFName"].ToString().Trim() == "")
                {
                    txtCFName.BackColor = System.Drawing.Color.Yellow;
                    errorMessage = errorMessage + " First Name may not be empty. ";
                    allOK = false;
                }
                else
                {
                    txtCFName.BackColor = System.Drawing.Color.White;

                }
                if (Request["txtCLName"].ToString().Trim() == "")
                {
                    txtCLName.BackColor = System.Drawing.Color.Yellow;
                    errorMessage = errorMessage + " Last name may not be empty. ";
                    allOK = false;
                }
                else
                {
                    txtCLName.BackColor = System.Drawing.Color.White;

                }
                if (Request["txtCCNum"].ToString().Trim() == "")
                {
                    txtCCNum.BackColor = System.Drawing.Color.Yellow;
                    errorMessage = errorMessage + " Credit card number may not be empty. ";
                    allOK = false;
                }
                else
                {
                    txtCCNum.BackColor = System.Drawing.Color.White;

                }
                if (Request["txtCCExp"].ToString().Trim() == "")
                {
                    txtCCExp.BackColor = System.Drawing.Color.Yellow;
                    errorMessage = errorMessage + " Expiration date may not be empty. ";
                    allOK = false;
                }
                else
                {
                    txtCCExp.BackColor = System.Drawing.Color.White;

                }
                if (Request["txtCCPin"].ToString().Trim() == "")
                {
                    txtCCPin.BackColor = System.Drawing.Color.Yellow;
                    errorMessage = errorMessage + " Credit card pin may not be empty. ";
                    allOK = false;
                }
                else
                {
                    txtCCPin.BackColor = System.Drawing.Color.White;

                }
                if (Request["txtCCType"].ToString().Trim() == "")
                {
                    txtCCType.BackColor = System.Drawing.Color.Yellow;
                    errorMessage = errorMessage + " Credit card type may not be empty. ";
                    allOK = false;
                }
                else
                {
                    txtCCType.BackColor = System.Drawing.Color.White;

                }//end 11/26/2019
            }
            else
            {
                if (Request["txtUserName"].ToString().Trim() == "")
                {
                    txtUserName.BackColor = System.Drawing.Color.Yellow;
                    errorMessage = errorMessage + " User name may not be empty. ";
                    employeeOK = false;
                }
                else
                {
                    txtUserName.BackColor = System.Drawing.Color.White;

                }
                if (Request["txtPassword"].ToString().Trim() == "")
                {
                    txtPassword.BackColor = System.Drawing.Color.Yellow;
                    errorMessage = errorMessage + " Password may not be empty. ";
                    employeeOK = false;
                }
                else
                {
                    txtPassword.BackColor = System.Drawing.Color.White;

                }
                if (Request["txtCFName"].ToString().Trim() == "")
                {
                    txtCFName.BackColor = System.Drawing.Color.Yellow;
                    errorMessage = errorMessage + " First Name may not be empty. ";
                    employeeOK = false;
                }
                else
                {
                    txtCFName.BackColor = System.Drawing.Color.White;

                }
                if (Request["txtCLName"].ToString().Trim() == "")
                {
                    txtCLName.BackColor = System.Drawing.Color.Yellow;
                    errorMessage = errorMessage + " Last name may not be empty. ";
                    employeeOK = false;
                }
                else
                {
                    txtCLName.BackColor = System.Drawing.Color.White;
                    
                }
            }

            if (employeeOK && allOK)
            {
                if (clsDataLayer.SaveUser(Server.MapPath("~/Database/Group4DB.accdb"),
                 txtUserName.Text, txtPassword.Text, drpSecurityLevel.SelectedValue, txtAddressLine.Text, txtCity.Text, txtStateCode.Text, txtPostalCode.Text, txtCFName.Text, txtCLName.Text, txtCCNum.Text, txtCCExp.Text, txtCCPin.Text, txtCCType.Text))
                {
                    lblDisplaySuccess.Text = "The user was successfully added!";
                    lblDisplay.Text = "";
                    grdUsers.DataBind();
                }
                else
                {
                    lblDisplay.Text = "The User already exists";
                    lblDisplaySuccess.Text = "";

                  //  lblDisplay.Text = errorMessage;


                }

            }
            else
            { lblDisplay.Text = errorMessage;
               
            }
        }
        catch { }

    }
}

public class grdUsers
{
}
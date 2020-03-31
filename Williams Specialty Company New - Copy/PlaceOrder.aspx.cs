using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PlaceOrder : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["SecurityLevel"] == null)// if seccion SecurityLevel is null then redirect user to Login web form
        {
            Response.Redirect("Login.aspx");
        }
    }

    

    protected void btnPlaceOrder_Click(object sender, ImageClickEventArgs e)
    {
        string errorMessage = "";// added 11/27/2019 input validation for PlaceOrder. Makes sure all inout fields are entered correctly. - Joey Muzzo
        try
        {
            bool allOK = true;
            
            if (Request["txtQuantity"].ToString().Trim() == "")
            {
                txtQuantity.BackColor = System.Drawing.Color.Yellow;
                errorMessage = errorMessage + " Quantity may not be empty. ";
                allOK = false;
            }
            else
            {
                txtQuantity.BackColor = System.Drawing.Color.White;

            }
            if (Request["txtMessage"].ToString().Trim() == "")
            {
                txtMessage.BackColor = System.Drawing.Color.Yellow;
                errorMessage = errorMessage + " Message may not be empty. ";
                allOK = false;
            }
            else
            {
                txtMessage.BackColor = System.Drawing.Color.White;

            }

            if (clsDataLayer.SaveOrder(Server.MapPath("~/Database/Group4DB.accdb"),
                int.Parse(txtQuantity.Text), int.Parse(drpProductID.SelectedValue), txtMessage.Text, Session["CustID"], int.Parse(drpEmployeeID.SelectedValue),chkPoD.Checked))
            {
                lblOrderSuccess.Text = "The order was successfully placed!";
                lblDisplayOrder.Text = "";
            }
            else
            {
                lblDisplayOrder.Text = "The order was not placed";

            }

        }
        catch (Exception ex) //added 11/27/2019
        {
            lblDisplayOrder.Text = ex.Message;
        }
    }


    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
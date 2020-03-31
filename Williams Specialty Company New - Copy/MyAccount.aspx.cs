using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MyAccount : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (Session["SecurityLevel"] == null) // if seccion SecurityLevel is null then redirect user to Login web form
        {
            Response.Redirect("Login.aspx");
        }
        
    }

    protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }

    protected void grdOrders_SelectedIndexChanged(object sender, EventArgs e)
    {
        
    }
}
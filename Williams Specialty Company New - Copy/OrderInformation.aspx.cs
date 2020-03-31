using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class OrderInformation : System.Web.UI.Page
{
   
       protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["SecurityLevel"] == "O")//added 12/9/19 hides the grid view unless security lvl is ops manager - Joey Muzzo
        {
            grdOrderInformation.Visible = true;

        }
        if (Session["SecurityLevel"] == "S")//added 12/9/19 hides the grid view unless security lvl is sales staff - Joey Muzzo
        {
            grdOrderInformation.Visible = true;

        }
       
        
    }

    protected void SqlDataSource1_Updated(object sender, SqlDataSourceStatusEventArgs e)//added 12/13/19 reloads page when datasource is updated
    {
        if (e.AffectedRows > 0)
        {
            Response.Redirect(Request.RawUrl);
            
        }
    }






}
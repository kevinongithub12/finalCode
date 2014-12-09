using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Contact : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!User.Identity.IsAuthenticated)
        {
            Response.Redirect("~");
        }
    }


    private void redirectToReturnUrl()
    {
        ////var returnURL = Request.QueryString["ReturnUrl"];
        ////if (!String.IsNullOrEmpty(returnURL))               //if return url avaiable
        ////{
        ////    Response.Redirect(returnURL); //if ReturnURL available then return to it
        ////}
    }
}
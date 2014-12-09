using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : Page
{
    private static Int32 countTimesLoaded = 0;
    protected static String returnURL = ""; 
    protected void Page_Load(object sender, EventArgs e)
    {
        if (String.IsNullOrEmpty((String)ViewState["returnURL"])
            )
        {
            if (!User.Identity.IsAuthenticated)
            {
                if (countTimesLoaded <= 0)
                {
                    returnURL = returnURL ?? "Default.aspx";
                    ++countTimesLoaded;    //increment the timesloaded
                    showAnimatedTitle();  //Since loaded for first time, show the titleScreen
                    //Response.Redirect("Default.aspx");
                }

            }
        }
    }

    protected void showAnimatedTitle()
    {
        
        Response.Redirect("AnimatedTitleScreen.aspx");
    }
}
using System;
using System.IO;
using System.Web;


    public partial class UserProfilePage : System.Web.UI.Page
    {


        protected void Page_Load(object sender, EventArgs e)
        {
            ViewState["returnURL"] = "AnimatedTitleScreen";
        }


        protected void redirectBttn(object sender, EventArgs e)
        {
            
        }
    }


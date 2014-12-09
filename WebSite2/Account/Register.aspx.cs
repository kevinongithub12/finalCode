using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Membership.OpenAuth;

public partial class Account_Register : Page
{
    protected static String userName;
    protected static String passWord;
    protected static String email;
    protected void Page_Load(object sender, EventArgs e)
    {
        RegisterUser.ContinueDestinationPageUrl = Request.QueryString["ReturnUrl"];


        if (IsPostBack)
        {
            //Find the value of the textboxes by the id  of the Stupid control markup
            TextBox userNameTextBox = (TextBox)RegisterUserWizardStep.ContentTemplateContainer.FindControl("UserName");
            userName = userNameTextBox.Text.ToString();

            TextBox passWordTextBox = (TextBox)RegisterUserWizardStep.ContentTemplateContainer.FindControl("Password");
            passWord = passWordTextBox.Text.ToString();

            TextBox EmailTextBox = (TextBox)RegisterUserWizardStep.ContentTemplateContainer.FindControl("Email");
            email = EmailTextBox.Text.ToString();

            #region  OLD method JS INJECTION
            //  System.Text.StringBuilder JScriptText = new System.Text.StringBuilder();

          //  JScriptText.Append("<script src=\\www.parsecdn.com/js/parse-1.3.1.min.js></script>");
          //  JScriptText.Append("<script type=\"text/javascript\"></script>");
          //  JScriptText.Append("<script>");
          //  JScriptText.Append("function sendUserInfotoCloud(){");
          //  JScriptText.Append("Parse.initialize('fKnBZJbUYPNfV5BgcPGPAFhem5Y6Xpp5mZPkJ9fk', 'GUYeo7lR7nVm81iMlTlxOzyF5mVc3xZbtVI9zWBD');");
          //  JScriptText.Append(" var user = new Parse.User();");
          //  JScriptText.Append("user.set('username', document.getElementById(<%=userName %>.value()));");
          //  JScriptText.Append("user.set('password', document.getElementById('sam123'));");
          //  JScriptText.Append("user.signUp(null, {success: function(user) { },error: function(user, error) {alert('Error: error.code');}});}");
          //  JScriptText.Append("</script>");

          //Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "sendUserInfotoCloud", JScriptText.ToString(), false);
            ////ScriptManager.RegisterClientScriptBlock(this, GetType(), "sendUserInfotoCloud", JScriptText.ToString(), false);
            #endregion
        }
    }


    public void RegisterUser_CreatedUser(object sender, EventArgs e)
    {
        String continueUrl = "";
        try
        {
            FormsAuthentication.SetAuthCookie(RegisterUser.UserName, createPersistentCookie: true);

             continueUrl = RegisterUser.ContinueDestinationPageUrl;
            if (!OpenAuth.IsLocalUrl(continueUrl))
            {
                continueUrl = "~/";
            }

        }

        catch (Exception ex)
        {

        }
        finally
        {
            Response.Redirect(continueUrl);
        }
        
    }
   
}
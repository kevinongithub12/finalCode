using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Services;
using System.Web.Services;
public partial class Account_Login : Page
{
    protected static String userName;
    protected static String passWord;
    protected static List<TextBox> txtBoxlst = new List<TextBox>(); //Static Generic List

    protected void Page_Load(object sender, EventArgs e)
     {
       
        if (IsPostBack)     //Clear the data List before each postback response!
        {

            txtBoxlst.Clear();

            if (User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/Default.aspx");
            }
        }

        if (!HttpContext.Current.User.Identity.IsAuthenticated)         //if user is not authenticated
        {
            //Find the Server-side Control values from View, and cast values as Textbox

            TextBox userNameTextBox = (TextBox)LoginView.Controls[0].FindControl("UserName");//This textbox holds  userName  
            TextBox commaTextBox = new TextBox();           //using this textbox to add a delimiter, so that I can split the String
            commaTextBox.Text = ",";
            TextBox passWordTextBox = (TextBox)LoginView.Controls[0].FindControl("Password"); //This txtBox holds the password


            userName = userNameTextBox.Text.ToString();
            passWord = passWordTextBox.Text.ToString();

            if (!String.IsNullOrEmpty(userNameTextBox.Text.ToString()     //Check if UserName textbox contains content
                    ))
            {
                txtBoxlst.Add(userNameTextBox);             //Add  userName txtbox in list         (position:Element [0])
            }
            if (!String.IsNullOrEmpty(passWordTextBox.Text.ToString()     //Check if password textbox contains content
                    ))
            {
                txtBoxlst.Add(commaTextBox);                //Add , (delimiter) txtbox in list.    (position:Element [1])
                txtBoxlst.Add(passWordTextBox);             //Add Password txtbox  in list.        (postion:Element [2])
            }  
          
        }
        RegisterHyperLink.NavigateUrl = "Register";
        OpenAuthLogin.ReturnUrl = Request.QueryString["ReturnUrl"];

        var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
        if (!String.IsNullOrEmpty(returnUrl))
        {
            RegisterHyperLink.NavigateUrl += "?ReturnUrl=" + returnUrl;
        }

        
    }
  
    //ajax Call to web method, Loop through static Generic List<TextBox>, 
    //Get text of each textbox, append to a string,return the string as json format, then clear the contents of the generic list
    [WebMethod]    
    public static String GetUserTextFields()
    {
        String strCredentials = "";                 //This String will hold all the textboxes text values

        foreach (TextBox txtBox in txtBoxlst)      //Loop through list of textboxes, and append txtbox text to a String
        {
            strCredentials += txtBox.Text.ToString();
        }

        txtBoxlst.Clear();            //Clear the list, otherwise list will contain every login attempt's credentials!
        return strCredentials;
       
    }
}

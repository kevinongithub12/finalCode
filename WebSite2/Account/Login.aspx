<%@ Page Title="Log in" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Account_Login" %>
<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content runat="server" ID="BodyContent"  ContentPlaceHolderID="MainContent">
    <script src="//www.parsecdn.com/js/parse-1.3.1.min.js"></script>
    <script src="Scripts/jquery-2.1.1.min.js"></script>
    <script src="Scripts/jquery-2.1.1.js"></script>
    <script type="text/javascript"> </script>

    <script>
        Parse.initialize("fKnBZJbUYPNfV5BgcPGPAFhem5Y6Xpp5mZPkJ9fk", "GUYeo7lR7nVm81iMlTlxOzyF5mVc3xZbtVI9zWBD");  //@params:appID,key
        window.fbAsyncInit = function () {
            Parse.FacebookUtils.init({ // this line replaces FB.init({
                appId: '714038725351814', // Facebook App ID
                status: false, // check Facebook Login status
                cookie: true, // enable cookies to allow Parse to access the session
                xfbml: true,
                version: 'v2.1'//Uses the correct version of the SDK
            });

            // Run code after the Facebook SDK is loaded.
        };

        (function (d, s, id) {                      //facebook SDK callback
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) { return; }
            js = d.createElement(s); js.id = id;
            js.src = "//connect.facebook.net/en_US/sdk.js";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));
        
        //on page load, wait for bind 
        

        function RequestParseUserInfo() {
            $("#loading").show();
            Page_ClientValidate("LoginUserValidationGroup");    //Adds ClientSide validation to the groupField
            //Now check if the validation succeeds,
            if (Page_IsValid) {             //if success= true...Page_Is_Valid :bool, bool_defaultValue => true

                $.ajax({
                    type: "POST",
                    url: "Login.aspx/GetUserTextFields",
                    data:"{}",
                    contentType:"application/json;charset=utf-8",
                    dataType:"json",
                    success:function(result){      
                        OnSuccess(result.d);
                        
                    },
                    error:function(xhr,status,error){
                        OnFailure(error);
                    }
                });
            }
  
        }
        
        function OnSuccess(response){               //Call back function
            var passW = "";
            var userN = "";

            $("#loading").hide();

            if( response ){   //If valid callback
                                                                 //  comma delimiter to split content
                var str_array = response.toString().split(',');  //Split  response in half, [username, password] 

               //Split the callback data.d contents!!!
                userN = str_array[0].toString();      //assign username array[0]
                passW = str_array[1].toString();      //assign password aray[1]

                getParseData(userN,passW);                          //call function to send credentials to cloud server
               // alert(passW + "," + userN);
                }   
            }
           
        function OnFailure(error){
            alert(error);
        }
        function getParseData(userN,passW)      {
                var user = new Parse.User();// their values are to the cloud server*/
                user.set("username", userN);
                user.set("password", passW);

                Parse.User.logIn(userN, passW, {
                    success: function (user) {
                        this
                        localStorage.setItem("CurrUserName", JSON.stringify(userN)); //save the userName!
                        localStorage.setItem("CurrUserPassword", JSON.stringify(passW)); //save the password!

                        user.save(null, {
                            success: function () {
                                alert("Success!");
                                Page_IsValid = true;
                                return true;
                            },
                            error: function () {
                                alert("fuck you!");
                            }

                        });
                    },
                    error: function (user, error)   {
                        
                        //alert("fuck man it failed!");
                        Page_IsValid = false;
                        return false;
                    }
              });
        }
       

    </script>
        <hgroup class="title">
            <h1><%: Title %></h1>
    </hgroup>
    <div id="loading" >
          <img src="Images/img/722.GIF" style="display:none;" />
      </div>
    <section id="loginForm" runat="server">
        <h2>Use a local account to log in.</h2>
        <asp:Login ID="LoginView" runat="server" ViewStateMode="Disabled" RenderOuterTable="false">
            <LayoutTemplate>
                <p class="validation-summary-errors">
                    <asp:Literal runat="server" ID="FailureText" />
                </p>
                <fieldset>
                    <legend>Log in Form</legend>
                    <ol>
                        <li>
                            <asp:Label runat="server" AssociatedControlID="UserName">User name</asp:Label>
                            <asp:TextBox runat="server" ID="UserName"  />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName"
                                 CssClass="field-validation-error" ErrorMessage="The user name field is required."
                                 ValidationGroup="LoginUserValidationGroup"></asp:RequiredFieldValidator>
                        </li>
                        <li>
                            <asp:Label runat="server" AssociatedControlID="Password">Password</asp:Label>
                            <asp:TextBox runat="server" ID="Password" TextMode="Password" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                                 CssClass="field-validation-error" ErrorMessage="The password field is required."
                                 ValidationGroup="LoginUserValidationGroup"></asp:RequiredFieldValidator>
                             
                        </li>
                       
                        <li>
                            <asp:CheckBox runat="server" ID="RememberMe" />
                            <asp:Label runat="server" AssociatedControlID="RememberMe"
                                 CssClass="checkbox">Remember me?</asp:Label>
                        </li>
                    </ol>
                    <asp:Button runat="server" CommandName="Login" Text="Log in"   
                         OnClientClick="javascript:RequestParseUserInfo();" />
                </fieldset>
            </LayoutTemplate>
        </asp:Login>
        <p>
            <asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled">Register</asp:HyperLink>
            if you don't have an account.
        </p>
    </section>

    <section id="socialLoginForm">
        <h2>Use another service to log in.</h2>
        <uc:OpenAuthProviders runat="server" ID="OpenAuthLogin" />
    </section>
</asp:Content>
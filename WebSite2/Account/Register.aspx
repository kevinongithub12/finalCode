<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Account_Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    <script src="//www.parsecdn.com/js/parse-1.3.1.min.js"></script>
    <script type="text/javascript"></script>
    <script>

        Parse.initialize("fKnBZJbUYPNfV5BgcPGPAFhem5Y6Xpp5mZPkJ9fk", "GUYeo7lR7nVm81iMlTlxOzyF5mVc3xZbtVI9zWBD");  //@params:appID,key

        window.fbAsyncInit = function () {
            Parse.FacebookUtils.init({ // this line replaces FB.init({
                appId: '714038725351814', // Facebook App ID
                status: true, // check Facebook Login status
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

        function getUserInfoFromParse() {
            // validate the group of validation fields on clientside
            Page_ClientValidate("LoginUserValidationGroup");
            
            if (Page_IsValid) {                              //Client-Validation Status val(true/false)
                                                            // user credentials pulled from server side, 
               var user = new Parse.User();                 // their values are sent to the cloud server*/
               
               user.set("username", $("#<%=RegisterUserWizardStep.ContentTemplateContainer
                            .FindControl("UserName").ClientID%>").val()
                   )
               ;
                user.set("password", $("#<%=RegisterUserWizardStep.ContentTemplateContainer
                            .FindControl("Password").ClientID%>").val()
                    )
                ;
                user.set("email", $("#<%=RegisterUserWizardStep.ContentTemplateContainer
                            .FindControl("Email").ClientID%>").val()
                    )
                ;

               user.signUp(null, {
                   success: function (user) {
                       alert("Success!");
                       Page_IsValid = true;
                       return true;
                       // Hooray! Let them use RaceTracker now.               
                    },
                    error: function (user, error) {
                        // Show the error message somewhere and let  user try again by posting false valid to serverside to break fn
                        alert("Error: " + error.code + " " + error.message );
                        Page_IsValid = false;
                        return false;
                        
                    }
               });;
               return true;
            }      
        }
</script>
    <hgroup class="title">
        <h1><%: Title %>.</h1>
        <h2>Use the form below to create a new account.</h2>
    </hgroup>
    
    <asp:CreateUserWizard runat="server" ID="RegisterUser" ViewStateMode="Enabled" OnCreatedUser="RegisterUser_CreatedUser">
        <LayoutTemplate>
            <asp:PlaceHolder runat="server" ID="wizardStepPlaceholder" />
            <asp:PlaceHolder runat="server" ID="navigationPlaceholder" />
        </LayoutTemplate>
        <WizardSteps>
            <asp:CreateUserWizardStep runat="server" ID="RegisterUserWizardStep">
                <ContentTemplate>
                    <p class="message-info">
                        Passwords are required to be a minimum of <%: Membership.MinRequiredPasswordLength %> characters in length.
                    </p>

                    <p class="validation-summary-errors">
                        <asp:Literal runat="server" ID="ErrorMessage" />
                    </p>

                    <fieldset>
                        <legend>Registration Form</legend>
                        <ol>
                            <li>
                                <asp:Label runat="server" AssociatedControlID="UserName">User name</asp:Label>
                                <asp:TextBox runat="server" ID="UserName"  />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName" 
                                    CssClass="field-validation-error" ErrorMessage="The user name field is required." 
                                    ValidationGroup="LoginUserValidationGroup"></asp:RequiredFieldValidator>
                            </li>
                            <li>
                                <asp:Label runat="server" AssociatedControlID="Email">Email address</asp:Label>
                                <asp:TextBox runat="server" ID="Email" TextMode="Email" value ="" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email" 
                                    CssClass="field-validation-error" ErrorMessage="The email address field is required." 
                                    ValidationGroup="LoginUserValidationGroup"></asp:RequiredFieldValidator>
                            </li>

                            <li>
                                <asp:Label runat="server" AssociatedControlID="Password">Password</asp:Label>
                                <asp:TextBox runat="server" ID="Password" TextMode="Password" value="" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" 
                                    CssClass="field-validation-error" ErrorMessage="The password field is required."
                                     ValidationGroup="LoginUserValidationGroup"></asp:RequiredFieldValidator>
                            </li>
                            <li>
                                <asp:Label runat="server" AssociatedControlID="ConfirmPassword">Confirm password</asp:Label>
                                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword" 
                                     CssClass="field-validation-error" Display="Dynamic" ErrorMessage="The confirm password field is required." 
                                    ValidationGroup="LoginUserValidationGroup"></asp:RequiredFieldValidator>
                                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                                     CssClass="field-validation-error" Display="Dynamic" ErrorMessage="The password and confirmation password do not match."
                                     ValidationGroup="LoginUserValidationGroup"></asp:CompareValidator>
                            </li>
                        </ol>
                        <asp:Button runat="server" ValidateRequestMode="Disabled" CommandName="MoveNext" Text="Register" OnClientClick="javascript:getUserInfoFromParse();"  />
                    </fieldset>
                </ContentTemplate>
                <CustomNavigationTemplate />
            </asp:CreateUserWizardStep>
        </WizardSteps>
    </asp:CreateUserWizard>
</asp:Content>


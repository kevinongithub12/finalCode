<%@ Page Title="UserName:" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="UserProfile.aspx.cs" Inherits="Contact" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <!DOCTYPE html>
    <html>
        <head>
            <meta charset="UTF-8" />
		    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		    <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
		    <title>Race Tracker: User Profile Grid Gallery</title>
		    <meta name="description" content="UserList of up to 30 users nearby as a collague" />
		    <meta name="keywords" content="google getting started gallery, image gallery, image grid, template, masonry" />
		    <meta name="author" content="Codrops" />
		    <link rel="shortcut icon" href="../favicon.ico">
		    <link rel="stylesheet" type="text/css" href="Content/css/demo.css" />
		    <link rel="stylesheet" type="text/css" href="Content/css/component.css" />
		    <script src="Scripts/js/modernizr.custom.js"></script>
        </head>

    <meta charset="utf-8" />
    <title><%: Page.Title %> - My ASP.NET Application</title>        
        
        <link href="Content/bootstrap-theme.css" rel="stylesheet" />
        <link href="Content/themes/base/jquery.ui.theme.css" rel="stylesheet" />
        <link href="http://localhost:10022/code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css" rel="stylesheet">


        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
        <script type="text/javascript" src="http://www.parsecdn.com/js/parse-1.2.15.min.js"></script>
        <script type="text/javascript" 
            src="http://connect.facebook.net/en_US/sdk.js#xfbml=1&appId=714038725351814&version=v2.1"></script>
        <script type="text/javascript" src="//code.jquery.com/jquery-2.1.1.js"></script>
        <script type="text/javascript" src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
        <script src="Scripts/jquery-2.1.1.js"></script>

        <script type="text/javascript">
      

            $(document).ready(function () {
                var appID, appKey;
                appID  = "fKnBZJbUYPNfV5BgcPGPAFhem5Y6Xpp5mZPkJ9fk";
                appKey = "GUYeo7lR7nVm81iMlTlxOzyF5mVc3xZbtVI9zWBD";

                Parse.initialize(appID, appKey);  //

                window.fbAsyncInit = function () {
                    Parse.FacebookUtils.init({ // this line replaces FB.init({
                        appId: '714038725351814', // Facebook App ID
                        status: true, // check Facebook Login status
                        cookie: true, // enable cookies to allow Parse to access the session
                        xfbml: true,
                        version: 'v2.1',//Uses the correct version of the SDK
                    });
                    //FB.init({
                    //    appId: '223615011031939',
                    //    status: true, // check login status
                    //    cookie: true, // enable cookies to allow the server to access the session
                    //    xfbml: true,  // parse XFBML
                    //    // channelUrl  : 'http://www.yourdomain.com/channel.html', // Custom Channel URL
                    //    oauth: true //enables OAuth 2.0
                    //});

                    FB.Canvas.setSize();
                };

                (function (d, s, id) {                      //facebook SDK callback
                    var js, fjs = d.getElementsByTagName(s)[0];
                    if (d.getElementById(id)) { return; }
                    js = d.createElement(s); js.id = id;
                    js.src = "//connect.facebook.net/en_US/sdk.js";
                    fjs.parentNode.insertBefore(js, fjs);
                }(document, 'script', 'facebook-jssdk'));

                //Get the Current User object

                var currentUser = Parse.User.current();
                currentUser.isCurrent ? console.log("isCurrentUser") : window.location.href = '~/Login.aspx';

                //if retrieved, then 
                if (currentUser != null ) {
                    if (currentUser.get("profilePicModel")) {        //if exists == true
                        var imageFile = currentUser.get("profilePicModel")._url;
                        $("#profileImg")[0].src = imageFile;
                    }
                    else {
                        var defaultURL = "Images/user_imgs/bugatti-veyron-gran-sport-gif.gif";
                        $("#profileImg")[0].src = defaultURL;
                    }
                }

                $('#profilePhotoFileUpload').bind(function(){
                    // add loading image to div

                    $('#loading').html('<img src="Images/img/722.GIF"/> loading...');
                    // run ajax request
                    $.ajax({
                        type: "GET",
                        dataType: "json",
                        url: "https://api.github.com/users/jveldboom",
                        success: function () {
                            // replace div's content with returned data
                            setTimeout(function () {                 
                            },
                            3300);
                        }
                    });
                });
               
            

                $('#profilePhotoFileUpload').bind("change", function (e) {
                    var fileUploadControl = $("#profilePhotoFileUpload")[0];
                   
                    var file = fileUploadControl.files[0];
                    var name = file.name; //This does *NOT* need to be a unique name
                    var parseFile = new Parse.File(name, file);

                    parseFile.save().then(
                      function () {
                          saveImageFile(parseFile);
                          currentUser.set("profilePicModel", parseFile);
                          currentUser.save(null, {                        //save the point!
                              success: function () {
                               //   alert("Success fuck u!");
                              }
                          });
                          localStorage.setItem("profilePicModel", parseFile);
                      },
                      function (error) {
                         // alert("error");
                      }
                    );
                });

                function saveImageFile(parseFile) {
                    var userprofilePic = new Parse.Object("userprofilePic");
                    userprofilePic.set("profileImg", parseFile);
                    userprofilePic.save(null,
                    {
                        success: function (gameScore) {
                            var photo = gameScore.get("profileImg");
                            $("#profileImg")[0].src = photo.url();
                            photo.save();
                        },
                        error: function (gameScore, error) {
                           // alert('Failed to create new object, with error code: ' + error.description);
                        }
                    });
                }
               
            });
           // $.removeAttr(".pam _3-95 uiBoxRed");
        </script>
    </head>
    <body>
          <div id="fb-root">
              <span>

              </span>
          </div>

          <script>
             $(document).ready(function () {
             window.fbAsyncInit = function () {
                 FB.init({
                     appId: '714038725351814', //Your facebook APP here
                     cookie: true // enable cookies to allow the server to access the session
                 });
             }

                 window.onload = function () {
                     FB.Canvas.setAutoGrow();
                 }
             });
             
         </script>

        
         <div class="fb-like" data-share="true" data-width="450" data-show-faces="true"></div>
    </body>

    <section class="contact">
        <header style="align-items:center">
            <h3 style="vertical-align:top";> <%=Title %> <%=User.Identity.Name %></h3>
            <div id="imgHolder" style="vertical-align:top; padding-left:80px;">
                    <img  id="profileImg" src="/Images/tumblr_mxbvss8Tp41sd5eo5o1_500.gif" style="vertical-align:top"  />
            </div>
            <div class="photoupload" style="vertical-align:top;" >
                <input type="file"  id="profilePhotoFileUpload" 
                        style=" padding-left:80px; position:relative">
           </div>
        </header>
        
    </section>

    <section class="contact">
        <div id="loading">
            <img id="ajax-spin" src="Images/img/722.GIF" />
        </div>
        <header>
            <h3>Statistics:</h3>
        </header>
        <p>
            <span class="label">Wins: 24</span>
            <span><a href="mailto:Support@example.com" id="wins"></a></span>
        </p>
        <p>
            <span class="label">Losses: 5</span>
            <span><a href="mailto:Marketing@example.com"></a></span>
        </p>
        <p>
            <h3>Current Race in Progress? <a href="LocationMaps.html">True</a></h3>
            <span class="label" id="currUserDestination">Destination Set </span>
        </p>
    </section>
        <div class="fb-comments" data-href="http://developers.facebook.com/docs/plugins/comments/" 
            data-numposts="50" data-colorscheme="dark"></div>
</asp:Content>

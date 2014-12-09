using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.Membership.OpenAuth;
using System.Web.Services;
using System.Web.Script.Services;
using System.Net;

namespace WebSite2
{
    public static class AuthConfig
    {
        public static void RegisterOpenAuth()
        {
            // See http://go.microsoft.com/fwlink/?LinkId=252803 for details on setting up this ASP.NET
            // application to support logging in via external services.

            //OpenAuth.AuthenticationClients.AddTwitter(
            //    consumerKey: "your Twitter consumer key",
            //    consumerSecret: "your Twitter consumer secret");
           
           OpenAuth.AuthenticationClients.AddFacebook(
                appId: "714038725351814",
                appSecret: "319b722c03445d3e7ed4d4d920d96c9c");

            //OpenAuth.AuthenticationClients.AddMicrosoft(
            //    clientId: "your Microsoft account client id",
            //    clientSecret: "your Microsoft account client secret");

            OpenAuth.AuthenticationClients.AddGoogle();
        }

    }
}
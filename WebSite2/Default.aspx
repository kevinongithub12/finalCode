<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

        <asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
             <div class="content-wrapper">
            <hgroup  class="">
               <%: Title %>
                
            </hgroup>
            <p>
            </p>
        </div>
            <h3>What is Race Tracker??</h3>
            <ol class="round">
                <li class="one">
                    <h5>Race Tracker. Track your racing progress against your friends.
            Real life like experience!!</h5>
                    <a href="http://go.microsoft.com/fwlink/?LinkId=245146"></a>
                </li>
                <li class="two">
                    <h5>Connect with your friends and race them wherever they are!!!</h5>
                    <a href="http://go.microsoft.com/fwlink/?LinkId=245147"></a>
                </li>
                <li class="three">
                    <h5>Login with your user account,facebook, or even microsoft account, and start sharing your experience !!!</h5>
                    <a href="http://go.microsoft.com/fwlink/?LinkId=245143"></a>
                </li>
            </ol>
        </asp:Content>
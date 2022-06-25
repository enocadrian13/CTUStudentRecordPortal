<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forgetpassword.aspx.cs" Inherits="CTUStudentRecordPortal.forgetpassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CTU Student Record Portal</title>
    <link rel="icon" href="srcfolder/ctu-logo.png" type="image/icon type" />
    <link rel="stylesheet" href="srcfolder/style.css" />
        <style>
            *{
                margin: 0;
                padding: 0;
            }

            body{
                font-family: 'Inter', sans-serif;
                background-color: #F8DEB7;
            }
            #forgotpassword-container{
                background-color: #FFC46C;
                width: 480px;
                height: 585px;
                margin-left: auto;
                margin-right: auto;
                margin-top: 89px;
                border-radius: 20px;
            }
            #firstnameTB{
                width: 190px;
                height: 35px;
                text-indent: 10px;
                font-size: 30px;
                border: 0;
            }
            #lastnameTB{
                width: 190px;
                height: 35px;
                text-indent: 10px;
                font-size: 30px;
                border: 0;
            }
            #birthdateTB{
                width: 389px;
                height: 35px;
                text-indent: 10px;
                font-size: 30px;
                border: 0;
            }
            #emailTB{
                width: 389px;
                height: 35px;
                text-indent: 10px;
                font-size: 30px;
                border: 0;
            }
            #usernameTB{
                width: 389px;
                height: 35px;
                text-indent: 10px;
                font-size: 30px;
                border: 0;
            }
            #submitBTN{
                width: 190px;
                height: 35px;
                margin-top: 10px;
                margin-left: 100px;
                font-size: 25px;
                border: 0;
                cursor: pointer;
                border-radius: 20px;
                transition: 0.6s;
            }
            #submitBTN:hover{
                font-weight: 700;
                background-color: #ffa319;
                cursor: pointer;
            }
            #signinBTN{
                width: 190px;
                height: 35px;
                margin-left: 100px;
                font-size: 25px;
                border: 0;
                cursor: pointer; 
                border-radius: 20px;
            }
            #signinBTN:hover{
                font-weight: 700;
                background-color: #ffa319;
                cursor: pointer;
            }
        </style>
        <script>
            var borderColor = "2px solid #F72525";

            //changes the border color if the user inputted the wrong/incorrect values
            function fnTextBoxBorder() {
                document.getElementById('firstnameTB').style.border = borderColor;
            }

            function lnTextBoxBorder() {
                document.getElementByID('lastnameTB').style.border = borderColor;
            }

            function bdateTextBoxBorder() {
                document.getElementById('birthdateTB').style.border = borderColor;
            }

            function emailTextBoxBorder() {
                document.getElementById('emailTB').style.border = borderColor;
            }

            function unameTextBoxBorder() {
                document.getElementById('usernameTB').style.border = borderColor;
            }
            //displays error message if the textbox value is null/empty
            function fnameMustNotEmpty() {
                var con = document.getElementById('name-error-message');
                fnTextBoxBorder();

                con.innerHTML = "First name must not be empty"
                con.style.color = "#F72525";
            }
            function lnameMustNotEmpty() {
                var con = document.getElementById('name-error-message');
                lnTextBoxBorder();

                con.innerHTML = "Last name must not be empty"
                con.style.color = "#F72525";
            }
            function bdayMustNotEmpty() {
                var con = document.getElementById('bday-error-message');
                bdateTextBoxBorder();

                con.innerHTML = "Birthdate must not be empty"
                con.style.color = "#F72525";
            }
            function emailMustNotEmpty() {
                var con = document.getElementById('email-error-message');
                emailTextBoxBorder();

                con.innerHTML = "Email must not be empty"
                con.style.color = "#F72525";
            }
            function unameMustNotEmpty() {
                var con = document.getElementById('username-error-message');
                unameTextBoxBorder();

                con.innerHTML = "Username must not be empty"
                con.style.color = "#F72525";
            }
        </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="forgotpassword-container">
            <div id="top-container">
                <img src="srcfolder/ctu-logo.png" alt="ctu-logo" width="75px" height="75px" style="margin-left: 205px; margin-top: 25px;" />
                <div style="font-size: 17px; font-weight: 800; text-align: center;">Cebu Technological University</div>
                <div style="font-size: 17px; font-weight: 400; text-align: center;">Student Record Portal</div>
                <div style="font-size: 27px; font-weight: 700; margin-top: 40px; margin-left: 40px;">Find Your Account:</div>
            </div>
            <div id="forgetpassword-form" style="margin-left: 40px; margin-top: 10px;">
                <asp:TextBox ID="firstnameTB" runat="server" placeholder="First name"></asp:TextBox>
                <asp:TextBox ID="lastnameTB" runat="server" placeholder="Last name"></asp:TextBox>
                <div id="name-error-message" style="font-size: 10px; font-weight: 600;"></div>
                <br />
                <asp:TextBox ID="birthdateTB" runat="server" placeholder="mm/dd/yyyy"></asp:TextBox>
                <div id="bday-error-message" style="font-size: 10px; font-weight: 600;"></div>
                <br />
                <asp:TextBox ID="emailTB" runat="server" placeholder="Email"></asp:TextBox>
                <div id="email-error-message" style="font-size: 10px; font-weight: 600;"></div>
                <br />
                <asp:TextBox ID="usernameTB" runat="server" placeholder="Username"></asp:TextBox>
                <div id="username-error-message" style="font-size: 10px; font-weight: 600;"></div>
                <br />
                <asp:Button ID="submitBTN" runat="server" Text="Submit" OnClick="submitBTN_Click" />
                <div style="margin-left: 190px; margin-top: 10px; font-weight: 600;">or</div>
                <asp:Button ID="signinBTN" runat="server" Text="Sign in" OnClick="signinBTN_Click" />
            </div>
        </div>
    </form>
</body>
</html>

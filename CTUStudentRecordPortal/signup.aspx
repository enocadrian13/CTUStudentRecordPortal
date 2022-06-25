<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="CTUStudentRecordPortal.signup" %>

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
        #signup-container{
            margin-top: 40px;
            margin-left: auto;
            margin-right: auto;
            background-color: #FFC46C;
            width: 54%;
            height: 705px;
            border-radius: 15px;
        }
        #firstnameTB{
            width: 335px;
            font-size: 33px;
            height: 45px;
            text-indent: 10px;
            border: 0;
        }
        #lastnameTB{
            width: 335px;
            font-size: 33px;
            height: 45px;
            text-indent: 10px;
            border: 0;
        }
        #birthdateTB{
            width: 335px;
            height: 45px;
            font-size: 33px;
            text-indent: 5px;
            border: 0;
        }
        #emailTB{
            width: 675px;
            height: 45px;
            font-size: 33px; 
            text-indent: 10px;
            border: 0;
        }
        #usernameTB{
            width: 675px;
            height: 45px;
            font-size: 33px;
            text-indent: 10px;
            border: 0;
        }
        #passwordTB{
            width: 335px;
            font-size: 33px;
            height: 45px;
            text-indent: 10px; 
            border: 0;
        }
        #confirmpasswordTB{
            width: 335px;
            font-size: 33px;
            height: 45px;
            text-indent: 10px;
            border: 0;
        }
        #termsCB{
            width: 30px;
            height: 30px;
            margin-top: 5px;
            border: 0;
            margin-bottom: 20px;
        }
        #termsLBL{
            padding-left: 17px;
            font-size: 28px;
            border: 0;
            font-weight: 500;
        }
        #signinBTN{
            height: 45px;
            width: 236px;
            font-size: 27px;
            margin-right: 200px;
            border: 0;
            cursor: pointer;
            border-radius: 15px;
            transition: 0.6s;
        }
        #signinBTN:hover{
            font-weight: 700;
            background-color: #ffa319;
            cursor: pointer;
        }
        #registerBTN{
            height: 45px;
            width: 236px;
            font-size: 27px;
            border: 0;
            cursor: pointer;
            border-radius: 15px;
            transition: 0.6s;
        }
        #registerBTN:hover{
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

        function passwordTextBoxBorder() {
            document.getElementById('passwordTB').style.border = borderColor;
        }
        function confirmTextBoxBorder() {
            document.getElementById('confirmpasswordTB').style.border = borderColor;
        }
        function termsCheckBoxBorder() {
            document.getElementById('termsCB').style.border = borderColor;
        }

        //displays an message below its corresponding textbox
        function passwordDoNotMatchText() {
            var con = document.getElementById('password-error-message');

            document.getElementById('passwordTB').style.border = borderColor;
            document.getElementById('confirmpasswordTB').style.border = borderColor;
            con.innerHTML = "Password do not match.";
            con.style.color = "#F72525";
        }
        function passwordMatchText() {
            var con = document.getElementById('password-error-message');

            con.innerHTML = "Password do match.";
            con.style.color = "#06B500";
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
        function passwordMustNotEmpty() {
            var con = document.getElementById('password-error-message');
            document.getElementById('passwordTB').style.border = borderColor;

            con.innerHTML = "Password must not be empty.";
            con.style.color = "#F72525";
        }
        function confirmMustNotEmpty() {
            var con = document.getElementById('password-error-message');
            document.getElementById('confirmpasswordTB').style.border = borderColor;

            con.innerHTML = "Confirm must not empty.";
            con.style.color = "#F72525";
        }

        //displays error message if had the same value
        function emailExistText() {
            var con = document.getElementById('email-error-message');

            document.getElementById('emailTB').style.border = borderColor;
            con.innerHTML = "This email is already been used.";
            con.style.color = "#F72525";
        }
        function usernameExistText() {
            var con = document.getElementById('username-error-message');

            document.getElementById('usernameTB').style.border = borderColor;
            con.innerHTML = "This username is already been used.";
            con.style.color = "#F72525";
        }
        function termsMustBeChecked() {
            var con = document.getElementById('terms-error-message');

            con.innerHTML = "Please accept Terms and Conditions to Register";
            con.style.color = "#F72525";
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="signup-container">

            <div id="title-container" style="padding-left: 70px; padding-top: 50px;">
                <div style="font-size: 24px; font-weight: 800;">Cebu Technological University</div>
                <div style="font-size: 22px; font-weight: 400;">Student Record Portal</div>
                <div style="padding-top: 40px; font-size: 50px; font-weight: 900;">Create Your Portal Account</div>
            </div>

            <div id="signup-form" style="padding-left: 70px; padding-top: 10px;">
                <asp:TextBox ID="firstnameTB" runat="server" placeholder="First name"></asp:TextBox>
                <asp:TextBox ID="lastnameTB" runat="server" placeholder="Last name"></asp:TextBox>
                <div id="name-error-message" style="font-size: 10px; font-weight: 700;"></div>
                <br />
                <asp:TextBox ID="birthdateTB" runat="server" placeholder="mm/dd/yyyy"></asp:TextBox>
                <div id="bday-error-message" style="font-size: 10px; font-weight: 700;"></div>
                <br />
                <asp:TextBox ID="emailTB" runat="server" placeholder="Email" TextMode="Email"></asp:TextBox>
                <asp:RegularExpressionValidator ID="revEmailAddress" runat="server" SetFocusOnError="true"
                        Display="None" ControlToValidate="emailTB" resourceKey="revEmailAddress"
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="register"></asp:RegularExpressionValidator>
                <div id="email-error-message" style="font-size: 10px; font-weight: 700;"></div>
                <br/>
                <asp:TextBox ID="usernameTB" runat="server" placeholder="Username"></asp:TextBox>
                <div id="username-error-message" style="font-size: 10px; font-weight: 700;"></div>
                <br />
                <asp:TextBox ID="passwordTB" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                <asp:TextBox ID="confirmpasswordTB" runat="server" placeholder="Confirm" TextMode="Password"></asp:TextBox>
                <div id="password-error-message" style="font-size: 10px; font-weight: 700;">Use 8 or more characters with a mix of letters, numbers & symbols</div>
                <br />
                <asp:CheckBox ID="termsCB" runat="server" />
                <asp:Label ID="termsLBL" runat="server" Text="I agree to terms and conditions."></asp:Label>
                <div id="terms-error-message" style="font-size: 10px; font-weight: 700;"></div>
                <br />
                <asp:Button ID="signinBTN" runat="server" Text="Sign in instead" OnClick="signinBTN_Click" />
                <asp:Button ID="registerBTN" runat="server" Text="Register Account" OnClick="registerBTN_Click" />
            </div>
            
        </div>
    </form>
</body>
</html>

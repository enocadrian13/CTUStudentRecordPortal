<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="CTUStudentRecordPortal.login" %>

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
                background: linear-gradient(to right,
                #F8DEB7 0%,
                #F8DEB7 50%,
                #f6cc8c 50%,
                #f6cc8c 100%);
                font-family: 'Inter', sans-serif;
            }
            #login-form-container{
                background: #FFC46C;
                height: 460px;
                width: 25%;
                margin-top: 90px;
                margin-bottom: 40px;
                margin-left: auto;
                margin-right: auto;
                border-radius: 20px;
                padding: 50px;
                box-shadow: 10px 10px #e8aa4c;
            }
            #portal-name{
                font-weight: 300;
            }
            #left-container{
                float: left;
                padding-top: 15px;
            }
            #right-container{
                float: right;
            }
            #sign-intitle{
                padding-top: 125px;
                text-align: center;
            }
            #login-form{
                padding-top: 10px;
                border-bottom: 5px solid black;
                padding-bottom: 15px;
            }
            #signbtn:hover{
                background-color: #ffa319;
            }
            #userNameTB{
                border: none;
                margin-bottom: 20px;
                border-radius: 10px;
                border: none;
                text-indent: 10px;
                font-size: 25px;
            }
            #passwordTB{
                border: 0;
                border-radius: 10px;
                margin-bottom: 20px;
                border-color: white;
                text-indent: 10px;
                font-size: 25px;
            }
            #signinBTN{
                float: right;
                height: 40px;
                width: 200px;
                border: none;
                cursor: pointer;
                border-radius: 30px;
                transition: 0.6s;
            }
            #signinBTN:hover{
                font-weight: 700;
                background-color: #ffa319;
                cursor: pointer;
            }
            #rememberMeCB{
                width: 20px; 
                height: 20px;
            }
            #signupBTN{
                margin-left: 5px;
                width: 100px;
                height: 20px;
                text-align: center;
                background: none;
                border: 0;
                cursor: pointer;
            }
            #signupBTN:hover{
                text-decoration: underline;
            }
            #forgotPasswordBTN{
                margin-left: 10px;
                width: 100px;
                height: 20px;
                text-align: center;
                cursor: pointer;
                background: #FFC46C;
                border: none;
            }
            #forgotPasswordBTN:hover{
                text-decoration: underline;
            }
            #error-message{
                font-size: 10px;
                font-weight: 700;
                color: red;
            }
        </style>

    <script type="text/javascript">
            function showWarningMessage(){
                window.alert("warning this website is for administrator only");
            }
            function changeColor(){
                var getColor = "red";
                var password = document.getElementById("passwordTB");
                var msg = document.getElementById("error-message");
                password.style.border = "2px solid red";
                password.style.borderColor = getColor;
                password.style.marginBottom = "0px";
                msg.innerHTML = "! Incorrect Username or Password. Try Again or click forgot password to reset";
                msg.style.marginBottom = "20px";
            }
        window.history.forward(1);
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="login-form-container">
            <div id="title-container">
                <div id="left-container">
                    <h3>Cebu Technological University </h3>
                    <h4 id="portal-name">Student Record Portal</h4>
                </div>
                
                <div id="right-container">
                    <img src="srcfolder/ctu-logo.png" alt="ctu-logo" width="110px" height="110px" />
                </div>

                <div id="sign-intitle">
                    <h2>Sign in</h2>
                </div>

                <div id="login-form">
                    <asp:Label ID="usernamelbl" runat="server" Text="Username"></asp:Label>
                    <br />
                    <asp:TextBox ID="userNameTB" runat="server" Height="40px" Width="390px" ></asp:TextBox>
                    <asp:Label ID="Label1" runat="server" Text="Password"></asp:Label>
                    <br />
                    <asp:TextBox ID="passwordTB" runat="server" Height="40px" Width="390px" TextMode="Password" ></asp:TextBox>
                    <div id="error-message"></div>
                    <asp:CheckBox ID="rememberMeCB" runat="server" Text=" Remember Me?"/>
                    <asp:Button ID="signinBTN" runat="server" Text="Sign In" Height="40px" Width="200px" OnClick="signinBTN_Click"/>
                    <h4 style=" margin-top: 40px; text-align: center;">Don't Have an Account?<asp:Button ID="signupBTN" runat="server" Text="Sign up here" OnClick="signupBTN_Click" /></h4>
                </div>

                <div id="forgot-container">
                    <h4 style="text-align: center; margin-top: 25px;">Forgot your password?<asp:Button ID="forgotPasswordBTN" runat="server" Text="Click Here" OnClick="forgotPasswordBTN_Click" /></h4>
                </div>

            </div>
            
        </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addnewstudent.aspx.cs" Inherits="CTUStudentRecordPortal.addnewstudent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CTU Student Record Portal</title>
    <link rel="icon" href="srcfolder/ctu-logo.png" type="image/icon type" />
    <link rel="stylesheet" href="srcfolder/style.css" />
    <style>
            input::-webkit-outer-spin-button,
            input::-webkit-inner-spin-button {
              -webkit-appearance: none;
              margin: 0;
            }
            *{
                margin: 0;
                padding: 0;
            }
            body{
                font-family: 'Inter', sans-serif;
            }
            #nav-container{
                background: #FFBD59;
                height: 65px;
                width: auto;
            }
            #homeBtn{
                padding-left: 60px; 
                padding-right: 5px; 
                font-size: 1.4em;
                float: left;
                background-color: #FFBD59;
                background-image: url('srcfolder/ctu-logo.png');
                background-repeat: no-repeat;
                border: 0;
                background-size: 55px;
                margin-left: 10px;
                margin-top: 5px;
                width: 300px;
                height: 60px;
                cursor: pointer;
                font-weight: 600;
                border-radius: 30px;
            }
            #searchBtn{
                float: right; 
                padding-left: 20px; 
                margin-top: 17px; 
                margin-right: 30px; 
                height: 30px; 
                width: 100px; 
                border: 0; 
                border-bottom-right-radius: 20px; 
                border-top-right-radius: 20px; 
                cursor: pointer;
                background-image: url('srcfolder/search-user-svg.svg');
                background-size: 25px;
                background-repeat: no-repeat;
                background-position: 10px 5px;
                font-weight: 600;
                transition: 0.5s;
            }
            #searchBtn:hover{
                background-color: #fdaf3a;
            }
            #searchTB{
                float: right; 
                margin-top: 17px; 
                height: 30px; 
                width: 300px; 
                border: 0; 
                text-indent: 5px;
            }
            #hero-container{
                width: 100%;
                height: 703px;
                background: linear-gradient(to right,
                #f6d29c 0%,
                #f6d29c 40%,
                #fedeae 40%,
                #fedeae 100%);
                font-family: 'Inter', sans-serif;
            }
            #logoutBtn{
                float: right; 
                margin-right: 50px; 
                width: 120px; 
                height: 16px; 
                background: #f1b150; 
                border: 2px solid #f4ac41; 
                border-radius: 30px; cursor: pointer;
                transition: 0.3s;
            }
            #logoutBtn:hover{
                font-weight: 700;
                background-color: #fdaf3a;
            }
            /* reqistration from container*/
            #registration-form-container{
                margin-left: 60px;
                margin-top: 10px;
                width: 1430px;
                height: 580px;
                background-color: #f7ca88;
                border: 1px solid #000000;
            }
            /* contents of the registration form */
            #registration-form{
                padding-left: 40px;
                padding-top: 45px;
            }
            /* Credits Container */
            #credits-container{
                background-color: #FFC46C;
                width: 100%;
                height: 18px;
                padding-top: 5px;
                text-align: center;
            }
            /*Registration form Label styles*/
            #lastnameLbl{
                font-size: 19px;
                font-weight: 600; 
                margin-bottom: 15px;
            }
            #lastnameTB{
                margin-bottom: 15px; 
                margin-left: 62px; 
                width: 400px; 
                height: 35px; 
                border: 0; 
                text-indent: 10px; 
                font-size: 20px;
            }
            #genderTB{
                float: right; 
                margin-right: 40px; 
                margin-bottom: 15px; 
                width: 180px; 
                height: 35px;
                border: white; 
                text-indent: 10px; 
                font-size: 20px;
            }
            #genderLbl{
                float: right;
                font-size: 19px;
                font-weight: 600; 
                margin-bottom: 15px; 
                margin-right: 20px; 
            }
            #suffixTB{
                float: right;
                margin-right:10px;
                margin-bottom: 15px;
                width: 120px;
                height: 35px; 
                border: 0; 
                text-indent: 10px; 
                font-size: 20px;
            }
            #suffixLbl{
                float: right; 
                font-size: 19px; 
                font-weight: 600; 
                margin-bottom: 15px; 
                margin-right: 20px;
            }
            #firstnameLbl{
                font-size: 19px; 
                font-weight: 600; 
                margin-bottom: 15px;
            }
            #firstnameTB{
                margin-bottom: 15px;
                margin-left: 60px; 
                width: 400px; 
                height: 35px; 
                border: white; 
                text-indent: 10px;
                font-size: 20px;
            }
            #middlenameTB{
                float: right;
                margin-right: 40px;
                margin-bottom: 15px;
                width: 400px;
                height: 35px; 
                border: 0; 
                text-indent: 10px; 
                font-size: 20px;
            }
            #middlenameLbl{
                float: right;
                font-size: 19px; 
                font-weight: 600; 
                margin-bottom: 15px;
            }
            #birthdateLbl{
                font-size: 19px; 
                font-weight: 600;
                margin-bottom: 15px;
            }
            #birthdateTB{
                margin-bottom: 15px; 
                margin-left: 74px; 
                width: 400px;
                height: 35px; 
                border: 0; 
                text-indent: 10px;
                font-size: 20px;
            }
            #addressTB{
                float: right; 
                margin-right: 40px;
                margin-bottom: 15px;
                width: 400px;
                height: 35px; 
                border: 0; 
                text-indent: 10px; 
                font-size: 20px;
            }
            #addressLbl{
                float: right;
                font-size: 19px;
                font-weight: 600;
                margin-bottom: 15px; 
                margin-right: 43px;
            }
            #emailLbl{
                font-size: 19px;
                font-weight: 600;
                margin-bottom: 15px;
            }
            #emailTB{
                margin-bottom: 15px;
                margin-left: 30px;
                width: 400px; 
                height: 35px; 
                border: 0; 
                text-indent: 10px;
                font-size: 20px;
            }
            #contactTB{
                float: right;
                margin-right: 40px;
                margin-bottom: 15px;
                width: 400px; 
                height: 35px; 
                border: 0; 
                text-indent: 10px; 
                font-size: 20px;
            }
            #contactLbl{
                float: right;
                font-size: 19px;
                font-weight: 600;
                margin-bottom: 15px;
                margin-right: 15px;
            }
            #enrolledprogramLbl{
                font-size: 19px; 
                font-weight: 600; 
                margin-bottom: 15px;
            }
            #enrolledprogramTB{
                margin-bottom: 15px;
                margin-left: 4px;
                width: 400px;
                height: 35px;
                border: 0; 
                width: 400px; 
                height: 35px; 
                border: 0; 
                text-indent: 10px; 
                font-size: 20px;
            }
            #yearlevelTB{
                float: right;
                margin-right: 40px;
                margin-bottom: 15px; 
                width: 400px;
                height: 35px; 
                border: 0; 
                text-indent: 10px;
                font-size: 20px;
            }
            #yearlevelLbl{
                float: right; 
                font-size: 19px; 
                font-weight: 600; 
                margin-bottom: 15px; 
                margin-right: 24px;
            }
            #enrollmentstatusLbl{
                font-size: 19px;
                font-weight: 600;
                margin-bottom: 15px;
            }
            #irregularCB{
                margin-bottom: 15px;
            }
            #regularCB{
                margin-bottom: 15px;
            }
            #creditunitTB{
                float: right; 
                margin-right: 40px;
                margin-bottom: 15px; 
                width: 400px; 
                height: 35px; 
                border: 0; 
                text-indent: 10px; 
                font-size: 20px;
            }
            #creditunitLbl{
                float: right; 
                font-size: 19px; 
                font-weight: 600; 
                margin-bottom: 15px;
                margin-right: 20px;
            }
            #pictureLbl{
                font-size: 19px;
                font-weight: 600;
            }
            #submitBtn{
                margin-left: 500px;
                margin-top: 30px;
                background: #FFBD59;
                border: 0;
                width: 430px; 
                height: 45px;
                border-radius: 30px;
                cursor: pointer;
                transition: 0.6s;
            }
            #submitBtn:hover{
                background-color: #f9a424;
            }
            #idLbl{
                font-size: 19px;
                font-weight: 600;
                margin-bottom: 15px;
            }
            #idTB{
                margin-bottom: 15px;
                margin-left: 62px; 
                width: 400px; 
                height: 35px; 
                border: 0; 
                text-indent: 10px; 
                font-size: 20px;
            }

            .alert {
                padding: 20px;
                background-color: #f44336;
                color: white;
                opacity: 1;
                transition: opacity 0.6s;
                position: fixed;
                top: 0;
                left: 0;
                width: 1500px;
            }

            .alert.success {background-color: #04AA6D;}
            .alert.info {background-color: #2196F3;}
            .alert.warning {background-color: #ff9800;}

            .closebtn {
                margin-left: 15px;
                color: white;
                font-weight: bold;
                float: right;
                font-size: 22px;
                line-height: 20px;
                cursor: pointer;
                transition: 0.3s;
            }

            .closebtn:hover {
                color: black;
            }
    </style>
    <script>
        var br = "1px solid red";

        function showErrorMessage0() {
            document.getElementById('error-message').innerHtml = "Select a file to Upload";
        }

        function showErrorMessage1() {
            document.getElementById('error-message').innerHtml = "file extension must be.jpg, .png, or.jpeg type.no file is chosen or empty";
        }

        function showErrorMessage2() {
            document.getElementById('error-message').innerHtml = "file should not exceed 2mb or 2000kb";
        }

        //sets search student id textbox border to red and displays message
        function searchBoxBorder() {
            document.getElementById('searchTB').style.border = br;
            const msg = "Student's Id must not contain a letter.";
            var code = 2;
            displayMessage(msg, code);
        }

        //sets student id textbox border to red
        function idTextBoxBorder() {
            document.getElementById('idTB').style.border = br;
        }
        //displays popup message if student id is null/empty
        function idTextboxIsEmpty() {
            idTextBoxBorder();
            const msg = "Student's Id must not be empty.";
            var code = 2;
            displayMessage(msg, code);
        }
        //displays a popup message if student id contains a character
        function idTextboxContainsCharacter() {
            idTextBoxBorder();
            const msg = "Student's Id must not contain a character.";
            var code = 2;
            displayMessage(msg, code);
        }

        //sets search student last name textbox border to red
        function lnameTextBoxBorder() {
            document.getElementById('lastnameTB').style.border = br;
        }
        //displays a popup message if student last name is null/empty
        function lnameTextboxIsEmpty() {
            const msg = "Student's Last name must not be empty.";
            var code = 2;
            displayMessage(msg, code);
        }

        //sets search student gender textbox border to red
        function genderTextBoxBorder() {
            document.getElementById('genderTB').style.border = br;
        }
        //displays a popup message if student gender selected the default choice
        function genderTextboxDefaultChoice() {
            const msg = "Select the student's gender.";
            var code = 2;
            displayMessage(msg, code);
        }

        //sets search student first name textbox border to red
        function fnameTextBoxBorder() {
            window.alert("Enter the student first name");
            document.getElementById('firstnameTB').style.border = br;
        }

        //sets search student middle name textbox border to red
        function mnameTextBoxBorder() {
            window.alert("Enter the student middle name");
            document.getElementById('middlenameTB').style.border = br;
        }

        //sets search student birthdate textbox border to red
        function bdayTextBoxBorder() {
            document.getElementById('birthdateTB').style.border = br;
        }

        //sets search student address textbox border to red
        function addressTextBoxBorder() {
            document.getElementById('addressTB').style.border = br;
        }

        //sets search student email textbox border to red
        function emailTextBoxBorder() {
            document.getElementById('emailTB').style.border = br;
        }

        //sets search student contact number textbox border to red
        function contactTextBoxBorder() {
            document.getElementById('contactTB').style.border = br;
        }

        //sets search student enrolled program textbox border to red
        function programTextBoxBorder() {
            document.getElementById('enrolledprogramTB').style.border = br;
            alert('Select the student enrolled course');
        }

        //sets search student year level textbox border to red
        function yearTextBoxBorder() {
            document.getElementById('yearlevelTB').style.border = br;
        }

        //sets search student sets credit unit textbox border to red
        function creditTextBoxBorder() {
            document.getElementById('creditunitTB').style.border = br;
        }


        function studentIdDoesNotExist() {
            document.getElementById('searchTB').style.border = br;
            const msg = "Student Id does not exist";
            var code = 2;
            displayMessage(msg, code);
        }

        //displays a popup message box
        function displayMessage(string, errorCode) {
            const msg = document.getElementById('display-message');

            var success = `<div class="alert success">
                <span class="closebtn">&times;</span>  
                <strong>Success!</strong> `+ string + `
                </div>`;

            var warning = `<div class="alert warning">
                <span class="closebtn">&times;</span>  
                <strong>Warning!</strong> `+ string + `
                </div>`

            var info = `<div class="alert info">
                <span class="closebtn">&times;</span>  
                <strong>Info!</strong> `+ string + `
                </div>`
            switch (errorCode) {
                //shows a success message
                case 1:
                    msg.innerHTML = success;
                    break;
                // shows a warning message
                case 2:
                    msg.innerHTML = warning;
                    break;
                //shows a info message
                case 3:
                    msg.innerHTML = info;
                    break;
            }
            
            var close = document.getElementsByClassName("closebtn");
            var i;

            for (i = 0; i < close.length; i++) {
                close[i].onclick = function () {
                    var div = this.parentElement;
                    div.style.opacity = "0";
                    setTimeout(function () { div.style.display = "none"; }, 600);
                }
            }
        }


    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="display-message">
            
        </div>

        <div id="nav-container">
            <div id="left-nav">
                <asp:Button ID="homeBtn" runat="server" Text="Student Record Portal" OnClick="homeBtn_Click" />
            </div>
            <div id="right-nav">
                <asp:Button ID="searchBtn" runat="server" Text="Search" OnClick="searchBtn_Click" />
                <asp:TextBox ID="searchTB" runat="server" placeholder="Search Student ID"></asp:TextBox>
            </div>
        </div>

        <div id="hero-container">
            <div id="titlePage" style="font-size: 50px; font-weight: 900; padding-top: 20px; padding-left: 35px;">Add New Student</div>
            <div id="registration-form-container">
                <div style="font-size: 40px; font-weight: 900; padding-left: 25px; padding-top: 10px;">Student Information</div>
                <div id="registration-form">
                    <!--Id Holder-->
                    <asp:Label ID="idLbl" runat="server" Text="Student Id:"></asp:Label>
                    <asp:TextBox ID="idTB" runat="server"></asp:TextBox>
                    <br />
                    <!-- first row -->
                    <asp:Label ID="lastnameLbl" runat="server" Text="Last Name:"></asp:Label>
                    <asp:TextBox ID="lastnameTB" runat="server"></asp:TextBox>
                    <asp:DropDownList ID="genderTB" runat="server">
                        <asp:ListItem Text="--Select Gender--"></asp:ListItem>
                        <asp:ListItem Text="Male"></asp:ListItem>
                        <asp:ListItem Text="Female"></asp:ListItem>
                        <asp:ListItem Text="Others"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:Label ID="genderLbl" runat="server" Text="Gender:"></asp:Label>
                    <asp:TextBox ID="suffixTB" runat="server"></asp:TextBox>
                    <asp:Label ID="suffixLbl" runat="server" Text="Suffix:"></asp:Label>
                    <br />
                    <!-- second row -->
                    <asp:Label ID="firstnameLbl" runat="server" Text="First Name:"></asp:Label>
                    <asp:TextBox ID="firstnameTB" runat="server"></asp:TextBox>
                    <asp:TextBox ID="middlenameTB" runat="server"></asp:TextBox>
                    <asp:Label ID="middlenameLbl" runat="server" Text="Middle Name:"></asp:Label>
                    <br />
                    <!-- third row -->
                    <asp:Label ID="birthdateLbl" runat="server" Text="Birthdate:"></asp:Label>
                    <asp:TextBox ID="birthdateTB" runat="server" placeholder="mm/dd/yyyy"></asp:TextBox>
                    <asp:TextBox ID="addressTB" runat="server"></asp:TextBox>
                    <asp:Label ID="addressLbl" runat="server" Text="Address:"></asp:Label>
                    <br />
                    <!-- fourth row -->
                    <asp:Label ID="emailLbl" runat="server" Text="Email Address:" TextMode="Email"></asp:Label>
                    <asp:TextBox ID="emailTB" runat="server"></asp:TextBox>
                    <asp:TextBox ID="contactTB" runat="server" placeholder="09XXXXXXXXX"></asp:TextBox>
                    <asp:Label ID="contactLbl" runat="server" Text="Contact No:"></asp:Label>
                    <br />
                    <!-- fifth row -->
                    <asp:Label ID="enrolledprogramLbl" runat="server" Text="Enrolled Program:"></asp:Label>
                    <asp:DropDownList ID="enrolledprogramTB" runat="server">
                        <asp:ListItem Text="--Select Course--"></asp:ListItem>
                        <asp:ListItem Text="BIT-AT"></asp:ListItem>
                        <asp:ListItem Text="BIT-CT"></asp:ListItem>
                        <asp:ListItem Text="BIT-TC"></asp:ListItem>
                        <asp:ListItem Text="BIT-ET"></asp:ListItem>
                        <asp:ListItem Text="BIT-GT"></asp:ListItem>
                        <asp:ListItem Text="BSIE"></asp:ListItem>
                        <asp:ListItem Text="BSIT"></asp:ListItem>
                        <asp:ListItem Text="BTLE"></asp:ListItem>
                        <asp:ListItem Text="BEED"></asp:ListItem>
                        <asp:ListItem Text="BSED-M"></asp:ListItem>
                        <asp:ListItem Text="BSP"></asp:ListItem>
                        <asp:ListItem Text="ABLIT"></asp:ListItem>
                        <asp:ListItem Text="ABLET"></asp:ListItem>
                        <asp:ListItem Text="BSES"></asp:ListItem>
                        <asp:ListItem Text="BSA"></asp:ListItem>
                        <asp:ListItem Text="BSTM"></asp:ListItem>
                        <asp:ListItem Text="BHM"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:DropDownList ID="yearlevelTB" runat="server">
                        <asp:ListItem Text="--Select Year Level--"></asp:ListItem>
                        <asp:ListItem Text="1"></asp:ListItem>
                        <asp:ListItem Text="2"></asp:ListItem>
                        <asp:ListItem Text="3"></asp:ListItem>
                        <asp:ListItem Text="4"></asp:ListItem>
                        <asp:ListItem Text="5"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:Label ID="yearlevelLbl" runat="server" Text="Year Level:"></asp:Label>
                    <br />
                    <!-- sixth row -->
                    <asp:Label ID="enrollmentstatusLbl" runat="server" Text="Enrollment Status:"></asp:Label>
                    <asp:CheckBox ID="irregularCB" runat="server" /> Irregular
                    <asp:CheckBox ID="regularCB" runat="server" /> Regular
                    <asp:TextBox ID="creditunitTB" runat="server"></asp:TextBox>
                    <asp:Label ID="creditunitLbl" runat="server" Text="Credit Unit:"></asp:Label>
                    <br />
                    <!-- seventh row -->
                    <asp:Label ID="pictureLbl" runat="server" Text="2x2 Image:"></asp:Label>
                    <asp:FileUpload ID="pictureUpload" runat="server"/><br/>
                    <div id="error-messsage" style="margin-bottom: 15px; font-weight: 900; font-size: 10px; color: red;"></div>
                    <!-- file extension must be .jpg, .png, or .jpeg type. no file is chosen or empty -->
                    <asp:Button ID="submitBtn" runat="server" Text="Submit" OnClick="submitBtn_Click" />
                </div>
            </div>
        </div>
        <div id="credits-container">
            <h5>Mad_Axia<asp:Button ID="logoutBtn" runat="server" Text="Log out" OnClick="logoutBtn_Click" /></h5>
            
        </div>
    </form>
</body>
</html>

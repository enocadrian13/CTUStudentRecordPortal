<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="CTUStudentRecordPortal.index" %>

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
                border: none;
                background-size: 55px;
                margin-left: 10px;
                margin-top: 5px;
                width: 300px;
                height: 60px;
                cursor: pointer;
                font-weight: 600;
                border-radius: 30px;
            }
            #addstudentBtn{
                margin-top: 20px;
                float: right;
                background-color: #FFBD59;
                background-image: url('srcfolder/add-user-svg.svg');
                background-repeat: no-repeat;
                border: none;
                background-size: 30px;
                margin-right: 15px;
                width: 150px;
                height: 30px;
                cursor: pointer;
                font-weight: 600;
                border-radius: 30px;
                transition: 0.6s;
            }
            #addstudentBtn:hover{
                background-color: #F9AE3D;
            }
            #title-btn:visited{
                color: #000000;
            }
            #hero-container{
                width: 100%;
                height: 604px;
                background-image: url('srcfolder/ctu-bg5.jpg');
                background-repeat: no-repeat;
                background-size: cover;
                text-align: center;
                padding-top: 100px;
                font-family: 'Inter', sans-serif;
            }
            #searchBtn{
                float: right; 
                padding-left: 20px; 
                margin-top: 17px; 
                margin-right: 30px; 
                height: 30px; 
                width: 100px; 
                border: none; 
                border-bottom-right-radius: 20px; 
                border-top-right-radius: 20px; 
                cursor: pointer;
                background-image: url('srcfolder/search-user-svg.svg');
                background-size: 25px;
                background-repeat: no-repeat;
                background-position: 10px 5px;
                font-weight: 600;
                transition: 0.6s;
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
            #viewlistBtn{
                width: 540px; 
                height: 40px;
                margin-top: 60px; 
                font-size: 27px; 
                border-radius: 15px; 
                font-family: 900; 
                border: none; 
                cursor: pointer;
                background: #FFBD59;
                transition: 0.4s;
            }
            #viewlistBtn:hover{
                background-color: #faa320;
            }
            #logoutBtn{
                float: right; 
                margin-right: 50px; 
                width: 120px; 
                height: 16px; 
                background: #f1b150; 
                border: 2px solid #f4ac41; 
                border-radius: 30px; cursor: pointer;
                transition: 0.6s;
            }
            #logoutBtn:hover{
                font-weight: 700;
                background-color: #fdaf3a;
            }
            #credits-container{
                background-color: #FFC46C;
                width: 100%;
                height: 18px;
                padding-top: 5px;
                text-align: center;
                transition: 0.6s;
            }
            #credits-container{
                background-color: #fbb54d;
            }
            #aboutusBtn{
                width: 540px;
                height: 40px;
                margin-top: 25px;
                font-size: 27px;
                border-radius: 15px;
                font-family: 900;
                border: none;
                cursor: pointer;
                background: #FFBD59;
                transition: 0.6s;
            }
            #aboutusBtn:hover {
                background-color: #faa320;
            }
        </style>
        <script>
            var br = "2px solid red";
            function searchBoxBorder() {
                document.getElementById('searchTB').style.border = br;
                alert('Student Id must not contain a letter');
            }
            function studentIdDoesNotExist() {
                document.getElementById('searchTB').style.border = br;
                window.alert('Student Id does not exist');
            }
        </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="nav-container">
            <div id="left-nav">
                <asp:Button ID="homeBtn" runat="server" Text="Student Record Portal" />
            </div>
            <div id="right-nav">
                <asp:Button ID="searchBtn" runat="server" Text="Search" OnClick="searchBtn_Click" />
                <asp:TextBox ID="searchTB" runat="server" placeholder="Search Student ID"></asp:TextBox>
                <asp:Button ID="addstudentBtn" runat="server" Text="Add Student" OnClick="addstudentBtn_Click" />
            </div>
        </div>

        <div id="hero-container">
            <div id="welcome-txt" style="font-size: 86px; font-weight: 700;">Welcome</div>
            <div id="to-txt" style="font-size: 34px; font-weight: 400; margin-top: 5px;">to</div>
            <div id="school-name-txt" style="font-size: 43px; font-weight: 800; margin-top: 20px;">Cebu Technological University</div>
            <div id="portal-name-txt" style="font-size: 36px; font-weight: 400; text-decoration: underline; margin-top: 20px;">Student Record Portal</div>
            <asp:Button ID="viewlistBtn" runat="server" Text="View List of Students" OnClick="viewlistBtn_Click" /><br/>
            <asp:Button ID="aboutusBtn" runat="server" Text="About Us" OnClick="aboutusBtn_Click" />
        </div>

        <div id="credits-container">
            <h5>Mad_Axia<asp:Button ID="logoutBtn" runat="server" Text="Log Out" OnClick="logoutBtn_Click" /></h5>
        </div>
    </form>
</body>
</html>

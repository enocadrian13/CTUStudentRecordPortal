<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="searchresult.aspx.cs" Inherits="CTUStudentRecordPortal.searchresult" %>

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
            }
            #addstudentBtn:hover{
                background-color: #F9AE3D;
            }
            #title-btn:visited{
                color: #000000;
            }
            #hero-container{
                width: 100%;
                height: 703px;
                background-image: url('srcfolder/ctu-bg3.jpg');
                background-repeat: no-repeat;
                background-size: cover;
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
                transition: 0.6s;
            }
            #searchBtn:hover{
                font-weight: 700;
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
            /* search result contents */
            #search-result-container{
                width: 1200px;
                height: 580px;
                margin-left: auto;
                margin-right: auto;
                margin-top: 10px;
                padding-left: 25px;
                padding-top: 25px;
            }
            #left-contents{
                float: left;
            }
            #credits-container{
                background-color: #FFC46C;
                width: 100%;
                height: 18px;
                padding-top: 5px;
                text-align: center;
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
            /*Search Image Styles*/
            #studentImg {
                width: 192px;
                height: 192px;
                background-color: #ffffff;
            }
            #studentidLbl{
                padding-top: 5px;
                padding-left: 20px;
                font-size: 25px;
                font-weight: 600;
            }
            #studentidTB{
                width:600px; 
                height: 25px;
                text-indent: 10px;
                font-size: 20px; 
                margin-bottom: 2px; 
                margin-left: 47px; 
                font-weight: 700;
            }
            #studentnameLbl{
                padding-left: 20px;
                font-size: 25px;
                font-weight: 600;
            }
            #studentnameTB{
                width:600px;
                height: 25px;
                text-indent: 10px;
                font-size: 20px;
                margin-bottom: 2px;
            }
            #genderLbl{
                padding-left: 20px;
                font-size: 25px;
                font-weight: 600;
            }
            #genderTB{
                width: 250px;
                height: 25px;
                text-indent: 10px;
                font-size: 20px;
                margin-bottom: 2px;
                margin-left: 83px;
            }
            #birthdayLbl{
                padding-left: 5px;
                font-size: 25px;
                font-weight: 600;
            }
            #birthdayTB{
                width:225px;
                height: 25px; 
                text-indent: 10px; 
                font-size: 20px; 
                margin-bottom: 2px;
            }
            #addressLbl{
                padding-left: 20px;
                font-size: 25px;
                font-weight: 600;
            }
            #addressTB{
                width:600px;
                height: 25px;
                margin-left: 72px;
                text-indent: 10px;
                font-size: 20px;
            }
            #contactLbl{
                padding-left: 20px;
                font-size: 25px;
                font-weight: 600;
            }
            #contactTB{
                width:600px;
                height: 25px;
                margin-left: 35px;
                text-indent: 10px;
                font-size: 20px;
                margin-bottom: 2px;
            }
            #emailLbl{
                padding-left: 20px;
                font-size: 25px;
                font-weight: 600;
            }
            #emailTB{
                width:600px;
                height: 25px;
                margin-left: 3px;
                text-indent: 10px;
                font-size: 20px;
            }
            #enrolledprogramLbl{
                font-size: 25px;
                font-weight: 600;
            }
            #enrolledprogramTB{
                margin-bottom: 3px;
                width:450px;
                height: 25px;
                margin-left: 9px;
                text-indent: 10px;
                font-size: 20px;
            }
            #yearLbl{
                font-size: 25px;
                font-weight: 600;
            }
            #yearTB{
                margin-bottom: 3px;
                width:450px;
                height: 25px;
                margin-left: 89px;
                text-indent: 10px;
                font-size: 20px;
            }
            #enrollmentstatLbl{
                font-size: 25px;
                font-weight: 600;
            }
            #enrollmentstatTB{
                margin-bottom: 3px;
                width:450px;
                height: 25px; 
                margin-left: 3px;
                text-indent: 10px; 
                font-size: 20px;
            }
            #creditLbl{
                font-size: 25px;
                font-weight: 600;
            }
            #creditTB{
                margin-bottom: 3px;
                width:450px;
                height: 25px;
                margin-left: 84px;
                text-indent: 10px;
                font-size: 20px;
            }
            #totalLbl{
                font-size: 25px;
                font-weight: 600;
            }
            #totalTB{
                margin-bottom: 3px;
                width:450px;                                                                
                height: 25px;
                margin-left: 74px;
                text-indent: 10px; 
                font-size: 20px;
            }
            #changeprofileBtn{
                width:220px;
                height: 20px;
                font-size: 15px;
                font-weight: 400;
                margin-left: 20px; 
                background-color: #FFBD59;
                border-radius: 20px; 
                border: none; 
                cursor: pointer;
                margin-bottom: 10px;
            }
            #updateBtn{
                width:85px;
                height: 35px;
                font-size: 15px;
                font-weight: 500;
                margin-top: 70px;
                margin-left: 500px;
                margin-right: auto;
                background-color: #FFBD59; 
                border-radius: 20px;
                border: none; 
                cursor: pointer;
                transition: 0.6s;
            }
            #updateBtn:hover{
                font-weight: 700;
                background-color: #f8a52a;
            }
            #deleteBtn{
                width:85px; 
                height: 35px; 
                font-size: 15px;
                font-weight: 500;
                margin-left: 20px;
                background-color: #FFBD59; 
                border-radius: 20px; 
                border: none; 
                cursor: pointer;
                transition: 0.6s;
            }
            #deleteBtn:hover{
                font-weight: 700;
                background-color: #f8a52a;
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
                <asp:Button ID="homeBtn" runat="server" Text="Student Record Portal" OnClick="homeBtn_Click" />
            </div>
            <div id="right-nav">
                <asp:Button ID="searchBtn" runat="server" Text="Search" OnClick="searchBtn_Click" />
                <asp:TextBox ID="searchTB" runat="server" placeholder="Search Student ID"></asp:TextBox>
                <asp:Button ID="addstudentBtn" runat="server" Text="Add Student" OnClick="addstudentBtn_Click" />
            </div>
        </div>

        <div id="hero-container">
            <div id="title-name" style="padding-top: 20px; padding-left: 40px; font-size: 40px; font-weight: 700;">Search Result</div>
            <div id="search-result-container">
                <div id="left-contents">
                    <asp:Image ID="studentImg" runat="server" />
                    <br />
                    <!-- Optional Button -->
                    <!--<asp:FileUpload ID="changeprofileBtn" runat="server" /> -->
                    
                </div>
                <!-- first row -->
                <asp:Label ID="studentidLbl" runat="server" Text="Student Id:"></asp:Label>
                <asp:TextBox ID="studentidTB" runat="server" Enabled="False"></asp:TextBox>
                <br />
                <!-- second row -->
                <asp:Label ID="studentnameLbl" runat="server" Text="Student Name:"></asp:Label>
                <asp:TextBox ID="studentnameTB" runat="server" Enabled="False"></asp:TextBox>
                <br/>
                <!-- third row -->
                <asp:Label ID="genderLbl" runat="server" Text="Gender:"></asp:Label>
                <asp:TextBox ID="genderTB" runat="server" Enabled="False"></asp:TextBox>
                <asp:Label ID="birthdayLbl" runat="server" Text="Birthday:"></asp:Label>
                <asp:TextBox ID="birthdayTB" runat="server" Enabled="False"></asp:TextBox>
                <br />
                <!-- fourth row -->
                <asp:Label ID="addressLbl" runat="server" Text="Address:"></asp:Label>
                <asp:TextBox ID="addressTB" runat="server"></asp:TextBox>
                <br />
                <!-- fifth row -->
                <asp:Label ID="contactLbl" runat="server" Text="Contact No:"></asp:Label>
                <asp:TextBox ID="contactTB" runat="server"></asp:TextBox>
                <br />
                <!-- sixth row -->
                <asp:Label ID="emailLbl" runat="server" Text="Email Address:"></asp:Label>
                <asp:TextBox ID="emailTB" runat="server"></asp:TextBox>
                <br />
                <br />
                <br />
                <!-- seventh row -->
                <asp:Label ID="enrolledprogramLbl" runat="server" Text="Enrolled Program:"></asp:Label>
                <asp:TextBox ID="enrolledprogramTB" runat="server"></asp:TextBox>
                <br />
                <!-- eight row -->
                <asp:Label ID="yearLbl" runat="server" Text="Year Level:"></asp:Label>
                <asp:TextBox ID="yearTB" runat="server"></asp:TextBox>
                <br />
                <!-- ninth row -->
                <asp:Label ID="enrollmentstatLbl" runat="server" Text="Enrollment Status:"></asp:Label>
                <asp:TextBox ID="enrollmentstatTB" runat="server"></asp:TextBox>
                <br />
                <!-- tenth row -->
                <asp:Label ID="creditLbl" runat="server" Text="Credit Unit:"></asp:Label>
                <asp:TextBox ID="creditTB" runat="server"></asp:TextBox>
                <br />
                <!-- eleventh row -->
                <asp:Label ID="totalLbl" runat="server" Text="Total Credit:"></asp:Label>
                <asp:TextBox ID="totalTB" runat="server" Enabled="False"></asp:TextBox>
                <br />
                <asp:Button ID="updateBtn" runat="server" Text="Update" OnClick="updateBtn_Click" />
                <asp:Button ID="deleteBtn" runat="server" Text="Delete" OnClick="deleteBtn_Click" />
            </div>
        </div>

        <div id="credits-container">
            <h5>Mad_Axia<asp:Button ID="logoutBtn" runat="server" Text="Log out" OnClick="logoutBtn_Click"/></h5>
        </div>
    </form>
</body>
</html>

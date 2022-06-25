<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="viewlistofstudents.aspx.cs" Inherits="CTUStudentRecordPortal.viewlistofstudents" %>

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
            #hero-container{
                width: 100%;
                height: 703px;
                background-color: #F8DEB7;
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
                transition: 0.6s;
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
                border: 2px solid #000000;
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
            #GridView1{
                padding-top: 50px;
                margin-left:50px;
                width: 90%;
                height: auto;
                text-align: center;
                border: 1px solid black;
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
                <asp:Button ID="addstudentBtn" runat="server" Text="Add Student" OnClick="addstudentBtn_Click"/>
            </div>
        </div>

        <div id="hero-container">

            <div id="title" style="padding-top: 15px; font-size: 45px; font-weight: 800; padding-left: 45px;">List of Students</div>

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">


                <AlternatingRowStyle BackColor="White" ForeColor="Black"></AlternatingRowStyle>
                <Columns>
                    <asp:BoundField DataField="studentId" HeaderText="Student Id" SortExpression="studentId"></asp:BoundField>
                    <asp:BoundField DataField="studentLastname" HeaderText="Last Name" SortExpression="studentLastname"></asp:BoundField>
                    <asp:BoundField DataField="studentFirstname" HeaderText="First Name" SortExpression="studentFirstname"></asp:BoundField>
                    <asp:BoundField DataField="studentMiddlename" HeaderText="Middle Name" SortExpression="studentMiddlename"></asp:BoundField>
                    <asp:BoundField DataField="studentSuffix" HeaderText="Suffix" SortExpression="studentSuffix"></asp:BoundField>
                    <asp:BoundField DataField="studentEmail" HeaderText="Email Address" SortExpression="studentEmail"></asp:BoundField>
                    <asp:BoundField DataField="studentContactNumber" HeaderText="Contact Number" SortExpression="studentContactNumber"></asp:BoundField>
                    <asp:BoundField DataField="studentEnrolledProgram" HeaderText="Enrolled Program" SortExpression="studentEnrolledProgram"></asp:BoundField>
                    <asp:BoundField DataField="studentYearLevel" HeaderText="Year Level" SortExpression="studentYearLevel"></asp:BoundField>
                    <asp:BoundField DataField="studentEnrollmentStatus" HeaderText="Enrollment Status" SortExpression="studentEnrollmentStatus"></asp:BoundField>
                    <asp:BoundField DataField="studentCreditUnit" HeaderText="Credit Unit" SortExpression="studentCreditUnit"></asp:BoundField>
                </Columns>
                <EditRowStyle BackColor="#999999"></EditRowStyle>

                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="Black"></FooterStyle>

                <HeaderStyle BackColor="#FED393" Font-Bold="True" ForeColor="Black"></HeaderStyle>

                <PagerStyle HorizontalAlign="Center" BackColor="#284775" ForeColor="Black"></PagerStyle>

                <RowStyle BackColor="#F7F6F3" ForeColor="#333333"></RowStyle>

                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

                <SortedAscendingCellStyle BackColor="#FBC36F"></SortedAscendingCellStyle>

                <SortedAscendingHeaderStyle BackColor="#FFBD59"></SortedAscendingHeaderStyle>

                <SortedDescendingCellStyle BackColor="#FBC36F"></SortedDescendingCellStyle>

                <SortedDescendingHeaderStyle BackColor="#FFBD59"></SortedDescendingHeaderStyle>
            </asp:GridView>
            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:CTUStudentRecordDBConnectionString %>' SelectCommand="SELECT [studentId], [studentLastname], [studentFirstname], [studentMiddlename], [studentSuffix], [studentEmail], [studentContactNumber], [studentEnrolledProgram], [studentYearLevel], [studentEnrollmentStatus], [studentCreditUnit] FROM [StudentRecordTable]"></asp:SqlDataSource>
        </div>

        <div id="credits-container">
            <h5>Mad_Axia<asp:Button ID="logoutBtn" runat="server" Text="Log out" OnClick="logoutBtn_Click" /></h5>
            
        </div>
    </form>
</body>
</html>

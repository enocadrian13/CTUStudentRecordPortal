<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="aboutus.aspx.cs" Inherits="CTUStudentRecordPortal.aboutus" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CTU Student Record Portal</title>
    <link rel="icon" href="srcfolder/ctu-logo.png" type="image/icon type" />
    <link rel="stylesheet" href="srcfolder/style.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <style>
            *{
                margin: 0;
                padding: 0;
            }
            body{
                font-family: 'Inter', sans-serif;
                overflow-x: hidden;
            }
            #hero-container{
                background: #F8DEB7;
                width: auto;
            }
            #top-container{
                width: auto;
                height: 700px;
                background: #FFC46C;
                background-image: url('srcfolder/ctu-bg1.jpg');
                /* opacity: 0.2; */
                background-repeat: no-repeat;
                background-size: cover;
                text-align: center;
                padding-top: 120px;
            }
            #logo-container{
                padding-top: 50px;
            }
            #navigation-container{
                padding-top: 130px;
                font-size: 35px;
                font-weight: 600;
                text-align: center;
            }
            .navigation{
                /* display: block; */
                font-weight: 800;
                color: #000000;
                padding-right: 40px;
                text-decoration: none;
            }
            .navigation:visited{
                color: #000000;
            }
            .navigation:hover{
                transition: 0.3s;
                color: #F49E1E;
                cursor: pointer;
            }
            #scroll-top-btn{
                position: fixed;
                right: 5px;
                bottom: 5px;
                width: 40px;
                height: 40px;
                cursor: pointer;
                border: 0;
                border-radius: 10px;
                background-color: #fccc48;
            }
            #scroll-top-btn:hover{
                transition: 0.3s;
                background-color: #f8bf21;
            }
            #homeBtn{
                background-image: url('srcfolder/return-back-svgrepo-com.svg');
                position: fixed;
                left: 5px;
                top: 5px;
                width: 40px;
                height: 40px;
                cursor: pointer;
                border: 0;
                border-radius: 10px;
                cursor: pointer;
                background-color: #f5cc5c;
            }
            #homeBtn:hover{
                background-color: #ffc62b;
                transition: 0.8s;
            }
            #mission{
                background-image: url('srcfolder/ctu-bg2.jpg');
                background-repeat: no-repeat;
                background-size: cover;
            }
            #vision{
                padding-top: 90px;
                background-image: url('srcfolder/ctu-bg3.jpg');
                background-repeat: no-repeat;
                background-size: cover;
            }
            #goal{
                padding-top: 40px;
                background-image: url('srcfolder/ctu-bg4.jpg');
                background-repeat: no-repeat;
                background-size: cover;
            }
            #vision, #mission, #goal, #contact{
                width: auto;
                height: 791px;
            }
            #contact{
                background: linear-gradient(to right,
                #FFC46C 0%,
                #FFC46C 80%,
                #ffb84d 80%,
                #ffb84d 100%);
                padding-top: 180px;
            }
            #list{
                display: list-item;
            }
            ul.ls{
                display: list-item;
                list-style-type: square;
            }
            .reveal{
                position: relative;
                transform: translateX(150px);
                opacity: 0;
                transition: 1s all ease;
            }

            .reveal.active{
                transform: translateY(0);
                opacity: 1;
            }

            .reveal-left{
                position: relative;
                transform: translateX(-150px);
                opacity: 0;
                transition: 1s all ease;
            }

            .reveal-left.active-left{
                transform: translateY(0);
                opacity: 1;
            }

            #credits-container{
                background-color: #fbb54d;
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
                transition: 0.3s;
            }
            #logoutBtn:hover{
                font-weight: 700;
                background-color: #fdaf3a;
            }
    </style>
    
    </head>
<body>
    <form id="form1" runat="server">
            <div id="hero-container">
            <div id="top-container">
                <div id="title-container" style="font-size: 70px; font-weight: 700; padding-bottom: 5px;">Cebu Technological University</div>
                <div id="sub-title" style="font-size: 65px; font-weight: 700; text-decoration: overline; padding-top: 10px;">Argao Campus</div>
                <div id="logo-container">
                    <img src="srcfolder/ctu-logo.png" alt="ctu logo" width="230px" />
                    <img src="srcfolder/qs-logo.png" alt="qs logo" />
                    <img src="srcfolder/asean-logo.png" alt="asean logo" width="230px" />
                </div>
                <div id="navigation-container">
                    <a href="#vision" class="navigation" id="nav-vision">Vision</a>
                    <a href="#mission" class="navigation" id="nav-mission">Mission</a>
                    <a href="#goal" class="navigation" id="nav-goal">Goal</a>
                    <a href="#contact" class="navigation" id="nav-contact">Contact Us</a>
                </div>

                <button id="scroll-top-btn" title="Return to Top">
                    <img src="srcfolder/up-arrow-svgrepo-com.svg" alt="up arrow" width="35px" />
                </button>
                <asp:Button ID="homeBtn" runat="server" Text="" title="Home" OnClick="homeBtn_Click" />
            </div>

            <section id="vision">
                <div id="vision-title" class="reveal-left" style="background-color: #FFC978; padding-top: 20px; width: 817px; height: 80px; font-size: 55px; text-align: center; font-weight: 700;">Vision of the University</div>
                <div id="vision-content" class="reveal" style="background-color: #FFC978; padding-top: 80px; padding-left: 70px; padding-right: 50px; margin-top: 90px; margin-left: 120px; font-weight: 300; font-size: 36px; text-align: justify; height: 200px;">CTU as a Premier, Inclusive, Globally-Recognized Research and Innovation, Smart, Community-Responsive, And Sustainable Technological University (Per CTU Memo No. PB20-090, series of 2022 dated Feb. 20, 2022)</div>
            </section>

            <section id="mission">
                <div id="mission-title" class="reveal" style="background-color: #FFC978;  margin-top: 90px; float: right; width: 817px; height: 80px; font-size: 55px; text-align: center; font-weight: 700;" >Mission of the University</div>
                <div id="mision-content" class="reveal-left" style="background-color: #FFC978; float: left; width: 1295px; height:306px; margin-top: 100px; padding-left: 70px; padding-right: 50px; padding-top: 100px; font-weight: 300; font-size: 36px; text-align: justify;">The University shall primarily provide leading-edge degree programs, innovative professional, entrepreneurial, and technical   instruction as well as research and extension programs that address both the needs of the region and the nation in the context of the global knowledge economy, Fourth Industrial Revolution, and sustainability.
                </div>
            </section>
            <section id="goal">
                <div id="goal-title" class="reveal-left" style="background-color: #FFC978; width: 817px; height: 80px; font-size: 55px; text-align: center; font-weight: 700;">Goal of the University</div>
                <div id="goal-content" class="reveal" style="background-color: #FFC978; margin-top: 90px; margin-left: 100px; padding-top: 50px; padding-left: 50px; padding-right: 50px; font-size: 30px; height: 470px;">
                    <div id="qual" style="font-weight: 600; padding-bottom: 20px;">
                        By the end of 2024, CTU will be globally recognized for its quality. Specifically, it will:
                    </div>
                    <!-- <br /> -->
                    <div id="list">
                        <ul class="ls">
                            <li>Obtain a Philippine university system status with a CHEd SUC Level V recognition or equivalent.</li>
                            <li>Be ranked among the Top 10 Universities in the Philippines;</li>
                            <li>Be included in the list of internationally recognized ranking of universities including Quaquarelli Symonds,
                                Times Higher Education, Shanghai University Ranking, World University Impact Rankings;
                                </li>
                            <li>Pursue efforts to pave way for the development of new programs including natural sciences, and Doctor of
                                Medicine and Transnational Higher Education;</li>
                            <li>Achieve world-class performance and excellence in total quality
                                management; and lead innovations in the Fourth Industrial Revolution.</li>
                        </ul>
                    </div>
                </div>
            </section>

            <section id="contact">
                <div id="title-con" class="reveal-left" style="padding-left: 90px; font-size: 55px; font-weight: 800;">Contact Us:</div>
                <div id="web-label" class="reveal-left" style="padding-top: 40px; padding-left: 180px; font-size: 35px; font-weight: 600;">Website: <span>http://www.argao.ctu.edu.ph</span></div>
                <div id="email-label" class="reveal-left" style="padding-top: 40px; padding-left: 180px; font-size: 35px; font-weight: 600;">Email: <span>cdargao@ctu.edu.ph</span></div>
                <div id="phone-label" class="reveal-left" style="padding-top: 40px; padding-left: 180px; font-size: 35px; font-weight: 600;">Phone: <span>(032)-485-8290/485-5109</span></div>
                <div id="fax-label" class="reveal-left" style="padding-top: 40px; padding-left: 180px; font-size: 35px; font-weight: 600;">Fax: <span>(032)-4858-290</span></div>
            </section>

            <div id="credits-container">
                <h5>Mad_Axia<asp:Button ID="logoutBtn" runat="server" Text="Logout" OnClick="logoutBtn_Click" /></h5>
            
            </div>
        </div>
  
        <script>
            const scrollTop = document.querySelector("#scroll-top-btn");
            scrollTop.addEventListener("click", function () {
                // window.scrollTo({
                //     top: 0,
                //     left: 0;
                //     behavior: "smooth"; 
                // })
                $("html, body").animate({ scrollTop: 0 }, "slow");
            });

            const navVision = document.querySelector("#nav-vision");
            const navMission = document.querySelector("#nav-mission");
            const navGoal = document.querySelector("#nav-goal");
            const navCont = document.querySelector("#nav-contact");

            navVision.addEventListener("click", function () {
                $("html, body").animate({ scrollTop: $('#vision').position().top }, "slow");
            })

            navMission.addEventListener("click", function () {
                $("html, body").animate({ scrollTop: $('#mission').position().top }, "slow");
            })

            navGoal.addEventListener("click", function () {
                $("html, body").animate({ scrollTop: $('#goal').position().top }, "slow");
            })

            navCont.addEventListener("click", function () {
                $("html, body").animate({ scrollTop: $('#contact').position().top }, "slow");
            })

            function reveal() {
                var reveals = document.querySelectorAll(".reveal");

                for (var i = 0; i < reveals.length; i++) {
                    var windowHeight = window.innerHeight;
                    var elementTop = reveals[i].getBoundingClientRect().top;
                    var elementVisible = 150;

                    if (elementTop < windowHeight - elementVisible) {
                        reveals[i].classList.add("active");
                    } else {
                        reveals[i].classList.remove("active");
                    }
                }
            }

            function revealLeft() {
                var display = document.querySelectorAll(".reveal-left");

                for (var i = 0; i < display.length; i++) {
                    var windowHeight = window.innerHeight;
                    var elementTop = display[i].getBoundingClientRect().top;
                    var elementVisible = 150;

                    if (elementTop < windowHeight - elementVisible) {
                        display[i].classList.add("active-left");
                    } else {
                        display[i].classList.remove("active-left");
                    }
                }
            }

            window.addEventListener("scroll", revealLeft);
            window.addEventListener("scroll", reveal);

        </script>
     </form>
</body>
</html>

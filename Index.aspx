<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="IjasAhammed.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.0.16/dist/sweetalert2.all.min.js"></script>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>


    <script>
        function download() {

            Swal.fire({
                title: "Do you want to Download?",
                showDenyButton: true,
                showCancelButton: true,
                confirmButtonText: "Download",
                denyButtonText: `View`
            }).then((result) => {
                if (result.isConfirmed) {
                    // Download file logic here
                    var pdfUrl = '../assets/cv/IJAS.pdf';
                    var a = document.createElement('a');
                    a.href = pdfUrl;
                    a.download = true;
                    a.download = 'IJAS_AHAMMED_M_CV';
                    a.click();
                } else if (result.isDenied) {
                    window.open("assets/cv/IJAS.pdf");
                }
            });
        }

        function contact() {
            const whatsappNumber = '+917034455703';
            const message = 'Hello!';
            const url = `https://wa.me/${whatsappNumber}?text=${message}`;
            window.open(url, '_blank');
        }

        const sendmail = () => {
            const mail = $("#email").val();
            const name = $("#name").val();
            const sub = $("#subject").val();
            const message = $("#message").val();

            if (mail === "" || name === "" || sub === "" || message === "") {
                Swal.fire({
                    title: "Please fill in all fields!",
                    icon: "info",
                    confirmButtonText: "Close",
                });
                return false;
            }

            const inputData = {
                email: mail,
                name: name,
                subject: sub,
                message: message,
            };

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "Index.aspx/sendmail",
                data: JSON.stringify(inputData),
                dataType: "json",
                success: (result) => {
                    console.log(result);
                    // Do something with the result
                },
                error: (xhr, status, error) => {
                    console.error(xhr, status, error);
                    Swal.fire({
                        title: "Error sending email!",
                        icon: "error",
                        confirmButtonText: "Close",
                    });
                },
            });
        };

        function validation() {

            const email = document.getElementById("email").value;

            const voterIdRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
            if (voterIdRegex.test(email)) {
                return true;
            } else {
                Swal.fire({
                    title: 'Please Enter Valid Mail_id!!',
                    icon: 'info',
                    confirmButtonText: 'Close',
                }).then((result) => {
                    if (result.isConfirmed) {
                        $("#email").val('');
                        return false;
                    }
                });
                
            }
        }
       
    </script>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />

    <title>Ijas Ahammed M | software developer</title>
    <meta content="" name="description" />
    <meta content="" name="keywords" />

    <!-- Favicons -->
    <link href="assets/img/logo.png" rel="icon" />


    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet" />

    <!-- Vendor CSS Files -->
    <link href="assets/vendor/aos/aos.css" rel="stylesheet" />
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet" />
    <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet" />
    <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet" />
    <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet" />

    <!-- Template Main CSS File -->
    <link href="assets/css/style.css" rel="stylesheet" />

    <!-- =======================================================
  * Template Name: MyResume - v4.7.0
  * Template URL: https://bootstrapmade.com/free-html-bootstrap-template-my-resume/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>
<body>
    <form id="form1" runat="server">
        <!-- ======= Mobile nav toggle button ======= -->
        <!-- <button type="button" class="mobile-nav-toggle d-xl-none"><i class="bi bi-list mobile-nav-toggle"></i></button> -->
        <i class="bi bi-list mobile-nav-toggle d-xl-none"></i>
        <!-- ======= Header ======= -->
        <header id="header" class="d-flex flex-column justify-content-center">

            <nav id="navbar" class="navbar nav-menu">
                <ul>
                    <li><a href="#hero" class="nav-link scrollto active"><i class="bx bx-home"></i><span>Home</span></a></li>
                    <li><a href="#about" class="nav-link scrollto"><i class="bx bx-user"></i><span>About</span></a></li>
                    <li><a href="#resume" class="nav-link scrollto"><i class="bx bx-file-blank"></i><span>Resume</span></a></li>
                    <li><a href="#contact" class="nav-link scrollto"><i class="bx bx-envelope"></i><span>Contact</span></a></li>
                </ul>
            </nav>
            <!-- .nav-menu -->

        </header>
        <!-- End Header -->

        <!-- ======= Hero Section ======= -->
        <section id="hero" class="d-flex flex-column justify-content-center">
            <div class="container" data-aos="zoom-in" data-aos-delay="100">
                <h1>Ijas Ahammed M</h1>
                <p>I'm <span class="typed" data-typed-items="Web Developer, Software Developer"></span></p>
                <div class="social-links">
                    <a href="https://twitter.com/IjasAhammedM2?t=7dy9pOhuEbpW2FD0CJsPjQ&s=09" class="twitter"><i class="bx bxl-twitter"></i></a>
                    <a href="https://www.facebook.com/ijaz.nasar.18" class="facebook"><i class="bx bxl-facebook"></i></a>
                    <a href="https://www.instagram.com/ijaz_nasar" class="instagram"><i class="bx bxl-instagram"></i></a>
                    <a href="https://github.com/ijaznasar" class="github"><i class="bx bxl-github"></i></a>
                    <a href="https://www.linkedin.com/in/ijas-ahammed-m-8294b5224" class="linkedin"><i class="bx bxl-linkedin"></i></a>
                </div>
                <br />
                <div class="">
                    <input type="button" value="Download Resume" id="Download1" onclick="download()" />
                    <input type="button" value="Contact Me" id="Download1" onclick="contact()" />
                </div>
            </div>
        </section>
        <!-- End Hero -->

        <main id="main">

            <!-- ======= About Section ======= -->
            <section id="about" class="about">
                <div class="container" data-aos="fade-up">

                    <div class="section-title">
                        <h2>About</h2>
                    </div>
                    <br />
                    <br />

                    <div class="row">
                        <div class="col-lg-4 align-center">
                            <img src="assets/img/ijasph1.png" class="img-fluid" alt="" style="width: 300px; height: 300px;" />
                        </div>
                        <div class="col-lg-8 pt-4 content">
                            <div class="col-lg-4 row"></div>
                            <div class="col-lg-10">
                                <h5 style="text-align: justify; padding-top: 70px">Hello! I am Ijas Ahammed. Full Stack Dot Net Developer with three months of training and current work experience that has given me a strong foundation in software development. demonstrated capacity to produce excellent code and solutions by the deadline. 
                                    skilled at working with cross-functional teams to ensure the success of projects.

                                </h5>
                            </div>
                        </div>
                    </div>

                </div>
            </section>
            <!-- End About Section -->


            <!-- ======= Skills Section ======= -->
            <section id="skills" class="skills section-bg">
                <div class="container" data-aos="fade-up">

                    <div class="section-title">
                        <h2>Skills</h2>
                    </div>

                    <div class="row skills-content">

                        <div class="col-lg-6">

                            <div class="progress">
                                <span class="skill">C# <i class="val">85%</i></span>
                                <div class="progress-bar-wrap">
                                    <div class="progress-bar" role="progressbar" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                            <div class="progress">
                                <span class="skill">.NET Framework <i class="val">85%</i></span>
                                <div class="progress-bar-wrap">
                                    <div class="progress-bar" role="progressbar" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                            <div class="progress">
                                <span class="skill">HTML <i class="val">95%</i></span>
                                <div class="progress-bar-wrap">
                                    <div class="progress-bar" role="progressbar" aria-valuenow="95" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>

                            <div class="progress">
                                <span class="skill">CSS <i class="val">90%</i></span>
                                <div class="progress-bar-wrap">
                                    <div class="progress-bar" role="progressbar" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>

                            <div class="progress">
                                <span class="skill">JavaScript <i class="val">75%</i></span>
                                <div class="progress-bar-wrap">
                                    <div class="progress-bar" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>

                        </div>

                        <div class="col-lg-6">

                            <div class="progress">
                                <span class="skill">ASP.NET <i class="val">80%</i></span>
                                <div class="progress-bar-wrap">
                                    <div class="progress-bar" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                            <div class="progress">
                                <span class="skill">Rest API <i class="val">75%</i></span>
                                <div class="progress-bar-wrap">
                                    <div class="progress-bar" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                            <div class="progress">
                                <span class="skill">PL/SQL <i class="val">85%</i></span>
                                <div class="progress-bar-wrap">
                                    <div class="progress-bar" role="progressbar" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                            <div class="progress">
                                <span class="skill">Bootstrap<i class="val">70%</i></span>
                                <div class="progress-bar-wrap">
                                    <div class="progress-bar" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>
                            <div class="progress">
                                <span class="skill">Photoshop <i class="val">60%</i></span>
                                <div class="progress-bar-wrap">
                                    <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
                                </div>
                            </div>

                        </div>

                    </div>

                </div>
            </section>
            <!-- End Skills Section -->

            <!-- ======= Resume Section ======= -->
            <section id="resume" class="resume">
                <div class="container" data-aos="fade-up">

                    <div class="section-title">
                        <h2>Resume</h2>
                    </div>

                    <div class="row">
                        <div class="col-lg-6">
                            <h3 class="resume-title">Sumary</h3>
                            <div class="resume-item pb-0">
                                <h4>Ijas Ahammed M</h4>
                                <ul>
                                    <li>Vilayur,Palakkad,Kerela,India</li>
                                    <li>(+91) 7034455703</li>
                                    <li>mijasahammed@gmail.com</li>
                                </ul>
                            </div>

                            <h3 class="resume-title">Education</h3>
                            <div class="resume-item">
                                <h4>Master of Computer Application</h4>
                                <h5>2020 - 2022</h5>
                                <p><em>MES College of Engineering, Kuttippuram</em></p>
                            </div>
                            <div class="resume-item">
                                <h4>Bachelor of Computer Application</h4>
                                <h5>2017 - 2020</h5>
                                <p><em>SNDPYSS College,Perinthalmanna</em></p>
                            </div>
                            <div class="resume-item">
                                <h4>+2 Computer Science</h4>
                                <h5>2015 - 2017</h5>
                                <p><em>PTMYHSS Edappalam</em></p>
                            </div>
                            <div class="resume-item">
                                <h4>SSLC</h4>
                                <h5>2015</h5>
                                <p><em>GHSS Pulamanthole</em></p>
                            </div>
                        </div>
                        <div class="col-lg-6 aos-init aos-animate" data-aos="fade-up" data-aos-delay="100">
                            <h3 class="resume-title">Live Project</h3>
                            <div class="resume-item">
                                <h4>API INTEGRATION E SIGN IN SURETY AGREEMENT</h4>
                                <h5>Web Application</h5>
                                <ul>
                                    <li>The web application is C# API Based Project During the Employee Onboarding process thesurety agreement must be executed on an E-stamp and aadhar-sign </li>
                                    <li>All signatures must be authenticateed through Aadhar and verified via OTP sent to the respective mobile number</li>
                                </ul>
                            </div>
                            <h3 class="resume-title">Academic Projects</h3>
                            <div class="resume-item">
                                <h4>BLOOD-BANK-&-DONATION WEBSITE</h4>
                                <h5>Web Application</h5>
                                <ul>
                                    <li>The web application is ASP.NET 3-Tier Architecture Based Project </li>
                                </ul>
                            </div>
                            <div class="resume-item">
                                <h4>E-Commerce Website Based on Rating System</h4>
                                <h5>Web Application</h5>
                                <ul>
                                    <li>The web application is to user will view various products and can purchase products online. Customer gives review about the merchandise and online shopping services</li>
                                    <li>Certain keywords mentioned in the customer review will be mined and will be matched with the keywords which are already exist in the database based on the compariso</li>
                                    <li>Front-end : HTML, CSS, JavaScript</li>
                                    <li>Back-end : MySQL
                                    </li>
                                </ul>
                            </div>
                            <div class="resume-item">
                                <h4>Yathra Guide </h4>
                                <h5>Web & Android App</h5>
                                <ul>
                                    <li>An Android App using Eclipse version 4.2.0 and facility to show tourist  in Kerala, book tourist place tickets online, show hotel room and services,  book hotel rooms and pay room rent through online</li>
                                    <li>It also consists of information of  certain tourist places such as location of the tourist places, get images and reviews of users</li>
                                    <li>Front-end : Android and PyCharm </li>
                                    <li>Back-end : MySQL
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <br />
                        <br />
                        <div class="text-center">
                            <br />
                            <br />
                            <input type="button" value="Download Resume" id="Download" onclick="download()" />
                        </div>

                    </div>
                </div>
            </section>
            <!-- End Resume Section -->

            <!-- ======= Contact Section ======= -->
            <section id="contact" class="contact">
                <div class="container" data-aos="fade-up">

                    <div class="section-title">
                        <h2>Contact</h2>
                    </div>

                    <div class="row mt-1">

                        <div class="col-lg-4">
                            <div class="info">
                                <div class="address">
                                    <a href="https://www.google.co.in/maps/place/Vilayur,+Kerala/@10.8950395,76.1845421,16z/data=!3m1!4b1!4m5!3m4!1s0x3ba7ced7420638d3:0x4f0feeb93783c272!8m2!3d10.8950064!4d76.1885171"><i class="bi bi-geo-alt"></i></a>
                                    <h4>Location:</h4>
                                    <p>Vilayur,Pattambi,Palakkad,Kerela,India</p>
                                </div>

                                <div class="email">
                                    <i class="bi bi-envelope"></i>
                                    <h4>Email:</h4>
                                    <p>mijasahammed@gmail.com</p>
                                </div>

                                <div class="phone">
                                    <a href="tel:+917034455703"><i class="bi bi-phone"></i></a>
                                    <h4>Call:</h4>
                                    <p>+91 7034455703</p>
                                </div>

                            </div>

                        </div>

                        <div class="col-lg-8 mt-5 mt-lg-0">

                            <div action="" method="post" role="form" class="php-email-form">
                                <div class="row">
                                    <div class="col-md-6 form-group">
                                        <input type="text"  class="form-control" id="name" placeholder="Your Name" required="required" />
                                    </div>
                                    <div class="col-md-6 form-group mt-3 mt-md-0">
                                        <input type="email" class="form-control"  id="email" placeholder="Your Email" required="required" onchange="validation()" />
                                    </div>
                                </div>
                                <div class="form-group mt-3">
                                    <input type="text" class="form-control"  id="subject" placeholder="Subject" required="required" />
                                </div>
                                <div class="form-group mt-3">
                                    <textarea id="messege" class="form-control"  rows="5" placeholder="Message" required="required"></textarea>
                                </div>
                                <br />
                                <div class="text-center">
                                    <br />
                                    <input type="button" value="Send Message" id="Download" onclick="sendmail()" />
                                </div>

                            </div>

                        </div>

                    </div>

                </div>
            </section>
            <!-- End Contact Section -->

        </main>
        <!-- End #main -->

        <!-- ======= Footer ======= -->
        <footer id="footer">
            <div class="container">
                <h3>Ijas Ahammed M</h3>
                <div class="social-links">
                    <a href="https://twitter.com/IjasAhammedM2?t=7dy9pOhuEbpW2FD0CJsPjQ&s=09" class="twitter"><i class="bx bxl-twitter"></i></a>
                    <a href="https://www.facebook.com/ijaz.nasar.18" class="facebook"><i class="bx bxl-facebook"></i></a>
                    <a href="https://www.instagram.com/ijaz_nasar" class="instagram"><i class="bx bxl-instagram"></i></a>
                    <a href="https://github.com/ijaznasar" class="github"><i class="bx bxl-github"></i></a>
                    <a href="https://www.linkedin.com/in/ijas-ahammed-m-8294b5224" class="linkedin"><i class="bx bxl-linkedin"></i></a>
                </div>
                <div class="credits">
                    <!-- All the links in the footer should remain intact. -->
                    <!-- You can delete the links only if you purchased the pro version. -->
                    <!-- Licensing information: [license-url] -->
                    <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/free-html-bootstrap-template-my-resume/ -->
                    Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
                </div>
            </div>
        </footer>
        <!-- End Footer -->

        <div id="preloader"></div>
        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

        <!-- Vendor JS Files -->
        <script src="assets/vendor/purecounter/purecounter.js"></script>
        <script src="assets/vendor/aos/aos.js"></script>
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
        <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
        <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
        <script src="assets/vendor/typed.js/typed.min.js"></script>
        <script src="assets/vendor/waypoints/noframework.waypoints.js"></script>
        <script src="assets/vendor/php-email-form/validate.js"></script>

        <!-- Template Main JS File -->
        <script src="assets/js/main.js"></script>
    </form>
</body>
</html>

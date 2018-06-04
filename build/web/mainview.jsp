<%-- 
    Document   : mainview
    Created on : 03-may-2018, 17:26:07
    Author     : agustin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>



    <jsp:include page="assets/shared/head.jsp" /> 

    <body class="body_html_mainview margin_botton" >

        <jsp:include page="assets/shared/models/validateSession.jsp" />

        <!-- Header image -->
        <div class="intro grey darken-4  z-depth-1 header_mainview">
            <h1 class="grey-text text-lighten-5 header_title_mainview" >EFEMÉRIDES <span class="color_red">TAURINAS</span></h1>
            <img src="assets/img/image07.jpg"  class=" imagen_header_backgroud">
            <p class="guide_events">Guía de eventos del mundo del toro</p>
        </div>
        <!-- Start Header with no back -->
        <jsp:include page="assets/shared/models/header.jsp" />
        <!-- End Header with no back -->
        <!-- Start Sections -->
        <div class="container about margin_top_login">
            <h5>Secciones</h5><hr>
            <div class="row">
                <!-- Card Efemérides -->
                <div class="col s12 m6 l6">
                    <div class="card">
                        <div class="">
                            <img onerror="this.src='assets/img/no-photo.png';"  src="assets/img/bullfighting.jpg"  class="image_card_about_us">
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.</p>
                        </div>
                        <div class="card-action">
                            <a href="controllers/controllerEfemeride.jsp?op=loadallefems" class="waves-effect waves-light btn small_button background_color_red">Ver Efemérides</a>
                        </div>
                    </div>
                </div>
                <!-- Card Perspnajes -->
                <div class="col s12 m6 l6">
                    <div class="card">
                        <div class="">
                            <img onerror="this.src='assets/img/no-photo.png';"  src="assets/img/bullfighting.jpg" class="image_card_about_us">
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore.</p>
                        </div>
                        <div class="card-action">
                            <a href="controllers/controller.jsp?op=loadallcharacters" class="waves-effect waves-light btn small_button background_color_red">Ver personajes</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--End Sections -->

        <!-- Start Carrousel-->
        <jsp:include page="assets/shared/models/carrousel.jsp" />
        <!-- End Carrousel-->

        <!-- Start Galery -->
        <div class="container portfolio margin_top_login">
            <h5>Galería</h5>
            <hr>
            <div class="row">
                <div class="col s12 m12 l12  portfolio-holder">
                    <img onerror="this.src='assets/img/no-photo.png';"  class="materialboxed" src="https://i.pinimg.com/originals/1a/7b/11/1a7b1186aa20f3b15fd899084d11f683.jpg">
                    <img onerror="this.src='assets/img/no-photo.png';"  class="materialboxed" src="https://i.pinimg.com/originals/1a/7b/11/1a7b1186aa20f3b15fd899084d11f683.jpg">
                    <img onerror="this.src='assets/img/no-photo.png';"  class="materialboxed" src="https://i.pinimg.com/originals/1a/7b/11/1a7b1186aa20f3b15fd899084d11f683.jpg">
                    <img onerror="this.src='assets/img/no-photo.png';"  class="materialboxed" src="https://i.pinimg.com/originals/1a/7b/11/1a7b1186aa20f3b15fd899084d11f683.jpg">
                    <img onerror="this.src='assets/img/no-photo.png';"  class="materialboxed" src="https://i.pinimg.com/originals/1a/7b/11/1a7b1186aa20f3b15fd899084d11f683.jpg">
                    <img onerror="this.src='assets/img/no-photo.png';"  class="materialboxed" src="https://i.pinimg.com/originals/1a/7b/11/1a7b1186aa20f3b15fd899084d11f683.jpg">
                </div>
            </div>
        </div>
        <!-- End Galery -->

        <jsp:include page="assets/shared/body.jsp" />

    </body>
</html>

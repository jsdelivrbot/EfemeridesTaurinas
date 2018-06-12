<%-- 
Document   : addPersonaje
Created on : 14-may-2018, 13:02:23
Author     : agustin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="assets/shared/head.jsp" /> 
    <body class="body_html_mainview margin_botton">
        <jsp:include page="assets/shared/models/validateSession.jsp" />

        <jsp:include page="assets/shared/models/headerBack.jsp" />
        <form class="character-form" action="controllers/controller.jsp?op=savenewcharacter" method="POST" name="formcharacter">
            <div class="container margin_top_login">
                <!-- Start Row title-->
                <h5 class="titles_red_h5">Añadir Personaje</h5>
                <!-- End Row title-->
                <!-- Start Row image and credentials-->
                <div class="row">
                    <!-- Start col 1-->
                    <div class="col s12 m6 l6">
                        <label for="first_name" class="black_taurinas">Nombre</label>
                        <input id="first_name" required="true" type="text" class="validate" name="first_name">
                        <label for="surname" class="black_taurinas">Primer Apellido</label>
                        <input  id="frist_surname" required="true" type="text" class="validate" name="frist_surname">
                        <label for="second_surname"  required="true" class="black_taurinas">Segundo Apellido</label>
                        <input  id="surname" type="text" class="validate" name="second_surname">
                        <label for="birth_province" class="black_taurinas">Provincia de nacimiento</label>
                        <input id="birth_province" type="text" class="validate" name="birth_province">
                    </div>
                    <!-- End col 1-->
                    <!-- Start col 2-->
                    <div class="col s12 m6 l6">
                        <label for="first_nickname" required="true" class="black_taurinas">Primer Apodo</label>
                        <input id="first_nickname" type="text" class="validate" name="first_nickname">
                        <label for="second_nickname" class="black_taurinas">Segundo Apodo</label>
                        <input id="second_nickname" type="text" class="validate" name="second_nickname">
                        <label for="birth_date" required="true" class="black_taurinas">Fecha Nacimiento</label>
                        <input id="birth_date" type="text" class="datepicker" name="birth_date">
                        <label for="birth_town" class="black_taurinas">Pueblo de nacimiento</label>
                        <input id="birth_town" type="text" class="validate" name="birth_town">
                    </div>
                    <!-- End col 2-->
                </div>
                <!-- End Row image and credentials-->


                <br/><br/><br/>
                <!-- Start row Personal details-->
                <h5 class="titles_red_h5">Mas Datos</h5>
                <div class="row">
                    <!-- Start frist col personal detail-->
                    <div class="col s12 m6 l4">
                        <label for="name_poster"  class="black_taurinas">Nombre Cartel</label>
                        <input id="name_poster" required="true" type="text" class="validate" name="name_poster">
                        <label for="img" class="black_taurinas">Imagen <i id="informationimage " data-position="bottom" data-delay="10" data-tooltip="Debe colocar la URL de la imagen" class=" tooltipped material-icons information_orange_buttons">info</i></label>
                        <input  id="img" type="text" class="validate" name="img">
                    </div>
                    <!-- End frist col personal detail-->
                    <!-- Start second col personal detail-->
                    <div class="col s12 m6 l4">
                        <label for="direction" class="black_taurinas">Dirección</label>
                        <input id="direction" type="text" class="validate" name="direction">
                        <label for="contact" class="black_taurinas">Contacto</label>
                        <input id="contact" type="text" class="validate" name="contact">
                    </div>
                    <!-- End second col personal detail-->
                    <!-- Start third col personal detail-->
                    <div class="col s12 m6 l4">
                        <label for="phone" class="black_taurinas">Teléfono</label>
                        <input id="phone" type="number" class="validate" name="phone">  
                        <label for="email" class="black_taurinas">Email</label>
                        <input id="email" type="email" class="validate" name="email">
                    </div>
                    <!-- End third col personal detail-->
                </div>
                <!-- End row Personal details-->

                <!-- Start row of complete and cossio -->
                <div class="row center-align">
                    <!-- Start col 1-->
                    <div class="col s12 m6 l6">
                        <input type="checkbox" class="" id="complete" name="checkcomplete"/>
                        <label for="complete" class="black_taurinas">Completo</label>
                    </div>
                    <!-- End col 1-->
                    <!-- Start col 2-->
                    <div class="col s12 m6 l6">
                        <input type="checkbox" class="" id="cossio" name="checkcossio"/>
                        <label for="cossio" class="black_taurinas">Cossio</label>
                    </div>
                    <!-- End col 2-->
                </div>
                <!-- End row of complete and cossio -->   

                <!-- Start row provinces -->
                <div class="row">
                    <!-- Start col 1-->
                    <div class="col s12 m6 l6">
                        <label for="current_province" class="black_taurinas">Provincia actual</label>
                        <input id="current_province" type="text" class="validate" name="current_province">
                    </div>
                    <!-- End col 1-->
                    <!-- Start col 2-->
                    <div class="col s12 m6 l6">
                        <label for="current_town" class="black_taurinas">Pueblo actual</label>
                        <input id="current_town" type="text" class="validate" name="current_town">
                    </div>
                    <!-- End col 2-->
                </div>
                <!-- End row provinces -->


                <!-- Start row biograpy and image-->
                <div class="row">
                    <div class="col s12 m12 l12">
                        <label class="black_taurinas" for="biography">Biografía</label>
                        <textarea id="biography" class="materialize-textarea" name="biography"></textarea>  
                        <label class="black_taurinas" for="notes">Notas</label>
                        <textarea id="notes" class="materialize-textarea" name="notes"></textarea>  
                        <label class="black_taurinas" for="find_out">Averiguar</label>
                        <textarea id="find_out" class="materialize-textarea" name="find_out"></textarea>  
                    </div>
                </div>
                <!-- End row biograpy and image-->

                <div class="row center-align">
                    <button   class="waves-effect waves-light btn grey darken-4" type="submit"><i class="material-icons left">save</i>Guardar</button>
                    <a class="waves-effect waves-light btn grey darken-4" href="personajes.jsp"><i class="material-icons left">cancel</i>Cancelar</a>
                </div>
            </div>
        </form>
        <jsp:include page="assets/shared/body.jsp" />
    </body>
</html>

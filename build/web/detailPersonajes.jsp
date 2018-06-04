<%-- 
    Document   : torerosdetail
    Created on : 08-may-2018, 13:56:33
    Author     : agustin
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.List"%>
<%@page import="Entities.Efemeride"%>
<%@page import="Entities.Personaje"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="assets/shared/head.jsp" /> 
    <body class="body_html_mainview margin_botton">
        <jsp:include page="assets/shared/models/validateSession.jsp" />

        <jsp:include page="assets/shared/models/headerBack.jsp" />
        <div class="container margin_top_login">

            <%
                try {

                    Personaje personajedatail = (Personaje) session.getAttribute("personajedatail");
                    DateFormat dateFormat = new SimpleDateFormat("dd MMM, yyyy");
            %>
            <!-- Start Row title-->
            <div class="row">
                <div class="col s12 m7 l8">
                    <h5 class="titles_red_h5">Personaje</h5>
                </div>
                <div class="col s12 m5 l4">
                    <form target="_blank" class="filter-form" action="controllers/controller.jsp?op=createinformpdf" method="POST" name="formfilter">
                        <input class="hidden_display " name="idcharacter" value="<%=personajedatail.getIdpersonaje()%>">
                        <button class="btn waves-effect waves-light green" type="submit" name="action">Descargar informe<i class="material-icons right">picture_as_pdf</i></button>
                    </form>
                </div>
            </div>

            <!-- End Row title-->
            <!-- Start Row image and credentials-->
            <div class="row">

                <!-- Start col image-->
                <div class="col s12 m4 l5">
                    <div class="mate wrapper-image">
                        <img onerror="this.src='assets/img/no-photo.png';" class="image_character_detail" src="<%=personajedatail.getFoto()%>" >
                    </div>
                </div>
                <!-- End col image-->
                <!-- Start col credentials-->
                <div class="col s12 m8 l7">
                    <label for="first_name" class="black_taurinas">Nombre</label>
                    <input disabled="true" value="<%=personajedatail.getNombrepersonaje()%>" id="first_name" type="text" class="validate">
                    <label for="surname" class="black_taurinas">Apellidos</label>
                    <input disabled="" value="<%=personajedatail.getApellido1()%> <%=personajedatail.getApellido2()%>" id="surname" type="text" class="validate">
                    <label for="first_nickname" class="black_taurinas">Primer Apodo</label>
                    <input disabled="" value="<%=personajedatail.getApodo1()%>" id="first_nickname" type="text" class="validate">
                    <label for="second_nickname" class="black_taurinas">Segundo Apodo</label>
                    <input disabled="" id="second_nickname" value="<%=personajedatail.getApodo2()%>" type="text" class="validate">
                </div>
                <!-- End col credentials-->
            </div>
            <!-- End Row image and credentials-->
            <!-- Start row Personal details-->
            <h5 class="titles_red_h5">Más Datos</h5>
            <div class="row">
                <!-- Start frist col personal detail-->
                <div class="col s12 m6 l4">
                    <label for="name_poster" class="black_taurinas">Nombre Cartel</label>
                    <input disabled value="<%=personajedatail.getNombrecartel()%>" id="name_poster" type="text" class="validate">
                    <label for="birth_date" class="black_taurinas">Fecha Nacimiento</label>
                    <input disabled value="<%=dateFormat.format(personajedatail.getFechanacimiento())%>" id="birth_date" type="text" class="datepicker">
                    <label for="brith_province" class="black_taurinas">Provincia de nacimiento</label>
                    <input disabled value="<%=personajedatail.getProvincianacimiento()%>" id="brith_province" type="text" class="validate">
                </div>
                <!-- End frist col personal detail-->
                <!-- Start second col personal detail-->
                <div class="col s12 m6 l4">
                    <label for="direction" class="black_taurinas">Dirección</label>
                    <input disabled value="<%=personajedatail.getDireccion()%>" id="direction" type="text" class="validate">
                    <label for="contact" class="black_taurinas">Contacto</label>
                    <input disabled value="<%=personajedatail.getContacto()%>" id="contact" type="text" class="validate">
                    <label for="brith_town" class="black_taurinas">Pueblo de nacimiento</label>
                    <input disabled value="<%=personajedatail.getPueblonacimiento()%>" id="brith_town" type="text" class="validate">
                </div>
                <!-- End second col personal detail-->
                <!-- Start third col personal detail-->
                <div class="col s12 m6 l4">
                    <label for="phone" class="black_taurinas">Teléfono</label>
                    <input disabled value="<%=personajedatail.getTelefono()%>" id="phone" type="number" class="validate" >  
                    <label for="email" class="black_taurinas">Email</label>
                    <input disabled value="<%=personajedatail.getCorreo()%>" id="email" type="email" class="validate">
                    <label for="profession" class="black_taurinas">Profesion</label>
                    <input disabled value="profesion" id="profession" type="text" class="validate">
                </div>
                <!-- End third col personal detail-->
            </div>
            <!-- End row Personal details-->
            <div class="row">
                <div class="col s12 m6 l6">
                    <label for="current_province" class="black_taurinas">Provincia actual</label>
                    <input disabled value="<%=personajedatail.getProvinciaactual()%>" id="current_province" type="text" class="validate">
                    <label for="current_town" class="black_taurinas">Pueblo actual</label>
                    <input disabled value="<%=personajedatail.getPuebloactual()%>" id="current_town" type="text" class="validate">

                </div>
                <div class="col s12 m6 l6 center">
                    <div class="row">
                        <input disabled="disabled" type="checkbox" class="" id="complete" name="checkcomplete"/>
                        <label for="complete" class="black_taurinas">Completo</label>
                        <script>
                            if (<%=personajedatail.getCompleto()%> == true) {
                                $('#complete').prop('checked', true);
                            } else {
                                $('#complete').prop('checked', false);
                            }
                        </script>
                    </div>
                    <div class="row">
                        <input disabled="disabled" type="checkbox" class="" id="cossio" name="checkcossio"/>
                        <label for="cossio" class="black_taurinas">Cossio</label>
                        <script>
                            if (<%=personajedatail.getCossio()%> == true) {
                                $('#cossio').prop('checked', true);
                            } else {
                                $('#cossio').prop('checked', false);
                            }
                        </script>
                    </div>
                    <div class="row">
                        <input disabled="disabled" type="checkbox" class="" id="clm" name="checkclm"/>
                        <label for="clm" class="black_taurinas">CLM</label>
                        <!--<script>
                            if ( == true) {
                                $('#complete').prop('checked', true);
                            } else {
                                $('#complete').prop('checked', false);
                            }
                        </script>-->
                    </div>
                </div>
            </div>
            <!-- Start col personal biograpy-->
            <div class="row margin_top_login">
                <div class="col s12">
                    <label for="biography">Biografía</label>
                    <textarea disabled value=""  id="biography" class="materialize-textarea"><%=personajedatail.getBiografia()%></textarea>
                    <label for="notes">Notas</label>
                    <textarea disabled value=""  id="notes" class="materialize-textarea"><%=personajedatail.getNotas()%></textarea>
                    <label for="find_out">Averiguar</label>
                    <textarea disabled value=""  id="find_out" class="materialize-textarea"><%=personajedatail.getAveriguar()%></textarea>
                </div>
            </div>
            <!-- End col personal biograpy-->
            <!-- Start Table efemerides -->
            <h5 class="titles_red_h5">Efemérides</h5>
            <%
                List<Efemeride> listaEfemeridesPersonaje = (List<Efemeride>) session.getAttribute("listaEfemeridesPersonaje");
                if (listaEfemeridesPersonaje.size() != 0) {%>
            <table class="highlight striped">
                <thead>
                    <tr>
                        <th>Nombre</th>
                        <th>Año</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (int i = 0; i < listaEfemeridesPersonaje.size(); i++) {%>
                    <tr>
                        <td><%=personajedatail.getNombrepersonaje()%> <%=personajedatail.getApellido1()%> <%=personajedatail.getApellido2()%></td>
                        <td><%=dateFormat.format(listaEfemeridesPersonaje.get(i).getFechaefemeride())%></td>
                        <td>
                            <form class="filter-form" action="controllers/controllerEfemeride.jsp?op=detailefemeride" method="POST" name="formfilter">
                                <input class="hidden_display " name="idcharacter" value="<%=personajedatail.getIdpersonaje()%>">
                                <input class="hidden_display " name="idefemeride" value="<%=listaEfemeridesPersonaje.get(i).getIdefemeride()%>">
                                <button type="submit" class="waves-effect waves-light btn small_button background_color_red" >Ver más</button>
                            </form>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
            <%
            } else {%>
            <p>No existe cartel</p>
            <%}%>
            <!-- End Table efemerides -->
        </div>
        <%} catch (Exception e) {
                session.setAttribute("errormessage", "Error visualizar el detalle del personaje");
                response.sendRedirect("mainview.jsp");
            }%>
        <jsp:include page="assets/shared/body.jsp" />
    </body>
</html>

<%-- 
    Document   : toreros
    Created on : 08-may-2018, 11:50:37
    Author     : agustin
--%>

<%@page import="Entities.Personaje"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="assets/shared/head.jsp" /> 

    <body class="body_html_mainview margin_botton">
        <!-- Start Header with back-->
        <jsp:include page="assets/shared/models/headerBack.jsp" />
        <!-- End Header with back-->
        <div class="container margin_top_login">
            <!-- Start Row title and add-->
            <div class="row">
                <div class="col s12">
                    <h4 class="titles_red_h5">Personajes</h4>
                </div>
            </div>

            <div class="row">
                <div class="col s12 m4 l4">
                    <form class="filter-form" action="controllers/controller.jsp?op=sendfilter" method="POST" name="formfilter">
                        <select  id="sendfilter" onchange="this.form.submit()"  name="sendfilter">
                            <!-- controllers/controller.jsp?op=loadallefemerides -->
                            <option value="" disabled selected>Ordenar por</option>
                            <option value="1">Fecha de nacimiento</option>
                            <option value="2">Pueblo</option>
                            <option value="3">Nombre</option>
                            <option value="4">Apodo</option>
                            <option value="5">Incompleto</option>
                        </select>
                    </form>
                </div>
                <div class="col s12 m4 l4 center-align">
                    <form class="search-form" action="controllers/controller.jsp?op=searchcharacter" method="POST" name="formsearch">
                        <input placeholder="Buscar" id="search" type="text" class="validate input_search" name="search"> 
                        <button type="submit"  class="waves-effect waves-light btn background_color_red button_search" ><i class="material-icons left">search</i></buttom>
                    </form>
                </div>
                <div class="col s12 m4 l4 margin_top " >
                    <a class="waves-effect waves-light btn grey darken-4 right button_add_character " href="addPersonaje.jsp">añadir personaje</a>
                </div>
            </div>

            <!-- End row title and add-->
            <!-- Start row of characters-->
            <div class="row">
                <%
                    try {

                        List<Personaje> listaPersonaje = (List<Personaje>) session.getAttribute("listaPersonaje");

                        for (int i = 0; i < listaPersonaje.size(); i++) {%>
                <div class="col s12 m6 l4">
                    <div class="card">
                        <div class="card-content min_height_card_character">
                            <div class="img card_bullfighter">
                                card_bullfighter" src="<%=listaPersonaje.get(i).getFoto()%>"></div>
                            <h5><%=listaPersonaje.get(i).getNombrepersonaje()%> <%=listaPersonaje.get(i).getApellido1()%> <%=listaPersonaje.get(i).getApellido2()%> </h5>
                            <p>"<%=listaPersonaje.get(i).getApodo1()%>"</p>
                        </div>
                        <div class="card-action margin_top_card_action">
                            <div class="row">
                                <div class="fixed-action-btn horizontal " style="position: absolute; display: inline-block; right: 7px;">
                                    <a class="btn-floating btn-large background_color_red">
                                        <i class="large material-icons">menu</i>
                                    </a>
                                    <ul>
                                        <li>
                                            <form class="filter-form" action="controllers/controller.jsp?op=detailcharacter" method="POST" name="formfilter">
                                                <input class="hidden_display " name="idcharacter" value="<%=listaPersonaje.get(i).getIdpersonaje()%>">
                                                <button type="submit" class="waves-effect waves-light btn-floating green"><i class="material-icons">remove_red_eye</i></button>
                                            </form>
                                        </li>
                                        <li>
                                            <form class="filter-form" action="controllers/controller.jsp?op=editcharacter" method="POST" name="formfilter">
                                                <input class="hidden_display " name="idcharacter" value="<%=listaPersonaje.get(i).getIdpersonaje()%>">
                                                <button type="submit" class="waves-effect waves-light btn-floating blue"><i class="material-icons">edit</i></button>
                                            </form>
                                        </li>

                                        <li>
                                            <form class="filter-form" action="controllers/controller.jsp?op=deletecharacter" method="POST" name="formDelete-<%=listaPersonaje.get(i).getIdpersonaje()%>">
                                                <input class="hidden_display" name="idperonajedelete" value="<%=listaPersonaje.get(i).getIdpersonaje()%>">
                                                <button type="button" onclick="return confirmdelete(<%=listaPersonaje.get(i).getIdpersonaje()%>);" id="deletebutton" class="deletebutton waves-effect waves-light btn-floating red"><i id="delete" class= " material-icons">delete</i></button>
                                            </form>

                                        </li>
                                    </ul>
                                </div>


                            </div>
                        </div>
                    </div>
                </div>
                <%}
                    if (listaPersonaje.size() == 0) {%> 
                <span style="max-height: auto"> No se ha encontrado nigun personaje</span>
                <%
                        }

                    } catch (Exception e) {
                        session.setAttribute("errormessage", "Error visualizar los personajes");
                        response.sendRedirect("mainview.jsp");
                    }%>
            </div>

            <!-- End row of character-->
        </div>
        <jsp:include page="assets/shared/modals/modalconfirmationdeletcharacter.jsp" />
    </div>


    <jsp:include page="assets/shared/body.jsp" />
</body>
</html>

<%-- 
    Document   : profesiones
    Created on : 06-jun-2018, 18:21:21
    Author     : agustin
--%>

<%@page import="Entities.Profesion"%>
<%@page import="Entities.Personaje"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <jsp:include page="assets/shared/head.jsp" /> 

    <body class="body_html_mainview margin_botton">
        <jsp:include page="assets/shared/models/validateSession.jsp" />
        <jsp:include page="assets/shared/models/headerBack.jsp" />



        <div class="container margin_top_login">
            <h5 class="titles_red_h5">Profesiones  <i id="informationimage " data-position="bottom" data-delay="10" data-tooltip="Debe buscar el nombre y la profesión que quiera" class=" tooltipped material-icons information_orange_buttons">info</i></h5>
            <div class="row">
                <form class="filter-form-efe" action="controllers/controllerProfesion.jsp?op=searchcharacterprofession" method="POST" name="formfilterefe">
                    <div class="input-field col s6">
                        <input id="name" type="text" class="validate" name="nameandsurnames">
                        <label for="name">Nombre o apodo</label>
                    </div>
                    <div class="input-field col s6">
                        <input id="profession" type="text" class="validate" name="profession">
                        <label for="profession">Profesion</label>
                    </div>
                    <button class="btn waves-effect waves-light" type="submit" name="action">Submit<i class="material-icons right">send</i></button>
                </form>
            </div>

            <div class="row">
                <% List<Profesion> listaprofesion = (List<Profesion>) session.getAttribute("listaprofesiones");
                    if (listaprofesion.size() != 0) {
                %>
                <table class="striped highlight" id="myTable">
                    <thead>
                        <tr>
                            <th>Personaje</th>
                            <th>Profesion</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (int i = 0; i < listaprofesion.size(); i++) {
                                for (int j = 0; j < listaprofesion.get(i).getPersonajeList().size(); j++) {%>
                        <tr>
                            <td><%=listaprofesion.get(i).getPersonajeList().get(j).getNombrepersonaje() %> <%=listaprofesion.get(i).getPersonajeList().get(j).getApellido2() %> <%=listaprofesion.get(i).getPersonajeList().get(j).getApellido1() %></td>
                            <td><%=listaprofesion.get(i).getDescripcion()%></td>
                            <td><a class="waves-effect waves-light btn small_button red"><i class="material-icons center">delete</i></a></td>
                        </tr>
                        <%}
                            }%>
                    </tbody>
                </table>
                <span class="margin_top_login"><%=listaprofesion.size()%> resultados</span>
                <%} else {%>
                <span class="">No se han encontrado resultados</span>
                <%}%>
            </div>


            <!--Select P from Profesion P where P.personajeList = (SELECT PE FROM Personaje PE WHERE PE.idpersonaje = 51)-->
        </div>

        <jsp:include page="assets/shared/body.jsp" />
    </body>
</html>

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
            <h5 class="titles_red_h5">Profesiones  <i id="informationimage " data-position="bottom" data-delay="10" data-tooltip="Puede buscar por nombre y profesión" class=" tooltipped material-icons information_orange_buttons">info</i></h5>
            <div class="row">
                <form class="filter-form-efe" action="controllers/controllerProfesion.jsp?op=searchcharacterprofession" method="POST" name="formfilterefe">
                    <div class="row">
                        <div class="input-field col s12 m12 l4">
                            <input id="name" type="text" class="validate" name="nameandsurnames">
                            <label for="name">Nombre o apodo</label>
                        </div>
                        <div class="input-field col s12 m12 l3">
                            <input id="profession" type="text" class="validate" name="profession">
                            <label for="profession">Profesion</label>
                        </div>
                        <div class="col s12 m12 l5 right-align">
                            <button class="btn waves-effect waves-light green" type="submit" name="action">Buscar<i class="material-icons right">search</i></button>
                            <button class="btn waves-effect waves-light blue modal-trigger right-align" data-target="modalprof" type="button">Añadir<i class="material-icons right">add</i></button>
                        </div>
                    </div>

                </form>
            </div>


            <div class="row">
                <% List<Profesion> listaprofesion = (List<Profesion>) session.getAttribute("listaprofesiones");
                    List<Personaje> listapersonajes = (List<Personaje>) session.getAttribute("listapersonajes");
                    List<Profesion> selectlistaprofesiones = (List<Profesion>) session.getAttribute("selectlistaprofesiones");
                    if (listaprofesion != null && listaprofesion.size() != 0) {
                %>

                <table cellpadding="1" cellspacing="1" class="striped table table-hover" id="myTable">
                    <thead>
                        <tr>
                            <th>Personaje</th>
                            <th>Profesión</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (int i = 0; i < listaprofesion.size(); i++) {
                                for (int j = 0; j < listaprofesion.get(i).getPersonajeList().size(); j++) {%>
                        <tr>
                            <td><%=listaprofesion.get(i).getPersonajeList().get(j).getNombrepersonaje()%> <%=listaprofesion.get(i).getPersonajeList().get(j).getApellido2()%> <%=listaprofesion.get(i).getPersonajeList().get(j).getApellido1()%></td>
                            <td><%=listaprofesion.get(i).getDescripcion()%></td>
                            <td>
                                <form class="delete-profesion" action="controllers/controllerProfesion.jsp?op=deleteprofesionpersonaje" method="POST" name="deleteprofesion">
                                    <input class="hidden_display" name="idprofesiondelete" value="<%=listaprofesion.get(i).getIdprofesion()%>">
                                    <input class="hidden_display" name="idperonajedelete" value="<%=listaprofesion.get(i).getPersonajeList().get(j).getIdpersonaje()%>">
                                    <button class="waves-effect waves-light btn small_button red" type="submit" name="action"><i class="material-icons center">delete</i></button>
                                </form>
                            </td>
                        </tr>
                        <%}
                            }%>
                    </tbody>
                </table>
                <div class="col-md-12 center text-center">
                    <span class="left" id="total_reg"></span>
                    <ul class="pagination pager" id="myPager"></ul>
                </div>
                <%} else if (listapersonajes != null && listapersonajes.size() != 0) {%>

                <div class="row">
                    <table cellpadding="1" cellspacing="1" class="striped table table-hover" id="myTable">
                        <thead>
                            <tr>
                                <th>Personaje</th>
                                <th>Profesión</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for (int i = 0; i < listapersonajes.size(); i++) {
                                for (int j = 0; j < listapersonajes.get(i).getProfesionList().size(); j++) {%>
                            <tr>
                                <td><%=listapersonajes.get(i).getNombrepersonaje()%> <%=listapersonajes.get(i).getApellido1()%> <%=listapersonajes.get(i).getApellido2()%></td>
                                <td><%=listapersonajes.get(i).getProfesionList().get(j).getDescripcion()%></td>
                                <td>
                                    <form class="delete-profesion" action="controllers/controllerProfesion.jsp?op=deleteprofesionpersonaje" method="POST" name="deleteprofesion">
                                        <input class="hidden_display" name="idprofesiondelete" value="<%=listapersonajes.get(i).getProfesionList().get(j).getIdprofesion()%>">
                                        <input class="hidden_display" name="idperonajedelete" value="<%=listapersonajes.get(i).getIdpersonaje()%>">
                                        <button class="waves-effect waves-light btn small_button red" type="submit" name="action"><i class="material-icons center">delete</i></button>
                                    </form>
                                </td>
                            </tr>
                            <%}
                            }%>
                        </tbody>
                    </table>
                    <div class="col-md-12 center text-center">
                        <span class="left" id="total_reg"></span>
                        <ul class="pagination pager" id="myPager"></ul>
                    </div>
                </div>
                <div class="row margin_top_login">
                    <form class="filter-form-efe" action="controllers/controllerProfesion.jsp?op=addprofesionpersonaje" method="POST" name="formfilterefe">
                        <div class="input-field col s12 m12 l4">
                            <select name="selectidpersonajes" >
                                <option value="" disabled selected>Seleccione un personaje</option>
                                <% for (int i = 0; i < listapersonajes.size(); i++) {
                                %>
                                <option value="<%=listapersonajes.get(i).getIdpersonaje()%>"><%=listapersonajes.get(i).getNombrepersonaje()%> <%=listapersonajes.get(i).getApellido1()%> <%=listapersonajes.get(i).getApellido2()%></option>
                                <%}%>
                            </select>
                        </div>
                        <div class="input-field col s12 m12 l4">
                            <select name="selectidprofesion">
                                <option value="" disabled selected>Seleccione una profesion</option>
                                <% for (int i = 0; i < selectlistaprofesiones.size(); i++) {%>
                                <option value="<%=selectlistaprofesiones.get(i).getIdprofesion()%>"><%=selectlistaprofesiones.get(i).getDescripcion()%></option>
                                <%}%>
                            </select>
                        </div>
                        <div class="col s12 m12 l4 right-align">
                            <button class="btn waves-effect waves-light" type="submit" name="action">Añadir Profesion<i class="material-icons right">add</i></button>
                        </div>
                    </form>
                </div>
                <%} else {%>
                <span class="">No se han encontrado resultados</span>
                <%}%>
            </div>

            <!--Select P from Profesion P where P.personajeList = (SELECT PE FROM Personaje PE WHERE PE.idpersonaje = 51)-->
        </div>

        <jsp:include page="assets/shared/modals/modalprof.jsp"/>
        <jsp:include page="assets/shared/body.jsp" />
    </body>
</html>

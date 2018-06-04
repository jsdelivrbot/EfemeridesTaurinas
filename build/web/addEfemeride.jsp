<%-- 
    Document   : addEfemeride
    Created on : 14-may-2018, 15:12:34
    Author     : agustin
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Entities.Cartel"%>
<%@page import="Entities.Personaje"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="assets/shared/head.jsp" /> 
    <body class="body_html_mainview margin_botton">
        <jsp:include page="assets/shared/models/validateSession.jsp" />

        <jsp:include page="assets/shared/models/headerBack.jsp" />
        <div class="container margin_top_login ">
            <!-- Start Row title-->
            <h5 class="titles_red_h5">Añadir Efeméride</h5>
            <!-- End Row title-->
            <!-- Start Row image and credentials-->
            <form class="character-form" action="controllers/controllerEfemeride.jsp?op=savenewefe" method="POST" name="formcharacter">
                <div class="row">
                    <!-- Start col 1-->
                    <div class="col s12 m6 l6">
                        <label for="town" class="black_taurinas">Población</label>
                        <input required="required" id="town" type="text" class="validate" name="town">
                        <label for="date" class="black_taurinas">Fecha</label>
                        <input required="required" id="date" type="text" class="datepicker" name="date">
                    </div>
                    <!-- End col 1-->
                    <!-- Start col 2-->
                    <div class="col s12 m6 l6">
                        <label for="event" class="black_taurinas">Evento</label>
                        <input required="required" id="event" type="text" class="validate" name="event">
                        <label for="report" class="black_taurinas">Reportaje</label>
                        <input required="required" id="report" type="text" class="validate" name="report">
                    </div>
                    <!-- End col 2-->
                </div>
                <!-- End Row image and credentials-->
                <div class="row">
                    <div class="s12">
                        <label class="black_taurinas" for="notes">Notas</label>
                        <textarea id="notes" class="materialize-textarea" name="notes"></textarea>
                    </div>
                </div>
                <br/><br/><br/>
                <h5 class="titles_red_h5">Cartel <i id="informationimage " onclick="myFunction()" class="material-icons information_orange_buttons">info</i></h5> 

                <div class="chip background_color_red white-text" id="dialogInformation" style="height: auto!important; display: none">
                    <i class="material-icons close">close</i>
                    Un cartel esta formado por el toro, la ganaderia y el interviniente
                </div>

                <script>
                    function myFunction() {
                        var x = document.getElementById("dialogInformation");
                        if (x.style.display === "none") {
                            x.style.display = "block";
                        } else {
                            x.style.display = "none";
                        }
                    }
                </script>


                <%
                    List<Cartel> listacartel = (ArrayList<Cartel>) session.getAttribute("listacartel");
                    if (listacartel.size() != 0) {
                %>

                <div class="row margin_top_login">
                    <table class="striped centered highlight">
                        <thead>
                            <tr>
                                <th>Toros</th>
                                <th>Ganaderías</th>
                                <th>Intervinientes</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%for (int i = 0; i < listacartel.size(); i++) {
                            %>
                            <tr>
                                <td><%=listacartel.get(i).getNombretoro()%></td>
                                <td><%=listacartel.get(i).getNombreganaderia()%></td>
                                <td><%=listacartel.get(i).getNombreinterviniente()%></td>
                                <td><a></a></td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                </div>
                <%
                    session.setAttribute("listacartel", listacartel);
                } else if (listacartel.size() == 0) {%>
                <span>No existe cartel</span>
                <%}%>
                <div class="row margin_top_login">
                    <%if (listacartel.size() < 6) { %>
                    <button class="btn waves-effect waves-light blue modal-trigger right-align" data-target="modalcat">Añadir cartel</button>
                    <%}%>
                    <a class="waves-effect waves-light btn red " href="controllers/controllerEfemeride.jsp?op=deleteallrows">Borrar todos los carteles</a>
                </div>

                <div class="row margin_top_login">

                    <div class="col s10 m8 l8 offset-s1 offset-m2 offset-l2">
                        <div class="input-field col s12">
                            <select required="required" id="selectcharactersefemerides"  name="idpersonajes">
                                <option value="" disabled selected>Seleccione un personaje</option>
                                <%
                                    try {
                                        List<Personaje> listaPersonaje = (List<Personaje>) session.getAttribute("listapersonajes");
                                        for (int i = 0; i < listaPersonaje.size(); i++) {%>
                                <option value="<%=listaPersonaje.get(i).getIdpersonaje()%>"><%=listaPersonaje.get(i).getNombrepersonaje()%> <%=listaPersonaje.get(i).getApellido1()%> <%=listaPersonaje.get(i).getApellido2()%></option>
                                <%
                                        }

                                    } catch (Exception e) {
                                        session.setAttribute("errormessage", "Error cargar los personajes");
                                        response.sendRedirect("../mainview.jsp");
                                    }%>
                            </select>
                            <label>Selecciona un personaje</label>
                        </div>
                    </div>

                </div>

                <div class="row center-align">
                    <button type="submit" class="waves-effect waves-light btn grey darken-4 "><i class="material-icons left">save</i>Guardar</button>
                    <a class="waves-effect waves-light btn grey darken-4" href="efemerides.jsp"><i class="material-icons left">cancel</i>Cancelar</a>
                </div>
            </form>
            <!-- Start Modal -->
            <jsp:include page="assets/shared/modals/modalcat.jsp" />
            <!-- End Modal -->
        </div>
        <jsp:include page="assets/shared/body.jsp" />
    </body>
</html>

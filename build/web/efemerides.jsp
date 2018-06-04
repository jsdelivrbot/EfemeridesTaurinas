<%-- 
    Document   : toreros
    Created on : 08-may-2018, 11:50:37
    Author     : agustin
--%>

<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Entities.Efemeride"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <jsp:include page="assets/shared/head.jsp" /> 
    <script language="javascript" type="text/javascript">
        function poncombo(combo, valor)
        {
            for (i = 0; i < combo.options.length; i++)
                if (combo.options[i].value == valor)
                    combo.options[i].selected = true;
        }
    </script>
    <body class="body_html_mainview margin_botton">
        <jsp:include page="assets/shared/models/headerBack.jsp" />

        <div class="container margin_top_login">
            <div class="row">
                <div class="col s12">
                    <h4 class="titles_red_h5">Efemérides</h4>
                </div>
            </div>

            <div class="row">
                <div class="col s12 m4 l4">
                    <form class="filter-form-efe" action="controllers/controller.jsp?op=sendfilterefe" method="POST" name="formfilterefe">
                        <select  id="sendfilter" onchange="this.form.submit()"  name="sendfilterefe">
                            <!-- controllers/controller.jsp?op=loadallefemerides -->
                            <option value="" disabled selected>Ordenar por</option>
                            <option value="1">Fecha</option>
                            <option value="2">Pueblo</option>
                        </select>
                    </form>
                    <script language="javascript" type="text/javascript">
                        poncombo(document.formfilterefe.sendfilterefe, '<%=session.getAttribute("sendfilterefe")%>');
                    </script>
                </div>
                <div class="col s12 m6 l6 offset-m2 offset-l2">
                    <!--<a class=" red_taurinas modal-trigger" data-target="modal2">Añadir Efeméride</a>-->
                    <a class="waves-effect waves-light btn grey darken-4 right" href="controllers/controllerEfemeride.jsp?op=loadllcharactersforefemerides">añadir efeméride</a>
                </div>
            </div>

            <div class="row">

                <%
                    try {

                        List<Efemeride> listaefemerides = (List<Efemeride>) session.getAttribute("listaefemerides");
                        DateFormat dateFormat = new SimpleDateFormat("dd MMM, yyyy");
                        for (int i = 0; i < listaefemerides.size(); i++) {
                %>
                <div class="col s12 m6 l4" style="margin-bottom: 10px;">
                    <div class="card horizontal" style="height: 200px">
                        <div class="card-stacked">
                            <div class="card-content">
                                <h5><%=listaefemerides.get(i).getIdpersonaje().getNombrepersonaje()%> <%=listaefemerides.get(i).getIdpersonaje().getApellido1()%> <%=listaefemerides.get(i).getIdpersonaje().getApellido2()%></h5>
                                <p>Fecha: <%= dateFormat.format(listaefemerides.get(i).getFechaefemeride())%></p>
                                <p>Población: <%=listaefemerides.get(i).getPoblacion()%></p>
                            </div>
                            <div class="card-action">
                                <div class="fixed-action-btn horizontal " style="position: absolute; display: inline-block; right: 7px; margin-bottom: -15px">
                                    <a class="btn-floating btn-large background_color_red">
                                        <i class="large material-icons">menu</i>
                                    </a>
                                    <ul>
                                        <li>
                                            <form class="filter-form" action="controllers/controllerEfemeride.jsp?op=detailefemeride" method="POST" name="formfilter">
                                                <input class="hidden_display" name="idefemeride" value="<%=listaefemerides.get(i).getIdefemeride()%>">
                                                <input class="hidden_display" name="idcharacter" value="<%=listaefemerides.get(i).getIdpersonaje().getIdpersonaje()%>">
                                                <button type="submit" class="waves-effect waves-light btn-floating green"><i class="material-icons">remove_red_eye</i></button>
                                            </form>
                                        </li>
                                        <li>
                                            <form class="filter-form" action="controllers/controllerEfemeride.jsp?op=loadllcharactersforeditefemerides" method="POST" name="formfilter">
                                                <input class="hidden_display" name="idefemeride" value="<%=listaefemerides.get(i).getIdefemeride()%>">
                                                <input class="hidden_display" name="idcharacter" value="<%=listaefemerides.get(i).getIdpersonaje().getIdpersonaje()%>">
                                                <button type="submit" class="waves-effect waves-light btn-floating blue"><i class="material-icons">edit</i></button>
                                            </form>
                                        </li>

                                        <li>
                                            <!--<input class="hidden_display" name="idefemeride" value=">">
                                            <button class="waves-effect waves-light btn-floating red modal-trigger" data-target="modalefem"><i class="material-icons">delete</i></button>-->
                                            <form class="filter-form" action="controllers/controllerEfemeride.jsp?op=deleteefemeride" method="POST" name="formfilter">
                                                <input class="hidden_display" name="idefemeride" value="<%=listaefemerides.get(i).getIdefemeride()%>">
                                                <button type="submit" class="waves-effect waves-light btn-floating red"><i class="material-icons">delete</i></button>
                                            </form>


                                        </li>
                                    </ul>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>

                <%}

                    } catch (Exception e) {
                        session.setAttribute("errormessage", "Error visualizar las efemerides");
                        response.sendRedirect("mainview.jsp");
                    }%>
            </div>


            <jsp:include page="assets/shared/modals/modalconfirmationdeleteefem.jsp" />
        </div>
    </div>


    <jsp:include page="assets/shared/body.jsp" />
</body>
</html>

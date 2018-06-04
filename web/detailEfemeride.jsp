<%-- 
    Document   : detailEfemeride
    Created on : 09-may-2018, 23:06:12
    Author     : agustin
--%>

<%@page import="java.util.Date"%>
<%@page import="java.util.Locale"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Entities.Cartel"%>
<%@page import="Entities.Personaje"%>
<%@page import="Entities.Efemeride"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="assets/shared/head.jsp" /> 
    <body class="body_html_mainview margin_botton">

        <jsp:include page="assets/shared/models/headerBack.jsp" />
        <jsp:include page="assets/shared/models/validateSession.jsp" />
        
        <div class="container margin_top_login">

            <%
                try {
                    Efemeride efemeride = (Efemeride) session.getAttribute("efem");

                    Personaje perso = (Personaje) session.getAttribute("perso");%>
            <div class="row">
                <div class="col s12 m7 l8">
                    <h5 class="titles_red_h5">Efeméride: <span class="black_taurinas"><%=perso.getNombrepersonaje()%> <%=perso.getApellido1()%> <%=perso.getApellido2()%>, "<%=perso.getApodo1()%>"</span></h5>
                </div>
                <div class="col s12 m5 l4">
                    <form target="_blank" class="filter-form" action="controllers/controllerEfemeride.jsp?op=createinformpdf" method="POST" name="formfilter">
                        <input class="hidden_display " name="idefemedide" value="<%=efemeride.getIdefemeride()%>">
                        <button class="btn waves-effect waves-light green" type="submit" name="action">Descargar informe<i class="material-icons right">picture_as_pdf</i></button>
                    </form>
                </div>
            </div>
            <div class="row">
                <div class="col s12 m4 l4">
                    <label for="poblacion" class="black_taurinas">Población</label>
                    <input disabled="" value="<%=efemeride.getPoblacion()%>" id="poblacion" type="text" class="validate">
                </div>
                <div class="col s12 m4 l4">

                    <% DateFormat dateFormat = new SimpleDateFormat("EEE MMM dd HH:mm:ss zzz yyyy", Locale.US);
                        //dateFormat.parse(efemeride.getFechaefemeride().toString());
                        String date = dateFormat.format(efemeride.getFechaefemeride());
                    %>
                    <label for="date" class="black_taurinas">Fecha</label>
                    <input disabled="" value="<%= date%>" id="date" type="text" class="validate">
                </div>
                <div class="col s12 m4 l4">
                    <label for="evento" class="black_taurinas">Evento</label>
                    <input disabled="" value="<%=efemeride.getEvento()%>" id="evento" type="text" class="validate">
                </div>
            </div>
            <div class="row">
                <div class="col s12">
                    <label for="reporteje" class="black_taurinas">Reportaje</label>
                    <input disabled="" value="<%=efemeride.getReportaje()%>" id="reporteje" type="text" class="validate">
                </div>
                <div class="col s12">
                    <label for="notes" class="black_taurinas">Notas</label>
                    <textarea disabled value=""  id="notes" class="materialize-textarea"><%=efemeride.getNotas()%></textarea>
                </div>
            </div>

            <%
                Cartel cartel1 = new Cartel(efemeride.getToro1(), efemeride.getGanaderia1(), "interiviente");
                Cartel cartel2 = new Cartel(efemeride.getToro2(), efemeride.getGanaderia2(), "interiviente");
                Cartel cartel3 = new Cartel(efemeride.getToro3(), efemeride.getGanaderia3(), "interiviente");
                Cartel cartel4 = new Cartel(efemeride.getToro4(), efemeride.getGanaderia4(), "interiviente");
                Cartel cartel5 = new Cartel(efemeride.getToro5(), efemeride.getGanaderia5(), "interiviente");
                Cartel cartel6 = new Cartel(efemeride.getToro6(), efemeride.getGanaderia6(), "interiviente");

                List<Cartel> listacartel = new ArrayList<Cartel>();
                listacartel.add(cartel1);
                listacartel.add(cartel2);
                listacartel.add(cartel3);
                listacartel.add(cartel4);
                listacartel.add(cartel5);
                listacartel.add(cartel6);

                if (listacartel.size() != 0) {
            %>
            <div class="row">
                <table class="centered striped">
                    <thead>
                        <tr>
                            <th>Toros</th>
                            <th>Ganaderías</th>
                            <th>Interviniente</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (int i = 0; i < listacartel.size(); i++) {
                                if (listacartel.get(i).getNombretoro() != null && listacartel.get(i).getNombreganaderia() != null && listacartel.get(i).getNombreinterviniente() != null) {
                        %>
                        <tr>
                            <td><%=listacartel.get(i).getNombretoro()%></td>
                            <td><%=listacartel.get(i).getNombreganaderia()%></td>
                            <td><%=listacartel.get(i).getNombreinterviniente()%></td>
                        </tr>
                        <%}
                            }%>
                    </tbody>
                </table>
            </div>
            <%} else {%>
            <p>No existe cartel</p>
            <%}
                } catch (Exception e) {
                    session.setAttribute("errormessage", "Error visualizar los personajes");
                    response.sendRedirect("mainview.jsp");
                }%>

        </div>
    </div>


    <jsp:include page="assets/shared/body.jsp" />
</body>
</html>

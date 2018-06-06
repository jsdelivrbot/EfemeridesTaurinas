<%-- 
    Document   : profesiones
    Created on : 06-jun-2018, 18:21:21
    Author     : agustin
--%>

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
                <div class="input-field col s6">
                    <input id="first_name" type="text" class="validate">
                    <label for="first_name">First Name</label>
                </div>
            </div>
        </div>
        <jsp:include page="assets/shared/modals/modalconfirmationdeleteefem.jsp" />
        <jsp:include page="assets/shared/body.jsp" />
    </body>
</html>

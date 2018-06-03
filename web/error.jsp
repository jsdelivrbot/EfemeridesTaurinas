<%-- 
    Document   : login
    Created on : 25-abr-2018, 15:11:12
    Author     : agustin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="assets/shared/head.jsp" />

    <body class="background_color_red " >        
        <jsp:include page="assets/shared/models/headerMaterialize.jsp" />
        <jsp:include page="assets/shared/models/errorMessage.jsp" />


        <div id="login-page" class="row" style="margin-top: 15%">
            <div class="col card-panel s10 m8 l4 offset-s1 offset-m2 offset-l4">

                <div class="row">
                    <div class="input-field col s12 center">
                        <img  width="150" src="assets/img/cancel.svg" alt="" class=" center s12 m10">
                        <h5 class="grey-text text-lighten-5 header_title_mainview"><span class="black_taurinas">ERROR EXCEPTION</span></h5>
                        <p>Please contact system administrator.</p>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <a href="login.jsp" class="btn waves-effect waves-light col s12 m12 l12 black">Volver</a>
                    </div>
                </div>

            </div>

        </div>
    </body>
</html>

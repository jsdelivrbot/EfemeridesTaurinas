<%-- 
    Document   : mainview
    Created on : 03-may-2018, 17:26:07
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

            <div class="row ">
                <div class="col s6">
                    <h5 class="titles_red_h5 ">Galería</h5>
                </div>
                <div class="col s6">
                    <button class="btn waves-effect waves-light green right" type="submit" name="action">Añadir imagen<i class="material-icons right">add</i></button>
                </div>
            </div>

            <form action="controllers/controller.jsp?op=saveimage" method="POST" class="addimage-form" name="addimage">
                <div class="file-field input-field">
                    <div class="btn">
                        <span>Imagen</span>
                        <input type="file" multiple>
                    </div>
                    <div class="file-path-wrapper">
                        <input class="file-path validate" type="text" name="imageValue" placeholder="Asocia mas de una imagen">
                    </div>
                </div>
                <button class="btn waves-effect waves-light" type="submit" name="action">Submit
                    <i class="material-icons right">send</i>
                </button>

            </form>


        </div>

        <jsp:include page="assets/shared/body.jsp" />

    </body>
</html>

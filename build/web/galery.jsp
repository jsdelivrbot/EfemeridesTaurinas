<%-- 
    Document   : mainview
    Created on : 03-may-2018, 17:26:07
    Author     : agustin
--%>

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

            <div class="row ">
                <div class="col s6">
                    <h5 class="titles_red_h5 ">Galería</h5>
                </div>
            </div>

            <%
                List<Personaje> listaPersonajeImage = (List<Personaje>) session.getAttribute("listaPersonajeImage");
            %>

            <!--enctype="multipart/form-data"-->
            <form action="controllers/controller.jsp?op=saveimage" enctype="multipart/form-data"  method="POST" class="addimage-form" name="addimage">
                <div class="row">
                    <div class="col s6">
                        <input multiple class="" type="file" name="file"/>
                    </div>
                    
                </div>
                <div class="row">
                    <button class="btn waves-effect waves-light" type="submit" name="action">Submit
                        <i class="material-icons right">send</i>
                    </button>
                </div>
            </form>


        </div>

        <jsp:include page="assets/shared/body.jsp" />

    </body>
</html>

<%-- 
    Document   : profesion
    Created on : 05-jun-2018, 13:07:42
    Author     : agustin
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="Entities.Personaje"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title></title>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <link rel="stylesheet" type="text/css" href="kk/datatables.min.css"/>

        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
        <script type="text/javascript" src="kk/datatables.min.js"></script>



        <script type="text/javascript">
            $(document).ready(function () {
                $('#datatable').DataTable();
            });
        </script>

    </head>

    <body>
        <% List<Personaje> listaPersonaje = (List<Personaje>) session.getAttribute("listaPersonaje"); 
        DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");%>
        <div class="container">
            <div class="row" style="width: 1024px">
                <form id="form1">
                    <div style="max-width: 80%;">
                        <table id="datatable" class="stripe hover compact cell-border" >
                            <thead>
                                <tr>
                                    <th>Nombre</th>
                                    <th>Apellido</th>
                                    <th>Apellido</th>
                                    <th>Fecha de nacimiento</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% for (int i = 0; i < listaPersonaje.size(); i++) {%>
                                <tr>
                                    <td><%=listaPersonaje.get(i).getNombrepersonaje() %></td>
                                    <td><%=listaPersonaje.get(i).getApellido1() %></td>
                                    <td><%=listaPersonaje.get(i).getApellido2() %></td>
                                    <td><%=dateFormat.format(listaPersonaje.get(i).getFechanacimiento()) %></td>
                                </tr>
                                <%}%>
                            </tbody>
                        </table>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>

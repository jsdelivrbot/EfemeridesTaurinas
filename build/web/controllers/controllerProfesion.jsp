<%-- 
    Document   : controllerProfesion
    Created on : 06-jun-2018, 23:03:02
    Author     : agustin
--%>

<%@page import="java.util.List"%>
<%@page import="Entities.Personaje"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.Query"%>
<%@page import="jpautil.JPAUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%

            EntityManager em = (EntityManager) session.getAttribute("em");

            if (em == null) {

                try {
                    em = JPAUtil.getEntityManagerFactory().createEntityManager();
                    session.setAttribute("em", em);
                } catch (Exception e) {
                    session.setAttribute("errormessage", "Error al conectar con la base de datos");
                    response.sendRedirect("../login.jsp");
                }

            }

            String op = null;
            String sql = null;
            Query q = null;
            op = request.getParameter("op");

            List<Personaje> listapersonajes = null;
            /*
            List<Efemeride> listaefemerides = null;
            
            List<Cartel> listacartel = new ArrayList<>();
             */
            if (op.equals("loadallprofession")) {
                try {

                    sql = "SELECT p FROM Personaje p order by p.fechanacimiento DESC";
                    q = em.createQuery(sql);
                    q.setHint("javax.persistence.cache.storeMode", "REFRESH");
                    listapersonajes = (List<Personaje>) q.getResultList();
                    session.setAttribute("listapersonajes", listapersonajes);
                    response.sendRedirect("../profesiones.jsp");

                } catch (Exception e) {
                    session.setAttribute("errormessage", "Error cargando la efemeride");
                    response.sendRedirect("../mainview.jsp");
                }
            } else if (op.equals("searchcharacterprofession")) {
                String nameandsurnames = (String) request.getParameter("nameandsurnames");
                String profession = (String) request.getParameter("profession");

                sql = "SELECT P FROM Personaje P where p.nombrepersonaje like '" + nameandsurnames + "' or p.apellido1 like '" + nameandsurnames + "' or p.apellido2 like '" + nameandsurnames + "'";
                //q = em.createQuery(sql);
                //q.setHint("javax.persistence.cache.storeMode", "REFRESH");
                //Efemeride efem = (Efemeride) q.getSingleResult();

                out.print(sql);
                Personaje p = new Personaje();
                p.getProfesionList();
            }
        %>
    </body>
</html>

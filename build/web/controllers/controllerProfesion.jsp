<%-- 
    Document   : controllerProfesion
    Created on : 06-jun-2018, 23:03:02
    Author     : agustin
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Entities.Profesion"%>
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
            List<Profesion> listaprofesiones = null;
            /*
            List<Efemeride> listaefemerides = null;
            
            List<Cartel> listacartel = new ArrayList<>();
             */
            if (op.equals("loadallprofession")) {
                try {

                    sql = "SELECT P FROM Profesion P ORDER BY P.descripcion";
                    q = em.createQuery(sql);
                    q.setHint("javax.persistence.cache.storeMode", "REFRESH");
                    listaprofesiones = (List<Profesion>) q.getResultList();
                    session.setAttribute("listaprofesiones", listaprofesiones);
                    response.sendRedirect("../profesiones.jsp");

                } catch (Exception e) {
                    session.setAttribute("errormessage", "Error cargando la efemeride");
                    response.sendRedirect("../mainview.jsp");
                }
            } else if (op.equals("searchcharacterprofession")) {

                try {

                    String nameandnickname = (String) request.getParameter("nameandsurnames");
                    String profession = (String) request.getParameter("profession");

                    if (nameandnickname != "") {

                        sql = "SELECT PR FROM Profesion PR WHERE PR.personajeList = (SELECT P FROM Personaje P WHERE P.nombrepersonaje like '%"+nameandnickname+"%' or P.apodo1 like '%"+nameandnickname+"%')";

                        q = em.createQuery(sql);
                        q.setHint("javax.persistence.cache.storeMode", "REFRESH");
                        listaprofesiones = (List<Profesion>) q.getResultList();
                        session.setAttribute("listaprofesiones", listaprofesiones);
                        response.sendRedirect("../profesiones.jsp");
                    } else if (profession != "") {

                        session.removeAttribute("listapersonajes");
                        sql = "";
                        q = em.createQuery(sql);
                        q.setHint("javax.persistence.cache.storeMode", "REFRESH");
                        List<Personaje> listapersonajesaux = new ArrayList<Personaje>();
                        
                        for (int i = 0; i < q.getResultList().size(); i++) {
                            for(Profesion p:((Personaje) q.getResultList().get(i)).getProfesionList()){
                                if(p.getDescripcion().matches(profession))listapersonajesaux.add((Personaje) q.getResultList().get(i));                    
                            }
                        }
                        session.setAttribute("listaprofesiones", listaprofesiones);
                        response.sendRedirect("../profesiones.jsp");
                    }

                } catch (Exception e) {
                    session.setAttribute("errormessage", "Error buscando el personaje" + e);
                    response.sendRedirect("../mainview.jsp");
                }
            }
        %>
    </body>
</html>

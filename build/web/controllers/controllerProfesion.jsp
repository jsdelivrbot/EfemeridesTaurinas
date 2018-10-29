<%-- 
    Document   : controllerProfesion
    Created on : 06-jun-2018, 23:03:02
    Author     : agustin
--%>

<%@page import="com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException"%>
<%@page import="javax.persistence.NoResultException"%>
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
        <link rel="icon" href="assets/img/icon_bullfighter.ico">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Efemérides Taurinas</title>
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

                    if (nameandnickname != "" && profession == "") {

                        sql = "SELECT PR FROM Personaje PR WHERE PR.nombrepersonaje like '%" + nameandnickname + "%' or PR.apodo1 like '%" + nameandnickname + "%'";
                        out.print(sql + "resultado");

                        q = em.createQuery(sql);
                        q.setHint("javax.persistence.cache.storeMode", "REFRESH");
                        listapersonajes = (List<Personaje>) q.getResultList();
                        session.setAttribute("listapersonajes", listapersonajes);
                        session.removeAttribute("listaprofesiones");

                        sql = "SELECT P FROM Profesion P order by P.descripcion";
                        q = em.createQuery(sql);
                        q.setHint("javax.persistence.cache.storeMode", "REFRESH");
                        listaprofesiones = (List<Profesion>) q.getResultList();
                        session.setAttribute("selectlistaprofesiones", listaprofesiones);

                        response.sendRedirect("../profesiones.jsp");

                    } else if (profession != "" && nameandnickname == "") {

                        session.removeAttribute("listapersonajes");
                        sql = "SELECT P FROM Profesion P WHERE P.descripcion LIKE '%" + profession + "%'";
                        q = em.createQuery(sql);
                        q.setHint("javax.persistence.cache.storeMode", "REFRESH");
                        List<Profesion> listaprofesionaux = new ArrayList<Profesion>();
                        listaprofesionaux = (List<Profesion>) q.getResultList();

                        session.setAttribute("listaprofesiones", listaprofesionaux);
                        response.sendRedirect("../profesiones.jsp");
                    } else if (profession != "" && nameandnickname != "") {

                        sql = "SELECT PR FROM Profesion PR WHERE PR.descripcion LIKE '%panadero%' and  PR.personajeList = (SELECT P FROM Personaje P WHERE P.nombrepersonaje like '%agustin%' or P.apodo1 like '%agustin%')";

                        q = em.createQuery(sql);
                        q.setHint("javax.persistence.cache.storeMode", "REFRESH");
                        listaprofesiones = (List<Profesion>) q.getResultList();
                        session.setAttribute("listaprofesiones", listaprofesiones);
                        response.sendRedirect("../profesiones.jsp");
                    } else if (profession == "" && nameandnickname == "") {
                        response.sendRedirect("controllerProfesion.jsp?op=loadallprofession");
                    }

                } catch (Exception e) {
                    session.setAttribute("errormessage", "Error buscando el personaje" + e);
                    response.sendRedirect("../mainview.jsp");
                }
            } else if (op.equals("addprofesionpersonaje")) {
                try {

                    String selectidpersonajes = (String) request.getParameter("selectidpersonajes");
                    String selectidprofesion = (String) request.getParameter("selectidprofesion");

                    //comprobar si tiene una
                    sql = "SELECT P.profesionList FROM Personaje P WHERE P.idpersonaje =" + selectidpersonajes;
                    q = em.createQuery(sql);
                    q.setHint("javax.persistence.cache.storeMode", "REFRESH");
                    listaprofesiones = (List<Profesion>) q.getResultList();

                    //la que queremos meter
                    sql = "SELECT P FROM Profesion P WHERE P.idprofesion=" + selectidprofesion;
                    q = em.createQuery(sql);
                    q.setHint("javax.persistence.cache.storeMode", "REFRESH");
                    List<Profesion> listaprofesionesaux = (List<Profesion>) q.getResultList();
                    listaprofesiones.add(listaprofesionesaux.get(0));

                    //el personaje que tenemos 
                    sql = "SELECT P FROM Personaje P WHERE P.idpersonaje=" + selectidpersonajes;
                    q = em.createQuery(sql);
                    q.setHint("javax.persistence.cache.storeMode", "REFRESH");
                    Personaje p = (Personaje) q.getSingleResult();

                    p.setProfesionList(listaprofesiones);

                    em.getTransaction().begin();
                    em.persist(p);
                    em.getTransaction().commit();

                    response.sendRedirect("controllerProfesion.jsp?op=loadallprofession");
                    session.setAttribute("correctmessage", "Añadida la profesion al personaje " + " " + p.getNombrepersonaje() + " " + p.getApellido1() + " " + p.getApellido2());

                } catch (NoResultException nr) {
                    session.setAttribute("errormessage", "Debe seleccionar ambos campos");
                    response.sendRedirect("controllerProfesion.jsp?op=loadallprofession");
                } catch (IndexOutOfBoundsException e) {
                    session.setAttribute("errormessage", "Debe seleccionar ambos campos");
                    response.sendRedirect("controllerProfesion.jsp?op=loadallprofession");
                } catch (Exception ex) {
                    session.setAttribute("errormessage", "El personaje ya tiene asociada esa profesión");
                    response.sendRedirect("controllerProfesion.jsp?op=loadallprofession");

                }

            } else if (op.equals("deleteprofesionpersonaje")) {

                try {
                    String idprofesiondelete = (String) request.getParameter("idprofesiondelete");
                    String idperonajedelete = (String) request.getParameter("idperonajedelete");

                    //todas las profesiones que tiene el personaje
                    sql = "SELECT P.profesionList FROM Personaje P WHERE P.idpersonaje =" + idperonajedelete;
                    q = em.createQuery(sql);
                    q.setHint("javax.persistence.cache.storeMode", "REFRESH");
                    listaprofesiones = (List<Profesion>) q.getResultList();
                    List<Profesion> listaprofesionesaux = new ArrayList<Profesion>();

                    for (int i = 0; i < listaprofesiones.size(); i++) {

                        if (listaprofesiones.get(i).getIdprofesion() != Integer.parseInt(idprofesiondelete)) {
                            listaprofesionesaux.add(listaprofesiones.get(i));
                        }

                    }

                    //el personaje que tenemos 
                    sql = "SELECT P FROM Personaje P WHERE P.idpersonaje=" + idperonajedelete;
                    q = em.createQuery(sql);
                    q.setHint("javax.persistence.cache.storeMode", "REFRESH");
                    Personaje p = (Personaje) q.getSingleResult();

                    p.setProfesionList(listaprofesionesaux);

                    em.getTransaction().begin();
                    em.persist(p);
                    em.getTransaction().commit();

                    session.setAttribute("errormessage", "Borrada la profesion correctamente");
                    response.sendRedirect("controllerProfesion.jsp?op=loadallprofession");

                } catch (Exception e) {
                    session.setAttribute("errormessage", "Error borrando la profesion" + e);
                    response.sendRedirect("../mainview.jsp");
                }

            } else if (op.equals("addprofession")) {
                try {
                    
                    String profession= new String(request.getParameter("newprofession").getBytes("ISO-8859-1"), "UTF-8");
                    
                    Profesion p = new Profesion(0, profession);
                    em.getTransaction().begin();
                    em.persist(p);
                    em.getTransaction().commit();
                    
                    session.setAttribute("errormessage", "Añadida la profesion correctamente");
                    response.sendRedirect("controllerProfesion.jsp?op=loadallprofession");

                } catch (Exception e) {
                    session.setAttribute("errormessage", "Error añadiendo la profesion");
                    response.sendRedirect("controllerProfesion.jsp?op=loadallprofession");
                    
                }

            }
        %>
    </body>
</html>

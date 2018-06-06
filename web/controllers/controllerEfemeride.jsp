<%-- 
    Document   : controllerEfemeride
    Created on : 25-may-2018, 9:36:53
    Author     : agustin
--%>

<%@page import="methods.Inform"%>
<%@page import="org.eclipse.persistence.exceptions.DatabaseException"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="Entities.Cartel"%>
<%@page import="Entities.Personaje"%>
<%@page import="Entities.Efemeride"%>
<%@page import="javax.persistence.Query"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="jpautil.JPAUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="shortcut icon" href="../assets/img/icon_bullfighter.ico" />
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

            List<Efemeride> listaefemerides = null;
            List<Personaje> listapersonajes = null;
            List<Cartel> listacartel = new ArrayList<>();

            if (op.equals("detailefemeride")) {

                try {

                    String idefemeride = (String) request.getParameter("idefemeride");
                    String idcharacter = (String) request.getParameter("idcharacter");

                    sql = "SELECT E FROM Efemeride E where e.idefemeride =" + idefemeride;
                    q = em.createQuery(sql);
                    q.setHint("javax.persistence.cache.storeMode", "REFRESH");
                    Efemeride efem = (Efemeride) q.getSingleResult();
                    session.setAttribute("efem", efem);

                    sql = "SELECT p FROM Personaje p where p.idpersonaje =" + idcharacter;
                    q = em.createQuery(sql);
                    q.setHint("javax.persistence.cache.storeMode", "REFRESH");
                    Personaje perso = (Personaje) q.getSingleResult();
                    session.setAttribute("perso", perso);

                    response.sendRedirect("../detailEfemeride.jsp");

                } catch (Exception e) {
                    session.setAttribute("errormessage", "Error cargando la efemeride");
                    response.sendRedirect("../mainview.jsp");
                }
            } else if (op.equals("loadallefems")) {
                try {
                    sql = "SELECT E FROM Efemeride E";
                    q = em.createQuery(sql);
                    q.setHint("javax.persistence.cache.storeMode", "REFRESH");
                    listaefemerides = (List<Efemeride>) q.getResultList();
                    session.setAttribute("listaefemerides", listaefemerides);

                    response.sendRedirect("../efemerides.jsp");

                } catch (Exception e) {
                    session.setAttribute("errormessage", "Error cargando las efemerides");
                    response.sendRedirect("../mainview.jsp");
                }
            } else if (op.equals("deleteefemeride")) {
                try {

                    String idefemeride = (String) request.getParameter("idefemeride");

                    sql = "SELECT E FROM Efemeride E WHERE E.idefemeride = " + idefemeride;
                    q = em.createQuery(sql);
                    q.setHint("javax.persistence.cache.storeMode", "REFRESH");

                    Efemeride e = (Efemeride) q.getSingleResult();

                    em.getTransaction().begin();
                    em.remove(e);
                    em.getTransaction().commit();

                    response.sendRedirect("controllerEfemeride.jsp?op=loadallefems");
                    session.setAttribute("correctmessage", "Eliminada la efemeride de " + e.getIdpersonaje().getNombrepersonaje() + " " + e.getIdpersonaje().getApellido1() + " " + e.getIdpersonaje().getApellido2());

                } catch (Exception e) {
                    session.setAttribute("errormessage", e.toString());
                    response.sendRedirect("../mainview.jsp");
                }
            } else if (op.equals("savenewefe")) {
                try {

                    String town = (String) request.getParameter("town");
                    String date = (String) request.getParameter("date");
                    String event = (String) request.getParameter("event");
                    String report = (String) request.getParameter("report");
                    String idpersonajes = (String) request.getParameter("idpersonajes");
                    String notes = (String) request.getParameter("notes");

                    listacartel = (ArrayList<Cartel>) session.getAttribute("listacartel");

                    /*
                    out.println("Datos " + town + " date " + date + " event " + event + " report " + report + " idpersonaje -->" + idpersonajes + "<-- \n");
                    for (int i = 0; i < listacartel.size(); i++) {
                        out.println("Toro " + listacartel.get(i).getNombretoro() + " Ganaderia " + listacartel.get(i).getNombreganaderia() + " Interviniente " + listacartel.get(i).getNombreinterviniente() +"\n");
                    }*/
                    sql = "SELECT P FROM Personaje P WHERE P.idpersonaje =" + idpersonajes;
                    q = em.createQuery(sql);
                    q.setHint("javax.persistence.cache.storeMode", "REFRESH");
                    Personaje personaje = (Personaje) q.getSingleResult();

                    Efemeride efemeride = new Efemeride();
                    efemeride.setEvento(event);

                    SimpleDateFormat formatter = new SimpleDateFormat("dd MMM, yyyy");
                    Date fechaParaGuardar = formatter.parse(date);
                    efemeride.setFechaefemeride(fechaParaGuardar);
                    efemeride.setNotas(notes);
                    efemeride.setPoblacion(town);
                    efemeride.setReportaje(report);
                    efemeride.setIdpersonaje(personaje);

                    

                    switch (listacartel.size()) {
                        case 1:
                            efemeride.setToro1(listacartel.get(0).getNombretoro());
                            efemeride.setGanaderia1(listacartel.get(0).getNombreganaderia());
                            efemeride.setInterviniente1(listacartel.get(0).getNombreinterviniente());
                            break;
                        case 2:
                            efemeride.setToro1(listacartel.get(0).getNombretoro());
                            efemeride.setGanaderia1(listacartel.get(0).getNombreganaderia());
                            efemeride.setInterviniente1(listacartel.get(0).getNombreinterviniente());
                            efemeride.setToro2(listacartel.get(1).getNombretoro());
                            efemeride.setGanaderia2(listacartel.get(1).getNombreganaderia());
                            efemeride.setInterviniente2(listacartel.get(1).getNombreinterviniente());
                            break;
                        case 3:
                            efemeride.setToro1(listacartel.get(0).getNombretoro());
                            efemeride.setGanaderia1(listacartel.get(0).getNombreganaderia());
                            efemeride.setInterviniente1(listacartel.get(0).getNombreinterviniente());
                            efemeride.setToro2(listacartel.get(1).getNombretoro());
                            efemeride.setGanaderia2(listacartel.get(1).getNombreganaderia());
                            efemeride.setInterviniente2(listacartel.get(1).getNombreinterviniente());
                            efemeride.setToro3(listacartel.get(2).getNombretoro());
                            efemeride.setGanaderia3(listacartel.get(2).getNombreganaderia());
                            efemeride.setInterviniente3(listacartel.get(2).getNombreinterviniente());
                            break;
                        case 4:
                            efemeride.setToro1(listacartel.get(0).getNombretoro());
                            efemeride.setGanaderia1(listacartel.get(0).getNombreganaderia());
                            efemeride.setInterviniente1(listacartel.get(0).getNombreinterviniente());
                            efemeride.setToro2(listacartel.get(1).getNombretoro());
                            efemeride.setGanaderia2(listacartel.get(1).getNombreganaderia());
                            efemeride.setInterviniente2(listacartel.get(1).getNombreinterviniente());
                            efemeride.setToro3(listacartel.get(2).getNombretoro());
                            efemeride.setGanaderia3(listacartel.get(2).getNombreganaderia());
                            efemeride.setInterviniente3(listacartel.get(2).getNombreinterviniente());
                            efemeride.setToro4(listacartel.get(3).getNombretoro());
                            efemeride.setGanaderia4(listacartel.get(3).getNombreganaderia());
                            efemeride.setInterviniente4(listacartel.get(3).getNombreinterviniente());
                            break;
                        case 5:
                            efemeride.setToro1(listacartel.get(0).getNombretoro());
                            efemeride.setGanaderia1(listacartel.get(0).getNombreganaderia());
                            efemeride.setInterviniente1(listacartel.get(0).getNombreinterviniente());
                            efemeride.setToro2(listacartel.get(1).getNombretoro());
                            efemeride.setGanaderia2(listacartel.get(1).getNombreganaderia());
                            efemeride.setInterviniente2(listacartel.get(1).getNombreinterviniente());
                            efemeride.setToro3(listacartel.get(2).getNombretoro());
                            efemeride.setGanaderia3(listacartel.get(2).getNombreganaderia());
                            efemeride.setInterviniente3(listacartel.get(2).getNombreinterviniente());
                            efemeride.setToro4(listacartel.get(3).getNombretoro());
                            efemeride.setGanaderia4(listacartel.get(3).getNombreganaderia());
                            efemeride.setInterviniente4(listacartel.get(3).getNombreinterviniente());
                            efemeride.setToro5(listacartel.get(4).getNombretoro());
                            efemeride.setGanaderia5(listacartel.get(4).getNombreganaderia());
                            efemeride.setInterviniente5(listacartel.get(4).getNombreinterviniente());
                            break;
                        case 6:
                            efemeride.setToro1(listacartel.get(0).getNombretoro());
                            efemeride.setGanaderia1(listacartel.get(0).getNombreganaderia());
                            efemeride.setInterviniente1(listacartel.get(0).getNombreinterviniente());
                            efemeride.setToro2(listacartel.get(1).getNombretoro());
                            efemeride.setGanaderia2(listacartel.get(1).getNombreganaderia());
                            efemeride.setInterviniente2(listacartel.get(1).getNombreinterviniente());
                            efemeride.setToro3(listacartel.get(2).getNombretoro());
                            efemeride.setGanaderia3(listacartel.get(2).getNombreganaderia());
                            efemeride.setInterviniente3(listacartel.get(2).getNombreinterviniente());
                            efemeride.setToro4(listacartel.get(3).getNombretoro());
                            efemeride.setGanaderia4(listacartel.get(3).getNombreganaderia());
                            efemeride.setInterviniente4(listacartel.get(3).getNombreinterviniente());
                            efemeride.setToro5(listacartel.get(4).getNombretoro());
                            efemeride.setGanaderia5(listacartel.get(4).getNombreganaderia());
                            efemeride.setInterviniente5(listacartel.get(4).getNombreinterviniente());
                            efemeride.setToro6(listacartel.get(5).getNombretoro());
                            efemeride.setGanaderia6(listacartel.get(5).getNombreganaderia());
                            efemeride.setInterviniente6(listacartel.get(5).getNombreinterviniente());
                            break;
                    }

                    em.getTransaction().begin();
                    em.persist(efemeride);
                    em.getTransaction().commit();

                    response.sendRedirect("controllerEfemeride.jsp?op=loadallefems");
                    session.setAttribute("errormessage", "Guardada correctamente la efeméride de " + personaje.getNombrepersonaje() + " " + personaje.getApellido1() + " " + personaje.getApellido2());
                } catch (Exception e) {
                    response.sendRedirect("controllerEfemeride.jsp?op=loadallefems");
                    session.setAttribute("errormessage", "Error al crear la efemeride" +e);

                }

            } else if (op.equals("loadllcharactersforefemerides")) {
                try {
                    sql = "SELECT P FROM Personaje P";
                    q = em.createQuery(sql);
                    q.setHint("javax.persistence.cache.storeMode", "REFRESH");
                    listapersonajes = (List<Personaje>) q.getResultList();
                    session.setAttribute("listapersonajes", listapersonajes);
                    session.setAttribute("listacartel", listacartel);

                    response.sendRedirect("../addEfemeride.jsp");
                } catch (Exception e) {
                }

            } else if (op.equals("deleteallrows")) {
                session.removeAttribute("listacartel");
                response.sendRedirect("controllerEfemeride.jsp?op=loadllcharactersforefemerides");
            } else if (op.equals("createinformpdf")) {
                String idefemeride = (String) request.getParameter("idefemedide");
                sql = "SELECT E FROM Efemeride E WHERE E.idefemeride = " + idefemeride;
                q = em.createQuery(sql);
                q.setHint("javax.persistence.cache.storeMode", "REFRESH");
                Efemeride efemeride = (Efemeride) q.getSingleResult();
                //session.setAttribute("personajeEdit", personajeEdit)

                Inform i = new Inform();
                i.generateInformPDFEfemeride(request, response, efemeride);

                response.sendRedirect("../detailPersonajes.jsp");
                session.setAttribute("correctmessage", "Informe generado correctamente");

            } else if (op.equals("loadllcharactersforeditefemerides")) {
                try {
                    sql = "SELECT P FROM Personaje P";
                    q = em.createQuery(sql);
                    q.setHint("javax.persistence.cache.storeMode", "REFRESH");
                    listapersonajes = (List<Personaje>) q.getResultList();
                    session.setAttribute("listapersonajes", listapersonajes);

                    String idefemeride = (String) request.getParameter("idefemeride");
                    sql = "SELECT E FROM Efemeride E WHERE E.idefemeride =" + idefemeride;
                    q = em.createQuery(sql);
                    q.setHint("javax.persistence.cache.storeMode", "REFRESH");
                    Efemeride efemeride = (Efemeride) q.getSingleResult();
                    session.setAttribute("efemeride", efemeride);

                    Cartel cartel1 = new Cartel(efemeride.getToro1(), efemeride.getGanaderia1(), efemeride.getInterviniente1());
                    Cartel cartel2 = new Cartel(efemeride.getToro2(), efemeride.getGanaderia2(), efemeride.getInterviniente2());
                    Cartel cartel3 = new Cartel(efemeride.getToro3(), efemeride.getGanaderia3(), efemeride.getInterviniente3());
                    Cartel cartel4 = new Cartel(efemeride.getToro4(), efemeride.getGanaderia4(), efemeride.getInterviniente4());
                    Cartel cartel5 = new Cartel(efemeride.getToro5(), efemeride.getGanaderia5(), efemeride.getInterviniente5());
                    Cartel cartel6 = new Cartel(efemeride.getToro6(), efemeride.getGanaderia6(), efemeride.getInterviniente6());
                    listacartel.add(cartel1);
                    listacartel.add(cartel2);
                    listacartel.add(cartel3);
                    listacartel.add(cartel4);
                    listacartel.add(cartel5);
                    listacartel.add(cartel6);

                    session.setAttribute("listacartel", listacartel);

                    response.sendRedirect("../editEfemeride.jsp");
                } catch (Exception e) {
                    response.sendRedirect("controllerEfemeride.jsp?op=loadallefems");
                    session.setAttribute("errormessage", "Error al intetar cargar la edición del personaje" +e);
                }

            } else if (op.equals("saveeditefe")) {

                try {

                    String town = (String) request.getParameter("town");
                    String date = (String) request.getParameter("date");
                    String event = (String) request.getParameter("event");
                    String report = (String) request.getParameter("report");
                    String idpersonajes = (String) request.getParameter("idpersonajes");
                    String notes = (String) request.getParameter("notes");
                    String idefemeride = (String) request.getParameter("idefemeride");

                    listacartel = (ArrayList<Cartel>) session.getAttribute("listacartel");

                    /*   out.println("Datos " + town + " date " + date + " event " + event + " report " + report + " idpersonaje -->" + idpersonajes + "<-- \n"+ " notes "+notes);
                for (int i = 0; i < listacartel.size(); i++) {
                    out.println("Toro"+i+" " + listacartel.get(i).getNombretoro() + " Ganaderia"+i+" " + listacartel.get(i).getNombreganaderia() + " Interviniente"+i+" " + listacartel.get(i).getNombreinterviniente() + "\n");
                }*/
                    sql = "SELECT P FROM Personaje P WHERE P.idpersonaje =" + idpersonajes;
                    q = em.createQuery(sql);
                    q.setHint("javax.persistence.cache.storeMode", "REFRESH");
                    Personaje personaje = (Personaje) q.getSingleResult();

                    Efemeride efemeride = new Efemeride();
                    efemeride.setEvento(event);

                    SimpleDateFormat formatter = new SimpleDateFormat("dd MMM, yyyy");
                    Date fechaParaGuardar = formatter.parse(date);
                    efemeride.setFechaefemeride(fechaParaGuardar);
                    efemeride.setNotas(notes);
                    efemeride.setPoblacion(town);
                    efemeride.setReportaje(report);
                    efemeride.setIdpersonaje(personaje);

                    efemeride.setIdefemeride(Integer.parseInt(idefemeride));

                    switch (listacartel.size()) {
                        case 1:
                            efemeride.setToro1(listacartel.get(0).getNombretoro());
                            efemeride.setGanaderia1(listacartel.get(0).getNombreganaderia());
                            efemeride.setInterviniente1(listacartel.get(0).getNombreinterviniente());
                            break;
                        case 2:
                            efemeride.setToro1(listacartel.get(0).getNombretoro());
                            efemeride.setGanaderia1(listacartel.get(0).getNombreganaderia());
                            efemeride.setInterviniente1(listacartel.get(0).getNombreinterviniente());
                            efemeride.setToro2(listacartel.get(1).getNombretoro());
                            efemeride.setGanaderia2(listacartel.get(1).getNombreganaderia());
                            efemeride.setInterviniente2(listacartel.get(1).getNombreinterviniente());
                            break;
                        case 3:
                            efemeride.setToro1(listacartel.get(0).getNombretoro());
                            efemeride.setGanaderia1(listacartel.get(0).getNombreganaderia());
                            efemeride.setInterviniente1(listacartel.get(0).getNombreinterviniente());
                            efemeride.setToro2(listacartel.get(1).getNombretoro());
                            efemeride.setGanaderia2(listacartel.get(1).getNombreganaderia());
                            efemeride.setInterviniente2(listacartel.get(1).getNombreinterviniente());
                            efemeride.setToro3(listacartel.get(2).getNombretoro());
                            efemeride.setGanaderia3(listacartel.get(2).getNombreganaderia());
                            efemeride.setInterviniente3(listacartel.get(2).getNombreinterviniente());
                            break;
                        case 4:
                            efemeride.setToro1(listacartel.get(0).getNombretoro());
                            efemeride.setGanaderia1(listacartel.get(0).getNombreganaderia());
                            efemeride.setInterviniente1(listacartel.get(0).getNombreinterviniente());
                            efemeride.setToro2(listacartel.get(1).getNombretoro());
                            efemeride.setGanaderia2(listacartel.get(1).getNombreganaderia());
                            efemeride.setInterviniente2(listacartel.get(1).getNombreinterviniente());
                            efemeride.setToro3(listacartel.get(2).getNombretoro());
                            efemeride.setGanaderia3(listacartel.get(2).getNombreganaderia());
                            efemeride.setInterviniente3(listacartel.get(2).getNombreinterviniente());
                            efemeride.setToro4(listacartel.get(3).getNombretoro());
                            efemeride.setGanaderia4(listacartel.get(3).getNombreganaderia());
                            efemeride.setInterviniente4(listacartel.get(3).getNombreinterviniente());
                            break;
                        case 5:
                            efemeride.setToro1(listacartel.get(0).getNombretoro());
                            efemeride.setGanaderia1(listacartel.get(0).getNombreganaderia());
                            efemeride.setInterviniente1(listacartel.get(0).getNombreinterviniente());
                            efemeride.setToro2(listacartel.get(1).getNombretoro());
                            efemeride.setGanaderia2(listacartel.get(1).getNombreganaderia());
                            efemeride.setInterviniente2(listacartel.get(1).getNombreinterviniente());
                            efemeride.setToro3(listacartel.get(2).getNombretoro());
                            efemeride.setGanaderia3(listacartel.get(2).getNombreganaderia());
                            efemeride.setInterviniente3(listacartel.get(2).getNombreinterviniente());
                            efemeride.setToro4(listacartel.get(3).getNombretoro());
                            efemeride.setGanaderia4(listacartel.get(3).getNombreganaderia());
                            efemeride.setInterviniente4(listacartel.get(3).getNombreinterviniente());
                            efemeride.setToro5(listacartel.get(4).getNombretoro());
                            efemeride.setGanaderia5(listacartel.get(4).getNombreganaderia());
                            efemeride.setInterviniente5(listacartel.get(4).getNombreinterviniente());
                            break;
                        case 6:
                            efemeride.setToro1(listacartel.get(0).getNombretoro());
                            efemeride.setGanaderia1(listacartel.get(0).getNombreganaderia());
                            efemeride.setInterviniente1(listacartel.get(0).getNombreinterviniente());
                            efemeride.setToro2(listacartel.get(1).getNombretoro());
                            efemeride.setGanaderia2(listacartel.get(1).getNombreganaderia());
                            efemeride.setInterviniente2(listacartel.get(1).getNombreinterviniente());
                            efemeride.setToro3(listacartel.get(2).getNombretoro());
                            efemeride.setGanaderia3(listacartel.get(2).getNombreganaderia());
                            efemeride.setInterviniente3(listacartel.get(2).getNombreinterviniente());
                            efemeride.setToro4(listacartel.get(3).getNombretoro());
                            efemeride.setGanaderia4(listacartel.get(3).getNombreganaderia());
                            efemeride.setInterviniente4(listacartel.get(3).getNombreinterviniente());
                            efemeride.setToro5(listacartel.get(4).getNombretoro());
                            efemeride.setGanaderia5(listacartel.get(4).getNombreganaderia());
                            efemeride.setInterviniente5(listacartel.get(4).getNombreinterviniente());
                            efemeride.setToro6(listacartel.get(5).getNombretoro());
                            efemeride.setGanaderia6(listacartel.get(5).getNombreganaderia());
                            efemeride.setInterviniente6(listacartel.get(5).getNombreinterviniente());
                            break;
                    }
                    
                    em.getTransaction().begin();
                    em.merge(efemeride);
                    em.getTransaction().commit();

                    response.sendRedirect("controllerEfemeride.jsp?op=loadallefems");
                    session.setAttribute("errormessage", "Editada correctamente la efeméride de " + personaje.getNombrepersonaje() + " " + personaje.getApellido1() + " " + personaje.getApellido2());
                } catch (Exception e) {
                    //response.sendRedirect("controllerEfemeride.jsp?op=loadallefems");
                    //session.setAttribute("errormessage", "Error al editar la efeméride");

                    out.print(e);
                }

            }
        %>
    </body>
</html>



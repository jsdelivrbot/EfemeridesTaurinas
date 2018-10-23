<%-- 
    Document   : controller
    Created on : 03-may-2018, 13:15:45
    Author     : agustin
--%>

<%@page import="Entities.FotosPK"%>
<%@page import="Entities.Fotos"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.DefaultFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.net.URL"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="javax.swing.JFileChooser"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="com.itextpdf.text.PageSize"%>
<%@page import="com.itextpdf.text.Document"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Entities.Efemeride"%>
<%@page import="javax.persistence.Persistence"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@page import="javax.persistence.EntityTransaction"%>
<%@page import="java.util.Date"%>
<%@page import="Entities.Usuario"%>
<%@page import="Entities.Personaje"%>
<%@page import="java.util.List"%>
<%@page import="javax.persistence.Query"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jpautil.JPAUtil"%>
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
                String username = null;
                String password = null;
                String message = null;
                EntityTransaction transaction;

                //detail personaje
                String nombrepersonaje = null;
                String apellido1 = null;
                String apellido2 = null;
                String apodo1 = null;
                String apodo2 = null;
                String nombrecartel = null;
                String direccion = null;
                String telefono = null;
                String fechanacimiento = null;
                String fechapicadores = null;
                String fechapresentacion = null;
                String fechaalternativa = null;
                String contacto = null;
                String email = null;
                String imagen = null;
                String biografia = null;

                String completo = null;
                String cossio = null;
                String notas = null;
                String provinciaactual = null;
                String provincianacimiento = null;
                String puebloactual = null;
                String pueblonacimiento = null;

                List<Usuario> listaUsuario;
                List<Personaje> listaPersonaje;
                List<Efemeride> listaEfemeride;

                op = request.getParameter("op");

                if (op.equals("sendCredentials")) {
                    username = (String) request.getParameter("username");
                    password = (String) request.getParameter("password");

                    if (username == "" || password == "") {
                        session.setAttribute("errormessage", "Rellene los credenciales");
                        response.sendRedirect("../login.jsp");
                    } else {

                        MessageDigest m = MessageDigest.getInstance("MD5");
                        m.update(password.getBytes("UTF8"));
                        byte s[] = m.digest();
                        String result = "";
                        for (int i = 0; i < s.length; i++) {
                            result += Integer.toHexString((0x000000ff & s[i]) | 0xffffff00).substring(6);
                        }

                        sql = "SELECT u from Usuario u where u.nombreusuario = '" + username + "' and u.contraseña = '" + result + "'";
                        q = em.createQuery(sql);
                        q.setHint("javax.persistence.cache.storeMode", "REFRESH");

                        listaUsuario = (List<Usuario>) q.getResultList();

                        if (listaUsuario.size() > 0) {
                            session.setAttribute("login", "ok");
                            response.sendRedirect("../mainview.jsp");
                        } else {
                            session.setAttribute("errormessage", "Usuario o contraseña incorrectos");
                            response.sendRedirect("../login.jsp");

                        }

                    }
                } else if (op.equals("loadallcharacters")) {

                    try {

                        //sql = "SELECT p FROM Personaje p order by p.fechanacimiento DESC";
                        sql = "SELECT p FROM Personaje p order by p.fechanacimiento DESC";
                        q = em.createQuery(sql);
                        q.setHint("javax.persistence.cache.storeMode", "REFRESH");
                        listaPersonaje = (List<Personaje>) q.getResultList();
                        session.setAttribute("listaPersonaje", listaPersonaje);

                        response.sendRedirect("../personajes.jsp");

                    } catch (Exception e) {

                        session.setAttribute("errormessage", "Error al cargar los personajes");
                        response.sendRedirect("../mainview.jsp");
                    }

                } else if (op.equals("savenewcharacter")) {

                    try {
                        nombrepersonaje = new String(request.getParameter("first_name").getBytes("ISO-8859-1"), "UTF-8");
                        apellido1 = new String(request.getParameter("frist_surname").getBytes("ISO-8859-1"), "UTF-8");
                        apellido2 = new String(request.getParameter("second_surname").getBytes("ISO-8859-1"), "UTF-8");
                        apodo1 = new String(request.getParameter("first_nickname").getBytes("ISO-8859-1"), "UTF-8");
                        apodo2 = new String(request.getParameter("second_nickname").getBytes("ISO-8859-1"), "UTF-8");
                        nombrecartel = new String(request.getParameter("name_poster").getBytes("ISO-8859-1"), "UTF-8");
                        direccion = new String(request.getParameter("direction").getBytes("ISO-8859-1"), "UTF-8");
                        telefono = (String) request.getParameter("phone");
                        fechanacimiento = (String) request.getParameter("birth_date");
                        contacto = new String(request.getParameter("contact").getBytes("ISO-8859-1"), "UTF-8");
                        email = (String) request.getParameter("email");
                        biografia = new String(request.getParameter("biography").getBytes("ISO-8859-1"), "UTF-8");
                        completo = (String) request.getParameter("checkcomplete");
                        cossio = (String) request.getParameter("checkcossio");
                        notas = new String(request.getParameter("notes").getBytes("ISO-8859-1"), "UTF-8");
                        provinciaactual = new String(request.getParameter("current_province").getBytes("ISO-8859-1"), "UTF-8");
                        provincianacimiento = new String(request.getParameter("birth_province").getBytes("ISO-8859-1"), "UTF-8");
                        puebloactual = new String(request.getParameter("current_town").getBytes("ISO-8859-1"), "UTF-8");
                        pueblonacimiento = new String(request.getParameter("birth_town").getBytes("ISO-8859-1"), "UTF-8");

                        fechapicadores = new String(request.getParameter("picadores_date").getBytes("ISO-8859-1"), "UTF-8");
                        fechapresentacion = new String(request.getParameter("presentation_date").getBytes("ISO-8859-1"), "UTF-8");
                        fechaalternativa = new String(request.getParameter("alternative_date").getBytes("ISO-8859-1"), "UTF-8");

                        /*
                    out.print("Personaje " + nombrepersonaje + " " + apellido1 + " " + apellido2 + " " + apodo1 + " " + apodo2 + " " + nombrecartel + " " + direccion + " "
                            + telefono + " " + contacto + " " + email + " " + imagen + " " + biografia + " " + averiguar + " " + notas + " "
                            + provinciaactual + " " + provincianacimiento + " " + puebloactual + " " + pueblonacimiento);
                         */
                        SimpleDateFormat formatter = new SimpleDateFormat("dd MMM, yyyy");

                        Personaje personaje = new Personaje();
                        personaje.setApellido1(apellido1);
                        personaje.setApellido2(apellido2);
                        personaje.setApodo1(apodo1);
                        personaje.setApodo2(apodo2);
                        personaje.setBiografia(biografia);
                        personaje.setCorreo(email);
                        personaje.setDireccion(direccion);
                        personaje.setFechaalternativa(formatter.parse(fechaalternativa));
                        personaje.setFechanacimiento(formatter.parse(fechanacimiento));
                        personaje.setFechapicadores(formatter.parse(fechapicadores));
                        personaje.setFechapresentacion(formatter.parse(fechapresentacion));
                        personaje.setNombrecartel(nombrecartel);
                        personaje.setNombrepersonaje(nombrepersonaje);
                        personaje.setNotas(notas);
                        personaje.setPersonadecontacto(contacto);
                        personaje.setProvinciaactual(provinciaactual);
                        personaje.setProvincianacimiento(provincianacimiento);
                        personaje.setPuebloactual(puebloactual);
                        personaje.setPueblonacimiento(pueblonacimiento);
                        personaje.setTelefono(telefono);

                        if (completo == null) {
                            personaje.setCompleto(false);
                        } else if (completo != null) {
                            personaje.setCompleto(true);
                        }

                        if (cossio == null) {
                            personaje.setCossio(false);
                        } else if (completo != null) {
                            personaje.setCossio(true);
                        }

                        em.getTransaction().begin();
                        em.persist(personaje);
                        em.getTransaction().commit();

                        /*
                    sql = "SELECT MAX(P.idpersonaje) from Personaje P";
                    q = em.createQuery(sql);
                    q.setHint("javax.persistence.cache.storeMode", "REFRESH");

                    int id = (int) q.getFirstResult();

                    //------------------IMAGEN------------------
                    String urlGuardado = "C:\\Users\\agust\\Desktop\\MADRIJA\\Efemerides Taurinas toledanas\\EfemeridesTaurinas\\web\\files";

                    DiskFileItemFactory factory = new DiskFileItemFactory();
                    factory.setSizeThreshold(1024);
                    factory.setRepository(new File(urlGuardado));

                    ServletFileUpload upload = new ServletFileUpload(factory);
                    String nombreArchivo = "";

                    try {
                        List<FileItem> partes = upload.parseRequest(request);

                        for (FileItem items : partes) {
                            File file = new File(urlGuardado, items.getName());
                            items.write(file);
                            nombreArchivo = items.getName();

                            FotosPK fotoPK = new FotosPK();
                            fotoPK.setIdpersonaje(id);

                            Fotos foto = new Fotos();
                            foto.setNombreimagen(nombreArchivo);
                            foto.setImagen("files/" + nombreArchivo);
                            foto.setFotosPK(fotoPK);

                            em.getTransaction().begin();
                            em.persist(foto);
                            em.getTransaction().commit();

                        }
                    } catch (Exception e) {
                    }
//------------------IMAGEN------------------*/
                        response.sendRedirect("controller.jsp?op=loadallcharacters");
                        session.setAttribute("correctmessage", "Añadido el personaje correctamente");

                    } catch (Exception e) {
                        session.setAttribute("errormessage", "Error añadiendo el personaje" + e);
                        response.sendRedirect("../personajes.jsp");
                    }
                } else if (op.equals("loadallefemerides")) {
                    try {

                        //sql = "SELECT p FROM Personaje p order by p.fechanacimiento DESC";
                        sql = "SELECT e FROM Efemeride e";
                        q = em.createQuery(sql);
                        q.setHint("javax.persistence.cache.storeMode", "REFRESH");
                        listaEfemeride = (List<Efemeride>) q.getResultList();
                        session.setAttribute("listaEfemeride", listaEfemeride);

                        response.sendRedirect("../efemerides.jsp");

                    } catch (Exception e) {
                        session.setAttribute("errormessage", "Error cargando las efemerides");
                        response.sendRedirect("../mainview.jsp");
                    }
                } else if (op.equals("sendfilter")) {
                    String valor = (String) request.getParameter("sendfilter");

                    switch (Integer.parseInt(valor)) {
                        case 1:
                            try {
                                sql = "SELECT p FROM Personaje p order by p.fechanacimiento";
                                q = em.createQuery(sql);
                                q.setHint("javax.persistence.cache.storeMode", "REFRESH");
                                listaPersonaje = (List<Personaje>) q.getResultList();
                                session.setAttribute("listaPersonaje", listaPersonaje);

                                response.sendRedirect("../personajes.jsp");
                            } catch (Exception e) {
                                response.sendRedirect("../personajes.jsp");
                                session.setAttribute("errormessage", "Error al ordenar los personajes");
                            }
                            break;
                        case 2:
                            try {
                                sql = "SELECT p FROM Personaje p order by p.pueblonacimiento";
                                q = em.createQuery(sql);
                                q.setHint("javax.persistence.cache.storeMode", "REFRESH");
                                listaPersonaje = (List<Personaje>) q.getResultList();
                                session.setAttribute("listaPersonaje", listaPersonaje);

                                response.sendRedirect("../personajes.jsp");
                            } catch (Exception e) {
                                response.sendRedirect("../personajes.jsp");
                                session.setAttribute("errormessage", "Error al ordenar los personajes");
                            }
                            break;
                        case 3:
                            try {
                                sql = "SELECT p FROM Personaje p order by p.nombrepersonaje";
                                q = em.createQuery(sql);
                                q.setHint("javax.persistence.cache.storeMode", "REFRESH");
                                listaPersonaje = (List<Personaje>) q.getResultList();
                                session.setAttribute("listaPersonaje", listaPersonaje);

                                response.sendRedirect("../personajes.jsp");
                            } catch (Exception e) {
                                response.sendRedirect("../personajes.jsp");
                                session.setAttribute("errormessage", "Error al ordenar los personajes");
                            }
                            break;
                        case 4:

                            try {
                                sql = "SELECT p FROM Personaje p order by p.apodo1";
                                q = em.createQuery(sql);
                                q.setHint("javax.persistence.cache.storeMode", "REFRESH");
                                listaPersonaje = (List<Personaje>) q.getResultList();
                                session.setAttribute("listaPersonaje", listaPersonaje);

                                response.sendRedirect("../personajes.jsp");
                            } catch (Exception e) {
                                response.sendRedirect("../personajes.jsp");
                                session.setAttribute("errormessage", "Error al ordenar los personajes");
                            }
                            break;
                        case 5:

                            try {
                                sql = "SELECT P FROM Personaje P where p.completo = false";
                                q = em.createQuery(sql);
                                q.setHint("javax.persistence.cache.storeMode", "REFRESH");
                                listaPersonaje = (List<Personaje>) q.getResultList();
                                session.setAttribute("listaPersonaje", listaPersonaje);

                                response.sendRedirect("../personajes.jsp");
                            } catch (Exception e) {
                                response.sendRedirect("../personajes.jsp");
                                session.setAttribute("errormessage", "Error al ordenar los personajes");
                            }
                            break;

                    }
                } else if (op.equals("searchcharacter")) {
                    try {
                        String buscar = (String) request.getParameter("search");
                        sql = "SELECT p FROM Personaje p where p.nombrepersonaje like '%" + buscar + "%' or p.apodo1 like '%" + buscar + "%'";
                        q = em.createQuery(sql);
                        q.setHint("javax.persistence.cache.storeMode", "REFRESH");
                        listaPersonaje = (List<Personaje>) q.getResultList();
                        session.setAttribute("listaPersonaje", listaPersonaje);
                        session.setAttribute("buscar", buscar);
                        //out.print("buscar " +buscar);
                        response.sendRedirect("../personajes.jsp");
                    } catch (Exception e) {
                        response.sendRedirect("../personajes.jsp");
                        session.setAttribute("errormessage", "Error buscando los personajes");
                    }
                } else if (op.equals("deletecharacter")) {
                    try {

                        String idpersonaje = (String) request.getParameter("idperonajedelete");

                        sql = "SELECT P FROM Personaje p where p.idpersonaje =" + idpersonaje;

                        q = em.createQuery(sql);
                        q.setHint("javax.persistence.cache.storeMode", "REFRESH");

                        Personaje p = (Personaje) q.getSingleResult();

                        em.getTransaction().begin();
                        em.remove(p);
                        em.getTransaction().commit();

                        response.sendRedirect("controller.jsp?op=loadallcharacters");
                        session.setAttribute("correctmessage", "Eliminado el personaje " + p.getNombrepersonaje() + " " + p.getApellido1() + " " + p.getApellido2());

                    } catch (Exception e) {
                        //response.sendRedirect("../personajes.jsp");
                        //session.setAttribute("errormessage", "Error eliminando el personaje");
                        out.print(e);
                    }
                } else if (op.equals("editcharacter")) {

                    try {

                        String idpersonaje = (String) request.getParameter("idcharacter");

                        sql = "SELECT P FROM Personaje p where p.idpersonaje =" + idpersonaje;
                        q = em.createQuery(sql);
                        q.setHint("javax.persistence.cache.storeMode", "REFRESH");
                        Personaje personajeEdit = (Personaje) q.getSingleResult();
                        session.setAttribute("personajeEdit", personajeEdit);

                        response.sendRedirect("../editPersonaje.jsp");
                    } catch (Exception e) {
                        response.sendRedirect("../personajes.jsp");
                        session.setAttribute("errormessage", "Al intentar cargar la edicción del personaje");
                    }
                } else if (op.equals("saveeditcharacter")) {
                    try {

                        String idpersonaje = (String) request.getParameter("idcharacter");
                        nombrepersonaje = new String(request.getParameter("first_name").getBytes("ISO-8859-1"), "UTF-8");
                        apellido1 = new String(request.getParameter("frist_surname").getBytes("ISO-8859-1"), "UTF-8");
                        apellido2 = new String(request.getParameter("second_surname").getBytes("ISO-8859-1"), "UTF-8");
                        apodo1 = new String(request.getParameter("first_nickname").getBytes("ISO-8859-1"), "UTF-8");
                        apodo2 = new String(request.getParameter("second_nickname").getBytes("ISO-8859-1"), "UTF-8");
                        nombrecartel = new String(request.getParameter("name_poster").getBytes("ISO-8859-1"), "UTF-8");
                        direccion = new String(request.getParameter("direction").getBytes("ISO-8859-1"), "UTF-8");
                        telefono = (String) request.getParameter("phone");
                        fechanacimiento = (String) request.getParameter("birth_date");
                        contacto = new String(request.getParameter("contact").getBytes("ISO-8859-1"), "UTF-8");
                        email = (String) request.getParameter("email");
                        biografia = new String(request.getParameter("biography").getBytes("ISO-8859-1"), "UTF-8");
                        completo = (String) request.getParameter("checkcomplete");
                        cossio = (String) request.getParameter("checkcossio");
                        notas = new String(request.getParameter("notes").getBytes("ISO-8859-1"), "UTF-8");
                        provinciaactual = new String(request.getParameter("current_province").getBytes("ISO-8859-1"), "UTF-8");
                        provincianacimiento = new String(request.getParameter("birth_province").getBytes("ISO-8859-1"), "UTF-8");
                        puebloactual = new String(request.getParameter("current_town").getBytes("ISO-8859-1"), "UTF-8");
                        pueblonacimiento = new String(request.getParameter("birth_town").getBytes("ISO-8859-1"), "UTF-8");
                        fechapicadores = new String(request.getParameter("picadores_date"));
                        fechapresentacion = new String(request.getParameter("presentation_date").getBytes("ISO-8859-1"), "UTF-8");
                        fechaalternativa = new String(request.getParameter("alternative_date").getBytes("ISO-8859-1"), "UTF-8");
                        out.print("dsfasdf");

                        SimpleDateFormat formatter = new SimpleDateFormat("dd MMM, yyyy");

                        Personaje personaje = new Personaje();
                        personaje.setIdpersonaje(Integer.parseInt(idpersonaje));
                        personaje.setApellido1(apellido1);
                        personaje.setApellido2(apellido2);
                        personaje.setApodo1(apodo1);
                        personaje.setApodo2(apodo2);
                        personaje.setBiografia(biografia);
                        personaje.setCorreo(email);
                        personaje.setDireccion(direccion);
                        personaje.setFechaalternativa(formatter.parse(fechaalternativa));
                        personaje.setFechanacimiento(formatter.parse(fechanacimiento));
                        personaje.setFechapicadores(formatter.parse(fechapicadores));
                        personaje.setFechapresentacion(formatter.parse(fechapresentacion));
                        personaje.setNombrecartel(nombrecartel);
                        personaje.setNombrepersonaje(nombrepersonaje);
                        personaje.setNotas(notas);
                        personaje.setPersonadecontacto(contacto);
                        personaje.setProvinciaactual(provinciaactual);
                        personaje.setProvincianacimiento(provincianacimiento);
                        personaje.setPuebloactual(puebloactual);
                        personaje.setPueblonacimiento(pueblonacimiento);
                        personaje.setTelefono(telefono);

                        if (completo == null) {
                            personaje.setCompleto(false);
                        } else if (completo != null) {
                            personaje.setCompleto(true);
                        }

                        if (cossio == null) {
                            personaje.setCossio(false);
                        } else if (completo != null) {
                            personaje.setCossio(true);
                        }

                        em.getTransaction().begin();
                        em.merge(personaje);
                        em.getTransaction().commit();
                        response.sendRedirect("controller.jsp?op=loadallcharacters");
                        session.setAttribute("correctmessage", personaje.getNombrepersonaje() + " " + personaje.getApellido1() + " " + personaje.getApellido2() + " ha sido editado correctamente");
                    } catch (Exception e) {
                        //session.setAttribute("errormessage", "Error editando el personaje");
                        //response.sendRedirect("../personajes.jsp");
                        out.print(e);
                    }
                } else if (op.equals("detailcharacter")) {

                    try {

                        String idpersonaje = (String) request.getParameter("idcharacter");
                        sql = "SELECT P FROM Personaje p where p.idpersonaje =" + idpersonaje;
                        q = em.createQuery(sql);
                        q.setHint("javax.persistence.cache.storeMode", "REFRESH");
                        Personaje personajedatail = (Personaje) q.getSingleResult();
                        session.setAttribute("personajedatail", personajedatail);
                        List<Efemeride> listaEfemeridesPersonaje = personajedatail.getEfemerideList();
                        session.setAttribute("listaEfemeridesPersonaje", listaEfemeridesPersonaje);

                        response.sendRedirect("../detailPersonajes.jsp");

                    } catch (Exception e) {
                        response.sendRedirect("../personajes.jsp");
                        session.setAttribute("errormessage", "Error al visualizar el personaje");
                    }
                } else if (op.equals("sendfilterefe")) {

                    String valor = (String) request.getParameter("sendfilterefe");
                    session.setAttribute("sendfilterefe", valor);

                    switch (Integer.parseInt(valor)) {
                        case 1:
                            try {
                                sql = "SELECT e FROM Efemeride e order by e.fechaefemeride";
                                q = em.createQuery(sql);
                                q.setHint("javax.persistence.cache.storeMode", "REFRESH");
                                listaEfemeride = (List<Efemeride>) q.getResultList();
                                session.setAttribute("listaefemerides", listaEfemeride);

                                response.sendRedirect("../efemerides.jsp");
                            } catch (Exception e) {
                                response.sendRedirect("../efemerides.jsp");
                                session.setAttribute("errormessage", "Error al ordenar las efemerides por fecha");
                            }
                            break;
                        case 2:
                            try {
                                sql = "SELECT E FROM Efemeride E order by e.provincia";
                                q = em.createQuery(sql);
                                q.setHint("javax.persistence.cache.storeMode", "REFRESH");
                                listaEfemeride = (List<Efemeride>) q.getResultList();
                                session.setAttribute("listaefemerides", listaEfemeride);

                                response.sendRedirect("../efemerides.jsp");
                            } catch (Exception e) {
                                response.sendRedirect("../efemerides.jsp");
                                session.setAttribute("errormessage", "Error al ordenar las efemerides por provincia");
                            }
                            break;
                        case 3:
                            try {
                                sql = "SELECT E FROM Efemeride E order by e.pueblo";
                                q = em.createQuery(sql);
                                q.setHint("javax.persistence.cache.storeMode", "REFRESH");
                                listaEfemeride = (List<Efemeride>) q.getResultList();
                                session.setAttribute("listaefemerides", listaEfemeride);

                                response.sendRedirect("../efemerides.jsp");
                            } catch (Exception e) {
                                response.sendRedirect("../efemerides.jsp");
                                session.setAttribute("errormessage", "Error al ordenar las efemerides por pueblo");
                            }
                            break;
                    }

                } else if (op.equals("saveimage")) {

                    String idCharacter = (String) request.getParameter("selectIdCharacter");

                    String id = (String) session.getAttribute("idPersoGuardarImagen");
                   
                try {
 
                    //TODO: aqui
                    String urlGuardado = "C:\\Users\\agust\\Desktop\\MADRIJA\\Efemerides Taurinas toledanas\\EfemeridesTaurinas\\web\\files";

                    DiskFileItemFactory factory = new DiskFileItemFactory();
                    factory.setSizeThreshold(1024);
                    factory.setRepository(new File(urlGuardado));

                    ServletFileUpload upload = new ServletFileUpload(factory);
                    String nombreArchivo = "";

                    try {
                        List<FileItem> partes = upload.parseRequest(request);

                        
                        for (FileItem items : partes) {
                            
                            File file = new File(urlGuardado, items.getName());
                            items.write(file);
                            nombreArchivo = items.getName();

                            FotosPK fotoPK = new FotosPK();
                            fotoPK.setIdpersonaje(Integer.parseInt(id));

                            Fotos foto = new Fotos();
                            foto.setNombreimagen(nombreArchivo);
                            foto.setImagen("files/" + nombreArchivo);
                            foto.setFotosPK(fotoPK);

                            session.removeAttribute("idPersoGuardarImagen");

                            em.getTransaction().begin();
                            em.persist(foto);
                            em.getTransaction().commit();

                        }
                    } catch (Exception e) {
                    } 
                    response.sendRedirect("controller.jsp?op=loadallcharacters");
                    session.setAttribute("correctmessage", "Imagen guardada correctamente");
                     
                }catch (Exception e) {
                    //response.sendRedirect("../galery.jsp");
                    //session.setAttribute("errormessage", "Error guardar la imagen" + e);
                    out.print(e);
                }

            }

            else if (op.equals ( 
                "prepararIdGuardarImagen")) {
                session.removeAttribute("idPersoGuardarImagen");
                String idpersonaje = (String) request.getParameter("idcharacter");
                session.setAttribute("idPersoGuardarImagen", idpersonaje);
                response.sendRedirect("../galery.jsp");

            }

            else if (op.equals ( 
                "prepareCharacterImage")) {

                sql = "SELECT P FROM Personaje p";
                q = em.createQuery(sql);
                q.setHint("javax.persistence.cache.storeMode", "REFRESH");
                List<Personaje> listaPersonajeImage = (List<Personaje>) q.getResultList();
                session.setAttribute("listaPersonajeImage", listaPersonajeImage);

                response.sendRedirect("../galery.jsp");

            }

            else if (op.equals ( 
                "createinformpdf")) {
                try {

                    String idpersonaje = (String) request.getParameter("idcharacter");

                    sql = "SELECT P FROM Personaje p where p.idpersonaje =" + idpersonaje;
                    q = em.createQuery(sql);
                    q.setHint("javax.persistence.cache.storeMode", "REFRESH");
                    Personaje personajeEdit = (Personaje) q.getSingleResult();
                    //session.setAttribute("personajeEdit", personajeEdit);

//                    Inform i = new Inform();
//                    i.generateInformPDF(request, response, personajeEdit);
                    response.sendRedirect("../detailPersonajes.jsp");
                    session.setAttribute("correctmessage", "Informe generado correctamente");

                } catch (Exception e) {
                    response.sendRedirect("../personajes.jsp");
                    session.setAttribute("errormessage", "Error al intentar generar el pdf");
                }

            }

            else if (op.equals ( 
                "createfullinformpdf")) {
                try {

                    String idpersonaje = (String) request.getParameter("idcharacter");

                    sql = "SELECT P FROM Personaje p where p.idpersonaje =" + idpersonaje;
                    q = em.createQuery(sql);
                    q.setHint("javax.persistence.cache.storeMode", "REFRESH");
                    Personaje personajeEdit = (Personaje) q.getSingleResult();

//                    Inform i = new Inform();
                    // i.generateFullInformPDF(request, response, personajeEdit);
                    response.sendRedirect("../detailPersonajes.jsp");
                    session.setAttribute("correctmessage", "Informe generado correctamente");

                } catch (Exception e) {
                    response.sendRedirect("../personajes.jsp");
                    session.setAttribute("errormessage", "Error al intentar generar el pdf");
                }
            }

            else if (op.equals ( 
                "logout")) {
                session.invalidate();
                response.sendRedirect("../login.jsp");
            }

            else if (op.equals ( 
                "deleteselectedcartel")) {
                String idcartel = (String) request.getParameter("idcartel");
                out.print(idcartel);
                out.print(session.getAttribute("listacartel"));
            }

        %>

    </body>
</html>

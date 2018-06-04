<%-- 
    Document   : validateSession
    Created on : 04-jun-2018, 12:24:51
    Author     : agustin
--%>

<%
    String login = (String) session.getAttribute("login");
    if (login == null) {
        out.print("no deberia dejarme entrar");
%>
<jsp:forward page="../../../login.jsp"/>
<%
    // response.sendRedirect("login.jsp");
    }
%>

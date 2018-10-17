<%--
    Document   : errorMessage
    Created on : 15-may-2018, 15:14:07
    Author     : agustin
--%>

<%
    if (null != session.getAttribute("errormessage")) {
        String error = session.getAttribute("errormessage").toString();
        session.removeAttribute("errormessage");
%>

<script type="text/javascript">
    setTimeout(function () {
        //element.removeAttribute("style");
        //document.getElementById('errormessage').style.visibility = 'hidden';
        $("#errormessage").fadeOut();
    }, 3000);
</script>

<div class="row" id="errormessage">
    <div class="">
        <div class="card error_message_login">
            <div class="card-content white-text error_message_style">
                <span><%=error%></span>
            </div>
        </div>
    </div>
</div>
<%}%>

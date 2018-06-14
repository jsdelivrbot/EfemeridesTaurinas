<%-- 
    Document   : correctMessage
    Created on : 16-may-2018, 10:05:55
    Author     : agustin
--%>

<%
    if (null != session.getAttribute("correctmessage")) {
        String message = session.getAttribute("correctmessage").toString();
        session.removeAttribute("correctmessage");
%>

<script type="text/javascript">
    setTimeout(function () {
        $("#correctmessage").fadeOut();
    }, 3000);
</script>

<div class="row" id="correctmessage">
    <div class="">
        <div class="card error_message_login">
            <div class="card-content white-text text_align_center_style">
                <span><%=message%></span>
            </div>
        </div>
    </div>
</div>
<%}%>
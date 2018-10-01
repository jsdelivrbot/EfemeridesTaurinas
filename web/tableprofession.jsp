<%-- 
    Document   : tableprofession
    Created on : 07-jun-2018, 9:47:53
    Author     : agustin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <jsp:include page="assets/shared/head.jsp" /> 
    <body>

        <div class="row">
            <div class="col s12 m12 l6 offset-l2 center">
                <!--<input type="text" id="search" placeholder="Type to search..." />-->
                <table cellpadding="1" cellspacing="1" class="table table-hover" id="myTable">
                    <thead>
                        <tr>
                            <th>nombre</th>
                            <th>apellido</th>
                        </tr>
                    </thead>
                    <tbody >
                        <tr>
                            <td>Clayton</td>
                            <td>Cook</td>
                            <td>28</td>
                            <td>lorem.lorem.luctus@convallis.org</td>
                        </tr>
                        
                    </tbody>
                </table>
                <div class="col-md-12 center text-center">
                    <span class="left" id="total_reg"></span>
                    <ul class="pagination pager" id="myPager"></ul>
                </div>
            </div>
        </div>
    </body>
</html>


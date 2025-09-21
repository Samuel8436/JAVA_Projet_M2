<%-- 
    Document   : Sedeconnecter
    Created on : 23 févr. 2023, 11:02:12
    Author     : NOMENY
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            session.removeAttribute("login");
            response.sendRedirect("Login.jsp");
        %>
    </body>
</html>

<%-- 
    Document   : newjspSecurite_page
    Created on : 21 févr. 2023, 20:22:49
    Author     : NOMENY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language = "java" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String login = "";
            if (session.getAttribute("login")!=null){
            login = session.getAttribute("login").toString();
        }
        else{
        response.sendRedirect("Login.jsp");
        }%>
    </body>
</html>

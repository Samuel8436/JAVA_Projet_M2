<%-- 
    Document   : newjspSecurite_page
    Created on : 21 févr. 2023, 20:22:49
    Author     : NOMENY
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page language = "java" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            // Récupérer la session sans en créer une nouvelle
            //HttpSession session = request.getSession(false);

            // Vérifie si la session ou le login est nul
            if (session == null || session.getAttribute("login") == null) {
                response.sendRedirect("Login.jsp");
                return;
            }
        
            // Récupère le nom d'utilisateur
            String login = (String) session.getAttribute("login");
        %>
    </body>
</html>

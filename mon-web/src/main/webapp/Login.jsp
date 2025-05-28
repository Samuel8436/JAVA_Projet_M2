<%-- 
    Document   : Login
    Created on : 21 janv. 2023, 23:35:52
    Author     : NOMENY
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link href="bootstrap/._bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="bootstrap/bootstrap.bundle.min.js"></script>
        <link href="StylText.css" rel="stylesheet" type="text/css"/>
        <link href="StyleContainer.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div class="body">
        <form method="post" action="login">
            <center>
                <table align='TOP'>
                    <tr height='100px'>
                        <th colspan="2"><h1><center>AUTHENTIFICATION</center></h1><br></th>
                    </tr>
                    <tr height='100px'>
                        <td><label class="form-lael">Nom d'utilisateur : </label></td>
                        <td><input type="text" class="form-control" name="username" placeholder="Nom d'utilisateur" autocomplete='off' required></td>
                    </tr>
                    <tr height='100px'>
                        <td><label class="form-lael">Mot de passe : </label></td>
                        <td>
                            <div class="input-group mb-3">
                                <input type="password" name="password" id="motdepasse" class="form-control" aria-describedby="pwdHelpBlock" placeholder="Mot de passe" required>
                                <div class="input-group-append">
                                    <span class="input-group-text" onclick="togglePassword()">👁️</span>
                                </div>
                            </div>
                            
                        </td>
                    </tr>
                    <tr height='100px'>
                        <td colspan="2"><center><input type="submit" value="Se conecter" id="btn" name="login"></center></td>
                    </tr>
                </table>
            </center>
            
        </form>
            
            <%
                String error = (String) request.getAttribute("errorMessage");
                if (error != null) {
            %>
            <div class="container mt-3">
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <center>
                        <%= error %>
                    </center>
                </div>
            </div>
            <% } %>
            <!-- <input type="checkbox" onclick="togglePwd('mdpconfirm')"> Afficher le mot de passe -->
            <!-- <input type="submit" value="Afficher le mot de passe"> -->
        <a class="Autre" href="Autre_compte.jsp">Créer un compte</a>
        <br><br>
        </div>
        <script>
            function togglePassword() {
                const input = document.getElementById("motdepasse");
                const icon = document.querySelector(".toggle-password");

                if (input.type === "password") {
                input.type = "text";
                icon.textContent = "🙈"; 
                } else {
                input.type = "password";
                icon.textContent = "👁️";
                }
            }
        </script>
    </body>
</html>

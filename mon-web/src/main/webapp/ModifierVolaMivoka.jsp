<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modifier dépense</title>
        <link href="bootstrap/._bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="TransformMajuscul.js" type="text/javascript"></script>
        <link href="StylText.css" rel="stylesheet" type="text/css"/>
        <link href="StyleContainer.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="navBar.jsp" %>
        <%@include file="Securite_page.jsp" %>
        <%@include file="RequetteTatitra.jsp" %>
        <center>
            <%
                        String error = (String) request.getAttribute("errorMessage");
                        String success = (String) request.getAttribute("successMessage");
                    %>
                    <% if (error != null) { %>
                        <div class="alert alert-danger alert-dismissible fade show m-3" role="alert">
                            <%= error %>
                            <!-- <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"><img src="image/fermer.png" alt="" width="10px" height="10px"></button> -->
                        </div>
                    <% } else if (success != null) { %>
                        <div class="alert alert-success alert-dismissible fade show m-3" role="alert">
                            <%= success %>
                            <!-- <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button> -->
                        </div>
                    <% } %>
        </center>
        <h1><u><center>Modifier Dépense</center></u></h1>
        <div class="body">
            <div class="row">
                <div class="col-sm-4">
                    <form method="Post" action="ModifierVolaMivoaka">
                        <%
                            String id=request.getParameter("id");
                            pst=con.prepareStatement("SELECT * FROM volamivoaka WHERE id=?");
                            pst.setString(1, id);
                            rs=pst.executeQuery();
                            while (rs.next()) 
                            {
                        %>
                        <center>
                            <table width="600px">
                                <tr height='100px'>
                                     <td><label class="form-lael">Date : </label></td>
                                    <td><input type="Date" name="date" value="<%=rs.getString("daty") %>"  id="" class="form-control" required></td>
                                </tr>
                                <tr height='100px'>
                                    <td><label class="form-lael">Nom : </label></td>
                                    <td><input type="text" name="nom" value="<%=rs.getString("anarana") %>" onkeyup="controlnom(this)" placeholder="Nom" class="form-control" required></td>
                                </tr>
                                <tr height='100px'>
                                    <td><label class="form-lael">Prénom : </label></td>
                                    <td><input type="text" name="prenom" value="<%=rs.getString("fanampinanarana") %>" placeholder="Prénom" class="form-control" required></td>
                                </tr>
                                <tr height='100px'>
                                    <td><label class="form-lael">Montant : </label></td>
                                    <td><input type="text" name="montant" value="<%=rs.getString("maribola") %>" placeholder="Montant" class="form-control" required></td>
                                </tr>
                                <tr height='100px'>
                                    <td><label class="form-lael">Motif : </label></td>
                                    <td><input type="text" name="antony" value="<%=rs.getString("antony") %>" placeholder="Motif" class="form-control" required></td>
                                </tr>
                                <tr height='100px'>
                                    <td colspan="2"><center><input type="submit"  name="submit" value="MODIFIER" class="btn btn-info"></center></td>
                                </tr>
                            </table>
                        </center>
                        <%
                            }
                        %>
                        </p>
                    </form>
                </div>
            </div>
        </div>
        <script src="TransformMajuscul.js" type="text/javascript"></script>
    </body>
</html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@include file="RequetteTatitra.jsp" %>
<%
    if(request.getParameter("submit")!=null)
    {
        String id=request.getParameter("id");
        String daty=request.getParameter("date");
        String nom=request.getParameter("nom");
        String prenom=request.getParameter("prenom");
        String montant=request.getParameter("montant");
        String antony=request.getParameter("antony");
       
        pst=con.prepareStatement("UPDATE volamivoaka SET anarana = ?, fanampinanarana = ?, daty = ?, maribola = ?, antony = ? WHERE id=?");
        pst.setString(1, nom);
        pst.setString(2, prenom);
        pst.setString(3, daty);
        pst.setString(4,montant);
        pst.setString(5,antony);
        pst.setString(6, id); 
        int result = pst.executeUpdate();
        if (result > 0) {
            request.setAttribute("successMessage", "Mise à jour succès !");
            RequestDispatcher rd = request.getRequestDispatcher("formVolaMivoaka.jsp");
            rd.forward(request, response);
        }
        else {
            request.setAttribute("errorMessage", "Mise à jour echouer");
            RequestDispatcher rd = request.getRequestDispatcher("formVolaMivoaka.jsp");
            rd.forward(request, response);
        }  
    }   
%>
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
        <h1><center>Modifier Dépense</center></h1>
        <div class="body">
            <div class="row">
                <div class="col-sm-4">
                    <form method="Post" action="#">
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
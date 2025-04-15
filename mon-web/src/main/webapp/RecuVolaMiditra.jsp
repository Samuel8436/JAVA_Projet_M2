<%-- 
    Document   : RecuVolaMiditra
    Created on : 22 janv. 2023, 17:35:36
    Author     : NOMENY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reçu de REVENU</title>
        <link href="bootstrap/._bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="StylText.css" rel="stylesheet" type="text/css"/>
        <link href="StyleContainer.css" rel="stylesheet" type="text/css"/>
        <style>
            @media print{
                body *{
                    visibility: hidden;
                }
                .dotted, .dotted *{
                    visibility: visible;
                }
                .dotted{
                    position: absolute;
                    left: 0;
                    top: 0;
                }
            }
        </style>
    </head>
    <body>
        <%@include file="navBar.jsp" %>
        <%@include file="Securite_page.jsp" %>
        <form method="POST" action="#">
            <%
                Connection con;
                PreparedStatement pst;
                ResultSet rs;
                Class.forName("com.mysql.jdbc.Driver");
                con=DriverManager.getConnection("jdbc:mysql://localhost/gestiondecaisse","root",""); 

                String id=request.getParameter("id");
                pst=con.prepareStatement("SELECT * FROM volamiditra WHERE id=?");
                pst.setString(1, id);
                rs=pst.executeQuery();
                while (rs.next()) 
                {
            %>
            <div  class="">
                <div class="dotted">
                    <table width="">
                        <tr>
                            <td height="50" colspan="2">
                                <center><h1>Reçu de REVENU</h1></center><br>
                            </td>
                        </tr>

                        <tr height="50">
                            <td>Date :</td>
                            <td><%=rs.getString("daty") %></td>
                        </tr>

                        <tr height="50">
                            <td>Nom et Prénom :</td>
                            <td><%=rs.getString("anarana") %>  <%=rs.getString("fanampiny") %></td>
                        </tr>

                        <tr height="50">
                            <td>Montant :</td>
                            <td><%=rs.getString("maribola") %> Ar</td>
                        </tr>

                        <tr height="50">
                            <td>Raison :</td>
                            <td><%=rs.getString("antony") %></td>
                        </tr>
                        <tr height="70">
                            <td colspan="2"><div align="right">Signature</div><br><br></td>
                        </tr>
                        
                    </table>

                </div>
            </div>
            <%
               }
            %>
        </form><br>
        <span><button id='impresson' name='impression' onclick='imprimer_page()' class="btn btn-secondary" title="Imprimer"> Exporter en pdf</button></span>
        <script>
            function imprimer_page(){
                window.print(document.getElementById='impri');
            }
        </script>
    </body>
</html>

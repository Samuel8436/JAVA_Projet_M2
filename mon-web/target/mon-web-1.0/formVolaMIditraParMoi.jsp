<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Revenu par Mois</title>
        <link href="StylText.css" rel="stylesheet" type="text/css"/>
        <!-- <link rel="stylesheet" href="bootstrap/bootstrap.css"> -->
        <style>
            .datatable-header {
                margin-bottom: 10px;
            }
        </style>
        <link rel="stylesheet" href="bootstrap/bootstrap.css">
        <link rel="stylesheet" href="bootstrap/bootstrap.css">
    </head>
    <body>
        <%@include file="navBar.jsp" %>
        <%@include file="Securite_page.jsp" %>
        <%@include file="RequetteTatitra.jsp" %>
        <p><h2><b><center>Revenu Par Mois</center></b></h2></p>
        <div class="row justify-content-center">
            <div class="col-md-8 text-center">
                <table id="tbl-stdent" class="table table-striped table-bordered mx-auto">
                    <thead>
                        <tr>
                            <th>Mois et Années</th>
                            <th>Montant</th>
                        </tr>
                    </thead>
                    <tbody id="myTable">
                        <tr>
                            <%
                                try{
                                    pst = con.prepareStatement(Miditraisambolana);
                                    pst.setInt(1, userId);
                                    rs=pst.executeQuery();
                                    while (rs.next()){
                            %>
                            <td>
                                <%=rs.getString("date") %>
                            </td>
                            <td>
                                <%=rs.getString("totalmiditraparMoi") %>
                            </td>

                        </tr>
                        <%
                                }
                                rs.close();
                                pst.close();
                                con.close();

                            } catch (Exception e) {
                                out.println("Erreur : " + e.getMessage());
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
    <script src="mise_en_page_tatitra.js"></script>
</html>

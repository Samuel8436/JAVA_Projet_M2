<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Revenu par ans</title>
        <link href="StylText.css" rel="stylesheet" type="text/css"/>
        <style>
            .datatable-header {
                margin-bottom: 10px;
            }
        </style>
    </head>
    <body>
        <%@include file="navBar.jsp" %>
        <%@include file="Securite_page.jsp" %>
        <%@include file="RequetteTatitra.jsp" %>
        <p><h2><b><center>Revenu Par Ans</center></b></h2></p>
        <div class="row justify-content-center">
            <div class="col-md-8 text-center">
                <table id="tbl-stdent" class="table table-striped table-bordered mx-auto">
                    <thead>
                        <tr>
                            <th>Année</th>
                            <th>Montant</th>
                                
                        </tr>
                    </thead>
                    <tbody id="myTable">
                        <%
                            pst = con.prepareStatement(Miditraisataona);
                            pst.setInt(1, userId);
                            rs1=pst.executeQuery();
                            while (rs1.next()){
                        %>
                        <tr>
                            <td>
                                <%=rs1.getString("taona") %>
                            </td>
                            <td>
                                <%=rs1.getString("totalmiditraparAns") %>
                            </td>
                                <%
                                    }
                                    rs1.close();
                                    pst.close();
                                %>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
    <script src="mise_en_page_tatitra.js"></script>
</html>


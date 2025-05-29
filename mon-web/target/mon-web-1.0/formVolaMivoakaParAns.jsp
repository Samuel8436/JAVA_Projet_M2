<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dépense par ans</title>
        <link href="StylText.css" rel="stylesheet" type="text/css"/>
        <!-- <link rel="stylesheet" href="bootstrap/bootstrap.css"> -->
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
        <p><h2><b><center>Dépanse Par Ans</center></b></h2></p>
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
                            rs1=st.executeQuery(Mivoakaisataona);
                            while (rs1.next()){
                        %>
                        <tr>
                            <td>
                                <%=rs1.getString("taona") %>
                            </td>
                            <td>
                                <%=rs1.getString("totalmivoakaparAns") %>
                            </td>
                                <%
                                    }
                                %>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Revenu par Mois</title>
        <link href="StylText.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="bootstrap/bootstrap.css">
       
    </head>
    <body>
        <%@include file="navBar.jsp" %>
        <%@include file="Securite_page.jsp" %>
        <p><h2><b><center>Revenu Par Mois</center></b></h2></p>
        <%@include file="RequetteTatitra.jsp" %>
        <form method="Post" action="#">
            <table id="example" class="table table-striped table-bordered" style="width:100%">
                <tr>
                    <th>Mois & Années</th>
                    <th>Montant</th>
                    
                </tr>
                <tbody id="myTable">
                    <%
                        //String isambolana="SELECT taona,volana,SUM(maribola) AS totalmiditraparMoi FROM volamiditra GROUP BY volana and taona";
                        //Statement st=con.createStatement();
                        rs=st.executeQuery(Miditraisambolana);
                        while (rs.next()){
                    %>
                    <tr>
                        
                        <td>
                            <%=rs.getString("date") %>
                        </td>
                        <td>
                            <%=rs.getString("totalmiditraparMoi") %>
                        </td>
                        <%
                            }
                        %>
                    </tr>
                </tbody>
                
            </table>
        </form>
    
    </body>
</html>

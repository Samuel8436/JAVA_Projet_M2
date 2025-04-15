<%-- 
    Document   : VolaMiditraParMo
    Created on : 28 janv. 2023, 15:16:58
    Author     : NOMENY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>*

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="StylText.css" rel="stylesheet" type="text/css"/>
        <style>
            #overflowTest {
              
              color: white;
              padding: 15px;
              width: 100%;
              height: 200px;
              overflow: scroll;
              border: 1px solid #ccc;
            }
        </style>
    </head>
    <body>
        <%@include file="navBar.jsp" %>
        <%@include file="RequetteTatitra.jsp" %>
        <p>Revenu par moi</p>
        <p>
            <div id="overflowTest">
                <p><input type="search" id="myInput" class="float-right" placeholder="Recherche....."></p><br><br>
                <form method="Post" action="#">
                    <table class="table-striped" width="100%">
                        <thead>
                            <tr>
                                <th>Mois</th>
                                <th>Montant</th>
                            </tr>
                        </thead>
                        <tbody id="myTable">
                            <%
                                rs=st.executeQuery(isambolana);
                                while (rs.next()){
                            %>
                            <tr>

                                <td>
                                    <%=rs.getString("volana") %>/<%=rs.getString("taona") %>
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
               
            </div>
        </p>
        <br><br>
        <p><b><h2>Revenu par ans</h2></b></p>
        <p>
            <div id="overflowTest">
                <form name="vola_miditr_taona" action="#">
                    <table class="table-striped" width="100%">
                        <thead>
                            <tr>
                                <th>taona</th>
                                <th>maribola</th>
                            </tr>
                        </thead>
                            <tbody>
                            <%
                                rs1=st.executeQuery(isataona);
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
                                    %>
                            </tr>
                        </tbody>

                    </table>
                </form>
            </div>
</p><br><br>
        <p>
            Akapobeny
        </p>
        <p>
        <div id="overflowTest">
            <form name="akapobeny" action="#">
                <table border="3" width="100%">
                    <tr>
                        <th>Antony</th>
                        <th>Date</th>
                        <th>maribola</th>
                    </tr>
                    <tbody>
                        <%
                            rs2=st.executeQuery(detail);
                            while (rs2.next()){
                        %>
                        <tr> 
                            <td>
                                <%=rs2.getString("antony") %>
                            </td>
                            <td>
                                <%=rs2.getString("volana") %>/<%=rs2.getString("taona") %>
                            </td>
                            <td>
                                <%=rs2.getString("totalmiditraparAntony") %>
                            </td>
                            <%
                                }
                            %>
                        </tr>
                    </tbody>

                </table>
            </form>
        </div>
        </p>
        <script>
            $(document).ready(function(){
                $("#myInput").on("keyup", function() {
                    var value = $(this).val().toLowerCase();
                    $("#myTable tr").filter(function() {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                    });
                });
                });
        </script>
    </body>
</html>

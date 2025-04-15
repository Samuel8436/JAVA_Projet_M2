<%-- 
    Document   : SoldeTest
    Created on : 24 janv. 2023, 15:06:43
    Author     : NOMENY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      <%@include file="navBar.jsp" %>
      <%@include file="RequetteTatitra.jsp" %>
        <table>
            <tr>
                <td>
                  vola niditra :   
                </td>
                <%
                    rs1=st.executeQuery(query);
                    
                    while (rs1.next()) 
                    {
                %>
                    <td>
                        <input type="text" name="totalmiditra" id="totalmiditra" value="<%=rs1.getString("totalmiditra") %>" disabled>
                        
                    </td>
                <%
                    }
                %>
                                
            </tr>
            <tr>
                <td>Mivoaka : </td>
                <%
                   rs2=st.executeQuery(mivoaka);
                    while (rs2.next()) 
                    {
                %>
                <td>
                    <input type="text" name="totalmivoaka" id="totalmivoaka" value="<%=rs2.getString("total") %>" disabled>
                    
                </td>
                <%
                    }
                %>
            </tr>
        </table>
        <%
            /*String x="4";
            int rs11 = (int) Integer.parseInt(x);
            String y="2";
            int rs22 = (int) Integer.parseInt(y);
            int resu = rs11 - rs22;
            out.println(resu);*/
        %>
        <p id="mes"></p>
        <input type="button"  id="btn" onclick="resultat()" value="Afficher la solde restant">
        <script>
            function resultat(){
                var a1=document.getElementById("totalmiditra").value;
                var a2=document.getElementById("totalmivoaka").value;
                var totalmiditra = parseInt(a1);
                var totalmivoaka = parseInt(a2);
                var solde=totalmiditra-totalmivoaka;
                document.getElementById("mes").innerHTML="Solde restnt : "+solde;
            }
        </script>
   
</html>

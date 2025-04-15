<%-- 
    Document   : SoldMivoaka
    Created on : 24 janv. 2023, 15:37:44
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
        <table>
            <tr>
                <th>
                  vola nivoaka :   
                </th>
                <%
                   Connection con;
                    PreparedStatement pst;
                    ResultSet rs;
                                Class.forName("com.mysql.jdbc.Driver");
                                con=DriverManager.getConnection("jdbc:mysql://localhost/gestiondecaisse","root","");
                                
                                String query="SELECT SUM(maribola) AS total FROM volamivoaka";
                                Statement st=con.createStatement();
                                rs=st.executeQuery(query);
                                 while (rs.next()) 
                                {
                                        ///String id = rs.getString("id");
                            
                           
                %>
                <th>
                    <%=rs.getString("total") %>
                </th>
                <%
                                }
                            %>
            </tr>
        </table>
    </body>
</html>

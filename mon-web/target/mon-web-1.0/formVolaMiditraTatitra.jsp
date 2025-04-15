<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
  Connection con;
  PreparedStatement pst;
  ResultSet rs2;
  Class.forName("com.mysql.jdbc.Driver");
  con=DriverManager.getConnection("jdbc:mysql://localhost/gestiondecaisse","root","");
                                
  String detail="SELECT taona,antony,volana,SUM(maribola) AS totalmiditraparAntony FROM volamiditra GROUP BY antony";
  Statement st=con.createStatement();                           
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="StylText.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
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
    </body>
</html>

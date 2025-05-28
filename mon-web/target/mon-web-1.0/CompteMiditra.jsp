<%-- 
    Document   : CompteMiditra
    Created on : 22 janv. 2023, 21:12:59
    Author     : NOMENY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Compte</title>
    </head>
    <body>
        <h1>Compte</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>Daty</th>
                    <th>Vola</th>
                </tr>
            </thead>
            <tbody>
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
                <tr>
                    <td></td>
                    <td></td>
                </tr>
                <%}%>
                <!--<tr>
                    <td></td>
                    <td></td>
                </tr>-->
            </tbody>
        </table>

    </body>
</html>

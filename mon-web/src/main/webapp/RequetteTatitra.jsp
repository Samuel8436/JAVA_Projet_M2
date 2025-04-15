

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
    Connection con;
    PreparedStatement pst;
    
    ResultSet rs;
    ResultSet rs1;
    ResultSet rs2;
    ResultSet rs3;
    ResultSet rs4;
    Class.forName("com.mysql.jdbc.Driver");
    con=DriverManager.getConnection("jdbc:mysql://localhost/gestiondecaisse","root","");

    
    String Miditraisambolana="SELECT DATE_FORMAT(daty, '%M %Y') as date,SUM(maribola) AS totalmiditraparMoi FROM volamiditra GROUP BY date";
    String Mivoakaisambolana="SELECT DATE_FORMAT(daty, '%M %Y') as date,SUM(maribola) AS totalmiditraparMoi FROM volamivoaka GROUP BY date";
    String Miditraisataona="SELECT YEAR(daty) AS taona,SUM(maribola) AS totalmiditraparAns FROM volamiditra GROUP BY YEAR(daty)";
    String Mivoakaisataona="SELECT YEAR(daty) AS taona,SUM(maribola) AS totalmivoakaparAns FROM volamivoaka GROUP BY YEAR(daty)";
    String detail="SELECT YEAR(daty) AS taona,antony,MONTH(daty) AS volana,SUM(maribola) AS totalmiditraparAntony FROM volamiditra GROUP BY antony";
    //Solde miditra sy mivoaka
    String mivoaka="SELECT SUM(maribola) AS total FROM volamivoaka";
    String query="SELECT SUM(maribola) AS totalmiditra FROM volamiditra";
    Statement st=con.createStatement();
%>
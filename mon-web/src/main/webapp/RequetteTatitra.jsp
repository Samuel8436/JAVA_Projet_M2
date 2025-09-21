

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
    Connection con;
    PreparedStatement pst, pst2;
    
    ResultSet rs, rs1, rs2, rs3, rs4;
    Class.forName("com.mysql.jdbc.Driver");
    con=DriverManager.getConnection("jdbc:mysql://localhost/gestiondecaisse","root","");
    int userId = (int) session.getAttribute("user_id");
                                    
    
    String Miditraisambolana="SELECT DATE_FORMAT(daty, '%M %Y') as date,SUM(maribola) AS totalmiditraparMoi FROM volamiditra WHERE user_id = ? GROUP BY date";
    String Mivoakaisambolana="SELECT DATE_FORMAT(daty, '%M %Y') as date,SUM(maribola) AS totalmiditraparMoi FROM volamivoaka WHERE user_id = ? GROUP BY date";
    String Miditraisataona="SELECT YEAR(daty) AS taona,SUM(maribola) AS totalmiditraparAns FROM volamiditra WHERE user_id = ? GROUP BY YEAR(daty)";
    String Mivoakaisataona="SELECT YEAR(daty) AS taona,SUM(maribola) AS totalmivoakaparAns FROM volamivoaka WHERE user_id = ? GROUP BY YEAR(daty)";
    String detail="SELECT YEAR(daty) AS taona,antony,MONTH(daty) AS volana,SUM(maribola) AS totalmiditraparAntony FROM volamiditra WHERE user_id = ? GROUP BY antony";
    //Solde miditra sy mivoaka
    String mivoaka="SELECT SUM(maribola) AS total FROM volamivoaka WHERE user_id = ?";
    String query="SELECT SUM(maribola) AS totalmiditra FROM volamiditra WHERE user_id = ?";
    String Volamiditra = "SELECT * FROM `volamiditra` WHERE user_id = ? ORDER BY `id` DESC";
    //Statement st=con.createStatement();
%>
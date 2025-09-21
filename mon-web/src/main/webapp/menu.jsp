<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>*
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>menu</title>
        <link href="StylText.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="bootstrap/bootstrap.min.css">
        <style>
            a img {
                animation: mymove 7s infinite;
              }

              @keyframes mymove {
                50% {
                  -webkit-filter: grayscale(100%); 
                  filter: grayscale(100%);
                }
              }
            a.button{
            float: right;
            border: 0px;
            }
        </style>
       
    </head>
    <body>
        <%@include file="navBar.jsp" %>
        <%@include file="Securite_page.jsp" %>
        <%@include file="RequetteTatitra.jsp" %>
        <div class="container mt-3">
          <div class="alert alert-success text-center">
              Bienvenue <%= login %> !
          </div>
        </div>

        <br><br>
        <div class="container">
            <table width='100%'>
                <tr>
                    <td><a href="#"><img src="image/Tranofiangonana.jpg"  width="236" height="236"  alt="Paris" class="rounded-circle"></a></td>
                    <td><center><a href="#"><img src="image/logo_FLM.jpg"  width="236" height="236"  alt="Paris" class="rounded-circle"></a></center></td>
                    <td><center><a href="#"><img src="image/vola1.jpg"  width="236" height="236"  alt="Paris" class="rounded-circle"></a></center></td>
                
                </tr>
            </table>
        </div><br>

        <div class="container">
  
            <div class="card-columns">
              <div class="card bg-primary">
                <div class="card-body text-center">
                    <p class="card-text"><b><h2>Revenu</h2></b></p>
                    <%
                      pst = con.prepareStatement(query);
                      pst.setInt(1, userId);  
                      rs1=pst.executeQuery();

                        while (rs1.next()) 
                        {
                    %>
                        <p><%=rs1.getString("totalmiditra") %></p>
                    <%
                        }
                        rs1.close();
                        pst.close();
                    %>
                </div>
                <a class="button" href="formVolaMiditra.jsp"><img src="image/suivant.jpg" alt=""></a>
              </div>

              <div class="card bg-info">
                <div class="card-body text-center">
                    <p class="card-text"><b><h2>Dépense</h2></b></p>
                    <%
                    pst2 = con.prepareStatement(mivoaka);
                    pst2.setInt(1, userId);
                       rs2=pst2.executeQuery();
                        while (rs2.next()) 
                        {
                    %>
                        <p><%=rs2.getString("total") %></p>
                    <%
                        }
                        rs2.close();
                        pst2.close();
                    %>
                </div>
                <a class="button" href="formVolaMivoaka.jsp"><img src="image/suivant.jpg" alt=""></a>
              </div>

              <div class="card bg-success">
                <div class="card-body text-center">
                  <p class="card-text"><b><h2>Solde restant</h2></b></p>
                  <p>
                    <%
                        
                        PreparedStatement pstSoldeDepense = con.prepareStatement(mivoaka);
                        pstSoldeDepense.setInt(1, userId);
                        ResultSet rsSoldeDepense = pstSoldeDepense.executeQuery();
                        double dsoldMivoaka = 0;
                        if (rsSoldeDepense.next()) {
                            String soldMivoaka = rsSoldeDepense.getString("total");
                            dsoldMivoaka = (soldMivoaka != null) ? Double.parseDouble(soldMivoaka) : 0;
                        }
                        rsSoldeDepense.close();
                        pstSoldeDepense.close();

                        PreparedStatement pstSoldeRevenu = con.prepareStatement(query);
                        pstSoldeRevenu.setInt(1, userId);
                        ResultSet rsSoldeRevenu = pstSoldeRevenu.executeQuery();
                        double dSoldeMiditra = 0;
                        if (rsSoldeRevenu.next()) {
                            String SoldeMiditra = rsSoldeRevenu.getString("totalmiditra");
                            dSoldeMiditra = (SoldeMiditra != null) ? Double.parseDouble(SoldeMiditra) : 0;
                        }
                        rsSoldeRevenu.close();
                        pstSoldeRevenu.close();

                        double SOLDERESTANT = dSoldeMiditra - dsoldMivoaka;
                        out.println(SOLDERESTANT);
                    %>
                  </p>
                </div>
                <a class="button" href="#"><img src="image/suivant.jpg" alt=""></a>
              </div>

              <div class="card bg-secondary">
                <div class="card-body text-center">
                    <%@include file="SoldeMiditra&Mivok.jsp" %>
                </div>
              </div>

              <div class="card">
                <div class="card-body text-center">
                    <p class="card-text"><b><h2>Courbe de representation par ans</h2></b></p>
                    <%@include file="Courbesparans.jsp" %>
                </div>
              </div>
              
            </div>
          </div>
    </body>
</html>

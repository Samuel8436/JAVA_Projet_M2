<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                        rs1=st.executeQuery(query);

                        while (rs1.next()) 
                        {
                    %>
                        <p><%=rs1.getString("totalmiditra") %></p>
                    <%
                        }
                    %>
                </div>
                <a class="button" href="formVolaMiditra.jsp"><img src="image/suivant.jpg" alt=""></a>
              </div>

              <div class="card bg-info">
                <div class="card-body text-center">
                    <p class="card-text"><b><h2>Dépense</h2></b></p>
                    <%
                       rs2=st.executeQuery(mivoaka);
                        while (rs2.next()) 
                        {
                    %>
                        <p><%=rs2.getString("total") %></p>
                    <%
                        }
                    %>
                </div>
                <a class="button" href="formVolaMivoaka.jsp"><img src="image/suivant.jpg" alt=""></a>
              </div>

              <div class="card bg-success">
                <div class="card-body text-center">
                  <p class="card-text"><b><h2>Solde restant</h2></b></p>
                  <p>
                    <%
                        rs3=st.executeQuery(mivoaka);
                         if (rs3.next()) 
                        {
                    
                            String soldMivoaka=(rs3.getString("total"));
                            double dsoldMivoaka=Double.parseDouble(soldMivoaka);
                            //out.println(dsoldMivoaka);
                            rs4=st.executeQuery(query);
                            if (rs4.next()) 
                            {
                                String SoldeMiditra =rs4.getString("totalmiditra");
                                double dSoldeMiditra=Double.parseDouble(SoldeMiditra);
                                //out.println(dSoldeMiditra);
                                double SOLDERESTANT=dSoldeMiditra-dsoldMivoaka;
                                out.println(SOLDERESTANT);
                            }
                    
                        }else{
                             out.println("Eureur");
                         }
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

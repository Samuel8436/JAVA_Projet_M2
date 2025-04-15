<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>volamivoaka isataona</title>
        <link href="StylText.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="bootstrap/bootstrap.css">
        <style>
            div.card-deck{
                width: 30%;
                height: 354;
                border-radius: 10px;
            }
        </style>
    </head>
    <body>
        <%@include file="navBar.jsp" %>
        <%@include file="Securite_page.jsp" %>
        <br>
        <img id="Sariko" src="image/SAriko/aho.jpg" class="rounded-circle float-right" alt="Cinque Terre" width="304" height="334">
        <p>
            <div class="card-deck">
                <div class="card bg-primary">
                  <div class="card-body">
                      <div class="card-text">
                            Nom et Prénon : ANDRIANANDRASANA Nomeniony Samuël<br>
                            Né le : 15 Août 1999
                            à 
                            FIANARANTSOA<br>
                            Situation: Celibataira<br>
                            Nationaliter : Malagasy<br>
                            Adresse : Soatsihadino - Fianarantsoa<br>
                            Tél : +261 52 240 36<br>
                            E_mail : anomenionysamuel@gmail.com<br>
                      </div>
                  </div>
                </div>
            </div>
        </p>
        <br><br><br>
      
        <p>
            <table width="100%" border="1">
                <tr>
                    <td><div align="center"><marquee dir="ltr"> <b>Etat actuelle : </b>Etudiant <b>L<sub>3</sub></b> à l'EMIT - FIANARANTSOA (301)</marquee></td>
                </tr>
              </table>
            </table> 
        </p>	

    
    </body>
</html>

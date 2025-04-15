<%-- 
    Document   : formVolaMiditra
    Created on : 21 janv. 2023, 13:35:47
    Author     : NOMENY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Revenu</title>
        <link href="bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="bootstrap/jquery-3.6.0.min.js" type="text/javascript"></script>
        <script src="bootstrap/dataTable.bootstrap.min.js" type="text/javascript"></script>
        <link href="StylText.css" rel="stylesheet" type="text/css"/>
        <script src="TransformMajuscul.js" type="text/javascript"></script>
        <link href="StylText.css" rel="stylesheet" type="text/css"/>
        
        <style>
            #overflowTest 
            {
              color: white;
              padding: 15px;
              width: 50%;
              height: 500px;
              overflow: scroll;
              border: 1px solid #ccc;
            }
            @media print
            {
                body *{
                    visibility: hidden;
                }
                .print-container, .print-container *{
                    visibility: visible;
                }
                .print-container{
                    position: absolute;
                    left: 0;
                    top: 0;
                }
            }
            input.Recherche{
                padding-top: 10px;
                float: right;
            }
        </style>
    </head>
    <body>
        <%@include file="navBar.jsp" %>
        <%@include file="Securite_page.jsp" %>
            <p><b><center><h2>REVENU</h2></center></b></p>
    
    <div class="row">
        <div class="col-sm-4">
            <h2>Formulaire d'ajout</h2><br>
            <form method="POST" action="volaM">
                <p>
                    <label class="form-lael">Date : </label><input type="Date" name="date" id="" class="form-control" required>
                    <label class="form-lael">Nom : </label><input type="text" name="nom" onkeyup="controlnom(this)" placeholder="Nom" class="form-control" required>
                    <label class="form-lael">Prénom vbv: </label><input type="text" name="prenom" id="prenom" placeholder="Prénom" class="form-control" required>
                    <label class="form-lael">Montant : </label><input type="number" name="montant" placeholder="Montant" class="form-control" required>
                    <label class="form-lael">Motif : </label><input type="text" name="antony" placeholder="Motif" class="form-control" required>
                </p>
                <center>
                    <p>
                        <input type="submit" value="AJOUTER" class="btn btn-info">
                        <input type="reset" value="RETABLIR" class="btn btn-outline-secondary">
                    </p>
                </center>
            </form>
        </div>
    
    
    <!--Liste-->
        <div class="col-sm-8" id="overflowTest">
            <div class="form-group">
                <!-- <input class="Recherche" id="myInput" type="text" placeholder="Recherche..">-->
                <span class="list"><center><h2>Listes</h2></center></span>
            </div>
            <div class="panel-body">
                <div class='print-container'>
                    <table id="tbl-stdent" class="table table-striped table-bordered" cellspading="0" width="100%">
                        <thead>
                            <tr>
                                <th>Id</th>
                                <th>Nom</th>
                                <th>Date</th>
                                <th>Montant</th>
                                <th>Montant</th>
                            </tr>
                        </thead> 
                            <%
                            
                                Connection con;
                                PreparedStatement pst;
                                ResultSet rs;
                                Class.forName("com.mysql.jdbc.Driver");
                                con=DriverManager.getConnection("jdbc:mysql://localhost/gestiondecaisse","root","");
                                
                                String query="SELECT * FROM volamiditra";
                                Statement st=con.createStatement();
                                rs=st.executeQuery(query);
                                while (rs.next()) 
                                {
                                String id = rs.getString("id");
                            
                            %>
                            <tbody id="myTable">
                                <tr>
                                    <td><%=rs.getString("id") %></td>
                                    <td><%=rs.getString("anarana") %> <%=rs.getString("fanampiny") %></td>
                                    <!--<td></td>-->
                                    <td><%=rs.getString("daty") %></td>
                                    <!--<td><%//=rs.getString("taona") %>/<%//=rs.getString("volana") %></td>-->
                                    <td><%=rs.getString("maribola") %></td>
                                    <td><%=rs.getString("antony") %></td>
                                    <td>
                                        <a href="modifiervolaMiditr.jsp?id=<%=id %>"><img src="image/icons8-Edit-32.png" title='Modifier'></a>   
                                        <a href="SuprimerVolaMiditr?id=<%=rs.getString("id") %>"><img src="image/icons8-Trash-32.png" onclick="return confirm('Voulez-vous vraiment suprimer');" title='Suprimer'></a>
                                    </td>
                                    <td>
                                        <a href="RecuVolaMiditra.jsp?id=<%=id %>"><button title='Impression de reçu' class="btn btn-secondary"> Reçu</button></a>
                                    </td>
                                </tr>
                            </tbody>
                            <%
                                }
                            %>
                    </table>
                </div>
            </div>
        </div>
    </div>
    
    </body>
    <script>
        const input = document.getElementById("prenom");
    
        input.addEventListener("input", () => {
          const mots = input.value.split(' ').map(mot => {
            return mot ? mot[0].toUpperCase() + mot.slice(1).toLowerCase() : '';
          });
          input.value = mots.join(' ');
        });
      </script>
</html>

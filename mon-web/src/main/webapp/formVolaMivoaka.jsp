<%-- 
    Document   : formVolaMivoaka
    Created on : 15 déc. 2022, 21:04:01
    Author     : NOMENY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<a href="formVolaMivoaka.jsp"></a>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dépense</title>
        <link href="bootstrap/._bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="bootstrap/jquery-3.6.0.min.js" type="text/javascript"></script>
        <script src="bootstrap/dataTable.bootstrap.min.js" type="text/javascript"></script>
        <link href="StylText.css" rel="stylesheet" type="text/css"/>
        <script src="TransformMajuscul.js" type="text/javascript"></script>
        <link href="StylText.css" rel="stylesheet" type="text/css"/>
        <style>
            #overflowTest {
              color: white;
              padding: 15px;
              width: 50%;
              height: 500px;
              overflow: scroll;
              border: 1px solid #ccc;
            }
            @media print{
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
                float: right;
                padding-top: 10px;
            }
        </style>
    </head>
    <body>
        <%@include file="navBar.jsp" %>
        <%@include file="Securite_page.jsp" %>
        <p><h2><b><center>DEPENSE</center></b></h2></p>
    <%@include file="RequetteTatitra.jsp" %>
    <%
        rs3=st.executeQuery(mivoaka);
        if (rs3.next()) 
        {
            String soldMivoaka=(rs3.getString("total"));
            double dsoldMivoaka=Double.parseDouble(soldMivoaka);
            rs4=st.executeQuery(query);
            if (rs4.next()) 
                {
                    String SoldeMiditra =rs4.getString("totalmiditra");
                    double dSoldeMiditra=Double.parseDouble(SoldeMiditra);
                    double SOLDERESTANT=dSoldeMiditra-dsoldMivoaka;
                    out.println("SOLDERESTANT : " + SOLDERESTANT);
                }
            }else{
                  out.println("Eureur");
                  }
    %>
    <div class="row">
        <div class="col-sm-4">
            <h2>Formulaire d'ajout</h2><br>
            <form method="POST" action="volaMivoaka">
                <p>
                    <label class="form-lael">DATE : </label><input type="Date" name="date" id="" class="form-control" required>
                    <label class="form-lael">Nom : </label><input type="text" name="nom" onkeyup="controlnom(this)" id='nom' placeholder="Nom" class="form-control" required>
                    <label class="form-lael">Prénom : </label><input type="text" name="prenom"  placeholder="Prénom" class="form-control" required>
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
                    <!--<input class="Recherche"  id="myInput" type="text" placeholder="Recherche..">-->
                    <span class="list"><center><h2>Listes</h2></center></span>
                </div>
                <div class="panel-body">
                    <div class='print-container'>
                    <table id="tbl-stdent" class="table table-responsive table-bordered" cellspading="0" width="100%">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nom te Prénom</th>
                                <th>Date</th>
                                <th>Montant</th> 
                                <th>Motifs</th>
                            </tr>
                        </thead> 
                            <%
                            
                                /*Connection con;
                                PreparedStatement pst;
                                ResultSet rs;
                                Class.forName("com.mysql.jdbc.Driver");
                                con=DriverManager.getConnection("jdbc:mysql://localhost/gestiondecaisse","root","");
                                */
                                String volamivoaka="SELECT * FROM volamivoaka";
                                st=con.createStatement();
                                rs=st.executeQuery(volamivoaka);
                                while (rs.next()) 
                                {
                                        String id = rs.getString("id");
                            
                            %>
                            <tbody id="myTable">
                                <tr>
                                    <td><%=rs.getString("id") %></td>
                                    <td><%=rs.getString("anarana") %> <%=rs.getString("fanampinanarana") %></td>
                                    
                                    <td><%=rs.getString("daty") %></td>
                                    <td><%=rs.getString("maribola") %></td>
                                    <td><%=rs.getString("antony") %></td>
                                    <td>
                                        <a href="ModifierVolaMivoka.jsp?id=<%=id %>"><img src="image/icons8-Edit-32.png" title='Modifier'></a>   
                                            <a href="SuprimerVolaMivoaka?id=<%=rs.getString("id") %>"><img src="image/icons8-Trash-32.png" onclick="return confirm('Voulez-vous vraiment suprimer');" title='Suprimer'></a>
                                    </td>
                                    <td>
                                        <a href="RecuVolaMivoka.jsp?id=<%=id %>"><button title='Impression de reçu' class="btn btn-secondary"> Reçu</button></a>
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
    <script>
        
        function imprimer_page(){
            window.print(document.getElementById='impri');
        }

    </script>
    </body>
</html>

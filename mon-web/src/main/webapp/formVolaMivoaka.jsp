<%-- 
    Document   : formVolaMivoaka
    Created on : 15 déc. 2022, 21:04:01
    Author     : NOMENY
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<!-- <a href="formVolaMivoaka.jsp"></a> -->
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dépense</title>
        <link href="StylText.css" rel="stylesheet" type="text/css"/>
        <script src="TransformMajuscul.js" type="text/javascript"></script>
        <link href="StylText.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="style.css">
        <style>
            
        </style>
    </head>
    <body>
        <%@include file="navBar.jsp" %>
        <%@include file="Securite_page.jsp" %>
        <%@include file="RequetteTatitra.jsp" %>
        <center>
            <%
                String error = (String) request.getAttribute("errorMessage");
                String success = (String) request.getAttribute("successMessage");
            %>
            <% if (error != null) { %>
                <div class="alert alert-danger alert-dismissible fade show m-3" role="alert">
                    <%= error %>
                    <!-- <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"><img src="image/fermer.png" alt="" width="10px" height="10px"></button> -->
                </div>
            <% } else if (success != null) { %>
                <div class="alert alert-success alert-dismissible fade show m-3" role="alert">
                    <%= success %>
                    <!-- <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button> -->
                </div>
            <% } %>
        </center>
        <p><h2><b><center>DEPENSE</center></b></h2></p>
    <%
        pst = con.prepareStatement(mivoaka);
        pst.setInt(1, userId);
        rs3=pst.executeQuery();
        double dsoldMivoaka = 0;
        if (rs3.next()) 
        { 
            String soldMivoaka=(rs3.getString("total"));
            if (soldMivoaka != null) {
                dsoldMivoaka=Double.parseDouble(soldMivoaka);
            }
            
            pst2 = con.prepareStatement(query);
            pst2.setInt(1, userId);
            rs4=pst2.executeQuery();
            if (rs4.next()) 
                {
                    String SoldeMiditra =rs4.getString("totalmiditra");
                    //double dSoldeMiditra=Double.parseDouble(SoldeMiditra);
                    double dSoldeMiditra = (SoldeMiditra != null) ? Double.parseDouble(SoldeMiditra) : 0;
                    double SOLDERESTANT=dSoldeMiditra-dsoldMivoaka;
                    out.println("SOLDERESTANT : " + SOLDERESTANT);
                }
                rs4.close();
                pst2.close();
            }
            else{
                out.println("Eureur");
            }
            rs3.close();
            pst.close();    
    %>
    <div class="row">
        <div class="col-sm-4">
            <h2>Formulaire d'ajout</h2><br>
             
            <form method="POST" action="volaMivoaka">
                <p>
                    <label class="form-lael">DATE : </label><input type="Date" name="date" id="" class="form-control" required>
                    <label class="form-lael">Nom : </label><input type="text" name="nom" onkeyup="controlnom(this)" id='nom' placeholder="Nom" class="form-control" required>
                    <label class="form-lael">Prénom : </label><input type="text" name="prenom" id="prenom"  placeholder="Prénom" class="form-control" required>
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
                            
                            <tbody id="myTable">
                                <%
                                    try{
                                        String volamivoaka="SELECT * FROM volamivoaka WHERE user_id = ?";
                                        pst = con.prepareStatement(volamivoaka);
                                        pst.setInt(1, userId);
                                        rs = pst.executeQuery();
                                        while (rs.next()) 
                                        {
                                            String id = rs.getString("id");
                                %>
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
                                <%
                                    }
                                    con.close();
                                } catch (Exception e) {
                                    out.println("Erreur : " + e.getMessage());
                                }
                                %>
                            </tbody>
                            
                        
                    </table>
                    </div>
                </div>
                
                
            </div>
    </div>
    <script src="mise_en_page_vola_Miditr&Mivoaka.js"></script>
    </body>
</html>

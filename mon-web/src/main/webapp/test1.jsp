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
        <link href="StylText.css" rel="stylesheet" type="text/css"/>
        <script src="TransformMajuscul.js" type="text/javascript"></script>
        <link href="StylText.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="style.css">
    </head>
    <body>
        <%@include file="navBar.jsp" %>
        <%@include file="RequetteTatitra.jsp" %>
        
        <p><b><center><h2>REVENU</h2></center></b></p>
    
    
        <div class="col-sm-4">
            
        </div>
    
    
        <!--Liste-->
        <center>
        <div class="col-sm-8" id="overflowTest">
            <div class="form-group">
                <!-- <input class="Recherche" id="myInput" type="text" placeholder="Recherche..">-->
                <span class="list"><center><h2>Listes</h2></center></span>
            </div>
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
                <tbody id="myTable">
                    <%
                        
                        rs = st.executeQuery(Volamiditra);
                        while (rs.next()) {
                            String id = rs.getString("id");
                    %>
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
                    <%
                    }
                    %>
                </tbody>
            </table>
        </div>
        </center>
    
    </body>
    <script>
        const input = document.getElementById("prenom");
    
        input.addEventListener("input", () => {
          const mots = input.value.split(' ').map(mot => {
            return mot ? mot[0].toUpperCase() + mot.slice(1).toLowerCase() : '';
          });
          input.value = mots.join(' ');
        });

        // Mise en page de tableau
        $(document).ready(function () {
            $('#tbl-stdent').DataTable({
                searching: false,      // ✅ Barre de recherche activée 
                paging: true,
                lengthChange: true,
                pageLength: 5, // ✅ Valeur par défaut à 5
                ordering: true,
                autoWidth: false,
                language: {
                    search: "Recherche :",
                    lengthMenu: "Afficher _MENU_ enregistrements",
                    zeroRecords: "Aucun résultat trouvé",
                    info: "Page _PAGE_ sur _PAGES_",
                    infoEmpty: "Aucun enregistrement",
                    infoFiltered: "(filtré sur _MAX_ enregistrements)",
                    paginate: {
                        first: "«",
                        last: "»",
                        next: "›",
                        previous: "‹"
                    },
                },
                columnDefs: [
                    { orderable: false, targets: [5, 6] } // Désactiver tri sur "Actions" et "Reçu"
                ],
                order: [[0, 'desc']]  // Trier la première colonne (ID) par ordre décroissant
            });
        });
      </script>
</html>

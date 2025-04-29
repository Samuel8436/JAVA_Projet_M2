
<%-- 
    Document   : formVolaMiditra
    Created on : 21 janv. 2023, 13:35:47
    Author     : NOMENY
--%>
 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Liste des entrées de caisse</title>
    <link href="bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="bootstrap/dataTables.bootstrap.min.css">
    <script src="bootstrap/jquery-3.6.0.min.js" type="text/javascript"></script>
    <script src="bootstrap/jquery.dataTables.min.js"></script>
    <script src="bootstrap/dataTable.bootstrap.min.js" type="text/javascript"></script>
    <script src="bootstrap/dataTables.bootstrap.min.js"></script>
    
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
<body class="bg-light">
    
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
    <div class="container mt-5" id="overflowTest">
        <div class="form-group">
            <span class="list"><center><h2>Liste des entrées de caisse</h2></center></span>
        </div>

        <table id="tbl-stdent" class="table table-striped table-bordered" style="width:100%">
            <thead class="table-dark">
                <tr>
                    <th>Id</th>
                    <th>Nom</th>
                    <th>Date</th>
                    <th>Montant</th>
                    <th>Motif</th>
                    <th>Actions</th>
                    <th>Reçu</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Connection con;
                    PreparedStatement pst;
                    ResultSet rs;
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost/gestiondecaisse", "root", "");
                        String query = "SELECT * FROM volamiditra";
                        Statement st = con.createStatement();
                        rs = st.executeQuery(query);
                        while (rs.next()) {
                            String id = rs.getString("id");
                %>
                <tr>
                    <td><%= id %></td>
                    <td><%= rs.getString("anarana") %> <%= rs.getString("fanampiny") %></td>
                    <td><%= rs.getString("daty") %></td>
                    <td><%= rs.getString("maribola") %></td>
                    <td><%= rs.getString("antony") %></td>
                    <td>
                        <a href="modifiervolaMiditr.jsp?id=<%= id %>">
                            <img src="image/icons8-Edit-32.png" title="Modifier">
                        </a>
                        <a href="SuprimerVolaMiditr?id=<%= id %>" onclick="return confirm('Voulez-vous vraiment supprimer ?');">
                            <img src="image/icons8-Trash-32.png" title="Supprimer">
                        </a>
                    </td>
                    <td>
                        <a href="RecuVolaMiditra.jsp?id=<%= id %>">
                            <button class="btn btn-secondary btn-sm" title="Impression de reçu">Reçu</button>
                        </a>
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

    <script>
        $(document).ready(function () {
            $('#tbl-stdent').DataTable({
                searching: true,      // ✅ Barre de recherche activée
                paging: true,
                lengthChange: true,
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
                ]
            });
        });
    </script>
    </div>
</body>
</html>

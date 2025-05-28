
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
        div.custom-info {
            padding-top: 10px;
            font-weight: bold;
            color: #333;
        }
    </style>
    
</head>
<body class="bg-light">
    <div style="width:100%">
    <table id="tbl-stdent" class="table table-responsive table-bordered" cellspading="0" width="100%">
        <thead>
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
            dom: '<"top"l>t<"custom-info"i><"bottom"p><"clear">',
            searching: true,
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
                { orderable: false, targets: [5, 6] }
            ]
        });
    });
</script>

</body>
</html>

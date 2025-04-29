
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
</head>
<body>
    
    <%
        Connection con;
        PreparedStatement pst;
        
        ResultSet rs;
        ResultSet rs1;
        ResultSet rs2;
        ResultSet rs3;
        ResultSet rs4;
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost/gestiondecaisse","root","");

        
        String Miditraisambolana="SELECT DATE_FORMAT(daty, '%M %Y') as date,SUM(maribola) AS totalmiditraparMoi FROM volamiditra GROUP BY date";
        String Mivoakaisambolana="SELECT DATE_FORMAT(daty, '%M %Y') as date,SUM(maribola) AS totalmiditraparMoi FROM volamivoaka GROUP BY date";
        String Miditraisataona="SELECT YEAR(daty) AS taona,SUM(maribola) AS totalmiditraparAns FROM volamiditra GROUP BY YEAR(daty)";
        String Mivoakaisataona="SELECT YEAR(daty) AS taona,SUM(maribola) AS totalmivoakaparAns FROM volamivoaka GROUP BY YEAR(daty)";
        String detail="SELECT YEAR(daty) AS taona,antony,MONTH(daty) AS volana,SUM(maribola) AS totalmiditraparAntony FROM volamiditra GROUP BY antony";
        //Solde miditra sy mivoaka
        String mivoaka="SELECT SUM(maribola) AS total FROM volamivoaka";
        String query="SELECT SUM(maribola) AS totalmiditra FROM volamiditra";
        Statement st=con.createStatement();
    %>
        <div class="form-group">
            <span class="list"><center><h2>Liste des entrées de caisse</h2></center></span>
        </div>
        <div class="container mt-5" id="overflowTest">
        <table id="tbl-stdent" class="table table-striped table-bordered" style="width:100%">
            <thead class="table-dark">
                <tr>
                    <th>Mois et Années</th>
                    <th>Montant</th>
                </tr>
            </thead>
            <tbody>
                <%
                    try{
                        
                        rs=st.executeQuery(Miditraisambolana);
                        while (rs.next()){
                %>
                <tr>
                    <td>
                        <%=rs.getString("date") %>
                    </td>
                    <td>
                        <%=rs.getString("totalmiditraparMoi") %>
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
    
</body>
</html>

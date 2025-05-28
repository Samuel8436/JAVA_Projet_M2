<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Revenu par Mois</title>
        <link href="StylText.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="bootstrap/bootstrap.css">
       
    </head>
    <body>
        <%@include file="navBar.jsp" %>
        <%@include file="Securite_page.jsp" %>
        <%@include file="RequetteTatitra.jsp" %>
        <p><h2><b><center>Revenu Par Mois</center></b></h2></p>
        <form method="Post" action="#">
            <table id="tbl-stdent" class="table table-striped table-bordered" style="width:100%">
                <thead>
                    <tr>
                        <th>Mois et Années</th>
                        <th>Montant</th>
                        
                    </tr>
                </thead>
                <tbody id="myTable">
                    <tr>
                        <%
                            try{
                                
                                rs=st.executeQuery(Miditraisambolana);
                                while (rs.next()){
                        %>
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
        </form>
    </body>
    <script>
        // Mise en page de tableau
        $(document).ready(function () {
            $('#tbl-stdent').DataTable({
                searching: false,      // ✅ Barre de recherche activée
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
</html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Revenu par ans</title>
        <link href="StylText.css" rel="stylesheet" type="text/css"/>
        <!-- <link rel="stylesheet" href="bootstrap/bootstrap.css"> -->
        <style>
            .datatable-header {
                margin-bottom: 10px;
            }
        </style>
    </head>
    <body>
        <%@include file="navBar.jsp" %>
        <%@include file="Securite_page.jsp" %>
        <%@include file="RequetteTatitra.jsp" %>
        <p><h2><b><center>Revenu Par Ans</center></b></h2></p>
        <div class="row justify-content-center">
            <div class="col-md-8 text-center">
                <table id="tbl-stdent" class="table table-striped table-bordered mx-auto">
                    <thead>
                        <tr>
                            <th>Année</th>
                            <th>Montant</th>
                                
                        </tr>
                    </thead>
                    <tbody id="myTable">
                        <%
                            rs1=st.executeQuery(Miditraisataona);
                            while (rs1.next()){
                        %>
                        <tr>
                            <td>
                                <%=rs1.getString("taona") %>
                            </td>
                            <td>
                                <%=rs1.getString("totalmiditraparAns") %>
                            </td>
                                <%
                                    }
                                %>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </body><script>
        $(document).ready(function () {
            $('#tbl-stdent').DataTable({
                dom: '<"datatable-header"l>t<"bottom d-flex justify-content-center align-items-center gap-4"ip>',
                // dom: '<"datatable-header"l>t<"custom-info"i><"bottom"p>',
                searching: false,
                paging: true,
                lengthChange: true,
                pageLength: 5,
                ordering: true,
                autoWidth: false,
                order: [[0, 'desc']], // trier par année décroissante
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
                }
            });
        });
    </script>
</html>


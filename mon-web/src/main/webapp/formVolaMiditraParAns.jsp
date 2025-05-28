<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Revenu par ans</title>
        <link href="StylText.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="bootstrap/bootstrap.css">
    </head>
    <body>
        <%@include file="navBar.jsp" %>
        <%@include file="Securite_page.jsp" %>
        <p><h2><b><center>Revenu Par Ans</center></b></h2></p>
        <%@include file="RequetteTatitra.jsp" %>
        <table id="tbl-stdent" class="table table-striped table-bordered" style="width:100%">
            <tr>
                <th>Année</th>
                <th>Montant</th>
                    
            </tr>
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


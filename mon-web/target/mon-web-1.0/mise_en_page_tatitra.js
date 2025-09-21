
// Mise en page de tableau
$(document).ready(function () {
    $('#tbl-stdent').DataTable({
        dom: '<"datatable-header"l>t<"bottom d-flex justify-content-center align-items-center gap-4"ip>',
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
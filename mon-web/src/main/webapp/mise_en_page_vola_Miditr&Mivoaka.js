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
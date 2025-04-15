/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function controlnom(str) 
        {
            var test = str.value;
            var nb = test.length;

            if (nb >= 1) {
                var maj = test.toUpperCase();
                str.value = maj;
            } else {
                // alert("Veuillez entrer votre nom");
                document.getElementById("nom").focus();
            }
        }

        // Controle Prenom
        
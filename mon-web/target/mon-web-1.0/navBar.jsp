<%-- 
    Document   : navBar
    Created on : 21 janv. 2023, 22:47:28
    Author     : NOMENY
--%>
 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>navbar</title>
         <link rel="stylesheet" href="bootstrap/bootstrap.min.css">
        <script src="bootstrap/jquery.min.js"></script>
        <script src="bootstrap/popper.min.js"></script>
        <script src="bootstrap/bootstrap.min.js"></script>
        
        
        <link rel="stylesheet" href="bootstrap/dataTables.bootstrap.min.css">
        <!-- <script src="bootstrap/jquery-3.6.0.min.js" type="text/javascript"></script> -->
        <script src="bootstrap/jquery.dataTables.min.js"></script>
        <script src="bootstrap/dataTable.bootstrap.min.js" type="text/javascript"></script>
        <script src="bootstrap/dataTables.bootstrap.min.js"></script>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
            <a class="navbar-brand" href="menu.jsp"><img src="image/acceuil.jpg" width="20px" title="Menue prinsipal"></a>
  
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
          <a class="nav-link" href="formVolaMiditra.jsp" title="Revenu">Revenu</a>
      </li>
      <li class="nav-item">
          <a class="nav-link" href="formVolaMivoaka.jsp" title="Dépense">Dépense</a>
      </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                    Par mois
                </a>
                  <div class="dropdown-menu">
                      <a class="dropdown-item" href ="formVolaMIditraParMoi.jsp" title="Revenu">Revenu</a>
                      <a class="dropdown-item" href="formeVolaMIvoakaParMoi.jsp" title="Dépense">Dépense</a>
                </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                    Par ans
                </a>
                  <div class="dropdown-menu">
                      <a class="dropdown-item" href ="formVolaMiditraParAns.jsp" title="Revenu">Revenu</a>
                      <a class="dropdown-item" href="formVolaMivoakaParAns.jsp" title="Dépense">Dépense</a>
                </div>
      </li>
     
      <!-- <li class="nav-item">
          <a class="nav-link" href="Courbesparans.jsp" title="Statistique">Statistique</a>
      </li> -->
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                    <img src="image/Add List_24px.png" title="Plus">
                </a>
                  <div class="dropdown-menu">
                    <a class="dropdown-item" href="Autre_compte.jsp" title="Nouveaux compte">Créer un compte</a>
                    <!-- <a class="dropdown-item" href="SoldeMiditra&Mivok.jsp" title="Soldes">Soldes</a> -->
                    <!-- <a class="dropdown-item" href="apropot de developeur.jsp" title="Rapports">Autre</a> -->
                    <a class="dropdown-item" href="https://samuel8436.github.io/CURRICULUM-VITAE/" title="Ingenieur">Information de développeur</a>
                    <a class="dropdown-item" href="Sedeconnecter.jsp" title="Déconnexion">Déconnexion</a>
                </div>
      </li>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" name="" id="myInput" placeholder="Recherche..." aria-label="Search">
    </form>
  </div>
</nav>
          <br><br><br><br>
         <div>
              <table width='100%'>
                  <tr>
                      <td><center><img class="logo" src="image/logo_FLM.jpg" width="70" height="70" aligne="left"></center></td>
              <td><h1><center><div class="DIV"><b>GESTION DE CAISSE FLM</b></div></center></h1></td>
                      <td><img class="logo" src="image/logo_FLM.jpg" width="70" height="70" aligne="left"></td>
                  </tr>
              </table> 
            
          </div>
    </body>
    <script>
        $(document).ready(function(){
        $("#myInput").on("keyup", function() {
            var value = $(this).val().toLowerCase();
            $("#myTable tr").filter(function() {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
        });
        });
    </script>
</html>

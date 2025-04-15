<%-- 
    Document   : Autre_compte
    Created on : 21 févr. 2023, 18:21:55
    Author     : NOMENY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inscription</title>
        <link href="bootstrap/._bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="StylText.css" rel="stylesheet" type="text/css"/>
        <style>
            div.body {
                    background :#ccccff; 
                    width:50%;
                    height: 70%;
                    margin:30px auto;
                    border-radius:0.4em;
                    border:1px solid #191919;
                    overflow:hidden;
                    position:relative;
                    box-shadow: 0 5px 10px 5px rgba(0,0,0,0.2);
                  }
        </style>
    </head>
    <body>
        <div class="body">
            <h1><center>CREER UNE AUTRE COMPT</center></h1>
            <a href="Login.jsp">Authentification</a>
            <form method="POST" action="Autr_compte">
                <div class="col-sm-4">
                    <table  align='TOP' width='500px'>
                        <tr  height='100px'>
                            <td><label class="form-lael">Nom d'utilisateur : </label></td>
                            <td><input type="text" name="username" placeholder="Saississer la Nom d'utilisateur" id="" class="form-control" autocomplete='off' required></td>
                        </tr>
                        <tr  height='100px'>
                            <td><label class="form-lael">Mot de passe : </label></td>
                            <td><input type="password" name="password" placeholder="Saisisser la Mot de passe" class="form-control" autocomplete='off' required></td>
                        </tr>
                        <tr  height='100px'>
                            <td><label class="form-lael">Confirmation de mot de passe : </label></td>
                            <td><input type="password" name="conf_password" placeholder="Confirmer la Mot de passe" class="form-control" autocomplete='off' required></td>
                        </tr>
                        <tr  height='100px'>
                            <td colspan="2"><center><input type="submit" value="S'inscrire" id="btn"></center></td>
                            
                        </tr>
                    </table>
                    
                    <br><br><br><br>
                </div>
            </form>
            
       </div> 
    </body>
</html>

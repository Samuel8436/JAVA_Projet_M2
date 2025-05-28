package caisse;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.logging.*;

@WebServlet(name = "volaM", urlPatterns = {"/volaM"})
public class volaM extends HttpServlet 
{

    private static final Logger logger = Logger.getLogger(volaM.class.getName());

    // Méthode doPost
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        // HttpSession session = request.getSession();
        
        // Récupération des données envoyées par le formulaire
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String date = request.getParameter("date");
        String montant = request.getParameter("montant");
        String antony = request.getParameter("antony");
        
        // Déclaration des objets pour la connexion à la base de données
        Connection con = null;
        PreparedStatement pst = null;

        try {
            // Connexion à la base de données
            Class.forName("com.mysql.cj.jdbc.Driver");  // Utilisation du driver correct
            con = DriverManager.getConnection("jdbc:mysql://localhost/gestiondecaisse", "root", "");
            
            // Préparation de la requête SQL
            String query = "INSERT INTO volamiditra (anarana, fanampiny, daty, maribola, antony) VALUES (?, ?, ?, ?, ?)";
            pst = con.prepareStatement(query);
            pst.setString(1, nom);
            pst.setString(2, prenom);
            pst.setString(3, date);
            pst.setString(4, montant); // Vérifier si "montant" doit être un nombre ou chaîne
            pst.setString(5, antony);
            
            // Exécution de la requête
            int result = pst.executeUpdate();
            if (result > 0) {
                // Redirection vers le formulaire après insertion
                request.setAttribute("successMessage", "Ajout Succes !");
                RequestDispatcher rd = request.getRequestDispatcher("formVolaMiditra.jsp");
                rd.forward(request, response);
            } else {
                // response.getWriter().println("Erreur lors de l'insertion.");
                request.setAttribute("errorMessage", "Erreur d'ajout");
                RequestDispatcher rd = request.getRequestDispatcher("formVolaMiditra.jsp");
                rd.forward(request, response);
                }

        } catch (ClassNotFoundException e) {
            logger.log(Level.SEVERE, "Driver MySQL non trouvé", e);
            response.getWriter().println("Erreur de connexion à la base de données.");
        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Erreur SQL", e);
            request.setAttribute("errorMessage", "Erreur SQL lors de l'insertion.");
            RequestDispatcher rd = request.getRequestDispatcher("formVolaMiditra.jsp");
            rd.forward(request, response);
            // response.getWriter().println("Erreur SQL lors de l'insertion.");
        } finally {
            // Fermeture des ressources dans le bloc finally
            try {
                if (pst != null) pst.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                logger.log(Level.SEVERE, "Erreur lors de la fermeture de la connexion", e);
            }
        }
    }
}

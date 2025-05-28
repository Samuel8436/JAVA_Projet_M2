package caisse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.util.logging.*;

@WebServlet(name = "ModifierVolaM", urlPatterns = {"/ModifierVolaM"})
public class ModifierVilaM extends HttpServlet 
{
    private static final Logger logger = Logger.getLogger(ModifierVilaM.class.getName());

    // Méthode doPost
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getParameter("submit")!=null)
        {
            String id=request.getParameter("id");
            String daty=request.getParameter("date");
            String nom=request.getParameter("nom");
            String prenom=request.getParameter("prenom");
            String montant=request.getParameter("montant");
            String antony=request.getParameter("antony");
            
            // Connection con;
            // PreparedStatement pst;
            Connection con = null;
            PreparedStatement pst = null;
            // ResultSet rs;
            try 
            {
                // Connexion à la base de données
                Class.forName("com.mysql.cj.jdbc.Driver");  // Utilisation du driver correct
                con = DriverManager.getConnection("jdbc:mysql://localhost/gestiondecaisse", "root", "");
            
                String query="UPDATE volamiditra SET anarana = ?, fanampiny = ?, daty = ?, maribola = ?, antony = ? WHERE id=?";
                pst = con.prepareStatement(query);
                pst.setString(1, nom);
                pst.setString(2, prenom);
                pst.setString(3, daty);
                pst.setString(4,montant);
                pst.setString(5,antony);
                
                pst.setString(6, id);   
                int result = pst.executeUpdate();
                if (result > 0) {
                    request.setAttribute("successMessage", "Mise à jour succès !");
                    RequestDispatcher rd = request.getRequestDispatcher("formVolaMiditra.jsp");
                    rd.forward(request, response);
                }
                else {
                    request.setAttribute("errorMessage", "Mise à jour echouer");
                    RequestDispatcher rd = request.getRequestDispatcher("formVolaMiditra.jsp");
                    rd.forward(request, response); 
                }

            } catch (ClassNotFoundException e) {
            logger.log(Level.SEVERE, "Driver MySQL non trouvé", e);
            response.getWriter().println("Erreur de connexion à la base de données.");
        } catch (SQLException e) {
            logger.log(Level.SEVERE, "Erreur SQL", e);
            response.getWriter().println("Erreur SQL lors de l'insertion.");
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
}

package caisse;

import java.io.IOException;
import java.io.PrintWriter;

// import java.util.logging.Logger;

import java.sql.*;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet(name = "ModifierVolaMivoaka", urlPatterns = {"/ModifierVolaMivoaka"})
public class ModifierVolaMivoaka extends HttpServlet 
{
    // private static final Logger logger = Logger.getLogger(ModifierVolaMivoaka.class.getName());

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
        try 
        {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Driver MySQL moderne
            Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost/gestiondecaisse?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC",
            "root", "");
            // Récupère l'user_id depuis la session
            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("user_id") == null) {
                response.sendRedirect("Login.jsp");
                return;
            }
            int userId = (int) session.getAttribute("user_id");
            Statement st = con.createStatement();
             // conversion de montant en double
            double dmontant = Double.parseDouble(montant);

            // Calcul de la somme totale sortie
            ResultSet rs = st.executeQuery("SELECT SUM(maribola) AS total FROM volamivoaka");
            double totalSortie = 0;
            if (rs.next()) {
                totalSortie = rs.getDouble("total");
            }

            // Calcul de la somme totale entrée
            ResultSet rs1 = st.executeQuery("SELECT SUM(maribola) AS totalmiditra FROM volamiditra");
            double totalEntree = 0;
            if (rs1.next()) {
                totalEntree = rs1.getDouble("totalmiditra");
            }

            double soldeRestant = totalEntree - totalSortie;

            if (dmontant > soldeRestant || soldeRestant < 0) {
                // Message simple si le montant est supérieur au solde
                response.setContentType("text/html;charset=UTF-8");
                try (PrintWriter out = response.getWriter()) {
                    out.println("<script>alert('Impossible d’effectuer cette opération : solde insuffisant.');window.location='formVolaMivoaka.jsp';</script>");
                }
            } else 
            {
                // update dans la table volamivoaka
                PreparedStatement pst = con.prepareStatement(
                    "UPDATE volamivoaka SET anarana = ?, fanampinanarana = ?, daty = ?, maribola = ?, antony = ? WHERE id=? AND user_id = ?");
                    pst.setString(1, nom);
                    pst.setString(2, prenom);
                    pst.setString(3, daty);
                    pst.setDouble(4, dmontant);
                    // pst.setString(4,montant);
                    pst.setString(5,antony);
                    pst.setInt(6, Integer.parseInt(id)); 
                    pst.setInt(7, userId);
                    int result = pst.executeUpdate();
                    if (result > 0) {
                        request.setAttribute("successMessage", "Mise à jour succès !");
                        RequestDispatcher rd = request.getRequestDispatcher("formVolaMivoaka.jsp");
                        rd.forward(request, response);
                    }
                    else {
                        request.setAttribute("errorMessage", "Mise à jour echouer");
                        RequestDispatcher rd = request.getRequestDispatcher("formVolaMivoaka.jsp");
                        rd.forward(request, response);
                    } 
            }

        } catch (ClassNotFoundException | SQLException | NumberFormatException ex) {
            ex.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erreur serveur : " + ex.getMessage());
        }
        
    }
    else 
    {
        request.setAttribute("errorMessage", "Mise à jour echouer");
        RequestDispatcher rd = request.getRequestDispatcher("modifiervolaMiditr.jsp");
        rd.forward(request, response);
    }
    }
}

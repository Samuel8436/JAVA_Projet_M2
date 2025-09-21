package caisse;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet(name = "volaMivoaka", urlPatterns = {"/volaMivoaka"})
public class volaMivoaka extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forcer UTF-8 AVANT de lire les paramètres
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        // Récupérer l'utilisateur connecté
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("user_id") == null) {
            response.sendRedirect("Login.jsp");
            return;
        }
        int userId = (int) session.getAttribute("user_id");

        // Récupération des données
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String date = request.getParameter("date");
        String montantStr = request.getParameter("montant");
        String antony = request.getParameter("antony");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gestiondecaisse?useUnicode=true&characterEncoding=UTF-8&serverTimezone=UTC",
            "root",
            "");
             Statement st = con.createStatement()) 
        {

                // Class.forName("com.mysql.cj.jdbc.Driver"); // Driver MySQL moderne

                double dmontant = Double.parseDouble(montantStr);

                // Calcul de la somme totale sortie
                
                double totalSortie = 0;
                try 
                (PreparedStatement pst = con.prepareStatement("SELECT SUM(maribola) AS total FROM volamivoaka WHERE user_id = ?"))
                {
                  pst.setInt(1, userId);  
                  try (ResultSet rs = pst.executeQuery()){
                    if (rs.next()) {
                        totalSortie = rs.getDouble("total");
                    }
                  } catch (Exception e) {
                    // TODO: handle exception
                  }
                  
                } catch (Exception e) {
                    // TODO: handle exception
                }
                

                // Calcul de la somme totale entrée
                double totalEntree = 0;
                try 
                (PreparedStatement pst1 = con.prepareStatement("SELECT SUM(maribola) AS totalmiditra FROM volamiditra WHERE user_id = ?"))
                {
                    pst1.setInt(1, userId);
                    try (ResultSet rs1 = pst1.executeQuery()) {
                        if (rs1.next()) {
                            totalEntree = rs1.getDouble("totalmiditra");
                        }
                    }
                } 
                

                double soldeRestant = totalEntree - totalSortie;

                if (dmontant > soldeRestant || soldeRestant < 0) {
                    // Message simple si le montant est supérieur au solde
                    response.setContentType("text/html;charset=UTF-8");
                    try (PrintWriter out = response.getWriter()) {
                        out.println("<script>alert('Impossible d’effectuer cette opération : solde insuffisant.');window.location='formVolaMivoaka.jsp';</script>");
                    }
                } else {
                    // Insertion dans la table volamivoaka
                    try (PreparedStatement pst = con.prepareStatement(
                            "INSERT INTO volamivoaka (anarana, fanampinanarana, daty, antony, maribola, user_id) VALUES (?, ?, ?, ?, ?, ?)")) {
                        pst.setString(1, nom);
                        pst.setString(2, prenom);
                        pst.setString(3, date);
                        pst.setString(4, antony);
                        pst.setDouble(5, dmontant);
                        pst.setInt(6, userId);

                        pst.executeUpdate();
                        request.setAttribute("successMessage", "Ajout Succes !");
                        RequestDispatcher rd = request.getRequestDispatcher("formVolaMivoaka.jsp");
                        rd.forward(request, response);
                            // response.sendRedirect("formVolaMivoaka.jsp");
                    }
                    catch (Exception e) {
                        // TODO: handle exception
                        e.printStackTrace();
                        request.setAttribute("errorMessage", "Erreur d'ajout");
                        RequestDispatcher rd = request.getRequestDispatcher("formVolaMivoaka.jsp");
                        rd.forward(request, response);
                    }

                }

        } 
    }
        catch (ClassNotFoundException | SQLException | NumberFormatException ex) {
            ex.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erreur serveur : " + ex.getMessage());
        }
    }
}

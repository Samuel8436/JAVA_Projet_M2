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
        // Récupération des données
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String date = request.getParameter("date");
        String montantStr = request.getParameter("montant");
        String antony = request.getParameter("antony");

        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost/gestiondecaisse", "root", "");
             Statement st = con.createStatement()) {

            Class.forName("com.mysql.cj.jdbc.Driver"); // Driver MySQL moderne

            double dmontant = Double.parseDouble(montantStr);

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
            } else {
                // Insertion dans la table volamivoaka
                try (PreparedStatement pst = con.prepareStatement(
                        "INSERT INTO volamivoaka (anarana, fanampinanarana, daty, antony, maribola) VALUES (?, ?, ?, ?, ?)")) {
                    pst.setString(1, nom);
                    pst.setString(2, prenom);
                    pst.setString(3, date);
                    pst.setString(4, antony);
                    pst.setDouble(5, dmontant);

                    pst.executeUpdate();
                    request.setAttribute("successMessage", "Ajout Succes !");
                    RequestDispatcher rd = request.getRequestDispatcher("formVolaMivoaka.jsp");
                    rd.forward(request, response);
                        // response.sendRedirect("formVolaMivoaka.jsp");
                }
                catch (Exception e) {
                    // TODO: handle exception
                    request.setAttribute("errorMessage", "Erreur d'ajout");
                    RequestDispatcher rd = request.getRequestDispatcher("formVolaMivoaka.jsp");
                    rd.forward(request, response);
                }

            }

        } catch (ClassNotFoundException | SQLException | NumberFormatException ex) {
            ex.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erreur serveur : " + ex.getMessage());
        }
    }
}

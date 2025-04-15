package caisse;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.*;

@WebServlet(name = "SuprimerVolaMivoaka", urlPatterns = {"/SuprimerVolaMivoaka"})
public class SuprimerVolaMivoaka extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");

        // Connexion et suppression
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Driver moderne

            try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost/gestiondecaisse", "root", "");
                 PreparedStatement pst = con.prepareStatement("DELETE FROM volamivoaka WHERE id = ?")) {

                pst.setString(1, id);
                pst.executeUpdate();
                response.sendRedirect("formVolaMivoaka.jsp");
            }

        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace(); // Log en console
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erreur serveur : " + ex.getMessage());
        }
    }
}

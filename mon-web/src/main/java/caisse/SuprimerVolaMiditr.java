package caisse;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.*;

@WebServlet(name = "SuprimerVolaMiditr", urlPatterns = {"/SuprimerVolaMiditr"})
public class SuprimerVolaMiditr extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");

        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost/gestiondecaisse", "root", "");
             PreparedStatement pst = con.prepareStatement("DELETE FROM volamiditra WHERE id = ?")) {

            Class.forName("com.mysql.cj.jdbc.Driver");
            pst.setString(1, id);
            pst.executeUpdate();
            response.sendRedirect("formVolaMiditra.jsp");

        } catch (ClassNotFoundException | SQLException ex) {
            ex.printStackTrace();
        }
    }
}

package caisse;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
@WebServlet("/login")
public class login extends HttpServlet {

    private static final long serialVersionUID = 1L;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Rediriger vers Login.jsp en cas d'accès direct à /login
        response.sendRedirect("Login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();

        String login = request.getParameter("username");
        String password = request.getParameter("password");

        try (PrintWriter out = response.getWriter()) {
            Class.forName("com.mysql.cj.jdbc.Driver"); // ✅ Driver JDBC MySQL 8+
            try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/gestiondecaisse", "root", "");
                 PreparedStatement pst = con.prepareStatement("SELECT * FROM login WHERE username=? AND password=?")) {

                pst.setString(1, login);
                pst.setString(2, password);

                try (ResultSet rs = pst.executeQuery()) {
                    if (rs.next()) {
                        session.setAttribute("login", login);
                        response.sendRedirect("menu.jsp");
                    } else {
                        
                        request.setAttribute("errorMessage", "Nom d'utilisateur ou mot de passe incorrect !");
                        RequestDispatcher dispatcher = request.getRequestDispatcher("Login.jsp");
                        dispatcher.forward(request, response); // <-- forward évite la page blanche
                    }
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("Login.jsp"); // Redirection même en cas d'erreur
        }
    }
}

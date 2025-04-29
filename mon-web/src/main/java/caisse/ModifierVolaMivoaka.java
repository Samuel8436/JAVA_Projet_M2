package caisse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
// import java.util.logging.Logger;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
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
        
        
        Connection con;
        PreparedStatement pst;
        // ResultSet rs;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost/gestiondecaisse","root","");
            
            pst=con.prepareStatement("UPDATE volamivoaka SET anarana = ?, fanampinanarana = ?, daty = ?, maribola = ?, antony = ? WHERE id=?");
            pst.setString(1, nom);
            pst.setString(2, prenom);
            pst.setString(3, daty);
            pst.setString(4,montant);
            pst.setString(5,antony);
            pst.setString(6, id);   
            pst.executeUpdate(); 

            request.setAttribute("successMessage", "Mise à jour succès !");
            RequestDispatcher rd = request.getRequestDispatcher("formVolaMivoaka.jsp");
            rd.forward(request, response);
        } catch (Exception e) {
            // TODO: handle exception
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

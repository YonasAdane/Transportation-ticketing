import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author user
 */
@WebServlet(urlPatterns = {"/BuyTicket"})
public class BuyTicket extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter(); 
        try {
          Class.forName("com.mysql.cj.jdbc.Driver");
          Connection con;  
          con = DriverManager.getConnection("jdbc:mysql://localhost:3306/TransportTicketingSys","root","1234");
          Statement stmt=con.createStatement(); 
          ResultSet rs;
          HttpSession session=request.getSession();
//          request.setAttribute("buses", null);  

        
        
        
        
        
        
        
        
        
        
        
        }catch (ClassNotFoundException|SQLException ex) {
            out.println(ex);
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}

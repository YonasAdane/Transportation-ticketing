

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet(urlPatterns = {"/DELETEbus"})
public class DELETEbus extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String busIDParam = request.getParameter("Role");      
        int busID = Integer.parseInt(busIDParam);
//            out.println(busID);
            
            try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/TransportTicketingSys","root","1234");
            String sql = "DELETE FROM Bus WHERE BusID = ?";
            PreparedStatement stmt=con.prepareStatement(sql);
//            stmt.setInt(1, busID);
            stmt.setInt(1, Integer.parseInt(String.valueOf(busID)));
//            stmt.executeUpdate();
            int rowAffected=stmt.executeUpdate();
//            out.println(rowAffected+" are affected");
        if(rowAffected==1){
            response.sendRedirect("CreateBus.jsp");
                }
            }catch (ClassNotFoundException|SQLException ex) {
            out.println("Succes");
//            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        
        
        
        }
    
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String busIDParam = request.getParameter("Role");      
        int busID = Integer.parseInt(busIDParam);
//        HttpSession session=request.getSession();
        HttpSession session = request.getSession();
        int id = (int) session.getAttribute("id");
            try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/TransportTicketingSys","root","1234");
             String sql = "INSERT INTO Ticket (BusID, UserID) VALUES (?, ?)";

            PreparedStatement stmt=con.prepareStatement(sql);
//            stmt.setInt(1, busID);
            stmt.setInt(1, busID);
//            HttpSession session=request.getSession();
//            int UserName= (int) session.getAttribute("name");
//            int r=(int) ;;

            
             stmt.setInt(2, id);      
//            stmt.executeUpdate();
            int rowAffected=stmt.executeUpdate();
//            out.println(rowAffected+" are affected");
        if(rowAffected==1){
            response.sendRedirect("LoginStyle.jsp");
                }
            }catch (ClassNotFoundException|SQLException ex) {
            out.println(ex);
//            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        
        
        
        
        }
}



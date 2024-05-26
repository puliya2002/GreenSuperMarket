/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package customer;

import customer.DBConnect;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author pulin
 */
@WebServlet(name = "EditProfileServlet", urlPatterns = {"/EditProfileServlet"})
public class EditProfileServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
    try{
            System.out.println("Servlet doPost method is called for UPDATE PRODUCT SERVLET !");
             String cusID = request.getParameter("cusID");
             String cusAddress = request.getParameter("cusAddress");
             String cusPhone = request.getParameter("cusPhone");

            if (cusID != null && !cusID.isEmpty()) {
                int ID = Integer.parseInt(cusID);
                String Address = cusAddress;
                String Phone = cusPhone;

               
                  try (Connection connection = DBConnect.getConnection()) {
                    String sql = "UPDATE customer SET address = ? , phone = ? WHERE id = ?";
                    try (PreparedStatement statement = connection.prepareStatement(sql)) {
                        
                        statement.setString(1, Address);
                        statement.setString(2,Phone);
                        statement.setInt(3, ID);
                        
                        System.out.println("Executing SQL: " + sql);
                        

                        
                        statement.executeUpdate();
                    }
                  }
        PrintWriter out = response.getWriter();         
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Your Page Title</title>");
        out.println("</head>");
        out.println("<body>");
            out.println("<script>");
            out.println("alert('Profile updated successfully');");
            out.println("location='LogoutServlet'");
            out.println("</script>");
        out.println("</body>");
        out.println("</html>");    
              
              } else {
        PrintWriter out = response.getWriter();        
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Your Page Title</title>");
        out.println("</head>");
        out.println("<body>");    
            out.println("<script>");
            out.println("alert('error');");
            out.println("location='edit-products.jsp'");
            out.println("</script>");
        out.println("</body>");
        out.println("</html>");  
            }
}          
   catch (NumberFormatException  |SQLException e ) {
    
            e.printStackTrace();
            log("Error in UpdateProductServlet: " + e.getMessage(), e);
            request.setAttribute("javax.servlet.error.exception", e);
            response.sendRedirect("/SE02Project/update_error.jsp"); 


}
}
}
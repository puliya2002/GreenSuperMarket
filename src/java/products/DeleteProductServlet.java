/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package products;

import customer.DBConnect;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "DeleteProductServlet", urlPatterns = {"/DeleteProductServlet"})
public class DeleteProductServlet extends HttpServlet {
    
        protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    try {
            System.out.println("Servlet doPost method is called!");

            
            String productIdStr = request.getParameter("productID");

            if (productIdStr != null && !productIdStr.isEmpty()) {
                int productId = Integer.parseInt(productIdStr);

                
                try (Connection connection = DBConnect.getConnection()) {
                    String sql = "DELETE FROM product WHERE p_id = ?";
                    try (PreparedStatement statement = connection.prepareStatement(sql)) {
                        statement.setInt(1, productId);
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
            out.println("alert('Product deleted successfully');");
            out.println("location='edit-products.jsp'");
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

        } catch (NumberFormatException  |SQLException e) {
            e.printStackTrace();
            log("Error in DeleteProductServlet: " + e.getMessage(), e);
            request.setAttribute("javax.servlet.error.exception", e);
            response.sendRedirect("/SE02Project/delet_error.jsp"); 
        }
    }    
    
}
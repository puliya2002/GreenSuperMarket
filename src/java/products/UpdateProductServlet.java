/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package products;

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
@WebServlet(name = "UpdateProductServlet", urlPatterns = {"/UpdateProductServlet"})
public class UpdateProductServlet extends HttpServlet {

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
    try{
            System.out.println("Servlet doPost method is called for UPDATE PRODUCT SERVLET !");
             String productIdStr = request.getParameter("productID");
             String priceStr = request.getParameter("productPrice");
             String nameStr = request.getParameter("productName");

            if (productIdStr != null && !productIdStr.isEmpty()) {
                int productId = Integer.parseInt(productIdStr);
                double newPrice = Double.parseDouble(priceStr);
                String newName = nameStr;

               
                  try (Connection connection = DBConnect.getConnection()) {
                    String sql = "UPDATE product SET price = ? , name = ? WHERE p_id = ?";
                    try (PreparedStatement statement = connection.prepareStatement(sql)) {
                        
                        statement.setDouble(1, newPrice);
                        statement.setString(2,newName);
                        statement.setInt(3, productId);
                        
                        System.out.println("Executing SQL: " + sql);
                        System.out.println("Parameters: price=" + newPrice + ", itemid=" + productId);

                        
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
            out.println("alert('Product updated successfully');");
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
}          
   catch (NumberFormatException  |SQLException e ) {
    
            e.printStackTrace();
            log("Error in UpdateProductServlet: " + e.getMessage(), e);
            request.setAttribute("javax.servlet.error.exception", e);
            response.sendRedirect("/SE02Project/update_error.jsp"); 


}
}
}
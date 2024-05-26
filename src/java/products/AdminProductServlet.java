/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package products;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import customer.DBConnect;
import java.io.PrintWriter;
import static java.lang.System.out;

@WebServlet("/AdminProductServlet")
@MultipartConfig
public class AdminProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String productName = request.getParameter("name");
        
        double productPrice = Double.parseDouble(request.getParameter("price"));
        
        String productCategory = request.getParameter("category");
        
        String featured = request.getParameter("featured");


        Part filePart = request.getPart("image");
        
        String fileName = extractFileName(filePart);

        // Specify the directory where you want to store the uploaded files
        String uploadDir = "img/menu";
        File uploadDirFile = new File(uploadDir);
        if (!uploadDirFile.exists()) {
            uploadDirFile.mkdirs();
        }

        // Save the file to the specified directory
        String filePath = uploadDir + File.separator + fileName;
        try (InputStream fileContent = filePart.getInputStream()) {
            Files.copy(fileContent, new File(filePath).toPath(), StandardCopyOption.REPLACE_EXISTING);
        }
        
        response.setContentType("text/html;charset=UTF-8");
        // Call a method to update the database with the product information
        boolean isSuccess = addProduct(productName, productPrice, productCategory, filePath, featured);
        
        
        PrintWriter out = response.getWriter();
        
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Your Page Title</title>");
        out.println("</head>");
        out.println("<body>");
        if (isSuccess) {
            // Product added successfully, you might want to redirect to a success page or display a message
            out.println("<script>");
            out.println("alert('Product added successfully');");
            out.println("location='add-products.jsp'");
            out.println("</script>");
        } else {
            // Product addition failed, handle the error (e.g., redirect to an error page)
            out.println("<script>");
            out.println("alert('Product not added');");
            out.println("location='add-products.jsp'");
            out.println("</script>");
        }
        
        out.println("</body>");
        out.println("</html>");
    }

    private boolean addProduct(String productName, double productPrice, String productCategory, String filePath, String featured) {
        try (Connection connection = DBConnect.getConnection();
             PreparedStatement statement = connection.prepareStatement(
                     "INSERT INTO product (name, price, category, image, featured) VALUES (?, ?, ?, ?, ?)")) {

            statement.setString(1, productName);
            statement.setDouble(2, productPrice);
            statement.setString(3, productCategory);
            statement.setString(4, filePath);
            statement.setString(5, featured);

            int rowsAffected = statement.executeUpdate();

            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    private String extractFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        String[] tokens = contentDisposition.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf("=") + 2, token.length() - 1);
            }
        }
        return "";
    }
}


/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package products;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import customer.DBConnect;

@WebServlet("/ProductDisplayServlet")
public class ProductsDisplayServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Call a method to retrieve product details from the database
        List<Product> productList = getProducts();

        // Set the product list as an attribute in the request
        request.setAttribute("productList", productList);

        // Forward the request to the JSP page
        RequestDispatcher dispatcher = request.getRequestDispatcher("products.jsp");
        dispatcher.forward(request, response);
    }

    private List<Product> getProducts() {
        List<Product> productList = new ArrayList<>();

        try (Connection connection = DBConnect.getConnection();
             PreparedStatement statement = connection.prepareStatement("SELECT * FROM product");
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                int p_Id = resultSet.getInt("p_id");
                String productName = resultSet.getString("name");
                double productPrice = resultSet.getDouble("price");
                String productCategory = resultSet.getString("category");
                String imagePath = resultSet.getString("image");
                String Featured = resultSet.getString("featured");

                Product product = new Product(p_Id, productName, productPrice, productCategory, imagePath, Featured);
                productList.add(product);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return productList;
    }
}

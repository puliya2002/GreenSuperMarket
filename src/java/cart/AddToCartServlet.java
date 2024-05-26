package cart;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author pulin
 */
@WebServlet("/addToCart")
public class AddToCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve product details from the request
        int p_Id = Integer.parseInt(request.getParameter("productID"));
        String productName = request.getParameter("productName");
        double productPrice = Double.parseDouble(request.getParameter("productPrice"));
        String imagePath = request.getParameter("imagePath");

        // Create or retrieve the shopping cart from the session
        List<CartItem> cart = ShoppingCartUtil.getCartFromSession(request.getSession());

        // Add the new item to the cart
        CartItem newItem = new CartItem(p_Id, productName, productPrice,imagePath, 1); // Assuming initial quantity is 1
        cart.add(newItem);

        // Update the cart in the session
        ShoppingCartUtil.updateCartInSession(request.getSession(), cart);
        
        


       String referringPage = request.getHeader("Referer");

        // Redirect back to the referring page or any other desired page
        response.sendRedirect(referringPage);
    }
}
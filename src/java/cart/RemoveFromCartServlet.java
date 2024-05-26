/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package cart;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author pulin
 */
@WebServlet("/removeFromCart")
public class RemoveFromCartServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve parameters from the request
        String productName = request.getParameter("productName");

        // Log the received product name for debugging
        System.out.println("Received request to remove: " + productName);

        // Remove the item from the cart in the session
        HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        // Iterate over the cart to find and remove the item
        Iterator<CartItem> iterator = cart.iterator();
        while (iterator.hasNext()) {
            CartItem cartItem = iterator.next();
            if (cartItem.getProductName().equals(productName)) {
                iterator.remove();

                // Log the removal for debugging
                System.out.println("Removed item: " + productName);

                break;
            }
        }

        // Redirect back to the cart page
        response.sendRedirect(request.getContextPath() + "/cart.jsp");
    }
}
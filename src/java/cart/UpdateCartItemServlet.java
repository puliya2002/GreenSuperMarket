/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package cart;

import java.io.IOException;
import java.io.PrintWriter;
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
// Import statements

@WebServlet("/updateCartItem")
public class UpdateCartItemServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve parameters from the form
        String productName = request.getParameter("productName");
        int newQuantity = Integer.parseInt(request.getParameter("quantity"));

        // Update the cart item in the session
        HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        for (CartItem cartItem : cart) {
            if (cartItem.getProductName().equals(productName)) {
                cartItem.setQuantity(newQuantity);
                cartItem.setTotal(cartItem.getPrice() * newQuantity);
                break;
            }
        }

        // Redirect back to the cart page
        response.sendRedirect(request.getContextPath() + "/cart.jsp");
    }
}

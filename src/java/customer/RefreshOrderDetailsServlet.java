/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package customer;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
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
@WebServlet("/RefreshOrderDetailsServlet")
public class RefreshOrderDetailsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Call the common method to handle both GET and POST requests
        handleRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get the logged-in user from the session
        HttpSession session = request.getSession();

        // Fetch updated order details
        
         Customer loggedInUser = (Customer) session.getAttribute("loggedInUser");
            // Fetch updated order details
            List<OrderDetails> orderDetails = CustomerDBUtil.getOrderDetails(loggedInUser.getId());
            // Update the session with the new order details
            session.setAttribute("orderDetails", orderDetails);
        
        

        // Return a response (can be empty if you don't need to send any data back)
        String refPage = request.getHeader("Referer");
        if (refPage != null && !refPage.isEmpty()) {
            
            
            
            response.sendRedirect(refPage);
        } else {
            // If refPage is not available, redirect to a default page (e.g., user-account.jsp)

            RequestDispatcher dis = request.getRequestDispatcher("user-account.jsp");
            dis.forward(request, response);
        }
    }

    private void handleRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}

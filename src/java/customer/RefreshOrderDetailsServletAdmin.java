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
@WebServlet("/RefreshOrderDetailsServletAdmin")
public class RefreshOrderDetailsServletAdmin extends HttpServlet {

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

        List<OrderDetails> orderDetails = CustomerDBUtil.getOrderDetailsAdmin();
        session.setAttribute("orderDetails", orderDetails);
        // Return a response (can be empty if you don't need to send any data back)
        RequestDispatcher dis = request.getRequestDispatcher("admin.jsp");
        dis.forward(request, response);

    }

    private void handleRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
}

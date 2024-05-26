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

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        PrintWriter out = response.getWriter();
        response.setContentType("text/html");

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        boolean isTrue;

        isTrue = CustomerDBUtil.validate(email, password);

        if (isTrue) {
            List<Customer> cusDetails = CustomerDBUtil.getCustomer(email, password);
            
            
            
            Customer loggedInUser = cusDetails.get(0);

            HttpSession session = request.getSession();
            session.setAttribute("userLoggedIn", true); // Set the userLoggedIn attribute in the session
            session.setAttribute("loggedInUser", loggedInUser); // Optionally store the logged-in user in the session
            session.setAttribute("cusDetails", cusDetails); // Set customer details
            
            

            // Set user role (adjust this based on your actual user and role structure)
            if ("admin".equals(loggedInUser.getUser())) {
                session.setAttribute("userRole", UserRole.ADMIN);
            } else {
                session.setAttribute("userRole", UserRole.USER);
            }

            


            if (loggedInUser.getUser() != null && loggedInUser.getUser().equals("admin")) {
                
                List<OrderDetails> orderDetails = CustomerDBUtil.getOrderDetailsAdmin();
                session.setAttribute("orderDetails", orderDetails);

                request.setAttribute("cusDetails", cusDetails);
                RequestDispatcher dis = request.getRequestDispatcher("admin.jsp");
                dis.forward(request, response);
            } else {
                
                List<OrderDetails> orderDetails = CustomerDBUtil.getOrderDetails(loggedInUser.getId());
                session.setAttribute("orderDetails", orderDetails);

                String refPage = request.getHeader("Referer");

                if (refPage != null && !refPage.isEmpty()) {
                    response.sendRedirect(refPage);
                } else {
                    // If refPage is not available, redirect to a default page (e.g., user-account.jsp)
                    request.setAttribute("cusDetails", cusDetails);
                    RequestDispatcher dis = request.getRequestDispatcher("user-account.jsp");
                    dis.forward(request, response);
                }

            }
        } else {
            out.println("<script type = 'text/javascript'>");
            out.println("alert('your email or password is incorrect')");
            out.println("location='login.jsp'");
            out.println("</script>");

        }

    }

}

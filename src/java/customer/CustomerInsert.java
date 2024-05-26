
package customer;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author pulin
 */

    
@WebServlet("/CustomerInsert")
public class CustomerInsert extends HttpServlet {
    private static final long serialVersionUID = 1L;
    


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        String first_name = request.getParameter("first_name");
        String last_name = request.getParameter("last_name");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String mail = request.getParameter("mail");
        String password = request.getParameter("password");
        String user = request.getParameter("user");
        
        boolean isTrue;
        
        isTrue = CustomerDBUtil.insercustomer(first_name,last_name, address, phone, mail, password,user);
        
        
        String registrationForm = request.getParameter("registrationForm");
        if (isTrue){
            if ("checkout".equals(registrationForm)) {
        response.sendRedirect("checkout-login.jsp");
    } else if ("standard".equals(registrationForm)) {
        response.sendRedirect("login.jsp");
    } else {
        // Handle other cases or set a default redirection
        response.sendRedirect("login.jsp");
    }
        }else{
            RequestDispatcher dis2 = request.getRequestDispatcher("home.jsp");
            dis2.forward(request,response);
        }
    }

  

}

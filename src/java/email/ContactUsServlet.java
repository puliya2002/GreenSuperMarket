/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package email;

import java.io.IOException;
import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ContactUsServlet")
public class ContactUsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        String host = "SMTP.titan.email"; 
        String port = "587"; 
        String username = "greensuper@provisionsgraphic.com";
        String password = "Green@123"; 

        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", port);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.ssl.protocols", "TLSv1.2"); 

        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            Message mimeMessage = new MimeMessage(session);
            mimeMessage.setFrom(new InternetAddress(username));
            mimeMessage.setRecipients(Message.RecipientType.TO, InternetAddress.parse("vidmalpulindu@gmail.com"));
            mimeMessage.setSubject("New Contact Form Submission");

            String emailContent = "First Name: " + firstName + "\n";
            emailContent += "Last Name: " + lastName + "\n";
            emailContent += "Email: " + email + "\n\n";
            emailContent += "Message:\n" + message;

            mimeMessage.setText(emailContent);

            Transport.send(mimeMessage);

            response.sendRedirect("emailsent.jsp");
        } catch (MessagingException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while processing the form. Please try again.");
RequestDispatcher dispatcher = request.getRequestDispatcher("error.jsp");
dispatcher.forward(request, response);
        }
    }
}




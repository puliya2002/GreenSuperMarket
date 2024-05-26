/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package order;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            // Retrieve order details from the request parameters
            int customerId = Integer.parseInt(request.getParameter("customerId"));
            String payment = request.getParameter("payment");
            String paymentStatus = request.getParameter("paymentStatus");
            String customerEmail = request.getParameter("customerEmail");

            // Retrieve the count of products
            int productCount = Integer.parseInt(request.getParameter("productCount"));

            StringBuilder emailContent = new StringBuilder();
            emailContent.append("Thank you for your order!\n\n");
            emailContent.append("Customer ID: ").append(customerId).append("\n");
            emailContent.append("Customer Email: ").append(customerEmail).append("\n");
            emailContent.append("\n\n");

            for (int i = 0; i < productCount; i++) {
                // Construct parameter names for each product
                String productIdParam = "productID_" + i;
                String quantityParam = "quantity_" + i;
                String totalParam = "total_" + i;
                String orderDateTimeParam = "orderDateTime_" + i;
                String productNameParam = "productName_" + i;

                // Retrieve product details for each iteration
                int productId = Integer.parseInt(request.getParameter(productIdParam));
                int quantity = Integer.parseInt(request.getParameter(quantityParam));
                double total = Double.parseDouble(request.getParameter(totalParam));
                String orderDateTime = request.getParameter(orderDateTimeParam);
                String productName = request.getParameter(productNameParam);

                // Append product details to the email content
                emailContent.append("Product ID: ").append(productId).append("\n");
                emailContent.append("Product Name: ").append(productName).append("\n");

                emailContent.append("Quantity: ").append(quantity).append("\n");
                emailContent.append("Total: Rs ").append(total).append("\n");
                emailContent.append("Order Date: ").append(orderDateTime).append("\n\n");

                // Insert order into the database for each product
                if (!OrderDBUtil.insertOrder(customerId, productId, quantity, total, orderDateTime, paymentStatus)) {
                    out.println("<h2>Error placing order for Product ID: " + productId + ". Please try again.</h2>");
                    return; // Stop processing if an error occurs
                }

            }

            emailContent.append("Payment Status: ").append(paymentStatus).append("\n\n");
            emailContent.append("We appreciate your business.");

            
                sendConfirmationEmail(customerId,  emailContent.toString(), customerEmail);


            out.println("<script>");
            out.println("    window.location.href = 'ordersuccess.jsp';");
            out.println("</script>");
        }
    }

    private void sendConfirmationEmail(int customerId, String emailContent, String customerEmail) {
        // Your email sending code remains the same, I'm copying it here for reference
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
        
        
         String[] recipients = {"vidmalpulindu@gmail.com", customerEmail};

        try {

            Message message = new MimeMessage(session);

            message.setFrom(new InternetAddress(username));

            InternetAddress[] recipientAddresses = new InternetAddress[recipients.length];
    for (int i = 0; i < recipients.length; i++) {
        recipientAddresses[i] = new InternetAddress(recipients[i]);
    }
    message.setRecipients(Message.RecipientType.TO, recipientAddresses);
            
            message.setSubject("Order Confirmation");

            message.setText(emailContent);

            Transport.send(message);

            System.out.println("Confirmation email sent successfully!");

        } catch (MessagingException e) {
            e.printStackTrace();
            System.out.println("Error sending confirmation email: " + e.getMessage());
        }
    }
}

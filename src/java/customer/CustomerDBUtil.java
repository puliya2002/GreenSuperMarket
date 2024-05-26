package customer;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author pulin
 */

//validation
public class CustomerDBUtil {
    private static boolean isSucces;
    private static Connection con= null;
    private static Statement stmt = null;
    private static ResultSet rs = null;
    
    
    public static boolean validate(String email, String password){
        
        
        
        //database connection
        //String databaseUrl = "jdbc:mysql://localhost:3306/green";
        //String user = "root";
        //String pass = "user";
        
        
        try{

            con = DBConnect.getConnection();
            stmt = con.createStatement();
            
            String sql = "select * from customer where email ='"+email+"' and password='"+password+"' ";
            rs = stmt.executeQuery(sql);
            
            if(rs.next()){
                isSucces = true;   
            }else{
                isSucces = false;
            }
            
        }
        catch(Exception e){
            e.printStackTrace();
            
        }
        
        
     
        
        return isSucces;
    }
    
    

    
    
    
//get data    
    public static List<Customer> getCustomer(String email, String password){
        ArrayList<Customer> cus = new ArrayList<>();
        
        
        try{
            con = DBConnect.getConnection();
            stmt = con.createStatement();
            
            String sql = "select * from customer where email ='"+email+"'  ";

            rs = stmt.executeQuery(sql);
            
            if(rs.next()){
               int id = rs.getInt(1);
               String first_name = rs.getString(2);
               String last_name = rs.getString(3);
               String address = rs.getString(4);
               String phone = rs.getString(5);
               String emailU = rs.getString(6);
               String passwordU = rs.getString(7);
               String user = rs.getString(8);
               
               Customer c = new Customer(id,first_name,last_name,address,phone,emailU, passwordU,user);
               cus.add(c);
            }
            
        }
        catch(Exception e){
            e.printStackTrace();
            
        }
        
        return cus;
    }
    
    
    
    
    
    //registration
    
    public static boolean insercustomer(String first_name, String last_name, String address, String phone, String mail, String password, String user){
        boolean isSuccess = false;    
        
        
        //database connection
        //String databaseUrl = "jdbc:mysql://localhost:3306/green";
        //String user = "root";
        //String pass = "user";
        
        try{
            
            //Class.forName("com.mysql.jdbc.Driver");
            //Connection con = DriverManager.getConnection(databaseUrl,user,pass);
            //Statement stmt = con.createStatement();
            con = DBConnect.getConnection();
            stmt = con.createStatement();
            
            String sql = "insert into customer values(0,'"+first_name+"','"+last_name+"','"+address+"','"+phone+"','"+mail+"','"+password+"','"+user+"')";
            int rs = stmt.executeUpdate(sql);
            
            if(rs>0){
                isSuccess = true;
            }
            else{
                isSuccess = false;
            }
        }
        catch (Exception e){
            e.printStackTrace();
        }
        
        return isSuccess;
    }

    
    
    
    
     
   public static List<Customer> getCustomerById(int customerId) {
    ArrayList<Customer> cus = new ArrayList<>();

    try {
        con = DBConnect.getConnection();
        stmt = con.createStatement();

        String sql = "select * from customer where id =" + customerId;
        rs = stmt.executeQuery(sql);

        if (rs.next()) {
            int id = rs.getInt(1);
            String first_name = rs.getString(2);
            String last_name = rs.getString(3);
            String address = rs.getString(4);
            String phone = rs.getString(5);
            String emailU = rs.getString(6);
            String passwordU = rs.getString(7);
            String user = rs.getString(8);

            Customer c = new Customer(id, first_name, last_name, address, phone, emailU, passwordU, user);
            cus.add(c);
        }
        
        
        
        
        
        

    } catch (Exception e) {
        e.printStackTrace();
    }

    return cus;
}
   
    


    public static List<OrderDetails> getOrderDetails(int customerId) {
        ArrayList<OrderDetails> orderDetails = new ArrayList<>();

        try {
            con = DBConnect.getConnection();
            stmt = con.createStatement();

            String orderSql = "SELECT customer.id, product.p_id, orders.order_id, product.name, product.image, product.price, product.category, orders.qnt, orders.total, orders.payment, customer.first_name, customer.last_name, customer.email, customer.address, customer.phone, orders.date  FROM customer JOIN orders ON customer.id = orders.id JOIN product ON orders.p_id = product.p_id WHERE customer.id = ? ORDER BY orders.order_id DESC;";
            PreparedStatement orderStmt = con.prepareStatement(orderSql);
            orderStmt.setInt(1, customerId);
            ResultSet orderRs = orderStmt.executeQuery();

            while (orderRs.next()) {
                int productId = orderRs.getInt("p_id");
                int orderId = orderRs.getInt("order_id");
                String productName = orderRs.getString("name");
                String productImage = orderRs.getString("image");
                Double productPrice = orderRs.getDouble("price");
                String productCategory = orderRs.getString("category");
                int orderQnt = orderRs.getInt("qnt");
                Double orderTotal = orderRs.getDouble("total");
                String orderPayment = orderRs.getString("payment");
                String customerFname = orderRs.getString("first_name");
                String customerLname = orderRs.getString("last_name");
                String customerEmail = orderRs.getString("email");
                String customerAddress = orderRs.getString("address");
                String customerPhone = orderRs.getString("phone");
                String orderDate = orderRs.getString("date");
                
                
                
                
                

                OrderDetails orderDetail = new OrderDetails(customerId, productId, orderId, productName, productImage, productPrice, productCategory, orderQnt, orderTotal, orderPayment, customerFname, customerLname, customerEmail, customerAddress, customerPhone, orderDate);
                orderDetails.add(orderDetail);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close ResultSet and PreparedStatement in a finally block
            // ...
        }

        return orderDetails;
    }

    // ... (existing code)
        public static List<OrderDetails> getOrderDetailsAdmin() {
        ArrayList<OrderDetails> orderDetails = new ArrayList<>();

        try {
            con = DBConnect.getConnection();
            stmt = con.createStatement();

            String orderSql = "SELECT customer.id, product.p_id, orders.order_id, product.name, product.image, product.price, product.category, orders.qnt, orders.total, orders.payment, customer.first_name, customer.last_name, customer.email, customer.address, customer.phone, orders.date  FROM customer JOIN orders ON customer.id = orders.id JOIN product ON orders.p_id = product.p_id ORDER BY orders.order_id DESC;";
            PreparedStatement orderStmt = con.prepareStatement(orderSql);
   
            ResultSet orderRs = orderStmt.executeQuery();

            while (orderRs.next()) {
                int customerId = orderRs.getInt("id");
                int productId = orderRs.getInt("p_id");
                int orderId = orderRs.getInt("order_id");
                String productName = orderRs.getString("name");
                String productImage = orderRs.getString("image");
                Double productPrice = orderRs.getDouble("price");
                String productCategory = orderRs.getString("category");
                int orderQnt = orderRs.getInt("qnt");
                Double orderTotal = orderRs.getDouble("total");
                String orderPayment = orderRs.getString("payment");
                String customerFname = orderRs.getString("first_name");
                String customerLname = orderRs.getString("last_name");
                String customerEmail = orderRs.getString("email");
                String customerAddress = orderRs.getString("address");
                String customerPhone = orderRs.getString("phone");
                String orderDate = orderRs.getString("date");

                OrderDetails orderDetail = new OrderDetails(customerId, productId, orderId, productName, productImage, productPrice, productCategory, orderQnt, orderTotal, orderPayment, customerFname, customerLname, customerEmail, customerAddress, customerPhone, orderDate);
                orderDetails.add(orderDetail);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close ResultSet and PreparedStatement in a finally block
            // ...
        }

        return orderDetails;
    }

   
   
   
   
   
    
public class CustomerManager {

    public static Customer getCustomerDetails(int customerId) throws Exception {
        // Replace this logic with your actual implementation to get customer details from the database
        // You can use the CustomerDBUtil.getCustomer method or any other appropriate method
        List<Customer> customers = CustomerDBUtil.getCustomerById(customerId);

        if (!customers.isEmpty()) {
            return customers.get(0); // Assuming the list contains only one customer for the given ID
        } else {
            throw new Exception("Customer not found with ID: " + customerId);
        }
    }
}





    
    
}

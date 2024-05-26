/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
// OrderDetails.java
package customer;

// OrderDetails class to represent data from the new SQL query
public class OrderDetails {
    private int customerId;
    private int productId;
    private int orderId;
    private String productName;
    private String productImage;
    private Double productPrice;
    private String productCategory;
    private int orderQnt;
    private Double orderTotal;
    private String orderPayment;
    private String customerFname;
    private String customerLname;
    private String customerEmail;
    private String customerAddress;
    private String customerPhone;
    private String orderDate;

    // Constructor, getters, and setters

    // Constructor
    public OrderDetails(int customerId, int productId, int orderId, String productName, String productImage, Double productPrice, String productCategory, int orderQnt, Double orderTotal,String orderPayment, String customerFname, String customerLname, String customerEmail, String customerAddress, String customerPhone, String orderDate) {
this.customerId = customerId;
        this.productId = productId;
        this.orderId = orderId;
        this.productName = productName;
        this.productImage = productImage;
        this.productPrice = productPrice;
        this.productCategory = productCategory;
        this.orderQnt = orderQnt;
        this.orderTotal = orderTotal;
        this.orderPayment = orderPayment;
        this.customerFname = customerFname;
        this.customerLname = customerLname;
        this.customerEmail = customerEmail;
        this.customerAddress = customerAddress;
        this.customerPhone = customerPhone;
        this.orderDate = orderDate;
    }

        // Getters and setters
    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }
    
    // Getters and setters for the additional fields
    
    
    

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductImage() {
        return productImage;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }

    public Double getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(Double productPrice) {
        this.productPrice = productPrice;
    }

    public String getProductCategory() {
        return productCategory;
    }

    public void setProductCategory(String productCategory) {
        this.productCategory = productCategory;
    }

    public int getOrderQnt() {
        return orderQnt;
    }

    public void setOrderQnt(int orderQnt) {
        this.orderQnt = orderQnt;
    }

    public Double getOrderTotal() {
        return orderTotal;
    }

    public void setOrderTotal(Double orderTotal) {
        this.orderTotal = orderTotal;
    }

    public String getOrderPayment() {
        return orderPayment;
    }

    public void setOrderPayment(String orderPayment) {
        this.orderPayment = orderPayment;
    }

    public String getCustomerFname() {
        return customerFname;
    }

    public void setCustomerFname(String customerFname) {
        this.customerFname = customerFname;
    }

    public String getCustomerLname() {
        return customerLname;
    }

    public void setCustomerLname(String customerLname) {
        this.customerLname = customerLname;
    }

    public String getCustomerEmail() {
        return customerEmail;
    }

    public void setCustomerEmail(String customerEmail) {
        this.customerEmail = customerEmail;
    }

    public String getCustomerAddress() {
        return customerAddress;
    }

    public void setCustomerAddress(String customerAddress) {
        this.customerAddress = customerAddress;
    }

    public String getCustomerPhone() {
        return customerPhone;
    }

    public void setCustomerPhone(String customerPhone) {
        this.customerPhone = customerPhone;
    }
    
    public String getOrderDate(){
        return orderDate;
    }
    
    public void setOrderDate(String orderDate){
        this.orderDate = orderDate;
    }
}

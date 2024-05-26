/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package order;


public class Order {
    private String customerId;
    private String[] productIds;
    private String[] quantities;
    private String[] prices;
    private String orderDateTime;
    private String paymentMethod;

    // Constructors, getters, and setters

    public Order() {
    }

    public Order(String customerId, String[] productIds, String[] quantities, String[] prices, String orderDateTime,
            String paymentMethod) {
        this.customerId = customerId;
        this.productIds = productIds;
        this.quantities = quantities;
        this.prices = prices;
        this.orderDateTime = orderDateTime;
        this.paymentMethod = paymentMethod;
    }

    // Getters and setters

    public String getCustomerId() {
        return customerId;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId;
    }

    public String[] getProductIds() {
        return productIds;
    }

    public void setProductIds(String[] productIds) {
        this.productIds = productIds;
    }

    public String[] getQuantities() {
        return quantities;
    }

    public void setQuantities(String[] quantities) {
        this.quantities = quantities;
    }

    public String[] getPrices() {
        return prices;
    }

    public void setPrices(String[] prices) {
        this.prices = prices;
    }

    public String getOrderDateTime() {
        return orderDateTime;
    }

    public void setOrderDateTime(String orderDateTime) {
        this.orderDateTime = orderDateTime;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }
}


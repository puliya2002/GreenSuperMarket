/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cart;

public class CartItem {
    private int p_id;
    private String productName;
    private double price;
    private double total;
    private String imagePath;
    private int quantity;
    private String productId;



    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }
    


    // Calculate total based on quantity and price
    public void updateTotal() {
        this.total = this.quantity * this.price;
    }
    
    
    
    public CartItem(int p_id, String productName, double price, String imagePath, int quantity) {
        this.p_id = p_id;
        this.productName = productName;
        this.price = price;
        this.imagePath =imagePath;
        this.quantity = quantity;
    }
    
    public int getP_id(){
        return p_id;
    }
    
    public void setP_id(int P_id){
        this.p_id = p_id;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
    
    
    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }
    
    
    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }
    

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    


    // Other methods, if needed


}


/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package products;

public class Product {
    private int p_id;
    private String name;
    private double price;
    private String category;
    private String imagePath;
    private String featured;

    public Product(int p_id, String name, double price, String category, String imagePath, String featured) {
        this.p_id = p_id;
        this.name = name;
        this.price = price;
        this.category = category;
        this.imagePath = imagePath;
        this.featured = featured;
    }
    
    public int getP_id(){
        return p_id;
    }

    public String getName() {
        return name;
    }

    public double getPrice() {
        return price;
    }

    public String getCategory() {
        return category;
    }

    public String getImagePath() {
        return imagePath;
    }
    
    public String getFeatured(){
        return featured;
    }
}

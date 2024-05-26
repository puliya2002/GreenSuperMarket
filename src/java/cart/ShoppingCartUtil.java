/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cart;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

public class ShoppingCartUtil {
    private static final String CART_SESSION_ATTRIBUTE = "cart";

public static void storeCartInSession(HttpSession session, List<CartItem> cart) {
        session.setAttribute(CART_SESSION_ATTRIBUTE, cart);
    }

    public static List<CartItem> getCartFromSession(HttpSession session) {
        List<CartItem> cart = (List<CartItem>) session.getAttribute(CART_SESSION_ATTRIBUTE);

        if (cart == null) {
            cart = new ArrayList<>();
            updateCartInSession(session, cart);
        }

        return cart;
    }
    
    

    public static void updateCartInSession(HttpSession session, List<CartItem> cart) {
        session.setAttribute(CART_SESSION_ATTRIBUTE, cart);
    }

    public static double calculateSubtotal(List<CartItem> cart) {
        double subtotal = 0;

        for (CartItem item : cart) {
            subtotal += item.getPrice() * item.getQuantity();
        }

        return subtotal;
    }

    public static double calculateTotal(List<CartItem> cart) {
        // Assuming a flat shipping fee of $20.00
        return calculateSubtotal(cart) ;
    }

    
    
        private static final String ADDED_PRODUCT_SESSION_ATTRIBUTE = "addedProduct";

    public static void storeProductDetailsInSession(HttpSession session, CartItem item) {
        session.setAttribute(ADDED_PRODUCT_SESSION_ATTRIBUTE, item);
    }

    public static CartItem getAddedProductFromSession(HttpSession session) {
        return (CartItem) session.getAttribute(ADDED_PRODUCT_SESSION_ATTRIBUTE);
    }

}


/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package customer;

/**
 *
 * @author pulin
 */
public class UserRole {

    public static final String ADMIN = "admin";
    public static final String USER = "user";

    // You can add other roles if needed

    // Optionally, you can add a method to check if a given role is valid
    public static boolean isValidRole(String role) {
        return ADMIN.equals(role) || USER.equals(role);
    }
}

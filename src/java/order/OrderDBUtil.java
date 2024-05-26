/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package order;

import customer.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class OrderDBUtil {
    public static boolean insertOrder(int customerId, int productId, int quantity, double total, String orderDateTime, String payment) {
    try (Connection connection = DBConnect.getConnection();
         PreparedStatement preparedStatement = connection.prepareStatement(
                 "INSERT INTO orders (id, p_id, qnt, total, date, payment) VALUES (?, ?, ?, ?, ?, ?)"
         )) {
        preparedStatement.setInt(1, customerId);
        preparedStatement.setInt(2, productId);
        preparedStatement.setInt(3, quantity);
        preparedStatement.setDouble(4, total);
        preparedStatement.setString(5, orderDateTime);
        preparedStatement.setString(6, payment);

        int rowsAffected = preparedStatement.executeUpdate();
        return rowsAffected > 0;
} catch (SQLException e) {
    e.printStackTrace();
    System.out.println("SQL Exception Code: " + e.getErrorCode());
    System.out.println("SQL Exception Message: " + e.getMessage());
    return false;
}
}}

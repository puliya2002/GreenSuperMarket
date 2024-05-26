/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package customer;


import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;


/**
 *
 * @author pulin
 */
public class DBConnect {
    
    private static String databaseUrl = "jdbc:mysql://localhost:3306/green";
    private static String user = "root";
    private static String pass = "user";
    private static Connection con;
    
    public static Connection getConnection(){
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            
            con = DriverManager.getConnection(databaseUrl, user, pass);

        }
        catch(Exception e){
            System.out.println("Database connection is not success");
        }
        
        return con;
    }

    static void closeResources(Connection con, Statement stmt, ResultSet rs) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}

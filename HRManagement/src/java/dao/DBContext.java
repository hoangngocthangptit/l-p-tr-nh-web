/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

/**
 *
 * @author nghie
 */

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBContext {
    protected Connection connection;
    public DBContext()
    {
        try {           
            String url = "jdbc:mysql://localhost:3306/qlns_db";
            String username = "root";
            String password = "admin";  
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = (Connection) DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        }
    }
    
    public void close(){
        try {
            connection.close();
        } catch (SQLException e) {
        }
    }
    
    public static void main(String[] args) {
        try {
            System.out.println(new DBContext().connection);
            System.out.println("ket noi thanh cong");
        } catch (Exception e) {
            System.out.println("ket noi that bai");
        }
    }
}

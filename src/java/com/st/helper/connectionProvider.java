/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.st.helper;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Sagar Thorave
 */
public class connectionProvider {
  
    private static Connection con;
    public static Connection getConnection() {
        
        try {
            if (con==null) {
            //load driver classs
            Class.forName("com.mysql.cj.jdbc.Driver");
            //create Connection
            
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/myblog","root","");    
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        return con;
    }
}

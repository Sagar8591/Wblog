/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.a.st.dao;


import com.st.entities.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Sagar Thorave
 */
public class Usdaoa {

    private Connection con;

    public Usdaoa(Connection con) {
        this.con = con;
    }

    public boolean adduser(User us) {
        boolean f = false;

        String fname=us.getFirst_name();
        String lname=us.getLast_name();
        String email=us.getEmail();
        String pass=us.getPassword();
        String gen=us.getGender();
        String aboutus=us.getAbout();
        //String Password=us.getPassword();
        
        try {
            String qu = ("insert into userdata(fname,lname,email,password,gender,about) values(?,?,?,?,?,?)");
            PreparedStatement ps = con.prepareStatement(qu);
            ps.setString(1, fname);
            ps.setString(2, lname);
            ps.setString(3,email);
            ps.setString(4,pass);
            ps.setString(5,gen);
            ps.setString(6,aboutus);
            int i = ps.executeUpdate();
            System.out.println(i);
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
    
  public User getUserByEmailandPassword( String email, String password){
      
      User us= null;     
      try {
          String queryget="select * from userdata where email=? and password=?";
          PreparedStatement pstm=con.prepareStatement(queryget);
          pstm.setString(1,email);
          pstm.setString(2, password);
          
         ResultSet set= pstm.executeQuery();
         if(set.next()){
         us=new User();
         //data from database
         String firstname=set.getString("fname");
         //set data into user 
         us.setFirst_name(firstname);
         us.setId(set.getInt("id")); 
         us.setLast_name(set.getString("lname"));
         us.setEmail(set.getString("email"));
         us.setPassword(set.getString("password"));
         us.setGender(set.getString("gender"));
         us.setAbout(set.getString("about"));
         us.setTimestamp(set.getTimestamp("regdate"));
         us.setProfile(set.getString("profile"));
         
         
        
         }
         
      } catch (Exception e) {
          e.printStackTrace();
      }
      
      return us; 
  }



  public boolean updateUser( User user){
      boolean f=false;
      try {
          String queuryUpdate =("update userdata set fname=?, lname=?, password=?, about=?, profile=? where id=?");
          PreparedStatement pstm=con.prepareStatement(queuryUpdate);
          pstm.setString(1, user.getFirst_name());
          pstm.setString(2, user.getLast_name());
          pstm.setString(3, user.getPassword());
          pstm.setString(4, user.getAbout());
          pstm.setString(5, user.getProfile());
          pstm.setInt(6, user.getId());
          pstm.execute();
          f=true;
      } catch (Exception e) {
          e.printStackTrace();
      }
  
      return f;
  }

    
}







//    public userDetails loginUser(userDetails us){
//       
//      userDetails user=null;
//        try {
//             String query=("select *from user where email=? and pass=?");
//               PreparedStatement ps=con.prepareStatement(query);
//               ps.setString(1, us.getEmail());
//               ps.setString(2, us.getPassword());
//               ResultSet res=ps.executeQuery();
//               
//               
//               if(res.next()){
//                   user=new userDetails();
//                   user.setName(res.getString("fname"));
//                   user.setEmail(res.getString("email"));
//               }
//               
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//       
//    
//        
//        
//        
//    return user;
//    
//    
//    }
//
//}
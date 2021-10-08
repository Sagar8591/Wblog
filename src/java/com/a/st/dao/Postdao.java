/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.a.st.dao;

import com.mysql.cj.protocol.Resultset;
import com.st.entities.Category;
import com.st.entities.Post;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Sagar Thorave
 */
public class Postdao {

    private Connection con=null;
    public Postdao(Connection con) {
    this.con=con;
    }
    
    public ArrayList<Category>getCategories(){
        ArrayList<Category> list=new ArrayList<>();
        try {
            String qu="select * from categories";
            Statement pstm=this.con.createStatement();
            ResultSet set=pstm.executeQuery(qu);
            while(set.next()){
                int cid=set.getInt("cid");
                String name=set.getString("name");
                String desc=set.getString("description");
                Category c=new Category(cid,name,desc);
                list.add(c);
                
                
            }
            
        } catch (Exception e) {
        e.printStackTrace();
        }
        
        return list;
    }
    
    
    public boolean savePost(Post pst){
        boolean f=false;
        
        try {
            String qinsert="INSERT INTO `posts`(`ptitle`, `pcontent`, `pcode`, `ppic`,`catid`,`uid`) VALUES (?,?,?,?,?,?)";
            PreparedStatement pstm=con.prepareStatement(qinsert);
            pstm.setString(1, pst.getPtitle());
            pstm.setString(2, pst.getPcontent());
            pstm.setString(3, pst.getPcode());
             pstm.setString(4, pst.getPpic());
            pstm.setInt(5, pst.getCid());
            pstm.setInt(6, pst.getUid());
         int i  = pstm.executeUpdate();
            if(i==1){
            f=true;
            }
        } catch (Exception e) {
            e.printStackTrace(); 
        }
        
    
        return f;
    }
    
    //save Category
    public boolean SaveCategory(Category cat){
        boolean f=false; 
        try {
            String queryinsertCat="INSERT INTO `categories`(`name`, `description`) VALUES (?,?)";
            PreparedStatement pr=con.prepareStatement(queryinsertCat);
            pr.setString(1, cat.getName());
            pr.setString(2, cat.getDescription());
       int i=pr.executeUpdate();
       if(i==1){
           f=true;
       }
        } catch (Exception e) {
        }
        return f;
    
    }
    
    
    
    //getAllPost
    public List<Post> getAllPosts(){
        List<Post> lall=new ArrayList<Post>();
        //fetch All data
        try {
            String queryfetchpost="select * from posts order by pid desc";
            Statement pst=con.createStatement();
            ResultSet set=pst.executeQuery(queryfetchpost);
            while(set.next()){
                int Pid=set.getInt("pid");
                String ptitle=set.getString("ptitle");
                String pContent=set.getString("pcontent");
                String pcode=set.getString("pcode");
                String ppic=set.getString("ppic");
                Timestamp pdate=set.getTimestamp("pdate");
                int Catid=set.getInt("catid");
                int Uid=set.getInt("uid");
                
                Post ps=new Post(Pid, ptitle, pContent, pcode, ppic, pdate, Catid, Uid);
                lall.add(ps);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
    
        return lall;
    }
    
    public List<Post> getPostByCatId( int catId){
    
        List<Post> lid=new ArrayList<Post>();
        //fetch post by categoryes
        
         try {
            String queryfetchpost="select * from posts where catid=?";
     
            PreparedStatement psat=con.prepareStatement(queryfetchpost);
               psat.setInt(1, catId);
            ResultSet set=psat.executeQuery();
            while(set.next()){
                int Pid=set.getInt("pid");
                String ptitle=set.getString("ptitle");
                String pContent=set.getString("pcontent");
                String pcode=set.getString("pcode");
                String ppic=set.getString("ppic");
                Timestamp pdate=set.getTimestamp("pdate");
             
                int Uid=set.getInt("uid");
                
                Post ps=new Post(Pid, ptitle, pContent, pcode, ppic, pdate, catId, Uid);
                lid.add(ps);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        
        
        return lid;
    
    }
    
    public Post getPostPostId(int postId){
    Post p=null;
        try {
            String query="select * from posts where pid=?";
            PreparedStatement prt=con.prepareCall(query);
            prt.setInt(1, postId);
            ResultSet set=prt.executeQuery();
            if(set.next()){
               
                int Pid=set.getInt("pid");
                int cid=set.getInt("catid");
                String ptitle=set.getString("ptitle");
                String pContent=set.getString("pcontent");
                String pcode=set.getString("pcode");
                String ppic=set.getString("ppic");
                Timestamp pdate=set.getTimestamp("pdate");
             
                int Uid=set.getInt("uid");
                
               p=new Post(Pid, ptitle, pContent, pcode, ppic, pdate,cid, Uid);
             
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return p;
    }
    
}

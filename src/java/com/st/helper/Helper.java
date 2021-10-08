/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.st.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

/**
 *
 * @author Sagar Thorave
 */
public class Helper {

public static boolean deleteFile(String path){
    boolean f=false;
    try {
        File file=new File(path);
        f=file.delete();
        //f=true;
    } catch (Exception e) {
        e.printStackTrace();
    }
    
    
    return f;
}
public static boolean saveFile(InputStream is,String path){
    boolean f=false;
    
    try {
        byte b[]=new byte[is.available()];
        is.read(b);
        FileOutputStream out=new FileOutputStream(path);
        out.write(b);
        out.flush();
        out.close();
        f=true;
    } catch (Exception e) {
        e.printStackTrace();
    }
    
    return f;
}
}

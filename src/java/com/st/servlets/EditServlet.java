/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.st.servlets;

import com.a.st.dao.Usdaoa;
import com.st.entities.Message;
import com.st.entities.User;
import com.st.helper.Helper;
import com.st.helper.connectionProvider;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Sagar Thorave
 */
@MultipartConfig
public class EditServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String updateFname=request.getParameter("Ufname");
        String updateLname=request.getParameter("Ulname");
        String updatePassword=request.getParameter("Upassword");
        String updateAbout=request.getParameter("Uabout");
       
        Part part=request.getPart("Uimage");
        String imageName=part.getSubmittedFileName();
        
        //fet UserFrom session
        HttpSession session=request.getSession();
        User us=(User)session.getAttribute("CurrentUser");
        
        us.setFirst_name(updateFname);
        us.setLast_name(updateLname);
        us.setPassword(updatePassword);
        us.setAbout(updateAbout);
        String oldfile=us.getProfile();
        us.setProfile(imageName);
        
//        Update database
        
        Usdaoa dao=new Usdaoa(connectionProvider.getConnection());
      boolean f=  dao.updateUser(us);
        if(f==true){
            
            String Oldfilepath=request.getRealPath("/")+"component"+File.separator+"pics"+File.separator+oldfile;
            String path=request.getRealPath("/")+"component"+File.separator+"pics"+File.separator+us.getProfile();
            //deletecode
            if(oldfile.equals("default.png")){
                
           
            }else{
            
                 Helper.deleteFile(Oldfilepath);
            //profile picture save code
                if ( Helper.saveFile(part.getInputStream(), path)) {
                    Message msg=new Message(" Profile Updated...","Success","alert-success");
                     session.setAttribute("msg", msg);
                     response.sendRedirect("profilepage.jsp");
                }else{
                
                    Message msg=new Message("Something went wrong...! try again.","error","alert-danger");
                     session.setAttribute("msg", msg);
                    response.sendRedirect("profilepage.jsp");
                }
            }
            
            
            
        }else{
                     Message msg=new Message("Something went wrong...! try again.","error","alert-danger");
                     session.setAttribute("msg", msg);
                    response.sendRedirect("profilepage.jsp");
        }
        
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}

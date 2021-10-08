/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.st.servlets;

import com.a.st.dao.Postdao;
import com.st.entities.Message;
import com.st.entities.Post;
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
public class SavepostServlet extends HttpServlet {

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
            out.println("<title>Servlet SavepostServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SavepostServlet at " + request.getContextPath() + "</h1>");
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
        HttpSession session=request.getSession();
        
        int cid=Integer.parseInt(request.getParameter("catlog"));
        String title=request.getParameter("pstitle");
        String content=request.getParameter("pscontent");
        String program=request.getParameter("pscode");
        Part part=request.getPart("psimage");
        String imagenamepc=part.getSubmittedFileName();
        
        //get Current User
     User us=(User)session.getAttribute("CurrentUser");
            int uid=us.getId();
           Post pst=new Post(title,content,program,imagenamepc,cid,uid);
           
        
           
        Postdao postdao=new Postdao(connectionProvider.getConnection());

       
       
        if(postdao.savePost(pst)){           
       String path=request.getRealPath("/")+"component"+File.separator+"blog_pic"+File.separator+imagenamepc;
                   Helper.saveFile(part.getInputStream(), path);

            Message msg=new Message("post saved","success","alert-success");
            session.setAttribute("msg", msg);
            response.sendRedirect("profilepage.jsp");
        }
        else{
          
            Message msg=new Message("Contain error","error","alert-danger");
            session.setAttribute("msg",msg);
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

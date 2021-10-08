/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.st.servlets;

import com.a.st.dao.Usdaoa;
import com.st.entities.User;
import com.st.helper.connectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class RegisterServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        //create session object
        HttpSession session = request.getSession();

        String check = (String) request.getParameter("checkB");

        if (check == null) {

            session.setAttribute("error", "Please accept term and conditions");
            response.sendRedirect("Register.jsp");
        } else {
            String firstname = (String) request.getParameter("fname");
            String lastname = (String) request.getParameter("lname");
            String email = (String) request.getParameter("email");
            String password = (String) request.getParameter("password");
            String gender = (String) request.getParameter("gender");
            String aboutme = (String) request.getParameter("about");

            User user = new User(firstname, lastname, email, password, gender, aboutme);

            //set Values
//        user.setFirst_name(firstname);
//        user.setLast_name(lastname);
//        user.setEmail(email);
//        user.setPassword(password);
//        user.setGender(gender);
//        user.setAbout(aboutme);
//        
            // Create user dao object
            Usdaoa dao = new Usdaoa(connectionProvider.getConnection());
            if (dao.adduser(user)) {
                session.setAttribute("succ", "Register Successfully...! Login here");
                response.sendRedirect("login.jsp");
            } else {
                 session.setAttribute("error2", "Server Problem....please try again later");
                 response.sendRedirect("Register.jsp");
            }

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

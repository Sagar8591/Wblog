<%-- 
    Document   : show_blog_info
    Created on : 06-Oct-2021, 11:15:07 AM
    Author     : Sagar Thorave
--%>

<%@page import="com.st.entities.Post"%>
<%@page import="com.st.helper.connectionProvider"%>
<%@page import="com.a.st.dao.Postdao"%>
<%@page import="com.st.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error_page.jsp " %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       
        <% User us = (User) session.getAttribute("CurrentUser");
                if (us == null) {
                response.sendRedirect("login.jsp");
                }
            %>
        <%int wq=Integer.parseInt(request.getParameter("post_id"));
          Postdao dao=new Postdao(connectionProvider.getConnection());
         Post ps=dao.getPostPostId(wq);
         


        %>
        <%@include file="component/allcomponents.jsp" %>
        <main class=" align-items-center primary-light-dark" >
          
            <div class=" d-flex container">
                <div class="col-md-6 offset-md-3">
                <div class="row mt-3">
                    
                        <div class="card text-center">
                            <b>  <div class="card-header bg-primary "><h3><%=ps.getPtitle()%></h3></div></b>

                             <div class="card-body text-dark">
                                  <img src="component/blog_pic/<%=ps.getPpic()%>" class="card-img-top m-2 " alt="...">
                                <p><%=ps.getPcontent()%></p>
                                <br>
                                <p><%=ps.getPcode()%></p>
                                

                                
                            </div>
                                <div class="card-footer text-center bg-primary"><%=ps.getUid()%> 
                                  <a href="#" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span>10</span></a>
                                       </div>
                    </div> 

                </div>

            </div>
            </div>
        </main>

    </body>
</html>

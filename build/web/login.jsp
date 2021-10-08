<%-- 
    Document   : login
    Created on : 25-Sep-2021, 8:33:57 PM
    Author     : Sagar Thorave
--%>

<%@page import="com.st.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>login here..</title>
       
    </head>
    <body>
        <%@include file="component/navbar.jsp" %>
        <main class="d-flex align-items-center primary-light-dark banner-background " style="height: 100vh">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 offset-md-3">
                        <div class="card">
                            <div class="card-header primary-light-dark text-white text-center "><span class="fa fa-user-circle-o fa-2x">&nbsp; </span><br>Login here</div>

                            <div class="card-body text-dark">
                                <% String success = (String) session.getAttribute("succ");
                                    if (success != null) {

                                %>
                                <script> swal("Congratulations..!", "Register Successfully, Login here", "success");</script>
                                

                                <% session.removeAttribute("succ");
                                        } %>

                            <%  Message msg=(Message)session.getAttribute("msg");

                                    if (msg!= null) {

                                %>
                                <div class="alert <%=msg.getCssClass()%> text-center" role="alert">
                                    <%=msg.getContent()%>
                                </div>

                                <% session.removeAttribute("msg");
                                        }%>
                                     
                                        <% // Message msg=(Message)session.getAttribute("")%>
                                        
                                        

                                <form action="LoginServlet" method="post">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input type="email" name="lemail" class="form-control" required id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input type="password" name="lpassword" class="form-control" id="exampleInputPassword1" required placeholder="Password">
                                    </div>
                                  
                                    <div class="container text-center p-3">
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </div>
                                </form>
                            </div>
                                        <div class="card-footer text-center">
                                            <a href="Register.jsp"><h5>New user..! Create new account.</h5></a>
                                        </div>
                        </div>
                    </div> 

                </div>

            </div>
        </main>


    </body>
</html>

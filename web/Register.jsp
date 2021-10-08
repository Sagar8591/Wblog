<%-- 
    Document   : login
    Created on : 25-Sep-2021, 8:33:57 PM
    Author     : Sagar Thorave
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register here..</title>


    </head>
    <body>
        <%@include file="component/navbar.jsp" %>


        <main class="d-flex align-items-center primary-light-dark banner-background " style="height: 140vh">
            <div class="container">
                <div class="row">
                    <div class="col-md-5 offset-md-3">
                        <div class="card">
                            <div class="card-header primary-light-dark text-white text-center "><span class="fa fa-vcard-o fa-2x">&nbsp;<br> Register here</span></div>
                            <br>
                            <div class="card-body text-dark" >
                                <form action="Reg" method="post" >

                                    <% String err = (String) session.getAttribute("error");

                                        if (err != null) {
                                    %>
                                    <div class="alert alert-danger text-center" role="alert">
                                        <%=err%>
                                    </div>
                                    <% session.removeAttribute("error");
                                        } %>
                                    <% String err2 = (String) session.getAttribute("error2");

                                        if (err2 != null) {
                                    %>
                                    <div class="alert alert-danger text-center" role="alert">
                                        <%=err2%>
                                    </div>
                                    <% session.removeAttribute("error2 ");
                                        }%>

                                    <div class="form-group">
                                        <label for="exampleInputEmail1">First name</label>
                                        <input type="text" name="fname" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter first name" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Last name</label>
                                        <input type="text" name="lname" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter last name" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Password" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="gender"> Select Gender</label><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input  type="radio" required  id="gender" name="gender" value="Male">Male&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input type="radio" required id="gender" name="gender" value="Female">Female
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">About</label>
                                        <textarea type="text" name="about" class="form-control" rows="3" id="exampleInputPassword1" placeholder="Enter something about yourself"></textarea>
                                    </div>
                                    <div class="form-check">
                                        <input name="checkB" type="checkbox" class="form-check-input" id="exampleCheck1">
                                        <label class="form-check-label" for="exampleCheck1">Accept terms and conditions.</label>
                                    </div>
                                    <br>
                                    <div class="container text-center p-3">
                                        <button type="submit" class="btn btn-primary ">Submit</button>
                                    </div>
                                </form>
                            </div>
                            <div class="card-footer text-center">
                                <a href="login.jsp"><h5>Already have an account..! Login here.</h5></a>
                            </div>
                        </div>
                    </div> 

                </div>

            </div>
        </main>


    </body>
</html>

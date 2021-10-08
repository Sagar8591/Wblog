<%-- 
    Document   : addCategory
    Created on : 08-Oct-2021, 7:45:07 PM
    Author     : Sagar Thorave
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        
    </head>
    <body>
         <%@include file="component/navbar.jsp" %>
        <div class="container">
           
            <form class="mt-4" method="post" action="CategoryServlet">
                    <div class="form-group">
                        <label for="exampleInputEmail1">Title</label>
                        <input type="text" name="Ctitle" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Title">
                    </div>
                    <div class="form-group">
                        <label for="exampleInputPassword1">Description</label>
                        <textarea type="text" class="form-control"  name="cd" rows="8" ></textarea>
<!--                        <textarea  name="Ncd" class="form-control" rows="3" id="exampleInputPassword1" placeholder="Enter something about yourself"></textarea>-->
                    </div>
                    
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>   
            </div>
        </div>
        <%%>
    </body>
</html>

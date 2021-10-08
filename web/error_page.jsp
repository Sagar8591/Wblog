<%-- 
    Document   : error_page
    Created on : 26-Sep-2021, 10:27:11 PM
    Author     : Sagar Thorave
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sorry! something went wrong...</title>
        <%@include file="component/allcomponents.jsp" %>
    </head>
    <body>
        <div class="container">
            <div class="text-center"  >
                <img src="component/img/browser.png" class="img-fluid"  alt="alt"/>
                <h3 class="display-3">Sorry! something went wrong...</h3>
                <%=exception %><br>
                <a href="index.jsp" ><button class="btn primary-background btn-lg mt-3">Home</button></a>
            </div>
        </div>
    </body>
</html>

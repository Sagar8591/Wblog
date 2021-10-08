<%-- 
    Document   : index
    Created on : 25-Sep-2021, 1:02:47 PM
    Author     : Sagar Thorave
--%>

<%@page import="com.st.helper.connectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title >index</title>
        <style>
            .banner-background{
                clip-path: polygon(50% 9%, 100% 0, 99% 79%, 75% 100%, 36% 85%, 0 100%, 0 0);
            }
        </style>
            
    
    </head>
    <body class="">
        <%@include file="component/navbar.jsp" %>
        <!-- //banner -->
        <div class="container-fluid mt-1">
            <div class="jumbotron primary-light-dark banner-background">
                <div class="container ">
                    <h3>Welcome to Wblog</h3>
                    <p>Welocome,World of technology. A programming language is a notation for writing programs, which are specifications of a computation or algorithm. Some authors restrict the term "programming language" to those languages that can express all possible algorithms.</p>  
                    <p>Most programming languages consist of instructions for computers. There are programmable machines that use a set of specific instructions, rather than general programming languages. Since the early 1800s, programs have been used to direct the behavior of machines such as Jacquard looms, music boxes and player pianos. The programs for these machines (such as a player piano's scrolls) did not produce different behavior in response to different inputs or conditions.</p>

                    <button class="btn btn-outline-light btn-lg"><span class="fa fa-paper-plane-o"></span>Start! its Free</button>
                    <a href="login.jsp"> <button class="btn btn-outline-light btn-lg"><span class="fa fa-user-circle-o fa-spin"></span>Login</button></a>
                </div>
            </div>
            <br>
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Java Programming</h5>
                                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                <a href="#" class="btn primary-background text-white">Read More..</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Java Programming</h5>
                                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                <a href="#" class="btn primary-background text-white">Read More..</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Java Programming</h5>
                                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                <a href="#" class="btn primary-background text-white">Read More..</a>
                            </div>
                        </div>
                    </div>
                </div>
                 <div class="row mb-2">
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Java Programming</h5>
                                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                <a href="#" class="btn primary-background text-white">Read More..</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Java Programming</h5>
                                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                <a href="#" class="btn primary-background text-white">Read More..</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title">Java Programming</h5>
                                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                <a href="#" class="btn primary-background text-white">Read More..</a>
                            </div>
                        </div>
                    </div>
                </div>
                
            </div>    



        </div>
    </body>
</html>

<%-- 
    Document   : profilepage
    Created on : 27-Sep-2021, 10:22:58 AM
    Author     : Sagar Thorave
--%>

<%@page import="java.util.List"%>
<%@page import="com.st.entities.Post"%>
<%@page import="com.st.entities.Message"%>
<%@page import="com.st.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile page</title>

    </head>
    <body>
        <%@include file="component/navbar.jsp" %>
        <%  Message msg = (Message) session.getAttribute("msg");

            if (msg != null) {

        %>
        <div class="alert <%=msg.getCssClass()%> text-center" role="alert">
            <%=msg.getContent()%>
        </div>

        <% session.removeAttribute("msg");
            }%>



        <main>
            <div class="container">
                <div class="row mt-4">
                    <div class="col-md-4 ">
                        <%
                            Category cot = new Category();
                            Postdao dao = new Postdao(connectionProvider.getConnection());
                            ArrayList<Category> list = dao.getCategories();
                        %>
                        <a href="#" onclick="getPosts(0,this)" class="c-link list-group-item list-group-item-action active">
                            All Posts
                        </a>
                        <%  for (Category cat : list) {
                        %>
                        <div class="list-group">

                            <a href="#" onclick="getPosts(<%=cat.getCid()%>,this)" class="c-link list-group-item list-group-item-action"><%=cat.getName()%> 

                            </a>
                        </div>
                        <% }


                        %>
                    </div>
                    <div class="col-md-8 " >
                        <div class="container-fluid" id="post-cont">

                        </div>
                    </div>

                </div>

            </div>
        </main>


        <script>
            function getPosts(catId,temp){
                $(".c-link").removeClass('active')
                 
                
                 $.ajax({
                url: "loadPost.jsp",
                data: {cid:catId},
                success: function (data, textStatus, jqXHR) {
                    console.log(data)

                    $('#post-cont').html(data)
                    $(temp).addClass('active') 

                    
                }
            })
            }
    
    $(document).ready(function(e) {
        let allpostRef=$('.c-link')[0]
        getPosts(0,allpostRef);
})
        </script>
    </body>
</html>



<meta name="viewport" content="width=device-width, initial-scale=1">
<%@include file="/component/allcomponents.jsp" %>
<%@page errorPage="error_page.jsp" %>
<%@page import="com.st.entities.User"%>
<nav class="navbar navbar-expand-lg navbar-dark primary-background">
   <% User us = (User) session.getAttribute("CurrentUser");
                if (us != null) {
                        
            %> 
             <ul class="navbar-nav">
            <a class="navbar-brand" href="profilepage.jsp"><span class="fa fa-cogs "></span>WBlog</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
             
            <li class="nav-item active">
                <a class="nav-link" href="profilepage.jsp"><span class="fa fa-comment-o"></span>LearnCode<span class="sr-only">(current)</span></a>
            </li>

            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <span class="fa fa-sort-amount-desc"></span> Categories
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="addCategory.jsp">Add Category</a>
                    
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#"><span class="fa fa-street-view"></span>Contact</a>
            </li>

            <li class="nav-item">
                <a class="nav-link"  data-toggle="modal" data-target="#exampleModalpost" ><span class="fa fa-edit"></span>&nbsp;Post</a>
            </li>


            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <span class="fa fa-gear"></span> Profile
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" data-toggle="modal" data-target="#exampleModal"><span class="fa fa-tasks"></span>&nbsp;<%=us.getFirst_name()%>&nbsp;<%=us.getLast_name()%></a>
                    <a class="dropdown-item" href="LogoutServlet"><span class="fa fa-sign-out"></span>Logout</a>
<!--                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">Data Structure</a>-->
                </div>
            </li>   
        </ul>


        <%@include file="updatepro.jsp"%>   

       







    </div>
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            

        <%
           } else {%>
           <a class="navbar-brand" href="index.jsp"><span class="fa fa-cogs "></span>WBlog</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
             
            <li class="nav-item active">
                <a class="nav-link" href="index.jsp"><span class="fa fa-comment-o"></span>LearnCode<span class="sr-only">(current)</span></a>
            </li>

           
            <li class="nav-item">
                <a class="nav-link" href="#"><span class="fa fa-street-view"></span>Contact</a>
            </li>

           <!--comment-->
            <li class="nav-item">
                <a class="nav-link" href="login.jsp"><span class="fa fa-user-circle-o fa-spin"></span>Login</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="Register.jsp"><span class="fa fa-vcard-o"></span>Signup</a>
            </li>
        </ul>

       
        
        
            

        <%  }%>
</nav>






















<%@page import="java.util.List"%>
<%@page import="com.st.entities.Post"%>
<%@page import="com.st.helper.connectionProvider"%>
<%@page import="com.a.st.dao.Postdao"%>
<div class="container" >
    <div class="row">
        <%
            Postdao dao = new Postdao(connectionProvider.getConnection());
            int idcat = Integer.parseInt(request.getParameter("cid"));

            List<Post> ps = null;

            if (idcat == 0) {
                ps = dao.getAllPosts();
            } else {
                ps = dao.getPostByCatId(idcat);
            }
            for (Post pt : ps) {
        %>   

        <div class="col-md-6 mt-2">
            <div class="card" >
                <div class="card-body">
                    <img src="component/blog_pic/<%=pt.getPpic()%>" class="card-img-top" alt="...">
                    <b><%=pt.getPtitle()%></b>
                    <p><%=pt.getPcontent()%></p>
                </div>
                <div class="card-footer text-center bg-primary ">
                    <a href="#" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span>10</span></a>
                    <a href="show_blog_info.jsp?post_id=<%=pt.getPid()%>" class="btn btn-outline-light btn-sm">Read more...</a>
                    <a href="#" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span>10</span></a>
                </div>

<!--                <div class="test" style="display: none">
                    <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">


                            </div>
                        </div>
                    </div>
                </div>-->
            </div>
        </div>
        <%
            }%>
    </div>

</div>

<%


%>


<!--for post model-->
<!-- Large modal -->



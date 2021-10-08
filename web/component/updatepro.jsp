<%-- 
    Document   : updatepro
    Created on : 27-Sep-2021, 8:09:43 PM
    Author     : Sagar Thorave
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.st.entities.Category"%>
<%@page import="com.st.helper.connectionProvider"%>
<%@page import="com.a.st.dao.Postdao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error_page.jsp" %>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header primary-background text-white ">
                <div class="container ">
                    <h5 class="modal-title" id="exampleModalLabel">Wblog</h5>
                </div>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true"></span>
                </button>
            </div>
            <div class="modal-body">
                <div class="container text-center">
                    <img src="component/pics/<%=us.getProfile()%>" class="img-fluid" style="border-radius: 50%; max-width: 150px;"/> 

                    <h5 class="modal-title mt-3" id="exampleModalLabel"><%=us.getFirst_name()%>&nbsp;<%=us.getLast_name()%></h5>

                    <!--//details-->

                    <div id="profile-detail">
                        <table class="table">

                            <tbody>
                                <tr>
                                    <th scope="row">Id</th>
                                    <td><%=us.getId()%></td>

                                </tr>
                                <tr>
                                    <th scope="row">Email</th>
                                    <td><%=us.getEmail()%></td>

                                </tr>
                                <tr>
                                    <th scope="row">Gender</th>
                                    <td><%=us.getGender()%></td>

                                </tr>
                                <tr>
                                    <th scope="row">Status</th>
                                    <td><%=us.getAbout()%></td>

                                </tr>
                                <tr>
                                    <th scope="row">Registered On:</th>
                                    <td><%=us.getTimestamp()%></td>

                                </tr>

                            </tbody>
                        </table>
                    </div>
                    <!--.//profile edit-->
                    <div id="profile-edit" style="display: none">
                        <h3 class="mt-2">Edit Profile</h3>
                        <form action="EditServlet" method="post" enctype="multipart/form-data">
                            <table class="table">

                                <tbody>
                                    <tr>
                                        <th scope="row">Email:</th>
                                        <td><%=us.getEmail()%></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">First Name:</th>
                                        <td><input type="text" required class="form-control" name="Ufname" value="<%=us.getFirst_name()%>" /></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">Last Name:</th>
                                        <td><input type="text" required class="form-control" name="Ulname" value="<%=us.getLast_name()%>"></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">Password</th>
                                        <td><input type="text" class="form-control" name="Upassword" value="<%=us.getPassword()%>"></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">Gender</th>
                                        <th><%=us.getGender().toUpperCase()%></th>                                
                                    </tr>

                                    <tr>
                                        <th scope="row">New profile</th>
                                        <td><input type="file" name="Uimage" class="form-control"></td>

                                    </tr>
                                    <tr>
                                        <th scope="row">Status</th>
                                        <td><textarea name="Uabout" class="form-control" rows="3"><%=us.getAbout()%>
                                            </textarea></td>

                                    </tr>

                                </tbody>
                            </table> 
                            <div>
                                <button class="btn btn-primary" type="submit" name="submit">Submit</button>
                            </div>
                        </form>
                    </div>          
                </div> 
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" id="edit-profile" class="btn btn-primary">Edit</button>
            </div>
        </div>
    </div>
</div>


<script>
    $(document).ready(function () {

        let editBtn = false;
        $('#edit-profile').click(function () {
            if (editBtn == false) {
                $('#profile-detail').hide();
                $('#profile-edit').show();
                editBtn = true;
                $(this).text("Back");
            } else {
                $('#profile-detail').show();
                $('#profile-edit').hide();
                editBtn = false;
                $(this).text("Edit");
            }
        });
    });
</script>


<!-- Button trigger modal -->

<!-- Modal -->
<div class="modal fade" id="exampleModalpost" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Provide the post details..</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body ">
                <form method="post" action="SavepostServlet" enctype="multipart/form-data">
                    <div class="form-group">
                        <select class="form-control" required name="catlog">
                            <option disabled selected>Select Category </option>
                            <%
                                Postdao dao = new Postdao(connectionProvider.getConnection());
                                ArrayList<Category> list = dao.getCategories();
                                for (Category c : list) {

                            %>
                            <option required value="<%=c.getCid()%>"><%=c.getName()%></option>
                            <%}%>
                        </select>
                    </div>
                    <div class="form-group">
                       <input type="text" required class="form-control" name="pstitle" placeholder="Enter post title" > 
                    </div>
                    <div class="form-group">
                        <textarea class="form-control" required style="height: 200px" name="pscontent" placeholder="Enter your content"></textarea> 
                    </div>
                    <div class="form-group">
                        <textarea class="form-control"  style="height: 150px" name="pscode" placeholder="Enter your program (if any)"></textarea> 
                    </div>  <div class="form-group">
                        <label>Select your pic...</label>
                        <input type="file"  class="form-control" name="psimage"> 
                    </div>
                    <div class="text-center">
                <button type="submit" name="submit"  class="btn btn-outline-primary">Submit</button>
                    </div>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
                        
                        
                        
                        
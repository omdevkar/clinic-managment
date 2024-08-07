<%-- 
    Document   : admin_home
    Created on : 21 Mar, 2023, 8:54:44 PM
    Author     : Tejas
--%>
<%@ page import="java.sql.*" %>
<%
    
    String userType=(String)session.getAttribute("userType");
    
    if (userType==null) {
   
    response.sendRedirect("login.jsp");

    return;
    }else{
    if (userType.equals("doctor")) {
        response.sendRedirect("logout");
        return;
        }
    if (userType.equals("normal")) {
        response.sendRedirect("logout");
        return;
        }
        if (userType.equals("receptionist")) {
        response.sendRedirect("logout");
        return;
    }
    }
    
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="Components/css_js.jsp" %>
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="Components/navbar.jsp"%>
        
        <div class="container-fluid">
            <div class="container-fluid">
                <%@include file="Components/message.jsp"%>
            </div>
            <div class="row mt-4">
                <div class="col-md-6">
                    <div class="card admin" data-toggle="modal" data-target="#add-users">
                        <div class="container text-center">
                            <div>
                                <img class="img-fluid admin-img" src="img/add-contact.png" alt="add-userIcon">
                            </div>
                            <h1>Add users</h1>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card admin" data-toggle="modal" data-target="#show_users">
                        <div class="container text-center">
                            <div>
                                <img class="img-fluid admin-img" src="img/account.png" alt="add-userIcon">
                                
                            </div>
                            <div>
                                <h3 id="demo"> </h3>
                            </div>
                            <h1>See users</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ADD USER Modal Start -->
        
<!--  Modal -->
<div class="modal fade" id="add-users" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header bg-primary text-dark">
        <h5 class="modal-title" id="exampleModalLabel">ADD USERS</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
          <form  action="add_user" method="post">
                            <div class="form-group">
                                <input type="hidden" name="add_user" value="add_user">
                                <div class="mb-3">
                    <label for="name" class="form-label">User Name</label>
                    <input type="text" name="name" class="form-control" id="name" placeholder="Name Here" aria-describedby="emailHelp">
                    
                 </div>
                <div class="mb-3">
                    <label for=email" class="form-label">User Email</label>
                    <input type="email"  name="email"class="form-control" id=email" placeholder="tejas@gmail.com" aria-describedby="emailHelp">
                 </div>
                <div class="mb-3">
                    <label for="password" class="form-label">User Password</label>
                    <input type="password" name="password" class="form-control" id="password" placeholder="********" aria-describedby="emailHelp">
                 </div>
                <div class="mb-3">
                    <label for="confirmPassword" class="form-label">Confirm Password</label>
                    <input type="password" name="repassword" class="form-control" id="confirmPassword" placeholder="********" aria-describedby="emailHelp">
                 </div>
                <div class="mb-3">
                    <label for="birthday" class="form-label">Birthday:</label>
                    <input type="date" class="form-control" id="birthday" name="birthday">
                </div>
                <div class="mb-3">
                    <label for="mob_no" class="form-label">Mobile Number</label>
                    <input type="number" name="mob_no" class="form-control" id="mob_no" placeholder="9876543210">
                 </div>
                <div class="mb-3">
                    <label class="form-label">Gender</label>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="gender" id="male" value="male">
                        <label class="form-check-label" for="male">
                            Male
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="gender" id="female" value="female">
                        <label class="form-check-label" for="female">
                            Female
                        </label>
                    </div>
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="gender" id="other" value="other">
                        <label class="form-check-label" for="other">
                            Other
                        </label>
                    </div>
                 </div>
                    <div class="input-group mb-3">
                      <div class="input-group-prepend">
                        <label class="input-group-text" for="inputGroupSelect01">Options</label>
                      </div>
                        <select name="user_type" class="custom-select form-control" id="inputGroupSelect01">
                        <option selected>Select User Type</option>
                        <option value="admin">Admin</option>
                        <option value="doctor">Doctor</option>
                        <option value="receptionist">Receptionist</option>
                        <option value="normal">Patient</option>
                      </select>
                    </div>
                <div class="container text-center">
                    <button type="submit" id="submit" class="btn btn-primary">Register</button>
                    <button type="reset" class="btn btn-outline-danger">Cancel</button>
                 </div>
                            </div>
            </form>
      </div>
    </div>
  </div>
</div>
        <!-- ADD USER Modal End -->
        

<!-- SHOW USERS Modal STARTS -->

<div class="modal fade" id="show_users" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header bg-primary text-dark">
        <h5 class="modal-title" id="exampleModalLabel">Show Users</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <% Class.forName("com.mysql.cj.jdbc.Driver"); %>
         <%
           Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/careandcure?autoReconnect=true&useSSL=false","root","root");
           Statement statement = con.createStatement() ;
          ResultSet resultset = statement.executeQuery("select * from patient_details_1") ;
       %>
       <TABLE class="table-responsive-lg table-hover" BORDER="1" id="myTable">
           <TR class=" border-1 text-dark">
      <TH class="p-2">ID</TH>
      <TH class="p-2">Name</TH>
      <TH class="p-2">Email</TH>
      <TH class="p-2">Password</TH>
      <TH class="p-2">Birth-Date</TH>
      <TH class="p-2">Mobile<br> Number</TH>
      <TH class="p-2">User Type</TH>
      </TR>
      <% while(resultset.next()){ %>
      <TR class="table-responsive-lg border-1">
       <TD class="p-2 "> <%= resultset.getString(1) %></td>
       <TD class="p-2"> <%= resultset.getString(2) %></TD>
       <TD class="p-2"> <%= resultset.getString(3) %></TD>
       <TD class="p-2"> <%= resultset.getString(4) %></TD>
       <TD class="p-2"> <%= resultset.getString(5) %></TD>
       <TD class="p-2"> <%= resultset.getString(6) %></TD>
       <TD class="p-2"> <%= resultset.getString(7) %></TD>
      </TR>
      <% } %>
     </TABLE>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
    </body>
</html>

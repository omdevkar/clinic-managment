<%-- 
    Document   : login
    Created on : 17 Mar, 2023, 8:00:08 PM
    Author     : Tejas
--%>
<%
    String userType=(String)session.getAttribute("userType");
    
    if (userType!=null) {
    if (userType.equals("doctor")) {
        response.sendRedirect("doctor_home.jsp");
        return;
        }
    if (userType.equals("normal")) {
        response.sendRedirect("patient_home.jsp");
        return;
        }
    if (userType.equals("admin")) {
        response.sendRedirect("admin_home.jsp");
        return;
        }
        if (userType.equals("receptionist")) {
        response.sendRedirect("receptionist_home.jsp");
        return;
        }
    return;
    }
    
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="Components/css_js.jsp" %>
    </head>
    <body>
        <%@include file="Components/navbar.jsp"%>
        <div class="container-fluid">
            <div class="row mt-5">
                <div class="col-md-4 offset-md-4">
                    <div class="container">
                            <%@include file="Components/message.jsp"%>
                        </div>
                <div class="card">
                    
                    <div class="card-header bg-primary text-center">
                        <h3>LOGIN HERE</h3>
                    </div>
                    <div class="card-body">
                        
                        
                        <form action="login_servlet1" method="post">
                            <div class="form-group">
                                <div class="mb-3">
                                  <label for="exampleInputEmail1" class="form-label">Email address</label>
                                  <input type="email" placeholder="examle@gmail.com" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                  <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
                                </div>
                                <div class="mb-3">
                                  <label for="exampleInputPassword1" class="form-label">Password</label>
                                  <input type="password" placeholder="*******" name="password" class="form-control" id="exampleInputPassword1">
                                </div>
                               <br>
                               <div class="container text-center">
                                   <a href="register.jsp" class=" text-decoration-underline text-danger">Click Here for Register</a>
                               </div>
                               <br>
                               
                               <div class="container text-center">
                                   <button type="submit" class="btn btn-primary">Submit</button>
                                   <button type="reset" class="btn btn-primary">Clear</button>
                               </div>
                                
                            </div>
                              </form>
                </div>
            </div>
            </div>
        </div>
        </div>
    <!-- Footer Start -->
    <%@include file="Components/footer.jsp" %>
    <!-- Footer End -->
    </body>
</html>

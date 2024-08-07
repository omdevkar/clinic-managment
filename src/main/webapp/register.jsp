
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
        <title>REGISTER </title>
        <%@include file="Components/css_js.jsp" %>
        
    </head>
    <body>
    <!-- Navbar Start -->
    <%@include file="Components/navbar.jsp"%>
    <!-- Navbar End -->
    
    <!<!-- Form Start -->
    <div class="container-fluid">
        
    <div class="row mt-5">
        <div class="col-md-4 offset-md-4">
            
            <div class="container">
                            <%@include file="Components/message.jsp"%>
                        </div>
            <div class="card">
                
                    <div class="card-header bg-primary text-center">
                        <h3>REGISTER HERE</h3>
                    </div>
                    <div class="card-body">
                        <form  action="register_servlet" method="post">
                            <div class="form-group">
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
                <div class="container text-center ">
                    <button type="submit" id="submit" class="btn btn-primary">Register</button>
                    <button type="reset" class="btn btn-outline-danger">Clear</button>
                 </div>
                            </div>
            </form>
                        <!-- Form End -->
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

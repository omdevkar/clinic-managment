<%-- 
    Document   : patient_home
    Created on : 17 Mar, 2023, 9:56:08 PM
    Author     : Tejas
--%>
<%
String userType=(String)session.getAttribute("userType");
    
    if (userType==null) {
    response.sendRedirect("index.jsp");
    return;
    }else{
        if (userType.equals("admin")) {
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
        <title>HOME</title>
        <%@include file="Components/css_js.jsp" %>
    </head>
    <body>
        <%session.getAttribute("name");%>
        <%@include file="Components/navbar.jsp"%>
        <div class="container-fluid">
            
            <div class="row mt-4">
                <div class="col-md-6">
                    <div class="card admin" data-toggle="modal" data-target="#add-users">
                        <div class="container text-center">
                            <div>
                                <img class="img-fluid admin-img" src="img/appointment.png" alt="see-appointments">
                            </div>
                            <h1>Today's Appointments</h1>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card admin">
                        <div class="container text-center">
                            <div>
                                <img class="img-fluid admin-img" src="img/account.png" alt="add-userIcon">
                            </div>
                            <h1>See users</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
    </body>
</html>

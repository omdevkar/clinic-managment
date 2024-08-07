<%-- 
    Document   : p_appointment
    Created on : 18 Mar, 2023, 10:10:51 AM
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
    if (userType.equals("doctor")) {
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
        <title>JSP Page</title>
        <%@include file="Components/css_js.jsp"%>
    </head>
    <body>
        <%@include file="Components/navbar.jsp" %>
        <!-- Appointment Start -->
    <div class="container-fluid bg-primary my-5 py-5">
        <div class="container py-5">
            <div class="row gx-5">
                <div class="col-lg-6 mb-5 mb-lg-0">
                    <div class="mb-4">
                        <h5 class="d-inline-block text-white text-uppercase border-bottom border-5">Appointment</h5>
                        <h1 class="display-4">Make An Appointment</h1>
                    </div>
                    <p class="text-white mb-5">FIll Form to Book Appointment</p>
                    
                </div>
                <div class="col-lg-6">
                    <div class="bg-white text-center rounded p-5">
                        <h1 class="mb-4">Book An Appointment</h1>
                        <form>
                            <div class="row g-3">
                                <div class="col-12 col-sm-6">
                                    <select class="form-select bg-light border-0" style="height: 55px;">
                                        <option selected>Choose Department</option>
                                        <option value="1">Dental</option>
                                        <option value="2">Physician</option>
                                       
                                    </select>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <div class="date" id="P_cotact" >
                                        <input type="number"  name="p_contat"
                                            class="form-control bg-light border-0"
                                            placeholder="Contact" style="height: 55px;">
                                    </div>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <input type="text" class="form-control bg-light border-0" placeholder="Your Name" style="height: 55px;">
                                </div>
                                <div class="col-12 col-sm-6">
                                    <input type="email" class="form-control bg-light border-0" placeholder="Your Email" style="height: 55px;">
                                </div>
                                <div class="col-12 col-sm-6">
                                    <div class="date" id="date" data-target-input="nearest">
                                        <input type="date" max="2023-05-31" min="2023-03-18"
                                            class="form-control bg-light border-0 datetimepicker-input"
                                            placeholder="Date" data-target="#date" data-toggle="datetimepicker" style="height: 55px;">
                                    </div>
                                </div>
                                <div class="col-12 col-sm-6">
                                    <select class="form-select bg-light border-0" style="height: 55px; width: auto">
                                        <option selected>Select Time</option>
                                        <option value="1">10:00</option>
                                        <option value="2">10:30</option>
                                        <option value="3">11:00</option>
                                        <option value="4">11:30</option>
                                        <option value="5">12:00</option>
                                        <option value="6">12:30</option>
                                        <option value="7">18:00</option>
                                        <option value="8">18:30</option>
                                        <option value="9">19:00</option>
                                        <option value="10">19:30</option>
                                        <option value="11">20:00</option>
                                        <option value="12">20:30</option>
                                    </select>
                                </div>
                                <div class="col-12">
                                    <button class="btn btn-primary w-100 py-3" type="submit">Make An Appointment</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Appointment End -->
    </body>
</html>

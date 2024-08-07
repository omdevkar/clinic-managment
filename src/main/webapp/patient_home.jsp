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
        <title>HOME</title>
        <%@include file="Components/css_js.jsp" %>
    </head>
    <body>
        <%session.getAttribute("name");%>
        <%@include file="Components/navbar.jsp"%>
        <h1 class="text-primary" <%String name=(String)session.getAttribute("name");%>><%out.print("Welcome " + name);%></h1>
    </body>
</html>

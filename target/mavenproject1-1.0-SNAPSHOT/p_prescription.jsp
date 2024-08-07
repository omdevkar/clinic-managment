<%-- 
    Document   : p_prescription
    Created on : 18 Mar, 2023, 10:39:22 AM
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
        <title>SEE PRESCRIPTION</title>
        <%@include file="Components/css_js.jsp" %>
    </head>
    <body>
        <%@include file="Components/navbar.jsp" %>
    </body>
</html>

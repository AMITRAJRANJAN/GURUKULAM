<%-- 
    Document   : newjsp
    Created on : 30 Aug, 2023, 2:57:14 PM
    Author     : mmani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
        String colour = request.getParameter("PAYMENTMETHOD");
        out.println(colour);
    %>
    </body>
</html>

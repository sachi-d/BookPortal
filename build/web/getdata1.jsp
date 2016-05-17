<%-- 
    Document   : getdata1
    Created on : May 12, 2016, 8:28:55 PM
    Author     : Sachi
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
        <p>
            <label for="pname">Product Name:</label>
            <select name="state" id="state">
                <%
                    if (request.getParameter("type") != null) {
                %>
                <option value="1">1</option>
                <option value="2">2</option>
                <%      } else {
                %>
                <option value="1">2</option>
                <option value="2">3</option>
                <%    }%>
            </select>
    </body>
</html>

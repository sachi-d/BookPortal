<%-- 
    Document   : getuser
    Created on : May 12, 2016, 11:39:52 AM
    Author     : Sachi
--%>

<%@page import="Model.Book"%>
<%@page import="Controller.DBDatalist"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

    </head>
    <body>
        <%
            String m = request.getParameter("q");
            int mm = Integer.parseInt(m);
            Book b = DBDatalist.getBook(mm);
        %>
        <p><%=b.getTitle()%></p>
        <h1><%=b.getTitle()%></h1>
        
    </body>
</html>

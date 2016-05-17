<%-- 
    Document   : getdata
    Created on : May 12, 2016, 11:39:52 AM
    Author     : Sachi
--%>

<%@page import="Model.Type"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Subject"%>
<%@page import="Model.Book"%>
<%@page import="Controller.DBDatalist"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

    </head>
    <body>
        <%
            String m = request.getParameter("type");
            int mm = Integer.parseInt(m);
            Book b = DBDatalist.getBook(mm);
            Type t = DBDatalist.getType(mm);
            ArrayList<Subject> sublist = DBDatalist.getSubjectsfromType(t);
        %>
        <p><%=b.getTitle()%></p>
        <h1><%=b.getTitle()%></h1>

        <select name="subs" >
            <%
                for (Subject s : sublist) {
            %>
            <option value="<%=s.getIdsubject()%>"><%=s.getName()%></option>
            <%
                }
            %>

        </select> 
     
    </body>
</html>

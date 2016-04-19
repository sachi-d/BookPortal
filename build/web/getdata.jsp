<%-- 
    Document   : getdata
    Created on : Apr 18, 2016, 7:43:59 PM
    Author     : Sachi
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="ace.DummyDB"%>
<%
    DummyDB db = new DummyDB();
 
    String query = request.getParameter("q");
     
    List<String> countries = db.getData(query);
 
    Iterator<String> iterator = countries.iterator();
    while(iterator.hasNext()) {
        String country = (String)iterator.next();
        out.println(country);
    }
%>
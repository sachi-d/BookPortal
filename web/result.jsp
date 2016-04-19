<%-- 
    Document   : newjspresult
    Created on : Apr 15, 2016, 11:52:21 AM
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
        <div id="result">
            <h3>${requestScope["message"]}</h3>
        </div>
        
    <h2>${requestScope.message}</h2>
      
    </body>
</html>

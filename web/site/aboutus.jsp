<%-- 
    Document   : aboutus
    Created on : Mar 26, 2016, 9:22:19 PM
    Author     : Sachi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>About Us</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link href="css/prettyPhoto.css" rel="stylesheet">
        <link href="css/price-range.css" rel="stylesheet">
        <link href="css/animate.css" rel="stylesheet">
        <link href="css/main.css" rel="stylesheet">
        <link href="css/responsive.css" rel="stylesheet">
    </head>
    <body>

        <%@include file="header.jsp" %>
        <div id="contact-page" class="container">
            <div class="breadcrumbs">
                <ol class="breadcrumb">
                    <li><a href="home.jsp">Home</a></li>
                    <li class="active">About Us</li>
                </ol>
            </div>
            <div class="bg">
                <div class="row">    		
                    <div class="col-sm-12">    			   			
                        <h2 class="title text-center">About <strong>Us</strong></h2>    			    				    				
                        <div id="gmap" class="contact-map">
                            <p>
                               This is the public website developed as a part of my individual software engineering project.
<br><br>
The background scenario is as follows:
<br>
Book Portal is a local book store with, multiple branches. Currently the items sold are books of many types, which are further divided into subjects. The store manages the physical customer monetary transactions and the report generation is handled manually. The two main problems attended by the Book Portal operations management system are the automatic report generation and reaching out to online customers. The motivation of Book Portal is to step into the world of technology by the use of a central management system to handle the inventory and the internal operations of the store while expanding the customer base by introducing online purchasing ability through a publicly accessible website.
<br>
                                <a target="_blank" href="http://bookportal-sachithra.rhcloud.com/login.jsp">The admin system</a> allows multiple user levels of the staff members to log in and perform separate duties within the system and the public website allows customers to view availability of items and purchase items online. The admin system generates monthly and annual reports, manages user notifications, incorporates role based access control, saves user logs and provides an invoice for physical bill issue in addition to controlling the items showcased in the website and managing the online purchase requests. The system is implemented using JSP and MySQL on MVC architecture and guest checkouts are integrated using PayPal.
<br>
Use the following form to request temporary admin panel access credentials.
                            </p>
                             <form id="request-admin-form" class="contact-form row" name="contact-form" method="post">
                                <div class="form-group col-md-6">
                                    <input type="text" name="name" class="form-control" required="required" placeholder="Name*">
                                </div>
                                <div class="form-group col-md-6">
                                    <input type="email" name="email" class="form-control" required="required" placeholder="Email*">
                                </div>
                                <div class="form-group col-md-12">
                                    <textarea name="message" id="message" class="form-control" rows="3" placeholder="Message(optional)"></textarea>
                                </div>                        
                                <div class="form-group col-md-12">
                                    <input type="submit" name="submit" class="btn btn-primary pull-right" value="Submit request">
                                </div>
</form>
                        </div>
                    </div>			 		
                </div>    	

            </div>	
        </div><!--/#contact-page-->

        <%@include file="footer.jsp" %>
    </body>
</html>

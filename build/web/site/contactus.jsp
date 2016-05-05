<%-- 
    Document   : contactus
    Created on : Mar 26, 2016, 9:22:44 PM
    Author     : Sachi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Contact Us</title>
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
                    <li class="active">Shopping Cart</li>
                </ol>
            </div>
            <div class="bg">
                <div class="row">    		
                    <div class="col-sm-12">    			   			
                        <h2 class="title text-center">Contact <strong>Us</strong></h2>    			    				    				

                    </div>			 		
                </div>	
                <div class="row">  	
                    <div class="col-md-4">
                        <div class="contact-form">
                            <h2 class="title text-center">Get In Touch</h2>
                            <div class="status alert alert-success" style="display: none"></div>
                            <form id="main-contact-form" class="contact-form row" name="contact-form" method="post">
                                <div class="form-group col-md-12">
                                    <input type="text" name="name" class="form-control" required="required" placeholder="Name">
                                </div>
                                <div class="form-group col-md-12">
                                    <input type="email" name="email" class="form-control" required="required" placeholder="Email">
                                </div>
                                <div class="form-group col-md-12">
                                    <input type="text" name="subject" class="form-control" required="required" placeholder="Subject">
                                </div>
                                <div class="form-group col-md-12">
                                    <textarea name="message" id="message" required="required" class="form-control" rows="8" placeholder="Your Message Here"></textarea>
                                </div>                        
                                <div class="form-group col-md-12">
                                    <input type="submit" name="submit" class="btn btn-primary pull-right" value="Submit">
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div id="gmap" class="contact-map">
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d15843.872186454464!2d79.8835174598701!3d6.894425522947966!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ae25a215b582afd%3A0xc6f95961e4ad63c7!2sNawala%2C+Sri+Jayawardenepura+Kotte!5e0!3m2!1sen!2slk!4v1461097122043" 
                                     frameborder="0" style="border:0; width: 380px;height: 450px;" allowfullscreen></iframe>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="contact-info">
                            <h2 class="title text-center">Contact Info</h2>
                            <address>
                                <p>BookPortal Inc.</p>
                                <p>935 W. Webster Ave New Streets Chicago, IL 60614, NY</p>
                                <p>Newyork USA</p>
                                <p>Mobile: +2 123 456</p>
                                <p>Fax: 2-123-456</p>
                                <p>Email: info@bookportal.lk</p>
                            </address>
                            <div class="social-networks">
                                <h2 class="title text-center">Social Networking</h2>
                                <ul>
                                    <li>
                                        <a href="#"><i class="fa fa-facebook"></i></a>
                                    </li>
                                    <li>
                                        <a href="#"><i class="fa fa-twitter"></i></a>
                                    </li>
                                    <li>
                                        <a href="#"><i class="fa fa-google-plus"></i></a>
                                    </li>
                                    <li>
                                        <a href="#"><i class="fa fa-youtube"></i></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>    			
                </div>  

            </div>	
        </div><!--/#contact-page-->

        <%@include file="footer.jsp" %>
    </body>

</html>

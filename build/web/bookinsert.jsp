<%-- 
    Document   : bookinsert
    Created on : Apr 15, 2016, 5:00:31 PM
    Author     : Sachi
--%>


<%@page import="Model.User"%>
<%@page import="Model.Subject"%>
<%@page import="Model.Type"%>
<%@page import="Model.Language"%>
<%@page import="sun.reflect.LangReflectAccess"%>
<%@page import="Model.Publisher"%>
<%@page import="Model.Author"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Controller.DBDatalist"%>
<%@page import="Model.Book"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert book</title>
        <link rel="shortcut icon" href="admin/images/logo.png">
        <!-- DATA TABLES -->
        <link href="plugins/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
        <!--<link rel="stylesheet" type="text/css" href="plugins/datatables/media/css/dataTables.bootstrap.css">-->

        <link href="admin/css/bootstrap.min.css" rel='stylesheet' type='text/css' />
        <!-- Custom Theme files -->
        <link href="admin/css/style.css" rel='stylesheet' type='text/css' />
        <link href="admin/css/font-awesome.css" rel="stylesheet"> 
        <script src="admin/js/jquery.min.js"></script>
        <script src="admin/js/bootstrap.min.js"></script>

        <!-- Mainly scripts -->
        <script src="admin/js/jquery.metisMenu.js"></script>
        <script src="admin/js/jquery.slimscroll.min.js"></script>
        <!-- Custom and plugin javascript -->
        <link href="admin/css/custom.css" rel="stylesheet">
        <script src="admin/js/custom.js"></script>
        <script src="admin/js/screenfull.js"></script>
    </head>
    <body>
        <%
            User usr = (User) session.getAttribute("user");
            if (usr.getULevel() == 1) {
        %>
        <%@include file="admin_sidebar.jsp" %>
        <div id="wrapper">
            <!----->

            <div id="page-wrapper" class="gray-bg dashbard-1">
                <div class="content-main">
                    <div class="grid-form" >

                        <div class="grid-form1"> 
                            <div class="col-md-12">
                                <div class="col-md-12">
                                    <%                        if (request.getParameter("msg") != null) {
                                            if (request.getParameter("msg").equals("error")) {
                                    %>
                                    <div class="col-md-12 text-center">
                                        <label class="alert alert-warning"><i class="fa fa-warning"></i> Warning:
                                            Oops! Something went wrong. <br/>Please try again.</label><hr>
                                    </div>
                                    <%
                                        }
                                        if (request.getParameter("msg").equals("success")) {
                                    %>
                                    <div class="col-md-12 text-center">
                                        <label class="alert alert-success"><i class="fa fa-check"></i> Success:
                                            Item added successfully.</label><hr>
                                    </div>
                                    <%
                                            }
                                        }
                                    %>

                                </div>
                                <h3 >Insert book</h3>



                                <!-- - - - - - - - - - - ADD NEW INVENTORY ITEM - - - - - - - - - - - - - - - - -->

                                <form class="form-horizontal" action="savebook" method="POST" enctype="multipart/form-data">


                                    <div class="form-group">
                                        <label class="col-md-3 control-label"> Title :</label>
                                        <div class="col-md-9">
                                            <input class="form-control" name="title" required="">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-3 control-label"> ISBN :</label>
                                        <div class="col-md-9">
                                            <input class="form-control" name="isbn" required="">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <hr>
                                    </div>


                                    <div class="form-group" >
                                        <label class="col-sm-3 control-label">Author 1 : </label>
                                        <label class="col-md-3">

                                            <input type="radio" name="isauth1"  value="exauth1" onclick="selectnew('existingauth1', 'newauth1')" checked="" > Existing author
                                        </label>
                                        <div class="col-sm-6">
                                            <select name="existingauth1" id="existingauth1" class="form-control">
                                                <option value="select" selected="" disabled="">Select..</option>
                                                <%
                                                    ArrayList<Author> arrAuthor = DBDatalist.getAuthorList();
                                                    if (arrAuthor != null) {

                                                        for (int i = 0; i < arrAuthor.size(); i++) {
                                                            Author auth = (Author) arrAuthor.get(i);
                                                %>
                                                <option value="<%=auth.getIdauthor()%>"><%=auth.getName()%></option>
                                                <%
                                                        }
                                                    }
                                                %>
                                            </select>
                                        </div>

                                    </div>
                                    <div class="form-group" >
                                        <label class="col-sm-3 control-label"> </label>
                                        <label class="col-md-3">
                                            <input type="radio" name="isauth1" value="newauth1" onclick="selectnew('newauth1', 'existingauth1')"> New author
                                        </label>
                                        <div class="col-md-6">
                                            <input class="form-control" name="newauth1" id="newauth1" placeholder="Enter the name of new author" disabled="">
                                        </div>

                                    </div>
                                    <div class="form-group">
                                        <hr>
                                    </div>


                                    <div class="form-group" >
                                        <label class="col-sm-3 control-label">Author 2 : </label>
                                        <label class="col-md-3">
                                            <input type="radio" name="isauth2"  value="exauth2" onclick="selectnew('existingauth2', 'newauth2')" checked=""> Existing author
                                        </label>
                                        <div class="col-sm-6">
                                            <select name="existingauth2" id="existingauth2" class="form-control" >
                                                <option value="select" selected="" disabled="">Select..</option>
                                                <%
                                                    if (arrAuthor != null) {

                                                        for (int i = 0; i < arrAuthor.size(); i++) {
                                                            Author auth = (Author) arrAuthor.get(i);
                                                %>
                                                <option value="<%=auth.getIdauthor()%>"><%=auth.getName()%></option>
                                                <%
                                                        }
                                                    }
                                                %>
                                            </select>
                                        </div>

                                    </div>
                                    <div class="form-group" >
                                        <label class="col-sm-3 control-label"> </label>
                                        <label class="col-md-3">
                                            <input type="radio" name="isauth2" value="newauth2" onclick="selectnew('newauth2', 'existingauth2')"> New author
                                        </label>
                                        <div class="col-md-6">
                                            <input class="form-control" name="newauth2" id="newauth2" placeholder="Enter the name of new author" disabled="">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <hr>
                                    </div>



                                    <div class="form-group" >
                                        <label class="col-sm-3 control-label">Author 3 : </label>
                                        <label class="col-md-3">
                                            <input type="radio" name="isauth3"  value="exauth3" onclick="selectnew('existingauth3', 'newauth3')" checked=""> Existing author
                                        </label>
                                        <div class="col-sm-6">
                                            <select name="existingauth3" id="existingauth3" class="form-control" >
                                                <option value="select" selected="" disabled="">Select..</option>
                                                <%
                                                    if (arrAuthor != null) {

                                                        for (int i = 0; i < arrAuthor.size(); i++) {
                                                            Author auth = (Author) arrAuthor.get(i);
                                                %>
                                                <option value="<%=auth.getIdauthor()%>"><%=auth.getName()%></option>
                                                <%
                                                        }
                                                    }
                                                %>
                                            </select>
                                        </div>

                                    </div>
                                    <div class="form-group" id="author3">
                                        <label class="col-sm-3 control-label"> </label>
                                        <label class="col-md-3">
                                            <input type="radio" name="isauth3" value="newauth3" onclick="selectnew('newauth3', 'existingauth3')"> New author
                                        </label>
                                        <div class="col-md-6">
                                            <input class="form-control" name="newauth3" id="newauth3" placeholder="Enter the name of new author" disabled="">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <hr>
                                    </div>


                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Publisher :</label>
                                        <label class="col-md-3">
                                            <input type="radio" name="ispub"  value="expub" onclick="selectnew('existingpub', 'newpub')" checked=""> Existing publisher
                                        </label>
                                        <div class="col-sm-6">
                                            <select name="existingpub" id="existingpub" class="form-control" >
                                                <option value="select" selected="" disabled="">Select..</option>
                                                <%
                                                    ArrayList<Publisher> arrPublisher = DBDatalist.getPublisherList();
                                                    if (arrPublisher != null) {

                                                        for (int i = 0; i < arrPublisher.size(); i++) {
                                                            Publisher auth = (Publisher) arrPublisher.get(i);
                                                %>
                                                <option value="<%=auth.getIdpub()%>"><%=auth.getName()%></option>
                                                <%
                                                        }
                                                    }
                                                %>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group" >
                                        <label class="col-sm-3 control-label"> </label>
                                        <label class="col-md-3">
                                            <input type="radio" name="ispub" value="newpub" onclick="selectnew('newpub', 'existingpub')"> New publisher
                                        </label>
                                        <div class="col-md-6">
                                            <input class="form-control" name="newpub" id="newpub" placeholder="Enter the name of new author" disabled="">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Published date:</label>
                                        <div class="col-md-9">
                                            <input name="pubdate" type="date" class="form-control" required="">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <hr>
                                    </div>


                                    <div class="form-group">
                                        <label class="col-md-3 control-label"> Description :</label>
                                        <div class="col-md-9">
                                            <textarea rows="3" class="form-control" name="description" required="" id="description"></textarea>
                                        </div>
                                    </div>



                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Language :</label>
                                        <div class="col-sm-3">
                                            <select name="language" class="form-control" required="">
                                                <option value="select" selected="" disabled="">Select..</option>
                                                <%
                                                    ArrayList<Language> arrLanguage = DBDatalist.getLanguageList();
                                                    if (arrLanguage != null) {

                                                        for (int i = 0; i < arrLanguage.size(); i++) {
                                                            Language auth = (Language) arrLanguage.get(i);
                                                %>
                                                <option value="<%=auth.getIdlan()%>"><%=auth.getName()%></option>
                                                <%
                                                        }
                                                    }
                                                %>
                                            </select>
                                        </div>
                                        <label class="col-md-3 control-label" > Edition :</label>
                                        <div class="col-md-3">
                                            <input class="form-control" name="edition" required="" id="edition" type="number" value="1">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Type :</label>
                                        <div class="col-sm-3">
                                            <select name="type" id="type" class="form-control" required="" onchange="setsubjects()">
                                                <option value="select" selected="" disabled="">Select..</option>
                                                <%
                                                    ArrayList<Type> arrType = DBDatalist.getTypeList();
                                                    if (arrType != null) {

                                                        for (int i = 0; i < arrType.size(); i++) {
                                                            Type auth = (Type) arrType.get(i);
                                                %>
                                                <option value="<%=auth.getIdType()%>"><%=auth.getName()%></option>
                                                <%
                                                        }
                                                    }
                                                %>
                                            </select>
                                        </div>
                                        <label class="col-sm-3 control-label">Subject :</label>
                                        <div class="col-sm-3">

                                            <select id= "subject" name="subject" class="form-control" required="">
                                                <option value="select" selected="" disabled="">Select..</option>
                                                <%
                                                    ArrayList<Subject> arrSubject = DBDatalist.getSubjectList();
                                                    if (arrSubject != null) {

                                                        for (int i = 0; i < arrSubject.size(); i++) {
                                                            Subject auth = (Subject) arrSubject.get(i);
                                                %>
                                                <option value="<%=auth.getIdsubject()%>"><%=auth.getName()%></option>
                                                <%
                                                        }
                                                    }
                                                %>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Price (Rs.):</label>
                                        <div class="col-md-3">
                                            <input class="form-control" name="price" required="">
                                        </div>
                                        <div class="col-md-6"></div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Image:</label>
                                        <div class="col-md-3">
                                            <input type="radio" name="isdefaultfile"  value="def" onclick="selectnew('defaultfilecover', 'filecover')" > Default Image
                                        </div>

                                        <div class="col-md-6"><input type="hidden" id="defaultfilecover"></div>
                                    </div>
                                    <div class="form-group">

                                        <div class="col-md-3"></div>
                                        <div class="col-md-3">
                                            <input type="radio" name="isdefaultfile"  value="newfile" onclick="selectnew('filecover', 'defaultfilecover')" checked=""> New Image
                                        </div>
                                        <div class="col-md-3">
                                            <input class="form-control" type="file" name="filecover" id="filecover"/>
                                            <!--<p><small>Please use a default image if an image is unavailable</small></p>-->
                                        </div>
                                        <div class="col-md-3"></div>
                                    </div>


                                    <!--<button type="submit" class="btn btn-default">Submit</button>-->

                                    <!--                                                        <form action="NewServlet" method="post" enctype="multipart/form-data">
                                                                                                <input type="file" name="filecover" />
                                                                                                <input type="submit" value="upload" />
                                                                                            </form>   -->
                                    <div class="form-group">
                                        <div class="col-md-3"></div>
                                        <div class="col-md-3"></div>
                                        <div class="col-md-3"></div>
                                        <div class="col-md-3">
                                            <button type="submit" class="btn btn-lg btn-primary pull-right">Add item</button>
                                        </div>

                                    </div>


                                </form>

                            </div>
                            <div class="clearfix"> </div>
                        </div>
                    </div>
                    <%@include file="admin_footer.jsp" %>
                </div>

            </div>
            <div class="clearfix"></div>
        </div>
        <%
        } else {
        %>
        <%@include file="404.jsp" %>
        <%
            }
        %>
        <script src="admin/js/jquery.nicescroll.js"></script>
        <script src="admin/js/scripts.js"></script>

        <!--        <script src="plugins/jQuery/jquery-1.12.2.min.js"></script>
                <script src="plugins/jQueryUI/jquery-ui.js"></script>
        
                <script src="admin/js/bootstrap.min.js"></script>
                 DATA TABES SCRIPT 
                <script src="plugins/datatables/media/js/jquery.dataTables.min.js" type="text/javascript"></script>
                <script src="plugins/datatables/media/js/dataTables.bootstrap.min.js" type="text/javascript"></script>-->


        <!-- jQuery 2.1.4 -->
        <script src="plugins/jQuery/jQuery-2.1.4.min.js"></script>
        <script src="plugins/jQueryUI/jquery-ui.js"></script>
        <!-- Bootstrap 3.3.2 JS -->
        <script src="js/bootstrap.min.js"></script>
        <!-- DATA TABES SCRIPT -->
        <script src="plugins/datatables/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="plugins/datatables/dataTables.bootstrap.min.js" type="text/javascript"></script>

        <script type="text/javascript" src="plugins/jQueryUI/jquery-ui.js"></script>
        <script type="text/javascript" src="js/jquery-ui-1.10.3.custom.min.js"></script>
        <script type="text/javascript" src="js/portBox.slimscroll.min.js"></script>
        <script type="text/javascript" src="js/validation.js"></script>


        <script type="text/javascript">
                                                function removeoptions(selectbox) {
                                                    var i;
                                                    for (i = selectbox.options.length - 1; i >= 0; i--) {
                                                        selectbox.remove(i);
                                                    }
                                                }
                                                function selectnew(el1, el2) {
                                                    document.getElementById(el1).disabled = false;
                                                    document.getElementById(el2).disabled = true;
                                                }

                                                function setsubjects() {
                                                    var typeid = document.getElementById("type").value;
                                                    removeoptions(document.getElementById('subject'));
                                                    if (typeid === '1') {
                                                        var subjectlist = <%= Type.subjectListtoJSArray(1)%>;
                                                    } else if (typeid === '2') {
                                                        var subjectlist = <%= Type.subjectListtoJSArray(2)%>;
                                                    } else if (typeid === '3') {
                                                        var subjectlist = <%= Type.subjectListtoJSArray(3)%>;
                                                    } else if (typeid === '4') {
                                                        var subjectlist = <%= Type.subjectListtoJSArray(4)%>;
                                                    }

                                                    for (i = 0; i < subjectlist.length; i++) {
                                                        el = document.createElement('option');
                                                        el.value = subjectlist[i];
                                                        el.innerHTML = subjectlist[i + 1];
                                                        document.getElementById('subject').appendChild(el);
                                                        i++;
                                                    }
                                                }


        </script>      

    </body>
</html>


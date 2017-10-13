<%@page import="JavaCode.admin.DatabaseInfo"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="JavaCode.admin.DatabaseInfo"%>
<%@page import="DbObjects.School"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <title>Schedule Sharp</title>
        <meta name="generator" content="Bootply" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <!-- Bootstrap core CSS -->
        <link href="./bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="./bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
        <link href="./bootstrap/css/styles.css" rel="stylesheet" type="text/css">
        <link href="http://cdn.datatables.net/1.10.4/css/jquery.dataTables.css" rel="stylesheet">

        <style type='text/css'>
            body {
                padding-top: 70px;
                padding-bottom: 30px;
                background-color: #ffd789;
            }
            .theme-dropdown .dropdown-menu {
                position: static;
                display: block;
                margin-bottom: 20px;
            }
            .theme-showcase > p > .btn {
                margin: 5px 0;
            }
            .theme-showcase .navbar .container {
                width: auto;
            }

            .navbar-custom {
                background-color: #b43c3d;
                color:#ffffff;
                border-radius:0;
                min-height:auto;
            }

            .navbar-custom .navbar-nav > li > a {
                color:#fff;
                padding-left:25px;
                padding-right:25px;
                padding-top:20px;
                padding-bottom:20px;
            }
            .navbar-custom .navbar-nav > .active > a, .navbar-nav > .active > a:hover, .navbar-nav > .active > a:focus {
                color: #ffffff;
                background-color:transparent;
            }

            .navbar-custom .navbar-nav > li > a:hover, .nav > li > a:focus {
                text-decoration: none;
                background-color: #d76c6d;
            }

            .navbar-custom .navbar-brand {
                color:#eeeeee;
                padding:20px;
            }

            .navbar-custom .navbar-toggle,
            .navbar-custom .nav .open>a, .navbar-custom .nav .open>a:hover, .navbar-custom .nav .open>a:focus {
                background-color:transparent;
            }

            .navbar-custom .icon-bar {
                border: 1px solid #fff;                
            }

            /*-- change navbar dropdown color --*/
            .navbar-custom .navbar-nav .open .dropdown-menu>li>a,.navbar-custom .navbar-nav .open .dropdown-menu {
                color:#b43c3d;
            }

            .modal-dialog-index
            {width:400px;margin:20px auto;}
            .modal-content-index
            {position:relative;background-color:#fac150;-webkit-background-clip:padding-box;background-clip:padding-box;border:1px solid #999;border:1px solid rgba(0,0,0,0);border-radius:6px;outline:0;-webkit-box-shadow:0 3px 9px rgba(0,0,0,1);box-shadow:0 3px 9px rgba(0,0,0,1)}
            .modal-content-index
            {-webkit-box-shadow:0 5px 15px rgba(0,0,0,.5);box-shadow:0 5px 15px rgba(0,0,0,.5)}
            .btn-submit{color:#fff;background-color:#de672d;}
            .btn-reg{color:#fff;background-color:#ffe87e;}
            .modal-dialog2{width:800px;margin:30px auto}
            .modal-content2{position:relative;background-color:#fff1a9;-webkit-background-clip:padding-box;background-clip:padding-box;border:1px solid #999;border:1px solid rgba(0,0,0,.2);border-radius:6px;outline:0;-webkit-box-shadow:0 3px 9px rgba(0,0,0,.5);box-shadow:0 3px 9px rgba(0,0,0,.5)}
            .modal-content2{-webkit-box-shadow:0 5px 15px rgba(0,0,0,.5);box-shadow:0 5px 15px rgba(0,0,0,.5)}
            .table-striped2>tbody>tr:nth-child(odd){background-color: #fac150;}

            #main{
                width:100%;
            }
            #search{
                width: 30%;
                float:left;
            }
            #result{
                width: 70%;
                float: right;
            }
        </style>

    </head>

    <body>

        <nav class="navbar navbar-custom navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="StudMain.jsp"><font color="#fac150" face="Showcard Gothic" size="5"><b><i> SCHEDULE # !!</i></b></font></a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="StudMain.jsp">Home</a></li>                       
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">ASSIGNED COURSE<span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="assignedView.jsp">ADD SCHEDULE</a></li>
                                <li class="divider"></li>
                                <li><a href="assignedSearch.jsp">VIEW SCHEDULE</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">DESIRED COURSE<span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="desiredView.jsp">ADD SCHEDULE</a></li>
                                <li class="divider"></li>
                                <li><a href="desiredSearch.jsp">VIEW SCHEDULE</a></li>
                                <li class="divider"></li>
                                <li><a href="http://localhost:8080/ScheduleSharp/SelectAllCourses?redirectTo=viewCourse">VIEW COURSES</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">MY FRIENDS<span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="viewFriend.jsp">VIEW FRIENDS</a></li>
                                <li class="divider"></li>
                                <li><a href="searchFriend.jsp">SEARCH FRIEND</a></li>
                                <li class="divider"></li>
                                <li><a href="viewRequestFriend.jsp">VIEW REQUEST</a></li>
                            </ul>
                        </li>

                        <div class="navbar-brand"><font color="#fac150" size="2">HELLO, ${currentSessionUser.getFirstName()}!</font></div> 
                        <a class="navbar-brand" href="../signout"><font color="#fac150" size="2"><u>SIGN OUT?</u></font></a>
                    </ul>
                </div><!--/.nav-collapse -->
            </div>
        </nav>

        <div id="addSchool" name="addSchool" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
            <div class="modal-dialog">
                <div class="modal-content2">

                    <div id="search">

                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                                <span class="sr-only">Close</span></button>
                            <h4 class="modal-title" id="myModalLabel">Delete School</h4>
                        </div>

                        <!-- DELETE SCHOOL MODAL -->
                        <form onSubmit="return deleteSchool()" >
                            <div class="modal-dialog-index">
                                <div class="modal-content-index">

                                    <div class="modal-body" align='center'>
                                        <div class="control-group warning">
                                            <label class="control-label" for="SchoolID">School ID: </label>
                                            <div class="controls">
                                                <input type="text" id="SchoolID" name="SchoolID">
                                                <span class="help-inline"></span>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <button type="submit" class="btn btn-submit btn-lg">Delete School</button>
                            </div>

                        </form>
                    </div>
                </div>


            </div>
        </div>

        <div id="main">
            <div id="myTabContent" class="tab-content" style="width:95%;margin-left:auto;margin-right:auto">
                

                        <div align="center" style="vertical-align:bottom">
                            <div align="center" style="vertical-align:bottom">
                                <table class="table table-striped result">
                                    <thead>
                                        <tr>
                                            <th><div align="center">Course ID</div></th>
                                    <th><div align="center">Course Code</div></th>
                                    <th><div align="center">Section ID</div></th>
                                    <th><div align="center">Course Name</div></th>
                                    <th><div align="center">Instructor</div></th>
                                    <th><div align="center">Schedule Block</div></th>
                                    <th><div align="center">Year</div></th>
                                    <th><div align="center">Semester</div></th>
                                    </tr>  
                                    </thead>
                                    <tbody>
                                        <c:forEach var="i" items="${crs}">
                                            <tr>
                                                <td>${i.getCourseID()}</td>
                                                <td>${i.getCourseN()}</td>
                                                <td>${i.getSection()}</td>
                                                <td>${i.getCourseName()}</td>
                                                <td>${i.getInstructor()}</td>
                                                <td>${i.getBlocks()}</td>
                                                <td>${i.getYear()}</td>
                                                <td>${i.getSemester()}</td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div> 
                    </div>
                </div>


        <!-- script references -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="./bootstrap/js/bootstrap.min.js"></script>
        <script src="./bootstrap/js/docs.min.js"></script>
        <script src="http://cdn.datatables.net/1.10.4/js/jquery.dataTables.min.js"></script>
        <script>
                        $(document).ready(function () {
                            $('.result').DataTable();
                        });
        </script>

        <script>
            function deleteSchool() {
                var ID = document.getElementById("SchoolID");
                alert("made it");
                var url = "http://localhost:8080/ScheduleSharp/DeleteSchool?SchoolID=" + ID.value;

                req = new XMLHttpRequest();
                req.open("GET", url, false);
                req.send(null);

                if (req.readyState === 4 && req.status === 200) {
                    if (req.responseText != "ok") {
                        alert("School wasn't deleted");
                    }
                    else {
                        alert("School deleted!");
                    }
                }
            }



            /*function deleteRow(r) {
             var i = r.parentNode.parentNode.rowIndex;
             var j = document.getElementById("myTable").getAttribute("name");
             alert("in here");
             alert("i is " + i + "j is " + j);
             //.deleteRow(i);
             }*/

        </script>
    </body>
</html>

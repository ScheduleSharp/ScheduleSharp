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
                    <a class="navbar-brand" href="AdminMain.jsp"><font color="#fac150" face="Showcard Gothic" size="5"><b><i> SCHEDULE # !!</i></b></font></a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="AdminMain.jsp">Home</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">MANAGE SCHOOL <span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="http://localhost:8080/ScheduleSharp/SelectAllSchools?redirectTo=addSchool">ADD SCHOOL</a></li>
                                <li class="divider"></li>
                                <li><a href="http://localhost:8080/ScheduleSharp/SelectAllSchools?redirectTo=modifySchool">MODIFY SCHOOL</a></li>
                                <li class="divider"></li>
                                <li><a href="http://localhost:8080/ScheduleSharp/SelectAllSchools?redirectTo=deleteSchool">DELETE SCHOOL</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">MANAGE STUDENT <span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="http://localhost:8080/ScheduleSharp/SelectAllStudents?redirectTo=viewStudentAccountRequests">ACCOUNT REQUEST</a></li>
                                <li class="divider"></li>
                                <li><a href="http://localhost:8080/ScheduleSharp/SelectAllStudents?redirectTo=deleteStudentAccount">DELETE ACCOUNT</a></li>
                            </ul>
                        </li>
                    </ul>
                    <li>
                         <a class="navbar-brand" href="../signoutAdmin"><font color="#fac150" size="2"><u>SIGN OUT?</u></font></a>
                    </li>
                </div><!--/.nav-collapse -->
            </div>
        </nav>

        <div id="main">
            <div align="center" style="vertical-align:bottom;">
                <div align="center" style="vertical-align:bottom">   
                    <div id="myTabContent" class="tab-content" style="width:70%">

                        <h3>Student Account Requests</h3>
                        <div align="center" style="vertical-align:bottom">
                            <div align="center" style="vertical-align:bottom">
                                <table id="accountRequestsTable" class="table table-striped result">
                                    <thead>
                                        <tr>
                                            <th><div align="center"><input type="checkbox" name="approve" class="selectall"/></div></th>
                                    <th><div align="center">Student ID</div></th>
                                    <th><div align="center">User Name</div></th>
                                    <th><div align="center">First Name</div></th>
                                    <th><div align="center">Last Name</div></th>
                                    <th><div align="center">Email</div></th>
                                    <th><div align="center">Approved</div></th>
                                    <th><div align="center">
                                        <button id="acceptSelected" type="button" class="btn btn-warning btn-xs">ACCEPT Checked</button>
                                    </div></th>
                                    <th><div align="center">
                                        <button id="rejectSelected" type="button" class="btn btn-danger btn-xs">DELETE Checked</button>
                                    </div></th>
                                    </tr>  
                                    </thead>
                                    <tbody>
                                        <c:forEach var="i" items="${student}">
                                            <tr id="${i.getStudentID()}">   
                                                <td><div align="center"><input type="checkbox" name="approve"/></div></td>
                                                <td>${i.getStudentID()}</td>
                                                <td>${i.getUserName()}</td>
                                                <td>${i.getFirstName()}</td>
                                                <td>${i.getLastName()}</td>
                                                <td>${i.getEmail()}</td>
                                                <td>${i.getApproved()}</td>
                                                <td><div align="center"><a href="../AcceptStudent?studentID=${i.getStudentID()}">
                                                            <button type="button" class="btn btn-danger btn-xs">ACCEPT</button></a>
                                                    </div></td>
                                                <td><div align="center"><a href="../RejectStudent?studentID=${i.getStudentID()}">
                                                            <button type="button" class="btn btn-danger btn-xs">REJECT</button></a>
                                                    </div></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div> 

                    </div>
                </div><!-- /example -->
            </div>
        </div>

        <!-- script references -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="./bootstrap/js/bootstrap.min.js"></script>
        <script src="./bootstrap/js/docs.min.js"></script>
        <script src="http://cdn.datatables.net/1.10.4/js/jquery.dataTables.min.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>        
        <script>
            $(document).ready(function () {
                $('.result').DataTable();
            });
        </script>


        <script>
            $('.selectall').click(function () {
                if ($(this).is(':checked')) {
                    $('div input').prop('checked', true);
                } else {
                    $('div input').prop('checked', false);
                }
            });

            var data = new Array();
            var i = 0;
            function useAjax(data) {
                var j, param = "";
                for (j = 0; j < data.length; j++) {
                    param += data[j] + "-";
                }

                var url = "http://localhost:8080/ScheduleSharp/AcceptStudent?IDs=" + param;

                req = new XMLHttpRequest();
                req.open("GET", url, false);
                req.send(null);

                if (req.readyState === 4 && req.status === 200) {

                    /*if (req.responseText != "ok") {
                     //window.location.reload(true);
                     alert("NOO");
                     } else {*/
                    alert("Student(s) accepted!");
                    location.reload();
                    //}
                }
            }

            $(document).on('click', '#acceptSelected', function () {
                //$('#acceptSelected').click(function () {
                $('#accountRequestsTable').find('tr').each(function () {
                    var row = $(this);
                    if (row.find('input[type="checkbox"]').is(':checked')) {
                        data[i] = row.attr('id');
                        //alert(data[i]);
                        i++;
                    }
                });
                useAjax(data);
            });

            /*alert("going in");
             $.ajax({
             type: "GET",
             url: "AcceptStudent",
             data: {IDs: data},
             success: function () {
             window.location.reload(true);
             //alert("Email sent");
             }
             });
             alert("going out");*/
        </script>

    </body>
</html>

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
        <link href="./bootstrap/css/bootstrap.css" rel="stylesheet">
        <link href="./bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
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
            {width:460px;margin:20px auto;}
            .modal-content-index
            {position:relative;background-color:#fac150;-webkit-background-clip:padding-box;background-clip:padding-box;border:1px solid #999;border:1px solid rgba(0,0,0,0);border-radius:6px;outline:0;-webkit-box-shadow:0 3px 9px rgba(0,0,0,1);box-shadow:0 3px 9px rgba(0,0,0,1)}
            .modal-content-index
            {-webkit-box-shadow:0 5px 15px rgba(0,0,0,.5);box-shadow:0 5px 15px rgba(0,0,0,.5)}
            .btn-submit{color:#fff;background-color:#de672d;}
            .btn-reg{color:#fff;background-color:#ffe87e;}
            .modal-dialog2{width:800px;margin:30px auto}

            .modal-content{position:relative;background-color:#fff1a9;-webkit-background-clip:padding-box;background-clip:padding-box;border:1px solid #999;border:1px solid rgba(0,0,0,.2);border-radius:6px;outline:0;-webkit-box-shadow:0 3px 9px rgba(0,0,0,.5);box-shadow:0 3px 9px rgba(0,0,0,.5)}
            .modal-content{-webkit-box-shadow:0 5px 15px rgba(0,0,0,.5);box-shadow:0 5px 15px rgba(0,0,0,.5)}
            .table-striped2>tbody>tr:nth-child(odd){background-color: #fac150;}

            #main{
                width:100%;
            }
            #search{
                width: 33%;
                float:left;
            }
            #result{
                width: 67%;
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
            <div align="center" style="vertical-align:bottom">
                <div align="center" style="vertical-align:bottom">
                    <div id="myTabContent" class="tab-content" style="width:95%">
                        <h3>Modify School</h3>
                        <!--<button type="button" class="btn-lg btn-submit" data-toggle="modal" data-target="#static">
                            Modify Schedule Block
                        </button>-->
                        <div align="center" style="vertical-align:bottom">
                            <div align="center" style="vertical-align:bottom">
                                <table id="newtable" class="table table-striped result">
                                    <thead>
                                        <tr>
                                            <th><div align="center">School ID</div></th>
                                    <th><div align="center">School Name</div></th>
                                    <th><div align="center">Total Semester</div></th>
                                    <th><div align="center">Total Days</div></th>
                                    <th><div align="center">Total Period</div></th>
                                    <th><div align="center">Lunch Range</div></th>
                                    <th><div align="center">Modify</div></th>
                                    </tr>  
                                    </thead>
                                    <tbody>
                                        <c:forEach var="i" items="${s}">
                                            <tr id="${i.getSchoolID()}">      
                                                <td>${i.getSchoolID()}</td>
                                                <td>${i.getSchoolName()}</td>
                                                <td>${i.getSemester()}</td>
                                                <td>${i.getDays()}</td>
                                                <td>${i.getPeriod()}</td>
                                                <td>${i.getRangeLunch()}</td>
                                                <td><button id="modifyButton" name="modifyButton" type="button" class="mybutton btn btn-danger btn-xs">MODIFY</button> </td>
                                                <!--<td><div align="center">
                                                        <button id="modifyButton" name="modify" type="button" class="btn btn-danger btn-xs">MODIFY</button>
                                                    </div></td>
                                                <td> <button id="modifyButton" name="modify" type="submit" style="" class="btn btn-danger btn-xs" data-toggle="modal" data-target="#editModal" >MODIFY</button>
                                                </td>-->
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div> 

                    </div>

                </div>
            </div>
        </div>

        <div class="modal fade" id="static" name="static" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title" id="myModalLabel">Editing Schedule Blocks </h4>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label class="col-sm-3 control-label">Enter school ID:</label>
                            <div class="col-sm-5">
                                <input type="text" class="form-control" name="schoolIDBlocks" id="schoolIDBlocks" value=""/>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" id="schoolIDForBlocks" name="changeButton" class="btn btn-primary">Get Blocks</button>
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> 
                    </div>
                </div>
            </div>
        </div>

        <!-- EditModal -->
        <div class="modal fade" id="editModal" name="editModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title" id="myModalLabel">Editing Information </h4>
                    </div>
                    <form id="updateInformation" method="post" class="form-horizontal" action="modifySchool.jsp">
                        <div class="modal-body">
                            <!-- The form is placed inside the body of modal -->
                            <input type="hidden" id="schoolID" name="schoolID" value=""> 
                            <div class="form-group">
                                <label class="col-sm-3 control-label">School Name</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" name="SchoolName" id="SchoolName" value="" onBlur="validateSchoolName()"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Semester</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" name="Semester" id="Semester" value=""/>
                                </div>
                            </div> 
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Days</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" name="Days" id="Days" value=""/>
                                </div>
                            </div> 
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Period</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" name="Period" id="Period" value=""/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-3 control-label">Lunch Range</label>
                                <div class="col-sm-5">
                                    <input type="text" class="form-control" id="LunchRange" name="LunchRange" value=""/>
                                </div>
                            </div>
                        </div> 
                        <div class="col-sm-5"><span style="color: red" id ="schoolMessage"></span></div>
                        <div class="modal-footer">
                            <button type="button" id="changeButton" name="changeButton" class="btn btn-primary">Change</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> 
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- EditModal -->



        <!-- script references -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="./bootstrap/js/bootstrap.min.js"></script>
        <script src="./bootstrap/js/docs.min.js"></script>
        <script src="http://cdn.datatables.net/1.10.4/js/jquery.dataTables.min.js"></script>
        <script>
                                        $(document).on('click', '#schoolIDForBlocks', function () {
                                            //schoolIDForBlocks
                                            var id = document.getElementById("schoolIDBlocks");
                                            alert(id.value);
                                        });

                                        $(document).ready(function () {
                                            $('.result').DataTable();
                                            var scheduleBlock = [];
                                        });
                                        var buttons = document.querySelectorAll('#newtable tbody .mybutton');
                                        var id = 0;
                                        var i = 0;
                                        var info = new Array();     // ARRAY WILL STORE VALUES TO BE DISPLAYED IN MODAL

                                        // TERRIBLE WAY TO STORE VALUES TO BE SENT TO SERVLET
                                        var schoolID = 0;
                                        var sName = "";
                                        var semester = 0;
                                        var days = 0;
                                        var period = 0;
                                        var lunchRange = "";

                                        function modifySchoolServlet() {

                                            var url = "http://localhost:8080/ScheduleSharp/modifySchool?SchoolName=" + sName
                                                    + "&Semester=" + semester + "&Days=" + days + "&Period=" + period
                                                    + "&lunchRange=" + lunchRange + "&SchoolID=" + schoolID;
                                            req = new XMLHttpRequest();
                                            req.open("GET", url, false);
                                            req.send(null);

                                            if (req.readyState === 4 && req.status === 200) {
                                                alert("Successfully modified school!");
                                                location.reload();
                                            }
                                        }

                                        // 'CHANGE' BUTTON CLICKED
                                        $(document).on('click', '#changeButton', function () {
                                            sName = $('#SchoolName').val();
                                            semester = $('#Semester').val();
                                            days = $("#Days").val();
                                            period = $("#Period").val();
                                            lunchRange = $("#LunchRange").val();
                                            modifySchoolServlet();
                                        });

                                        //  GRAB INFO FROM TABLE TO DISPLAY ON MODAL
                                        function callThis() {
                                            var temp = document.getElementById("newtable").rows[id].cells.length;

                                            for (var j = 0; j < temp - 1; j++) {   // -1 because we don't want the innerHTML of the 'MODIFY' button
                                                info[j] = document.getElementById("newtable").rows[id].cells.item(j).innerHTML;
                                            }
                                            // TERRIBLE WAY TO DIPLAY INFO IN MODAL
                                            schoolID = info[0];
                                            $("#SchoolName").val(info[1] + "");
                                            $("#Semester").val(info[2] + "");
                                            $("#Days").val(info[3] + "");
                                            $("#Period").val(info[4] + "");
                                            $("#LunchRange").val(info[5] + "");
                                            $("#editModal").modal("show").addClass("fade");
                                        }

                                        // ADDING A LISTENER TO EVERY BUTTON
                                        function buttonClicked(e) {
                                            var button = this,
                                                    cell = button.parentElement,
                                                    row = cell.parentElement,
                                                    firstCell = row.querySelector('td');
                                            id = firstCell.innerHTML;
                                            callThis();
                                        }
                                        // ADDING A LISTENER TO EVERY BUTTON
                                        for (var i = 0; i < buttons.length; i++) {
                                            buttons[i].addEventListener('click', buttonClicked);
                                        }


                                        function validateSchoolName() {
                                            var school = document.getElementById("SchoolName");
                                            var message = document.getElementById("schoolMessage");
                                            var url = "http://localhost:8080/ScheduleSharp/modifySchoolValidation?name=" + school.value + "&ID=" + schoolID;
                                            var req = new XMLHttpRequest();
                                            req.open("GET", url, false);
                                            req.send(null);

                                            if (req.readyState === 4 && req.status === 200) {
                                                if (req.responseText !== "ok") {
                                                    message.innerHTML = req.responseText;
                                                    //messageFinal = "Error: Please review the information again.";
                                                    school.focus();
                                                    //return false;
                                                } else {
                                                    message.innerHTML = "";
                                                    //messageFinal = "";
                                                    //return true;
                                                }
                                            }
                                        }
        </script>

    </body>
</html>
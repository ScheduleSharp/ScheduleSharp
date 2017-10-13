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

            table{
                margin-left:auto;
                margin-right:auto;
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

        <div id="confirmation" name="confirmation" class="modal fade" tabindex="-1" data-backdrop="false" role="dialog">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">×</button>
                <h4 id="title" name="title" class="modal-title">Title</h4>
            </div>
            <div id="body" name="body" class="modal-body">
                <p>My modal content</p>
            </div>
            <div class="modal-footer">
                <button class="btn" data-dismiss="modal">Close</button>
            </div>
        </div>

        <div id="main">
            <div id="myTabContent" class="tab-content" style="width:95%;margin-left:auto;margin-right:auto">
                <div align="center" style="vertical-align:bottom">
                    <div align="center" style="vertical-align:bottom">
                        <div align="center" style="margin:15px">
                            <button type="button" class="btn btn-sch btn-nosch" data-toggle="modal" data-target="#addSchool"><h3>Add School</h3></button>
                            &nbsp;&nbsp;&nbsp;&nbsp;</div>

                        <div align="center" style="vertical-align:bottom">
                            <div align="center" style="vertical-align:bottom">
                                <table class="table table-striped result">
                                    <thead>
                                        <tr>
                                            <th><div align="center">School ID</div></th>
                                    <th><div align="center">School Name</div></th>
                                    <th><div align="center">Total Semester</div></th>
                                    <th><div align="center">Total Days</div></th>
                                    <th><div align="center">Total Period</div></th>
                                    <th><div align="center">Lunch Range</div></th>

                                    </tr>  
                                    </thead>
                                    <tbody>
                                        <c:forEach var="i" items="${s}">
                                            <tr>      
                                                <td>${i.getSchoolID()}</td>
                                                <td>${i.getSchoolName()}</td>
                                                <td>${i.getSemester()}</td>
                                                <td>${i.getDays()}</td>
                                                <td>${i.getPeriod()}</td>
                                                <td>${i.getRangeLunch()}</td>
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

        <!-- ADD SCHOOL MODAL BEGIN -->
        <div id="addSchool" name="dialog-ok" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-content-index">

                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
                        <span class="sr-only">Close</span></button>
                    <h4 class="modal-title" id="myModalLabel">Add School</h4>
                </div>

                <form class="form-horizontal form-inline" role="form" onSubmit="return sendDataToServlet()">
                    <div class="modal-body" align='center'>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">School Name: </label>
                            <div class="controls col-sm-6">
                                <input type="text" class="form-control" id="SchoolName" name="SchoolName" onBlur="validateSchoolName()">
                            </div>
                        </div>
                        <br>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">Semester(s): </label>
                            <div class="col-sm-8">
                                <select id="Semester" name="Semester" class="form-control" onBlur="validateSemester()">
                                </select>
                            </div>
                        </div>
                        <br><br>
                        <div class="form-group">
                            <label class="col-sm-6 control-label">Days Per Week: </label>
                            <div class="col-sm-2">
                                <select id="Days" name="Days" class="form-control" onBlur="validateDays()">
                                </select>
                            </div>
                        </div>
                        <br>
                        <div class="form-group">
                            <label class="col-sm-4 control-label">Total Periods: </label>
                            <div class="col-sm-8">
                                <select id="Period" name="Period" class="form-control" onBlur="validatePeriods()">
                                </select>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-4 control-label">Lunch Range: </label>
                            <div class="col-sm-8">
                                <select id="RangeLunch1" name="RangeLunch1"  class="form-control" style="width:50px" onBlur="validateLunchRange1()">
                                </select>
                                <span> To </span>
                                <select id="RangeLunch2" name="RangeLunch2"  class="form-control" style="width:50px" onBlur="validateLunchRange2()">
                                </select>
                            </div>
                        </div>
                        <div>
                            <span style="color: red" id ="schoolMessage"> </span>
                            <span style="color: red" id ="semesterMessage"> </span>
                            <span style="color: red" id ="daysMessage"> </span>
                            <span style="color: red" id ="periodsMessage"> </span>
                            <span style="color: red" id ="rangeLunch1Message"> </span>
                            <span style="color: red" id ="rangeLunch2Message"> </span>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="submit" id="addDialogButton" class="btn btn-default">Add</button>
                    </div>

                </form>
            </div>
        </div>
        <!-- ADD SCHOOL MODAL END -->

        <div id="dialog2" name="dialog2" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
            <div class="modal-dialog modal-content-index">
                <div class="modal-header">
                    <h4 class="modal-title">Please enter the schedule blocks (Eg. "Period 1; Day 1, 2" - 1;1,2)</h4>
                </div>
                <div class="modal-body" align="center">
                    <div class="input_fields_wrap">
                        <button class="add_field_button">Add More Fields</button>
                        <!--<div><input type="text" name="mytext[]"></div>-->
                    </div>
                </div>
                <div> <span style="color: red" id ="blockMessage"> </span></div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" id="test">OK</button> 
                    <button type="button" class="btn btn-default" id="close" data-dismiss="modal">CLOSE</button>
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
            var rangeLunch = 0;
            //var messageFinal = "";
            function validateSchoolName() {
                var school = document.getElementById("SchoolName");
                var message = document.getElementById("schoolMessage");
                var url = "http://localhost:8080/ScheduleSharp/addSchoolValidation?name=" + school.value;
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

            function validateSemester() {
                var semester = $('#Semester');
                var message = document.getElementById("semesterMessage");
                if (semester.length == 0 || $(semester).val() == "")
                {
                    message.innerHTML = "Semester: Please select one of the choices.";
                    //messageFinal = "Error: Please review the information again.";
                    semester.focus();
                    //return false;
                } else {
                    message.innerHTML = "";
                    //messageFinal = "";
                    //return true;
                }
            }

            function validateDays() {
                var days = $('#Days');
                var message = document.getElementById("daysMessage");
                if (days.length == 0 || $(days).val() == "") {
                    message.innerHTML = "Days Per Week : Please select one of the choices.";
                    //messageFinal = "Error: Please review the information again.";
                    days.focus();
                    //return false;
                } else {
                    message.innerHTML = "";
                    //messageFinal = "";
                    //return true;
                }
            }

            function validatePeriods() {
                var periods = $('#Period');
                var message = document.getElementById("periodsMessage");
                if (periods.length == 0 || $(periods).val() == "") {
                    message.innerHTML = "Periods : Please select one of the choices.";
                    //messageFinal = "Error: Please review the information again.";
                    periods.focus();
                    //return false;
                } else {
                    message.innerHTML = "";
                    //messageFinal = "";
                    //return true;
                }
            }

            function validateLunchRange1() {
                var rangeLunch1 = $('#RangeLunch1');
                var message = document.getElementById("rangeLunch1Message");
                if (rangeLunch1.length == 0 || $(rangeLunch1).val() == "") {
                    message.innerHTML = "Lunch Range (1) : Please select one of the choices.";
                    //messageFinal = "Error: Please review the information again.";
                    rangeLunch1.focus();
                    //return false;
                } else {
                    message.innerHTML = "";
                    //messageFinal = "";
                    rangeLunch = rangeLunch1;
                    //return true;
                }
            }

            function validateLunchRange2() {

                var rangeLunch2 = $('#RangeLunch2');
                var message = document.getElementById("rangeLunch2Message");
                if (rangeLunch2.length == 0 || $(rangeLunch2).val() == "") {
                    message.innerHTML = "Lunch Range (2) : Please select one of the choices.";
                    messageFinal = "Error: Please review the information again.";
                    rangeLunch2.focus();
                    //return false;
                } else if ($(rangeLunch2).val() < rangeLunch.value) {
                    message.innerHTML = "Lunch Range (2) : Please select a value higher than the first one.";
                    messageFinal = "Error: Please review the information again.";
                    rangeLunch2.focus();
                    //return false;
                } else {
                    messageFinal = "";
                    message.innerHTML = "";
                    //return true;
                }
            }
        </script>

        <script>
            /*var sName = "";
            var days = 0;
            var rLunch1 = 0;
            var rLunch2 = 0;
            var semester = 0;
            var period = 0;
            var scheduleBlocks = new Array();
            var schoolBlocks = "";*/

            // DYNAMICALLY SET THE VALUES FOR THE DROPDOWN
            $(document).ready(function () {
                $("#Semester").append("<option>" + "</option>");
                $("#Days").append("<option>" + "</option>");
                $("#Period").append("<option>" + "</option>");
                $("#RangeLunch1").append("<option>" + "</option>");
                $("#RangeLunch2").append("<option>" + "</option>");

                for (i = 1; i <= 9; i++) {
                    if (i <= 7) {
                        $("#Days").append("<option>" + i + "</option>");
                        if (i <= 4) {
                            $("#Semester").append("<option>" + i + "</option>");
                        }
                    }

                    $("#Period").append("<option>" + i + "</option>");
                    $("#RangeLunch1").append("<option>" + i + "</option>");
                    $("#RangeLunch2").append("<option>" + i + "</option>");
                }
            });
            /*
            // TRANSITION FROM FIRST MODAL TO SECOND
            function showDialog2() {
                $("#addSchool").removeClass("fade").modal("hide");
                validateForm();
                //alert("days " + days.value + " periods " + period.value);

                for (i = 0; i < days.value; i++) {
                    scheduleBlocks[i] = new Array();
                    for (j = 0; j < period.value; j++) {
                        scheduleBlocks[i][j] = 0;
                    }
                }
                $("#dialog2").modal("show").addClass("fade");
            }

            // WHEN 'ADD SCHOOL' BUTTON ON FIRST MODAL IS CLICKED
            $("#addDialogButton").on("click", function () {
                showDialog2();
            });
            
            // WHEN 'OK' ON SECOND MODAL IS CLICKED
            $("#test").on("click", function () {
                // SHOULDN'T WORK THERE IS ONLY ONE CLASS
                $('input[name^=dt]').each(function () { // go through each input field in second modal
                    var temp = this.value;
                    schoolBlocks += temp;
                    schoolBlocks += "_";
                    var index = temp.indexOf(";");
                    var dayy = temp.substring(0, index);
                    var periodd = temp.substring(index + 1).split(",");

                    var j = 0;
                    while (j < periodd.length) {
                        scheduleBlocks[dayy - 1][periodd[j] - 1] = 1;
                        j += 1;
                    }
                });

                var result = true;
                for (var i = 0; i < scheduleBlocks.length; i++) {
                    var scheduleBlock = scheduleBlocks[i];
                    for (var j = 0; j < scheduleBlock.length; j++) {
                        if (scheduleBlock[j] === 0) {
                            result = false;
                        }
                    }
                }

                if (result === true) {
                    $(".modal-backdrop").fadeOut("slow");
                } else {
                    var message = document.getElementById("blockMessage");
                    message.innerHTML = "Schedule Blocks Error : Please check your input again";
                }

            });
            
            // ALLOWING THE USER TO ADD FIELDS ON SECOND MODAL
            $(document).ready(function () {
                var max_fields = 20; //maximum input boxes allowed
                var wrapper = $(".input_fields_wrap"); //Fields wrapper
                var add_button = $(".add_field_button"); //Add button ID

                var x = 1; //initlal text box count
                $(add_button).click(function (e) {
                    e.preventDefault();
                    if (x < max_fields) { //max input box allowed
                        $(wrapper).append('<div><input type="text" name="dt[]"/></div>'); //add input box  - <a href="#" class="remove_field">Remove</a>
                        x++; //text box increment
                    }
                });
                 $(wrapper).on("click", ".remove_field", function (e) { //user click on remove text
                 e.preventDefault();
                 $(this).parent('div'  });
                 ).remove();
                 x--;
                 })
            });*/
            var check = 1;
            function validateSchoolNameLastTime() {
                var school = document.getElementById("SchoolName");
                var url = "http://localhost:8080/ScheduleSharp/addSchoolValidation?name=" + school.value;
                var req = new XMLHttpRequest();
                req.open("GET", url, false);
                req.send(null);

                if (req.readyState === 4 && req.status === 200) {
                    if (req.responseText !== "ok") {
                        alert("School already exists!");
                        check = -1;
                    } else {
                        check = 1;
                    }
                }
            }

            function sendDataToServlet() {
                validateSchoolNameLastTime();   // concurrency
                var sName = document.getElementById("SchoolName");
                var days = document.getElementById("Days");
                var rLunch1 = document.getElementById("RangeLunch1");
                var rLunch2 = document.getElementById("RangeLunch2");
                var semester = document.getElementById("Semester");
                var period = document.getElementById("Period");
                
                if (check === 1) {      // ALL PRIOR TESTS HAVE PASSED
                    var url = "http://localhost:8080/ScheduleSharp/AddSchool?SchoolName=" + sName.value
                            + "&Semester=" + semester.value + "&Days=" + days.value + "&Period=" + period.value
                            + "&RangeLunch1=" + rLunch1.value + "&RangeLunch2=" + rLunch2.value;
                    req = new XMLHttpRequest();
                    req.open("GET", url, false);
                    req.send(null);
                    if (req.readyState === 4 && req.status === 200) {
                        alert("Successfully added!");
                        location.reload();
                    } else {
                        alert(req.readyState + " " + req.status)
                    }
                }
            }

            // ADDS INFO TO DB
            function validateForm() {
                sendDataToServlet();
            }
        </script>

    </body>
</html>

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

        <script src='//code.jquery.com/jquery-1.11.0.js'></script>
        <style type='text/css'>
            body {
                padding-top: 20px;
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
            {width:300px;margin:20px auto;}
            .modal-content-index
            {position:relative;background-color:#fcd059;-webkit-background-clip:padding-box;background-clip:padding-box;border:1px solid #999;border:1px solid rgba(0,0,0,0);border-radius:6px;outline:0;-webkit-box-shadow:0 3px 9px rgba(0,0,0,1);box-shadow:0 3px 9px rgba(0,0,0,1)}
            .modal-content-index
            {-webkit-box-shadow:0 5px 15px rgba(0,0,0,.5);box-shadow:0 5px 15px rgba(0,0,0,.5)}
            .btn-submit{color:#fff;background-color:#fa6450;}
            .btn-reg{color:#fff;background-color:#ff8e29;}
            .modal-dialog2{width:80%;margin:30px auto}
            .modal-dialog3{width:60%;margin:30px auto}
            .modal-content2{position:relative;background-color:#fff1a9;-webkit-background-clip:padding-box;background-clip:padding-box;border:1px solid #999;border:1px solid rgba(0,0,0,.2);border-radius:6px;outline:0;-webkit-box-shadow:0 3px 9px rgba(0,0,0,.5);box-shadow:0 3px 9px rgba(0,0,0,.5)}
            .modal-content2{-webkit-box-shadow:0 5px 15px rgba(0,0,0,.5);box-shadow:0 5px 15px rgba(0,0,0,.5)}
            .table-striped2>tbody>tr:nth-child(odd){background-color: #ffa68b;}
            .btn-fr{background-color: #b43c3d}
            //.table-striped2>tbody>tr:nth-child(even){background-color: #ffe2aa;}
            #main{
                width:100%;
            }
            #search{
                width: 25%;
                float:left;
            }
            #result{
                width: 75%;
                float: right;
            }
            .table-sch, .th-sch, .td-sch{
                border: 1px solid #fa6450;
                border-collapse: collapse;
            }
            .th-sch, .td-sch{
                padding: 1px;
                text-align: center;
            }

            .btn-sch{
                width: 140px; 
                height : 140px;
            }

            .btn-nosch{
                background-color: #ffe7b6;
            }
            .btn-color1{
                background-color: #a2d7d8;
            }
            .btn-color2{
                background-color: #bfe1bf;
            }
            .btn-color3{
                background-color: #ededea;
            }
            .btn-color4{
                background-color: #fcd059;
            }
            .btn-color5{
                background-color: #de5842;
            }
            .btn-color6{
                color: #eeeeee;
                background-color: #5db89d;
            }
            .outbox {
                border: 3px dashed #c51230;
                padding: 10px 40px; 
                background: #ffcdb7;
                width:95%;
                border-radius: 25px;
                opacity: 0.93;
            }
        </style>
    </head>
    <body>   
        <div align="center"><h4>YOUR INPUTTED COURSE IS NOT AVAILABLE<br>
                HERE IS MORE OPTIONS!</h4><br>

            <ul id="myTab" class="nav nav-tabs" role="tablist" style="width:90%">
                <li role="presentation" class="active"><a href="#newCourse" id="newCourse-tab" role="tab" data-toggle="tab" aria-controls="newCourse" aria-expanded="true"><b>ADD NEW COURSE</b></a></li>
                <li role="presentation"><a href="#Section" id="Section-tab" role="tab" data-toggle="tab" aria-controls="Section"><b>SECTION OPTION</b></a></li>
                <li role="presentation"><a href="#Block" id="Block-tab" role="tab" data-toggle="tab" aria-controls="Block"><b>COURSE OPTION</b></a></li>
            </ul>

            <div id="myTabContent" class="tab-content" style="width:88%">
                <div role="tabpanel" class="tab-pane fade in active" id="newCourse" aria-labelledby="newCourse-tab">       
                    <div class="show" tabindex="-1" role="dialog" aria-hidden="true" >   <Br><Br>
                       <form>
                            <table class="table table-striped2">
                                <tbody>
                                    <tr>
                                        <td><b>YEAR</b></td>
                                        <td><div align="center"><input name="YEAR" id="YEAR" type="text" class="form-control" value="2015" readonly></div></td>
                                        <td><b>SEMESTER</b></td>
                                        <td><div align="center"><input name="SEMESTER" id="SEMESTER" type="text" class="form-control" value="FALL" readonly></div></td>
                                    </tr>
                                    <tr>
                                        <td><b>COURSE ID</b></td>
                                        <td><div align="center"><input name="CourseID" id="CourseID" type="text" class="form-control" value=${CourseID} readonly></div></td>
                                        <td><b>SECTION NUMBER</b></td>
                                        <td><div align="center"><input name="SectionNum" id="SectionNum" type="text" class="form-control" value=${SectionID} readonly></div></td>
                                    </tr>
                                    <tr>
                                        <td><b>COURSE NAME</b></td>
                                        <td><div align="center"><input name="CourseName" id="CourseName" type="text" class="form-control" placeholder="COURSE NAME" required></div></td>
                                        <td><b>INSTRUCTOR NAME</b></td>
                                        <td><div align="center"><input name="InstName" id="InstName" type="text" class="form-control" placeholder="INSTRUCTOR NAME" required></div></td>
                                    </tr>
                                    ${blockOption}
                                </tbody>
                            </table>
                            <br>
                            <div align="right">           
                                <button type="submit" id="showAlert" class="btn btn-reg btn-lg" onclick="viewSchedule()">SUBMIT</button>
                            </div>
                        </form>
                    </div>
                </div>

                <div role="tabpanel" class="tab-pane fade" id="Section" aria-labelledby="Section-tab">
                    <div class="show" tabindex="-1" role="dialog" aria-hidden="true" >   <br><br>
                        <table class="table table-striped2">
                            <tbody>
                                <tr>
                                    <td><div align="center"><b>Course ID</b></div></td>
                                    <td><div align="center"><b>Course Section</b></div></td>
                                    <td><div align="center"><b>Course Name</b></div></td>
                                    <td><div align="center"><b>Instructor Name</b></div></td>
                                    <td><div align="center"><b>Class Blocks</b></div></td>
                                    <td><div align="center"><b></b></div></td>
                                </tr>
                                ${sectionOption}
                            </tbody>
                        </table>
                    </div>
                </div>
                            
                <div role="tabpanel" class="tab-pane fade" id="Block" aria-labelledby="Block-tab">
                    <div class="show" tabindex="-1" role="dialog" aria-hidden="true" >   <br><br>
                        <table class="table table-striped2">
                            <tbody>
                                <tr>
                                    <td><div align="center"><b>Course ID</b></div></td>
                                    <td><div align="center"><b>Course Section</b></div></td>
                                    <td><div align="center"><b>Course Name</b></div></td>
                                    <td><div align="center"><b>Instructor Name</b></div></td>
                                    <td><div align="center"><b>Class Blocks</b></div></td>
                                    <td><div align="center"><b></b></div></td>
                                </tr>
                                ${courseOption}
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            
            
        </div>
    <!-- script references -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <!-- <script src="./bootstrap/js/bootstrap.min.js"></script>-->
    <script src="./bootstrap/js/docs.min.js"></script>
    <script src="http://cdn.datatables.net/1.10.4/js/jquery.dataTables.min.js"></script>
    <script src='//code.jquery.com/jquery-1.11.0.js'></script>
    <script type='text/javascript' src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

    <script>
        function viewSchedule(){
            var dOption1 = document.getElementById("dOption1");
            var dOption2 = document.getElementById("dOption2");
            var pOption1 = document.getElementById("pOption1");
            var pOption2 = document.getElementById("pOption2");
            
            var d1 = dOption1.options[dOption1.selectedIndex].value;
            var d2 = dOption2.options[dOption2.selectedIndex].value;
            var p1 = pOption1.options[pOption1.selectedIndex].value;
            var p2 = pOption2.options[pOption2.selectedIndex].value;
            var y = document.getElementById("YEAR");
            var s = document.getElementById("SEMESTER");
            var cID = document.getElementById("CourseID");
            var sNum = document.getElementById("SectionNum");
            var cName = document.getElementById("CourseName");
            var inName = document.getElementById("InstName");
            
            
            var url = "http://localhost:8080/ScheduleSharp/addAssign?YEAR=" + y.value + "&SEMESTER=" + s.value
                    + "&CourseID=" + cID.value + "&SectionNum=" + sNum.value + "&CourseName=" + cName.value
                    + "&InstName=" + inName.value + "&d1=" + d1 + "&d2=" + d2 + "&p1=" + p1 + "&p2=" + p2;
            req = new XMLHttpRequest();
            req.open("GET", url, false);
            req.send(null);
            window.close();
        }
    </script>    
    <script>
        window.onunload = refreshParent;
        function refreshParent() {
            window.opener.location.reload();
        }
    </script>
</body>
</html>


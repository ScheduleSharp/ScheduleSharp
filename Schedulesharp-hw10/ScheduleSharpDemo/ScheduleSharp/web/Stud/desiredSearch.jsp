<%@page import="java.util.List"%>
<%@page import="DbObjects.Course"%>
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
    <link href="../bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../bootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
    <link href="../bootstrap/css/styles.css" rel="stylesheet" type="text/css">
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
         {width:300px;margin:20px auto;}
         .modal-content-index
         {position:relative;background-color:#bfe1bf;-webkit-background-clip:padding-box;background-clip:padding-box;border:1px solid #999;border:1px solid rgba(0,0,0,0);border-radius:6px;outline:0;-webkit-box-shadow:0 3px 9px rgba(0,0,0,1);box-shadow:0 3px 9px rgba(0,0,0,1)}
         .modal-content-index
         {-webkit-box-shadow:0 5px 15px rgba(0,0,0,.5);box-shadow:0 5px 15px rgba(0,0,0,.5)}
         .btn-submit{color:#fff;background-color:#fa6450;}
         .btn-reg{color:#fff;background-color:#5db89d;}
         .modal-dialog2{width:80%;margin:30px auto}
         .modal-dialog3{width:60%;margin:30px auto}
         .modal-dialog{width:60%;margin:50px auto}
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
            height : 120px;
        }
        
        .btn-nosch{
            background-color: #ffe7b6;
        }
        .btn-color1{
            color: #171717;
            background-color: #5db89d;
        }
        .btn-color2{
            color: #eeeeee;
            background-color: #007034;
        }
        .btn-color3{
            color: #eeeeee;
            background-color: #8c8535;
        }
        .btn-color4{
            background-color: #ffca00;
        }
        .btn-color5{
            color: #eeeeee;
            background-color: #f26547;
        }
        .btn-color5-1{
            background-color: #de5842;
        }
        .outbox {
            border: 3px dashed #c51230;
            padding: 10px 40px; 
            background: #ffcdb7;
            width:95%;
            border-radius: 25px;
            opacity: 0.93;
          }
        .textShadowRgb {text-shadow: 2px 2px 2px rgba(142,142,142, 0.8); }   
        .autocomplete-suggestions { border: 1px solid #999; background: #fff; cursor: default; overflow: auto; }
        .autocomplete-suggestion { padding: 10px 5px; font-size: 1.2em; white-space: nowrap; overflow: hidden; }
        .autocomplete-selected { background: #f0f0f0; }
        .autocomplete-suggestions strong { font-weight: normal; color: #3399ff; }
    </style>
  
  </head>

  <body>
    <!--Dismiss Alerts-->
    <script>
            window.setTimeout(function() {
            $(".alert").fadeTo(500, 0).slideUp(500, function(){
                $(this).remove(); 
            });
        }, 5000);
    </script>
    <!--ALERT START-->
    <%
        if(session.getAttribute("classAdded") != null){
            String addedAlert = (String)session.getAttribute("classAdded");
            if(addedAlert.equals("classAdded")){
    %>    
    <div class="alert alert-success alert-dismissible" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <center><strong>Success!</strong> That class has been added to your shopping cart!</center>
    </div>
    <%
            }
        }
        session.setAttribute("classAdded", null);
    %>
    <!--END-->
        <!--ALERT START-->
    <%
        if(session.getAttribute("couldNotAdd") != null){
            String addedAlert = (String)session.getAttribute("couldNotAdd");
            if(!addedAlert.equals("Could not add:")){
    %>    
    <div class="alert alert-danger alert-dismissible" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <center><strong>Aww!</strong> We could not generate your desired schedule. <% out.print(addedAlert);%>. You must remove these course(s). </center>
    </div>
    <%
            }
            else{
    %>
    <div class="alert alert-success alert-dismissible" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <center><strong>Huzza!</strong> Your schedule has been successfully generated. </center>
    </div>
    <%
            }
        }
        session.setAttribute("couldNotAdd", null);
    %>
    <!--END-->
    <div class="modal fade" id="ResultModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content2">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">Added Courses</h4>
                </div>
                <div class="modal-body">
                    <ul class="nav nav-tabs" id="tabContent">
                            <li class="active"><a href="#classes" data-toggle="tab">Classes</a></li>
                            <li><a href="#added-classes" data-toggle="tab">Added Courses</a></li>
                            <li><a href="#preferences" data-toggle="tab">Preferences</a></li>
                    </ul>

                    <div class="tab-content">
                        <div class="tab-pane active" id="classes">
                            <div class="modal-body">
                                <table class="table table-striped2"  style="width:100%" >
                                    <tbody>
                                        <tr>
                                            <th><div align="center">Course ID</div></th>
                                            <th><div align="center">Section</div></th>
                                            <th><div align="center">Course Name</div></th>
                                            <th><div align="center">Instructor</div></th>
                                            <th><div align="center">Period</div></th>
                                            <th><div align="center">Add</div></th>
                                        </tr>
                                <%
                                if((String)session.getAttribute("openModal") == "openModal"){
                                    List<String[]> courseInformation = (List<String[]>)session.getAttribute("courseInfomation");
                                    for(String[] rowData : courseInformation){
                                        out.println("<tr>");
                                        int i = 1;
                                        for(String data: rowData){
                                            out.println("<td><div align=\"center\">" + data + "</div></td>");
                                        }
                                        out.println("<td><form name=\"classinfo" + i + "\" action=\"../AddToShoppingCart\" method=\"post\" class=\"form-horizontal\">");
                                        for(String data: rowData){
                                            out.println("<input type=\"hidden\" name=\"information"+i+"\" value=\""+data+"\">");
                                            i++;
                                        }
                                        out.println("<div align=\"center\"><button type=\"submit\" class=\"btn btn-submit\">Add This Course</button></div></td>");
                                        out.println("</form>");        
                                        out.println("</tr>");
                                        
                                    }
                                    
                                }
                                %>
                                            
                                        </tr>
                                    </tbody>
                                  </table>
                            </div>
                        </div>

                        <div class="tab-pane" id="added-classes">
                            <div class="modal-body">
                                <table class="table table-striped2"  style="width:100%" >
                                    <tbody>
                                        <tr>
                                            <th><div align="center">Course ID</div></th>
                                            <th><div align="center">Section</div></th>
                                            <th><div align="center">Course Name</div></th>
                                            <th><div align="center">Instructor</div></th>
                                            <th><div align="center">Period</div></th>
                                            <th><div align="center">Remove</div></th>
                                        </tr>
                                        
                                        <%
                                        if((String)session.getAttribute("notEmpty") == "notEmpty"){
                                            List<String[]> shoppingCart = (List<String[]>)session.getAttribute("shoppingCart");
                                            for(String[] rowData : shoppingCart){
                                                out.println("<tr>");
                                                for(String data: rowData){
                                                    out.println("<td><div align=\"center\">" + data + "</div></td>");
                                                }
                                                out.println("</tr>");

                                            }    
                                        }    
                                        %>    
                                    </tbody>
                                  </table>
                            </div>
                        </div> 
                        <div class="tab-pane" id="preferences">
                            <div class="modal-body">
                                <form id="schedulePreferences" method="post" class="form-horizontal" action="../RetriveCourseInformation">
                                    <div class="form-group">
                                         <div class="modal-body">
                                            <legend>Lunch Periods</legend>
                                            <div class="LunchPeriod">
                                                <label>
                                                  <input name="LunchPeriod" type="checkbox" value="Lunch"> Include Lunch
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-reg">Save</button>
                                </form>   
                            </div>   
                        </div>    
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" onClick="location.href='../GenerateSchedule'">Generate</button>
                </div>
            </div><!--Modal Content-->
        </div><!--Modal Dialog-->
    </div><!--Opening-->  
      
         <div id="Schedule" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog2">
      <div class="modal-content2">

        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
          <h4 class="modal-title" id="myModalLabel">Classes In the Period</h4>
        </div>
        <div class="modal-body">
            
            <div align="center">
                <table class="table table-striped2"  style="width:95%" >
      <tbody>
          <tr>
              <th><div align="center">Course ID</div></th>
              <th><div align="center">Course Name</div></th>
              <th><div align="center">Instructor</div></th>
              <th><div align="center">Year</div></th>
              <th><div align="center">Semester</div></th>
              <th><div align="center">Day</div></th>
              <th><div align="center">Period</div></th>
              <th><div align="center">Add</div></th>
          </tr>
          <tr>
              <td><div align="center"></div></td>
              <td><div align="center"></div></td>
              <td><div align="center"></div></td>
              <td><div align="center"></div></td>
              <td><div align="center"></div></td>
              <td><div align="center"></div></td>
              <td><div align="center"></div></td>
              <td><div align="center">
                  <button type="button" class="btn btn-submit" data-dismiss="modal">Add This Course</button>
              </div></td>
          </tr>
      </tbody>
    </table>
            </div>        
        </div>
          <div class="modal-footer">
                        <div class="col-md-12">
                            <button type="button" class="btn btn-submit btn-lg" data-dismiss="modal">CANCEL</button>
                            <button type="button" class="btn btn-reg btn-lg" data-dismiss="modal" data-toggle="modal" data-target="#Friends">
                                View With Friends Name</button><br>
                        </div>	
                    </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->
  
  <div id="Friends" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog2">
      <div class="modal-content2">

        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
          <h4 class="modal-title" id="myModalLabel">Classes In the Period</h4>
        </div>
        <div class="modal-body">
            
            <div align="center">
                <table class="table table-striped2"  style="width:95%" >
      <tbody>
          <tr>
              <th><div align="center">Course ID</div></th>
              <th><div align="center">Course Name</div></th>
              <th><div align="center">Instructor</div></th>
              <th><div align="center">Year</div></th>
              <th><div align="center">Semester</div></th>
              <th><div align="center">Day</div></th>
              <th><div align="center">Period</div></th>
              <th><div align="center">Friends</div></th>
              <th><div align="center">Add</div></th>
          </tr>
          <tr>
              <td><div align="center"></div></td>
              <td><div align="center"></div></td>
              <td><div align="center"></div></td>
              <td><div align="center"></div></td>
              <td><div align="center"></div></td>
              <td><div align="center"></div></td>
              <td><div align="center"></div></td>
              <td><div align="center"></div></td>
              <td><div align="center">
                  <button type="button" class="btn btn-submit" data-dismiss="modal">Add This Course</button>
              </div></td>
          </tr>
      </tbody>
    </table>
            </div>        
        </div>
          <div class="modal-footer">
                        <div class="col-md-12">
                            <button type="button" class="btn btn-submit btn-lg" data-dismiss="modal">CANCEL</button>
                            <button type="button" class="btn btn-reg btn-lg" data-dismiss="modal" data-toggle="modal" data-target="#Schedule">
                                View Without Friends Name</button><br>
                        </div>	
                    </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->
  
    <div id="fRequest" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog3">
      <div class="modal-content2">

        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
          <h4 class="modal-title" id="myModalLabel">Friend Request</h4>
        </div>
        <div class="modal-body">
            
            <div align="center">
                <div align="center" style="vertical-align:bottom">
                    <div class="outbox" align="left" style="padding:3%">
                        <table align="center" style="width:95%">
                            <tr>
                                <td><div align="center" style="font-size:18px"><b>Student ID: </b></div></td>
                                <td><div align="center" style="font-size:18px">123456</div> </td>
                                <td>&nbsp;&nbsp;</td>
                                <td><div align="center" style="font-size:18px"><b>User Name: </b></div></td>
                                <td><div align="center" style="font-size:18px">ace123</div></td>
                            </tr>
                            <tr>
                                <td>&nbsp;&nbsp;</td>
                            </tr>
                            <tr>
                                <td><div align="center" style="font-size:18px"><b>First Name: </b></div></td>
                                <td><div align="center" style="font-size:18px">Ace</div></td>
                                <td>&nbsp;&nbsp;</td>
                                <td><div align="center" style="font-size:18px"><b>Last Name: </b></div></td>
                                <td><div align="center" style="font-size:18px">Portos</div></td>
                                <td>&nbsp;&nbsp;</td>
                                <td><div align="center"><button type="delete" class="btn btn-reg">Accept</button></div></td>
                                <td><div align="center"><button type="delete" class="btn btn-color5-1">Reject</button></div></td>
                            </tr>
                        </table>
                </div>
                    <br><br>
                    
                    <div class="outbox" align="left" style="padding:3%">
                        <table align="center" style="width:95%">
                            <tr>
                                <td><div align="center" style="font-size:18px"><b>Student ID: </b></div></td>
                                <td><div align="center" style="font-size:18px">000001</div> </td>
                                <td>&nbsp;&nbsp;</td>
                                <td><div align="center" style="font-size:18px"><b>User Name: </b></div></td>
                                <td><div align="center" style="font-size:18px">DDD</div></td>
                            </tr>
                            <tr>
                                <td>&nbsp;&nbsp;</td>
                            </tr>
                            <tr>
                                <td><div align="center" style="font-size:18px"><b>First Name: </b></div></td>
                                <td><div align="center" style="font-size:18px">Tomoya</div></td>
                                <td>&nbsp;&nbsp;</td>
                                <td><div align="center" style="font-size:18px"><b>Last Name: </b></div></td>
                                <td><div align="center" style="font-size:18px">Nagase</div></td>
                                <td>&nbsp;&nbsp;</td>
                                <td><div align="center"><button type="delete" class="btn btn-reg">Accept</button></div></td>
                                <td><div align="center"><button type="delete" class="btn btn-color5-1">Reject</button></div></td>
                            </tr>
                        </table>
                </div>
                    <br><br>
                </div>
            </div>        
        </div>
          <div class="modal-footer">
                        <div class="col-md-12">
                            <button type="button" class="btn btn-submit btn-lg" data-dismiss="modal">CLOSE</button>
                    </div>
          </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->
  
  
  
      
      
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
            <li><a href="StudMain.jsp">Home</a></li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">MY FRIENDS<span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="viewFriend.jsp">VIEW FRIENDS</a></li>
                <li class="divider"></li>
                <li><a href="searchFriend.jsp">SEARCH FRIEND</a></li>
              </ul>
            </li>
            <li class="dropdown  active">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">ASSIGNED COURSE<span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="assignedView.jsp">VIEW SCHEDULE</a></li>
                <li class="divider"></li>
                <li><a href="assignedSearch.jsp">SEARCH SCHEDULE</a></li>
              </ul>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">DESIRED COURSE<span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="desiredView.jsp">VIEW SCHEDULE</a></li>
                <li class="divider"></li>
                <li><a href="desiredSearch.jsp">SEARCH SCHEDULE</a></li>
              </ul>
            </li>
            <div class="navbar-brand"><button type="button" class="btn btn-fr" data-toggle="modal" data-target="#fRequest">
                    <font color="#b3ff45" size="4"><span class="glyphicon glyphicon-user"></span></font></button></div> 
            <div class="navbar-brand"><font color="#fac150" size="2">HELLO, ${currentSessionUser.getFirstName()}!</font></div> 
            <a class="navbar-brand" href="../index.jsp"><font color="#fac150" size="2"><u>SIGN OUT?</u></font></a>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>

      <div id="main">
        <div id="search">
            <div class="show" tabindex="-1" role="dialog" aria-hidden="true" >   
        <h2 class="text-margin text-center">
            <font color="#b73c3e" size="6"><br>Search Course</font>
        </h2>
            <div class="modal-dialog-index">
                <div class="modal-content-index">
                    <div class="modal-body" align='center'>
                        <form id="searchCourses" method="post" class="form-horizontal" action="../RetriveCourseInformation">
                            <div class="form-group input-group">
                                <label class="col-md-5"><font color="#b73c3e" size="2"><br>Course ID</font></label>
                                <div class="col-md-7">
                                    <input name="CourseID" type="text" class="form-control input-md" placeholder="Course Id" id="courseIDAuto">
                                </div>
                            </div>
                            <div class="form-group input-group">
                                <label class="col-md-5"><font color="#b73c3e" size="2"><br>Course Name</font></label>
                                <div class="col-md-7">
                                    <input name="CName" type="text" class="form-control input-md" placeholder="Course Name" id="CNameAuto">
                                </div>
                            </div>
                    <div class="modal-footer">
                        <div class="col-md-12">
                            <button type="submit" class="btn btn-reg btn-lg" data-toggle="modal" data-target="" id="SearchButton" onClick="">SEARCH</button><br>
                        </div>	
                    </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        </div>
        <div id="result">
            <div align="center" style="vertical-align:bottom">
            <div align="center" style="vertical-align:bottom">   
                <div id="myTabContent" class="tab-content" style="width:100%">

                    <h3>My Desired Course</h3>
                    <div align="right" style="margin:15px"><button type="button" class="btn btn-reg btn-lg">VIEW WITH FRIENDS</button>
                        &nbsp;&nbsp;&nbsp;&nbsp;</div>
                        <table class="table-sch" style="width:80%">
                            <tr>
                                <th class="th-sch"></th>
                                <th class="th-sch">MON</th>
                                <th class="th-sch">TUE</th>
                                <th class="th-sch">WED</th>
                                <th class="th-sch">THU</th>
                                <th class="th-sch">FRI</th>
                            </tr>
                            <%
                            String[][] displayArray = new String[12][5];
                            displayArray = (String[][])session.getAttribute("displayArray");
                            for(int i = 0; i < 12; i++){
                                out.println("<tr>");
                                out.println("<td class=\"td-sch\">" + (i+1) + "</td>");
                                for(int j = 0; j < 5; j++){
                                    if(displayArray[i][j] != null){
                                        out.println("<td class=\"td-sch\">");
                                        out.println("<button type=\"button\" class=\"btn btn-sch btn-color1\" data-toggle=\"modal\" data-target=\"\">");
                                        out.println("<p class=\"textShadowRgb\">");
                                        out.println(displayArray[i][j]);
                                        out.println("</p>");
                                        out.println("</button></td>");
                                    }
                                    else{
                                        out.println("<td class=\"td-sch\"><button type=\"button\" class=\"btn btn-sch btn-color1\" data-toggle=\"modal\" data-target=\"\"></button></td>");
                                    }
                                }
                                out.println("</tr>");
                            }           
                            %>
                            <%/*
                            <tr>
                                <td class="td-sch">1</td>
                                <td class="td-sch">
                                    <button type="button" class="btn btn-sch btn-color1" data-toggle="modal" data-target="#Schedule"></button>
                                </td>
                                <td class="td-sch">
                                    <button type="button" class="btn btn-sch btn-color1" data-toggle="modal" data-target="#Schedule">class 1</button>
                                </td>
                                <td class="td-sch">
                                    <button type="button" class="btn btn-sch btn-color1" data-toggle="modal" data-target="#Schedule">class 2</button>
                                </td>
                                <td class="td-sch">
                                    <button type="button" class="btn btn-sch btn-color1" data-toggle="modal" data-target="#Schedule">class 3</button>
                                </td>
                                <td class="td-sch">
                                    <button type="button" class="btn btn-sch btn-color1" data-toggle="modal" data-target="#Schedule">class 4</button>
                                </td>
                            </tr>
                            */        
                            %>
                        </table>
                </div>
            </div><!-- /example -->
        </div>
        </div>
    </div>
      
	<!-- script references -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="../bootstrap/js/bootstrap.min.js"></script>
        <script src="../bootstrap/js/docs.min.js"></script>
        <script src="../bootstrap/js/jquery.autocomplete.min.js"></script>
        <script src="http://cdn.datatables.net/1.10.4/js/jquery.dataTables.min.js"></script>
        <script>
            $(document).ready(function () {
                $('.result').DataTable();
            });
            <%
             if((String)session.getAttribute("openModal") == "openModal"){
                 out.print("$(window).load(function(){ $('#ResultModal\').modal(\'show\');});");
                 session.setAttribute("openModal", "");
            }
            %>
        </script>
        
        <script type="text/javascript">
            $(function(){
                var courseID = [
                    <%
                   List<String> columns = (List<String>)request.getAttribute("columns");
                   List<String[]> classes = (List<String[]>)session.getAttribute("classes");
                   for(String[] rowData : classes){
                       out.println("{ value: \'"+rowData[0]+"\', data: \' " + rowData[1] + "\' },");
                   }
                   
                   %>
                   /*            
                    { value: 'CSE114', data: 'Computer Science I' },
                    { value: 'CSE215', data: 'Foundations of Computer Science' },
                    { value: 'CSE219', data: 'Computer Science III' },
                    { value: 'CSE220', data: 'Systems Fundamentals I' },
                    { value: 'CSE300', data: 'Technical Communications' },
                    { value: 'CSE301', data: 'History of Computing' },
                    { value: 'CSE303', data: 'Introduction to the Theory of Computation' },
                    { value: 'CSE305', data: 'Principles of Database Systems' }
                   */ 
            ]; 
                var CourseName = [
                    <%
                   for(String[] rowData : classes){
                       out.println("{ value: \'"+rowData[1]+"\', data: \' " + rowData[0] + "\' },");
                   }
                   
                   %>
                ]
            $('#courseIDAuto').autocomplete({
                lookup: courseID,
                onSelect: function (suggestion) {
                    document.getElementById('CNameAuto').value = suggestion.data;
                }
                });
            $('#CNameAuto').autocomplete({
            lookup: CourseName,
            onSelect: function (suggestion) {
                document.getElementById('courseIDAuto').value = suggestion.data;
                }
                });
            });
            
            
        
        </script>
  </body>
</html>

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
         {width:300px;margin:20px auto;}
         .modal-content-index
         {position:relative;background-color:#fcd059;-webkit-background-clip:padding-box;background-clip:padding-box;border:1px solid #999;border:1px solid rgba(0,0,0,0);border-radius:6px;outline:0;-webkit-box-shadow:0 3px 9px rgba(0,0,0,1);box-shadow:0 3px 9px rgba(0,0,0,1)}
         .modal-content-index
         {-webkit-box-shadow:0 5px 15px rgba(0,0,0,.5);box-shadow:0 5px 15px rgba(0,0,0,.5)}
         .btn-submit{color:#fff;background-color:#fa6450;}
         .btn-reg{color:#fff;background-color:#5db89d;}
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
            color: #eeeeee;
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
    </style>
  
  </head>

  <body>
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
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">ASSIGNED COURSE<span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="assignedView.jsp">VIEW SCHEDULE</a></li>
                <li class="divider"></li>
                <li><a href="assignedSearch.jsp">SEARCH SCHEDULE</a></li>
              </ul>
            </li>
            <li class="dropdown  active">
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
     
            <div align="center" style="vertical-align:bottom">
            <div align="center" style="vertical-align:bottom">   
                <div id="myTabContent" class="tab-content" style="width:100%">

                    <h3>My Desired Course</h3>
                    <div align="right" style="margin:15px"><button type="button" class="btn btn-reg btn-lg">VIEW WITH FRIENDS</button>
                        &nbsp;&nbsp;&nbsp;&nbsp;</div>
                        <table class="table-sch" style="width:70%">
                            <tr>
                                <th class="th-sch"></th>
                                <th class="th-sch">MON</th>
                                <th class="th-sch">TUE</th>
                                <th class="th-sch">WED</th>
                                <th class="th-sch">THU</th>
                                <th class="th-sch">FRI</th>
                                <th class="th-sch">SAT</th>
                                <th class="th-sch">SUN</th>
                            </tr>
                            <tr>
                                <td class="td-sch">1</td>
                                <td class="td-sch">
                                    <button type="button" class="btn btn-sch btn-nosch" data-toggle="modal" data-target="#Schedule">not chosen block</button>
                                </td>
                                <td class="td-sch">
                                    <button type="button" class="btn btn-sch btn-color1" data-toggle="modal" data-target="#Schedule">class 1</button>
                                </td>
                                <td class="td-sch">
                                    <button type="button" class="btn btn-sch btn-color2" data-toggle="modal" data-target="#Schedule">class 2</button>
                                </td>
                                <td class="td-sch">
                                    <button type="button" class="btn btn-sch btn-color3" data-toggle="modal" data-target="#Schedule">class 3</button>
                                </td>
                                <td class="td-sch">
                                    <button type="button" class="btn btn-sch btn-color4" data-toggle="modal" data-target="#Schedule">class 4</button>
                                </td>
                                <td class="td-sch">
                                    <button type="button" class="btn btn-sch btn-color5" data-toggle="modal" data-target="#Schedule">class 5</button>
                                </td>
                                <td class="td-sch">
                                    <button type="button" class="btn btn-sch btn-nosch" data-toggle="modal" data-target="#Schedule">SEARCH</button>
                                </td>
                            </tr>
                            <tr>
                                <td class="td-sch">2</td>
                                <td class="td-sch"></td>
                                <td class="td-sch"></td>
                                <td class="td-sch"></td>
                                <td class="td-sch"></td>
                                <td class="td-sch"></td>
                                <td class="td-sch"></td>
                                <td class="td-sch"></td>
                            </tr>
                            <tr>
                                <td class="td-sch">3</td>
                                <td class="td-sch"></td>
                                <td class="td-sch"></td>
                                <td class="td-sch"></td>
                                <td class="td-sch"></td>
                                <td class="td-sch"></td>
                                <td class="td-sch"></td>
                                <td class="td-sch"></td>
                            </tr>
                            <tr>
                                <td class="td-sch">4</td>
                                <td class="td-sch"></td>
                                <td class="td-sch"></td>
                                <td class="td-sch"></td>
                                <td class="td-sch"></td>
                                <td class="td-sch"></td>
                                <td class="td-sch"></td>
                                <td class="td-sch"></td>
                            </tr>
                            <tr>
                                <td class="td-sch">5</td>
                                <td class="td-sch"></td>
                                <td class="td-sch"></td>
                                <td class="td-sch"></td>
                                <td class="td-sch"></td>
                                <td class="td-sch"></td>
                                <td class="td-sch"></td>
                                <td class="td-sch"></td>
                            </tr>
                        </table>

                </div>
            </div><!-- /example -->
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
  </body>
</html>

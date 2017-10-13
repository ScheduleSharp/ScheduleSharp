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
         .btn-reg{color:#fff;background-color:#ff8e29;}
         .modal-dialog2{width:80%;margin:30px auto}
         .modal-dialog3{width:60%;margin:30px auto}
        .modal-content2{position:relative;background-color:#fff1a9;-webkit-background-clip:padding-box;background-clip:padding-box;border:1px solid #999;border:1px solid rgba(0,0,0,.2);border-radius:6px;outline:0;-webkit-box-shadow:0 3px 9px rgba(0,0,0,.5);box-shadow:0 3px 9px rgba(0,0,0,.5)}
        .modal-content2{-webkit-box-shadow:0 5px 15px rgba(0,0,0,.5);box-shadow:0 5px 15px rgba(0,0,0,.5)}
        .table-striped2>tbody>tr:nth-child(even){background-color: #ffa68b;}
        .btn-fr{background-color: #b43c3d}
        //.table-striped2>tbody>tr:nth-child(odd){background-color: #ffe2aa;}
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
        
        .btn-sch2{
            width: 100px; 
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
        .outbox {
            border: 3px dashed #c51230;
            padding: 10px 40px; 
            background: #ffcdb7;
            width:95%;
            border-radius: 25px;
            opacity: 0.93;
          }
    </style>

    
        <script>
            function viewSchedule(){
                var year = document.getElementById("YEARDrop");
                var sem = document.getElementById("SEMESTERDrop");
                var friend = document.getElementById("fList");
                var y = year.options[year.selectedIndex].value;
                var s = sem.options[sem.selectedIndex].value;
                var f = friend.options[friend.selectedIndex].value;
                var url = "http://localhost:8080/ScheduleSharp/AssignViewFriend?YEARDrop="
                            + y + "&SEMESTERDrop=" + s + "&fList=" + f;
                req = new XMLHttpRequest();
                req.open("GET", url, false);
                req.send(null);
                location.reload();
            }
        </script>
  
  </head>

  <body onload="checkBlock()">
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
            <li class="dropdown  active">
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
                <li><a href="desiredView.jsp">VIEW SCHEDULE</a></li>
                <li class="divider"></li>
                <li><a href="desiredSearch.jsp">SEARCH SCHEDULE</a></li>
              </ul>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">MY FRIENDS<span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">
                <li><a href="viewFriend.jsp">VIEW FRIENDS</a></li>
                <li class="divider"></li>
                <li><a href="searchFriend.jsp">SEARCH FRIEND</a></li>
                <li><a href="viewRequestFriend.jsp">VIEW REQUEST</a></li>
              </ul>
            </li>
            <div class="navbar-brand"><font color="#fac150" size="2">HELLO, ${currentSessionUser.getFirstName()}!</font></div> 
            <a class="navbar-brand" href="../signout"><font color="#fac150" size="2"><u>SIGN OUT?</u></font></a>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>

            <div align="center" style="vertical-align:bottom">
                <h3>View Assigned Course</h3>
                <div  style="display:inline-block; width:5%">
                        <select id="YEARDrop" name="YEARDrop" class="form-control">
                            <option value="2015" selected="">2015</option>
                            <option value="2014">2014</option>
                            <option value="2013">2013</option>
                        </select>
                    </div>
                    <jsp:include page="/returnDropdown" />
                    <div style="display:inline-block;  width:6%">
                    ${Semester}
                    </div>
                    <div style="display:inline-block;  width:15%">
                    ${fList}
                    </div>
                    <div style="display:inline-block;  width:4%">
                    <button class="btn btn-reg" onclick="viewSchedule()">VIEW</button>
                    </div>
                    
                    <h4>${current}</h4>
                    <button class="btn-lg btn-submit" onclick="tableToExcel('AssSchedule', 'W3C Example Table')">
                         Export This Assignment Schedule
                    </button>
                    <br><br>
                    <table id="AssSchedule" class="table-sch" style="width:70%">

                        <tr>
                            <th class="th-sch"></th>
                                ${Days}
                        </tr>
                        ${Period}
                    </table>
                
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
        <script> function checkBlock() {
            var c1 = '#de5842';
            var c2 = '#a2d7d8';
            var c3 = '#bfe1bf';
            var c4 = '#ededea';
            var c5 = '#fcd059';

            ${sBlock};
        }
    </script>
     <script type="text/javascript">
        var tableToExcel = (function() {
          var uri = 'data:application/vnd.ms-excel;base64,'
            , template = '<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>{worksheet}</x:Name><x:WorksheetOptions><x:DisplayGridlines/></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]--><meta http-equiv="content-type" content="text/plain; charset=UTF-8"/></head><body><table>{table}</table></body></html>'
            , base64 = function(s) { return window.btoa(unescape(encodeURIComponent(s))) }
            , format = function(s, c) { return s.replace(/{(\w+)}/g, function(m, p) { return c[p]; }) }
          return function(table, name) {
            if (!table.nodeType) table = document.getElementById(table)
            var ctx = {worksheet: name || 'Worksheet', table: table.innerHTML}
            window.location.href = uri + base64(format(template, ctx))
          }
        })()
</script>
  </body>
</html>

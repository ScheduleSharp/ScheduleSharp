<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                width: 100%;
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

            .modal-dialog3{width:60%;margin:30px auto}
            .modal-dialog-index
            {width:400px;margin:20px auto;}
            .modal-content-index
            {position:relative;background-color:#fac150;-webkit-background-clip:padding-box;background-clip:padding-box;border:1px solid #999;border:1px solid rgba(0,0,0,0);border-radius:6px;outline:0;-webkit-box-shadow:0 3px 9px rgba(0,0,0,1);box-shadow:0 3px 9px rgba(0,0,0,1)}
            .modal-content-index
            {-webkit-box-shadow:0 5px 15px rgba(0,0,0,.5);box-shadow:0 5px 15px rgba(0,0,0,.5)}
            .btn-submit{color:#fff;background-color:#de672d;}
            .btn-reg{color:#fff;background-color:#ffe87e;}
            .btn-fr{background-color: #b43c3d}
            .modal-dialog2{width:800px;margin:30px auto}
            .modal-content2{position:relative;background-color:#fff1a9;-webkit-background-clip:padding-box;background-clip:padding-box;border:1px solid #999;border:1px solid rgba(0,0,0,.2);border-radius:6px;outline:0;-webkit-box-shadow:0 3px 9px rgba(0,0,0,.5);box-shadow:0 3px 9px rgba(0,0,0,.5)}
            .modal-content2{-webkit-box-shadow:0 5px 15px rgba(0,0,0,.5);box-shadow:0 5px 15px rgba(0,0,0,.5)}
            .table-striped2>tbody>tr:nth-child(odd){background-color: #ffa177;}
            .table-striped2>tbody>tr:nth-child(even){background-color: #ffe6b4;}
            #main{
                width:100%;
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

        <div id="main">

            <div class="divider">

                <div align="center" style="vertical-align:bottom;">
                    <div align="center" style="vertical-align:bottom">   
                        <div id="myTabContent" class="tab-content" style="width:70%">

                            <h3>Friend List</h3>
                            <div align="center" style="vertical-align:bottom">
                                <div align="center" style="vertical-align:bottom">
                                    <table class="table table-striped2 flist">
                                        <thead>
                                            <tr>
                                                <th><div align="center"><input type="checkbox" name="approve" class="selectall"/></div></th>
                                        <th><div align="center">Student ID</div></th>
                                        <th><div align="center">User Name</div></th>
                                        <th><div align="center">First Name</div></th>
                                        <th><div align="center">Last Name</div></th>
                                        <th><div align="center">Email</div></th>
                                        <th><div align="center">
                                            <button type="button" class="btn btn-danger btn-xs">DELETE Checked</button>
                                        </div></th>
                                        </tr>  
                                        </thead>
                                        <tbody>
                                            <jsp:include page="/viewFriends" />
                                            ${fList}
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
            <script>
                $(document).ready(function () {
                    $('.request').DataTable();
                });
            </script>
            <script>
                $(document).ready(function () {
                    $('.flist').DataTable();
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
            </script>                    
    </body>
</html>

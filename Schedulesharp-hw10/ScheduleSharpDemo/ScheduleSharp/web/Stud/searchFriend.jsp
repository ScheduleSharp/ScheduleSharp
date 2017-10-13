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
            {width:500px;margin:20px auto;}
            .modal-content-index
            {position:relative;background-color:#ffa68b;-webkit-background-clip:padding-box;background-clip:padding-box;border:1px solid #999;border:1px solid rgba(0,0,0,0);border-radius:6px;outline:0;-webkit-box-shadow:0 3px 9px rgba(0,0,0,1);box-shadow:0 3px 9px rgba(0,0,0,1)}
            .modal-content-index
            {-webkit-box-shadow:0 5px 15px rgba(0,0,0,.5);box-shadow:0 5px 15px rgba(0,0,0,.5)}
            .btn-submit{color:#fff;background-color:#de672d;}
            .btn-reg{color:#fff;background-color:#ffa68b;}
            .modal-dialog2{width:800px;margin:30px auto}
            .modal-dialog3{width:60%;margin:30px auto}
            .modal-dialog4{width:40%;margin:30px auto}
            .modal-content2{position:relative;background-color:#fff1a9;-webkit-background-clip:padding-box;background-clip:padding-box;border:1px solid #999;border:1px solid rgba(0,0,0,.2);border-radius:6px;outline:0;-webkit-box-shadow:0 3px 9px rgba(0,0,0,.5);box-shadow:0 3px 9px rgba(0,0,0,.5)}
            .modal-content2{-webkit-box-shadow:0 5px 15px rgba(0,0,0,.5);box-shadow:0 5px 15px rgba(0,0,0,.5)}
            .table-striped2>tbody>tr:nth-child(odd){background-color: #ffa68b;}
            .btn-fr{background-color: #b43c3d}
            //.table-striped2>tbody>tr:nth-child(even){background-color: #ffe2aa;}
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

        <div id="searchf" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
            <div class="modal-dialog4">
                <div class="modal-content2">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title" id="myModalLabel">SEARCH FRIENDS</h4>
                    </div>
                    <div class="modal-body" align="center">

                        <ul id="myTab" class="nav nav-tabs" role="tablist" style="width:90%">
                            <li role="presentation" class="active"><a href="#Username" id="Username-tab" role="tab" data-toggle="tab" aria-controls="Username" aria-expanded="true"><b>Search by UserName</b></a></li>
                            <li role="presentation"><a href="#Fullname" id="Fullname-tab" role="tab" data-toggle="tab" aria-controls="Fullname"><b>Search by Full Name with Email</b></a></li>
                        </ul>

                        <div id="myTabContent" class="tab-content" style="width:88%">
                            <div role="tabpanel" class="tab-pane fade in active" id="Username" aria-labelledby="Username-tab">       
                                <div class="show" tabindex="-1" role="dialog" aria-hidden="true" >   
                                    <div class="modal-dialog-index">
                                        <div class="modal-content-index">
                                            <div class="modal-body" align='center'>
                                                <form action="../searchingFriend">
                                                    <table style="width:90%">
                                                        <tbody>
                                                            <tr>
                                                                <td><div align="center"><font color="#b73c3e" size="4"><br>User Name</font></div></td>
                                                                <td>&nbsp;&nbsp;&nbsp;</td>
                                                                <td><div align="center"><input name="name" type="text" class="form-control input-lg" placeholder="User Name"></div></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td><td></td>
                                                                <td><div align="right">
                                                                        <br><button type="submit" class="btn btn-submit btn-lg">SEARCH</button>
                                                                    </div></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>      
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div role="tabpanel" class="tab-pane fade" id="Fullname" aria-labelledby="Fullname-tab">
                                <div class="show" tabindex="-1" role="dialog" aria-hidden="true" >   
                                    <div class="modal-dialog-index">
                                        <div class="modal-content-index">
                                            <div class="modal-body" align='center'>
                                                <form action="../SearchingFriendByName">
                                                    <table style="width:90%">
                                                        <tbody>
                                                            <tr>
                                                                <td><div align="center"><font color="#b73c3e" size="4"><br>First Name</font></div></td>
                                                                <td>&nbsp;&nbsp;&nbsp;</td>
                                                                <td><div align="center"><input name="fname" type="text" class="form-control input-lg" placeholder="First Name"></div></td>
                                                            </tr>
                                                            <tr>
                                                                <td><div align="center"><font color="#b73c3e" size="4"><br>Last Name</font></div></td>
                                                                <td>&nbsp;&nbsp;&nbsp;</td>
                                                                <td><div align="center"><input name="lname" type="text" class="form-control input-lg" placeholder="Last Name"></div></td>
                                                            </tr>
                                                            <tr>
                                                                <td><div align="center"><font color="#b73c3e" size="4"><br>Email</font></div></td>
                                                                <td>&nbsp;&nbsp;&nbsp;</td>
                                                                <td><div align="center"><input name="email" type="text" class="form-control input-lg" placeholder="Email"></div></td>
                                                            </tr>
                                                            <tr>
                                                                <td></td><td></td>
                                                                <td><div align="right">
                                                                        <br><button type="submit" class="btn btn-submit btn-lg">SEARCH</button>
                                                                    </div></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>      
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br><br><br>
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

        <div align="center" style="vertical-align:bottom">
            <div align="center" style="vertical-align:bottom">   
                <div id="myTabContent" class="tab-content" style="width:75%">
                    <div align="center" style="margin:15px">
                        <button type="button" class="btn btn-reg btn-lg" data-toggle="modal" data-target="#searchf">
                            SEARCH FRIENDS FORM</button>
                    </div>
                    <br>
                    <h3>Search Result</h3>
                    <div align="center" style="vertical-align:bottom">
                        <div align="center" style="vertical-align:bottom">

                            <table class="table table-striped2 result">
                                <thead>
                                    <tr>                                           
                                        <th><div align="center">User Name</div></th>
                                <th><div align="center">First Name</div></th>
                                <th><div align="center">Last Name</div></th>
                                <th><div align="center">Request Friend</div></th>
                                </tr>  
                                </thead>
                                <tbody>
                                    ${fSearchList}
                                </tbody>
                            </table>
                        </div>
                    </div> 

                </div>
            </div><!-- /example -->
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

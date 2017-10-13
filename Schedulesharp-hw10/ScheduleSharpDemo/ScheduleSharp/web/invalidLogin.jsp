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
        <link href="css/styles.css" rel="stylesheet" type="text/css">

        <style type='text/css'>
            #bg {
                position: fixed; 
                top: 0%; 
                left: 0%; 
                width: 100%; 
                height: 100%;
                background-color: #ffed9b;
            }
            #bg img {
                width: 100%;
                position: absolute;
                top: 0;
                left: 0;
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

        </style>      
    </head>

    <body>
        <form name="registerationform" action ="RegisterStudent" method ="post">
            <div id="Register" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                <div class="modal-dialog2">
                    <div class="modal-content2">

                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                            <h4 class="modal-title" id="myModalLabel">Register</h4>
                        </div>
                        <div class="modal-body">

                            <div align="center">
                                <table class="table table-striped2"  style="width:95%" >
                                    <tbody>
                                        <tr>
                                            <td><b>USER NAME</b></td>
                                            <td><div align="center"><input name="UserName" type="text" class="form-control" placeholder="USER NAME"></div></td>
                                            <td></td><td></td>
                                        </tr>
                                    <td><b>PASSWORD</b></td>
                                    <td><div align="center"><input name="password1" type="password" class="form-control" placeholder="PASSWORD"></div></td>
                                    <td><b>CONFIRM PASSWORD</b></td>
                                    <td><div align="center"><input name="password2" type="password" class="form-control" placeholder="PASSWORD(CONFIRM)"></div></td>
                                    </tr>
                                    <tr>
                                        <td><b>FIRST NAME</b></td>
                                        <td><div align="center"><input name="FirstName" type="text" class="form-control" placeholder="FIRST NAME"></div></td>
                                        <td><b>LAST NAME</b></td>
                                        <td><div align="center"><input name="LastName" type="text" class="form-control" placeholder="LAST NAME"></div></td>
                                    </tr>
                                    <tr>
                                        <td><b>EMAIL</b></td>
                                        <td><div align="center"><input name="Email" type="text" class="form-control" placeholder="EMAIL"></div></td>
                                        <td></td><td></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>        
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">CANCEL</button>
                            <button type="submit" class="btn btn-submit">SUBMIT</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->

        </form>
        <!--login modal-->
        <!--  <form action="./Admin/AdminMain.jsp" method="post">  -->
        <form action="loginServlet">
            <div id='bg'>
                <!--<img src='./img/bg01.jpg' alt="">-->
                <div id="loginModal" class="modal show" tabindex="-1" role="dialog" aria-hidden="true" >   
                    <h2 class="text-margin text-center">
                        <font color="#b73c3e" face="Showcard Gothic" size="7"><br>Schedule Sharp</font>
                    </h2>
                    <div class="modal-dialog-index">
                        <div class="modal-content-index">
                            <div class="modal-header">
                                <h1 class="text-center"><font face="Bauhaus 93" color="de672d">Login</font></h1>
                            </div>

                            <div class="modal-body">
                                <!--change main.jsp to java file (servlet) later -->
                                <div class="form-group">
                                    <input name="id" type="text" class="form-control input-lg" placeholder="Id">
                                </div>
                                <div class="form-group">
                                    <input name="pw" type="password" class="form-control input-lg" placeholder="Password">
                                    <p style="color:red" align="center"><br>ID or Password is not right.<br>Please try to input your ID and Password again.</p>
                                </div>
                                <div class="form-group" align="right">                                
                                    <a href="./Admin/AdminMain.jsp">enter to admin (perm)</a>
                                    <br>
                                    <a href="./Stud/StudMain.jsp">enter to Student (perm)</a>
                                    <br>
                                    <button type="submit" class="btn btn-submit btn-lg btn-block">SIGN IN</button>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <div class="col-md-12">
                                    <button type="button" class="btn btn-reg btn-lg btn-block" data-toggle="modal" data-target="#Register">REGISTER</button><br>
                                </div>	
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>      
        <!-- script references -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
        <script src="./bootstrap/js/bootstrap.min.js"></script>
        <script src="./bootstrap/js/docs.min.js"></script>
    </body>
</html>

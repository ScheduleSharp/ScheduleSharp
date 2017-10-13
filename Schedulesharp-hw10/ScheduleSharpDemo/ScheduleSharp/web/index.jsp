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
            span.error {
                color:red;
                font-size: 15px;
            }
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
        <script>
            function validateUser() {
                var userM = document.getElementById("userMessage");
                var userID = document.getElementById("username");
                var url = "http://localhost:8080/ScheduleSharp/RegistrationValidation?username=" + userID.value;
                var req = new XMLHttpRequest();
                req.open("GET", url, false);
                req.send(null);

                if (req.readyState === 4 && req.status === 200) {
                    if (req.responseText !== "ok") {
                        userM.innerHTML = req.responseText;
                        userID.focus();
                    }
                    else {
                        userM.innerHTML = "";
                    }
                }
            }
        </script>

        <script>
            function validateFname() {
                var fNameM = document.getElementById("fNameMessage");
                var fName = document.getElementById("firstname");
                var url = "http://localhost:8080/ScheduleSharp/fNameValidation?firstname=" + fName.value;
                var req = new XMLHttpRequest();
                req.open("GET", url, false);
                req.send(null);

                if (req.readyState === 4 && req.status === 200) {
                    if (req.responseText !== "ok") {
                        fNameM.innerHTML = req.responseText;
                        fName.focus();
                    }
                    else {
                        fNameM.innerHTML = "";
                    }
                }
            }
        </script>

        <script>
            function validateLname() {
                var lNameM = document.getElementById("lNameMessage");
                var lName = document.getElementById("lastname");
                var url = "http://localhost:8080/ScheduleSharp/lNameValidation?lastname=" + lName.value;
                var req = new XMLHttpRequest();
                req.open("GET", url, false);
                req.send(null);

                if (req.readyState === 4 && req.status === 200) {
                    if (req.responseText !== "ok") {
                        lNameM.innerHTML = req.responseText;
                        lName.focus();
                    }
                    else {
                        lNameM.innerHTML = "";
                    }
                }
            }
        </script>

        <script>
            function validateEmail() {
                var emailM = document.getElementById("emailMessage");
                var email = document.getElementById("email");
                var url = "http://localhost:8080/ScheduleSharp/emailValidation?email=" + email.value;
                var req = new XMLHttpRequest();
                req.open("GET", url, false);
                req.send(null);

                if (req.readyState === 4 && req.status === 200) {
                    if (req.responseText !== "ok") {
                        emailM.innerHTML = req.responseText;
                        email.focus();
                    }
                    else {
                        emailM.innerHTML = "";
                    }
                }
            }
        </script>

        <script>
            function validatePassword() {
                var passM = document.getElementById("passwordMessage");
                var password1 = document.getElementById("password1");
                var password2 = document.getElementById("password2");
                var url = "http://localhost:8080/ScheduleSharp/passwordValidation?password1=" + password1.value + "&password2=" + password2.value;
                var req = new XMLHttpRequest();
                req.open("GET", url, false);
                req.send(null);

                if (req.readyState === 4 && req.status === 200) {
                    if (req.responseText !== "ok") {
                        passM.innerHTML = req.responseText;
                        password1.focus();
                    }
                    else {
                        passM.innerHTML = "";
                    }
                }
            }
        </script>

        <script>
            function validationlogin() {
                var username = document.forms["registerationform"]["username"].value;
                var fname = document.forms["registerationform"]["firstname"].value;
                var lname = document.forms["registerationform"]["lastname"].value;
                var pass1 = document.forms["registerationform"]["password1"].value;
                var pass2 = document.forms["registerationform"]["password2"].value;
                var email = document.forms["registerationform"]["email"].value;
                var passM = document.getElementById("passwordMessage");
                var password1 = document.getElementById("password1");

                if (fname === null || fname === "" || username === null || username === "" || lname === null ||
                        lname === "" || pass1 === null || pass1 === "" || pass2 === null
                        || pass2 === "" || email === null || email === "") {
                    passM.innerHTML = "Please enter your password";
                    password1.focus();
                    return false;                 
                } else {
                    alert("Please wait until administer approves your account");
                    return true;
                }
            }
        </script>


    </head>

    <body>

        <form name="registerationform" action ="RegistrationStudent" onsubmit="return validationlogin()">
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
                                            <td><div align="center"><input id="username" name="username" type="text" class="form-control" placeholder="USER NAME" onblur="validateUser()"></div></td>
                                            <td></td><td></td>
                                        </tr>
                                    <td><b>PASSWORD</b></td>
                                    <td><div align="center"><input id="password1" name="password1" type="password" class="form-control" placeholder="PASSWORD"></div></td>
                                    <td><b>CONFIRM PASSWORD</b></td>
                                    <td><div align="center"><input id="password2" name="password2" type="password" class="form-control" placeholder="PASSWORD(CONFIRM)" onblur="validatePassword()"></div></td>
                                    </tr>
                                    <tr>
                                        <td><b>FIRST NAME</b></td>
                                        <td><div align="center"><input id="firstname" name="firstname" type="text" class="form-control" placeholder="FIRST NAME" onblur="validateFname()"></div></td>
                                        <td><b>LAST NAME</b></td>
                                        <td><div align="center"><input id="lastname" name="lastname" type="text" class="form-control" placeholder="LAST NAME" onblur="validateLname()"></div></td>
                                    </tr>

                                    <tr>
                                        <td><b>EMAIL</b></td>
                                        <td><div align="center"><input id="email" name="email" type="text" class="form-control" placeholder="EMAIL" onblur="validateEmail()"></div></td>
                                        <td><b>SCHOOL</b></td>
                                        <td>
                                            <select id="sList" name="sList" class="form-control">
                                            </select>
                                        </td>
                                    </tr>                                  
                                    </tbody>

                                </table>
                            </div>        
                            <span>&nbsp;&nbsp;</span><span class="error" id="userMessage"></span><span class="error" id="fNameMessage"></span>
                            <span class="error" id="lNameMessage"></span> <span class="error" id="emailMessage"></span></span> <span class="error" id="passwordMessage"></span>
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
                                    <button type="button" id="registerStudent" name="registerStudent" class="btn btn-reg btn-lg btn-block" >REGISTER</button><br><!--data-toggle="modal" data-target="#Register"-->
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
        <script>
                                            function useAjax() {
                                                //alert("hurray");
                                                var url = "http://localhost:8080/ScheduleSharp/dropdownSchool";
                                                var req = new XMLHttpRequest();
                                                req.open("GET", url, false);
                                                req.send(null);
                                                //alert("state " + req.readyState + " status " + req.status);
                                                if (req.readyState === 4 && req.status === 200) {
                                                    $("#sList").append("<option>" + "</option>");
                                                    $("#sList").append(req.responseText);
                                                    $("#Register").modal("show").addClass("fade");
                                                }
                                            }

                                            $("#registerStudent").on("click", function () {
                                                //alert("here");
                                                useAjax();
                                            });
                                            //registerationform

        </script>

    </body>
</html>

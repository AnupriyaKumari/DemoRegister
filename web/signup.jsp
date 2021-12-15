<%-- 
    Document   : signup
    Created on : 15-Dec-2021, 4:04:26 pm
    Author     : ANUPRIYA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

        <!-- Compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

    </head>
    <body style="background: url(img/back1.jfif); background-size: cover; background-attachment: fixed">
        <div class="container" style="padding-bottom: 5px;">
            <div class="row">
                <div class="col m6 offset-m3">
                    <div class="card">
                        <div class="card-content">

                            <h3 style="margin-top: 10px;" class="center-align">Register here!!</h3>
                            <h5 id="msg" class="center-align"></h5>
                            <div class="form center-align">



                                <form action="Register" method="post" id="myform">
                                    <input type="text" name="user_name" placeholder="Enter user name">
                                    <input type="email" name="user_email" placeholder="Enter user email">
                                    <input type="password" name="user_password" placeholder="Enter password">

                                    <!--image-->
                                    <div class="file-field input-field">
                                        <div class="btn blue">
                                            <span>File</span>
                                            <input name="image" type="file">
                                        </div>
                                        <div class="file-path-wrapper">
                                            <input class="file-path validate" type="text">
                                        </div>
                                    </div>

                                    <!--image-->


                                    <button type="submit" class="btn light-blue accent-3">Submit</button>
                                </form>
                            </div>
                        </div>
                        <!--</div>-->
                        <!--loader-->   
                        <div class="loader center-align" style="margin-top: 10px; display:none;">
                            <!--loaderstart-->
                            <div class="preloader-wrapper big active">
                                <div class="spinner-layer spinner-blue">
                                    <div class="circle-clipper left">
                                        <div class="circle"></div>
                                    </div><div class="gap-patch">
                                        <div class="circle"></div>
                                    </div><div class="circle-clipper right">
                                        <div class="circle"></div>
                                    </div>
                                </div>

                                <div class="spinner-layer spinner-red">
                                    <div class="circle-clipper left">
                                        <div class="circle"></div>
                                    </div><div class="gap-patch">
                                        <div class="circle"></div>
                                    </div><div class="circle-clipper right">
                                        <div class="circle"></div>
                                    </div>
                                </div>

                                <div class="spinner-layer spinner-yellow">
                                    <div class="circle-clipper left">
                                        <div class="circle"></div>
                                    </div><div class="gap-patch">
                                        <div class="circle"></div>
                                    </div><div class="circle-clipper right">
                                        <div class="circle"></div>
                                    </div>
                                </div>

                                <div class="spinner-layer spinner-green">
                                    <div class="circle-clipper left">
                                        <div class="circle"></div>
                                    </div><div class="gap-patch">
                                        <div class="circle"></div>
                                    </div><div class="circle-clipper right">
                                        <div class="circle"></div>
                                    </div>
                                </div>
                            </div>

                            <h5> Please wait..........</h5>                  





                            <!--loaderpre-->     
                        </div>              
                        <!--loader-->          



                    </div>
                </div>
            </div>  
        </div> 
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"
                integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
        crossorigin="anonymous"></script>
        <script>
            $(document).ready(function () {
                console.log("page is ready...")
                $("#myform").on('submit', function (event) {
                    event.preventDefault();

//                    var f = $(this).serialize();
                      let f = new FormData(this);

                    console.log(f);

                    $(".loader").show();
                    $(".form").hide();

                    $.ajax({
                        url: "Register2",
                        data: f,
                        type: 'POST',
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            console.log("success.........")
                            $(".loader").hide();
                            $(".form").show();

                            if (data.trim() == 'done') {
                                $('#msg').html("Successfully Registered!!")
                                $('#msg').addClass('green-text')
                            } else {
                                $('#msg').html("Something went wrong on server..!!")
                                $('#msg').addClass('red-text')
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log(data);
                            console.log("error.........")
                            $(".loader").hide();
                            $(".form").show();
                            $('#msg').html("Something went wrong on server..!!")
                            $('#msg').addClass('red-text')
                        },
                        
                        processData:false,
                        contentType:false
                    })
                })
            })
        </script>
    </body>
</html>

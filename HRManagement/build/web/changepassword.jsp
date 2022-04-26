<%-- 
    Document   : changepassword
    Created on : Jan 19, 2022, 10:36:32 PM
    Author     : nghie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Change Password</title>

        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/bootstrap.css">

        <link rel="stylesheet" href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
        <link rel="stylesheet" href="assets/vendors/bootstrap-icons/bootstrap-icons.css">
        <link rel="stylesheet" href="assets/css/app.css">
        <link rel="shortcut icon" href="assets/images/favicon.svg" type="image/x-icon">
    </head>

    <body>
        <div id="app">
            <%@include file="sidebar.jsp" %>
            <div id="main">
                <div class="page-heading">

                    <!-- Basic Horizontal form layout section start -->
                    <section id="basic-horizontal-layouts">
                        <div class="row match-height">
                            <div class="col-md-12 col-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="card-title">Change Password</h4>
                                    </div>
                                    <c:if test="${param.status.equals('success')}">
                                        <div class="alert alert-light-success color-success">
                                            <i class="bi bi-check-circle"></i> ${requestScope.mess}
                                        </div>
                                    </c:if>
                                    <c:if test="${param.status.contains('fail')}">
                                        <div class="alert alert-light-danger color-danger">
                                            <i class="bi bi-exclamation-circle"></i> ${requestScope.mess}
                                        </div>
                                    </c:if>
                                    <div class="card-content">
                                        <div class="card-body">
                                            <form action="change-pass" method="post" class="form form-horizontal">
                                                <div class="form-body">
                                                    <div class="row">
                                                        <div class="col-12">
                                                            <div class="form-group has-icon-left">
                                                                <div class="col-md-4">
                                                                    <label>Old Password</label>
                                                                </div>
                                                                <div class="col-md-8 form-group">
                                                                    <div class="position-relative">
                                                                        <input type="password" class="form-control" id="inp-old"
                                                                               name="oldPassword" value="${requestScope.oldpass}">
                                                                        <span class="form-control-icon" id="sp-old">
                                                                            <i class="bi bi-eye" id="i-old"></i>
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-12">
                                                            <div class="form-group has-icon-left">
                                                                <div class="col-md-4">
                                                                    <label>New Password</label>
                                                                </div>
                                                                <div class="col-md-8 form-group">
                                                                    <div class="position-relative">
                                                                        <input type="password" class="form-control" id="inp-new"
                                                                               name="newPassword" value="${requestScope.newpass}"  pattern="[a-zA-Z0-9!@#$%^&*]{8,}" required>
                                                                        <span class="form-control-icon" id="sp-new">
                                                                            <i class="bi bi-eye" id="i-new"></i>
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-12">
                                                            <div class="form-group has-icon-left">
                                                                <div class="col-md-4">
                                                                    <label>Confirm Password</label>
                                                                </div>
                                                                <div class="col-md-8 form-group">
                                                                    <div class="position-relative">
                                                                        <input type="password" class="form-control" id="inp-conf"
                                                                               name="confPassword" value="${requestScope.confpass}">
                                                                        <span class="form-control-icon" id="sp-conf" >
                                                                            <i class="bi bi-eye" id="i-conf"></i>
                                                                        </span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-12">
                                                            <button type="submit"
                                                                    class="btn btn-primary me-1 mb-1">Submit</button>
                                                            <button type="reset"
                                                                    class="btn btn-light-secondary me-1 mb-1">Reset</button>
                                                        </div>
                                                        <a class="font-bold" href="reset-pass" style="width: 170px; margin-top: 50px;">Forgot password?</a>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <!-- // Basic Horizontal form layout section end -->
                </div>

            </div>
        </div>
        <script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <script>
            var input = "input";
            var icon = "icon";
            function pass() {
                var inputElement = document.getElementById(input);
                var iconElement = document.getElementById(icon);
                if (inputElement.type === "password") {
                    inputElement.type = "text";
                    iconElement.classList.add("bi-eye-slash");
                    iconElement.classList.remove("bi-eye");
                } else {
                    inputElement.type = "password";
                    iconElement.classList.add("bi-eye");
                    iconElement.classList.remove("bi-eye-slash");
                }
            }
            document.getElementById("sp-old").onclick = (() => {
                input = "inp-old";
                icon = "i-old";
                pass();
            });
            document.getElementById("sp-new").onclick = (() => {
                input = "inp-new";
                icon = "i-new";
                pass();
            });
            document.getElementById("sp-conf").onclick = (() => {
                input = "inp-conf";
                icon = "i-conf";
                pass();
            });
        </script>
        <script src="assets/js/main.js"></script>
    </body>

</html>
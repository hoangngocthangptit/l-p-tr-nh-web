<%-- 
    Document   : resetpassword
    Created on : Jan 19, 2022, 10:49:07 PM
    Author     : nghie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Reset Password</title>

        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/bootstrap.css">

        <link rel="stylesheet" href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
        <link rel="stylesheet" href="assets/vendors/bootstrap-icons/bootstrap-icons.css">
        <link rel="stylesheet" href="assets/css/app.css">
        <link rel="shortcut icon" href="assets/images/favicon.svg" type="image/x-icon">
    </head>

    <body>
        <div id="app ">
            <div id="main">
                <div class="page-heading">
                    <!-- Basic Horizontal form layout section start -->
                    <section id="basic-horizontal-layouts mx-auto">
                        <div class="row match-height ">
                            <div class="col-md-12 col-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="card-title">Reset Password</h4>
                                    </div>

                                    <c:if test="${param.status.equals('success')}">
                                        <div class="alert alert-light-success color-success">
                                            <i class="bi bi-check-circle"></i> ${requestScope.mess}
                                        </div>
                                    </c:if>
                                    <c:if test="${param.status.equals('fail') || param.status.equals('invalid')|| param.status.equals('fail_1')|| param.status.equals('fail_2')}">
                                        <div class="alert alert-light-danger color-danger">
                                            <i class="bi bi-exclamation-circle"></i> ${requestScope.mess}
                                        </div>
                                    </c:if>
                                    <c:if test="${param.status.contains('send')}">
                                        <div class="alert alert-light-info color-info">
                                            <i class="bi bi-star"></i> ${requestScope.mess}
                                        </div>
                                    </c:if>
                                    <c:if test="${param.action.equals('set')}">
                                        <c:set value="?request=${param.request}&action=set" var="action">
                                        </c:set>
                                    </c:if>
                                    <div class="card-content">
                                        <div class="card-body">
                                            <form action="reset-pass${action}" method="post" class="form form-horizontal">
                                                <div class="form-body">
                                                    <div class="row">
                                                        <c:if test="${!param.action.equals('set')}">
                                                            <div class="col-md-4">
                                                                <label>Email</label>
                                                            </div>
                                                            <div class="col-md-8 form-group">
                                                                <input type="email" class="form-control"
                                                                       name="email" value="${param.email}">
                                                            </div>
                                                            <div class="col-md-4">
                                                                <label>User name</label>
                                                            </div>
                                                            <div class="col-md-8 form-group">
                                                                <input type="text"  class="form-control"
                                                                       name="username" value="${param.username}">
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${param.action.equals('set')}">
                                                            <div class="col-md-4">
                                                                <label>New Password</label>
                                                            </div>
                                                            <div class="col-md-8">
                                                                <div class="form-group has-icon-left">
                                                                    <div class="form-group">
                                                                        <div class="position-relative">
                                                                            <input type="password" class="form-control" id="inp-new"
                                                                                   name="newPassword" value="${requestScope.newpass}" pattern="[a-zA-Z0-9!@#$%^&*]{8,}" required>
                                                                            <span class="form-control-icon" id="sp-new">
                                                                                <i class="bi bi-eye" id="i-new"></i>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <label>Confirm Password</label>
                                                            </div>
                                                            <div class="col-md-8">
                                                                <div class="form-group has-icon-left">
                                                                    <div class="form-group">
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
                                                        </c:if>
                                                        <div class="col-md-4">
                                                        </div>
                                                        <div class="col-sm-8">
                                                            <button type="submit"
                                                                    class="btn btn-primary me-1 mb-1">Submit</button>
                                                            <button type="reset"
                                                                    class="btn btn-light-secondary me-1 mb-1">Reset</button>
                                                        </div>
                                                        <div class="col-md-4">
                                                        </div>
                                                        <div class="col-sm-8">
                                                            <p class="text-gray-600">Remember your account? <a href="login" class="font-bold">Log in</a>.</p>
                                                        </div>
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
<%-- 
    Document   : taskbar
    Created on : Jan 15, 2022, 2:59:31 AM
    Author     : nghie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Dash Board</title>

        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/bootstrap.css">

        <link rel="stylesheet" href="assets/vendors/iconly/bold.css">

        <link rel="stylesheet" href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
        <link rel="stylesheet" href="assets/vendors/bootstrap-icons/bootstrap-icons.css">
        <link rel="stylesheet" href="assets/css/app.css">
        <link rel="shortcut icon" href="assets/images/favicon.svg" type="image/x-icon">
    </head>
    <body>
        <div id="sidebar" class="active">
            <div class="sidebar-wrapper active">
                <div class="sidebar-header">
                    <div class="d-flex justify-content-between">
                        <div class="logo">
                            <a href="index.jsp"><img src="assets/images/logo/logo.png" alt="Logo" srcset=""></a>
                        </div>
                        <div class="toggler">
                            <a href="#" class="sidebar-hide d-xl-none d-block"><i class="bi bi-x bi-middle"></i></a>
                        </div>
                    </div>
                </div>
                <div class="sidebar-menu" id="myDIV">

                    <ul class="menu">
                        <li class="sidebar-title">Menu</li>
                        <li class="sidebar-item active" >
                            <a href="dashboard" class='sidebar-link'>
                                <i class="bi bi-grid-fill"></i>
                                <span>Dashboard</span>
                            </a>
                        </li>

                        <c:if test = "${sessionScope.user.role.equals('HR')}">   
                            <li class="sidebar-item">
                                <a href="add" class='sidebar-link'>
                                    <i class="bi bi-file-earmark-spreadsheet-fill"></i>
                                    <span>Add New User</span>
                                </a>
                            </li>
                        </c:if>
                        <c:if test = "${sessionScope.user.role.equals('HR') || sessionScope.user.role.equals('Manager')}">   
                            <li class="sidebar-item ">
                                <a href="userlist" class='sidebar-link'>
                                    <i class="bi bi-file-earmark-spreadsheet-fill"></i>
                                    <span>Users List</span>
                                </a>
                            </li>
                        </c:if>
                        <li class="sidebar-item has-sub">
                            <a href="#" class='sidebar-link'>
                                <i class="bi bi-file-earmark-spreadsheet-fill"></i>
                                <span>Request</span>
                            </a>
                            <ul class="submenu"> 
                                <li class="submenu-item ">
                                    <a href="request-response">Request Response</a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="assigned-requests">Assigned Request</a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="requests-list">Request List</a>
                                </li>
                            </ul>
                        </li>
                        <c:if test = "${sessionScope.user.role.equals('HR')}">   
                            <li class="sidebar-item ">
                                <a href="grouplist " class='sidebar-link'>
                                    <i class="bi bi-file-earmark-spreadsheet-fill"></i>
                                    <span>Group List</span>
                                </a>
                            </li>
                        </c:if>
                        <c:if test = "${sessionScope.user.role.equals('Staff')}">   
                            <li class="sidebar-item ">
                                <a href="timesheetlist" class='sidebar-link'>
                                    <i class="bi bi-card-checklist"></i>
                                    <span>TimeSheet</span>
                                </a>
                            </li>
                        </c:if>
                        <c:if test = "${sessionScope.user.role.equals('Staff')}">    
                            <li class="sidebar-item ">
                                <a href="absence-review" class='sidebar-link'>
                                    <i class="bi bi-layout-text-window-reverse"></i>
                                    <span>Absence Review</span>
                                </a>
                            </li> 
                        </c:if>
                        <li class="sidebar-item ">
                            <a href="absence-request" class='sidebar-link'>
                                <i class="bi bi-layout-text-window-reverse"></i>
                                <span>Absence Request</span>
                            </a>
                        </li>    
                        <li class="sidebar-item focus">
                            <a href="project-list" class='sidebar-link'>
                                <i class="bi bi-kanban"></i>
                                <span>Project List</span>
                            </a>
                        </li>       
                        <li class="sidebar-item sidebar-toggler ">
                            <a href="change-pass" class='sidebar-link'>
                                <i class="bi bi-file-lock2"></i>
                                <span>Change Password</span>
                            </a>
                        </li>  
                        <li class="sidebar-item ">
                            <a href="profile" class='sidebar-link'>
                                <i class="bi bi-person"></i>
                                <span>User Profile</span>
                            </a>
                        </li>
                        <c:if test = "${sessionScope.user.role.equals('Admin')}">   
                            <li class="sidebar-item focus">
                                <a href="setting-list" class='sidebar-link'>
                                    <i class="bi bi-gear"></i>
                                    <span>Setting List</span>
                                </a>
                            </li>
                        </c:if>
                        <c:if test = "${sessionScope.user.role.equals('Admin')}">   
                            <li class="sidebar-item focus ">
                                <a href="supporttypelist" class='sidebar-link'>
                                    <i class="bi bi-sliders"></i>
                                    <span>Support Type List</span>
                                </a>
                            </li>
                        </c:if>
                        <li class="sidebar-item" id ="logout">
                            <a href="logout">
                                <span class="font-bold"> Logout</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <button class="sidebar-toggler btn x"><i data-feather="x"></i></button>
        </div>
        <script>
            var header = document.getElementById("myDIV");
            var btns = header.getElementsByClassName("sidebar-item");
            var a = header.getElementsByClassName("active")
            console.log(a)
            for (var i = 0; i < btns.length; i++) {
                btns[i].addEventListener("click", function () {
                    a[0].className = a[0].className.replace(" active", "");
                    this.className += " active";
                });
            }
        </script>
        <script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
        <script src="assets/js/bootstrap.bundle.min.js"></script>

        <script src="assets/vendors/apexcharts/apexcharts.js"></script>
        <script src="assets/js/pages/dashboard.js"></script>

        <script src="assets/js/main.js"></script>
    </body>

</html>

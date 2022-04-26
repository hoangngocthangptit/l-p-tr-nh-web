<%-- 
    Document   : request_details
    Created on : Feb 11, 2022, 10:06:13 PM
    Author     : ZenBook
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Form Layout - Mazer Admin Dashboard</title>

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
            <jsp:include page="sidebar.jsp"/>
            <div id="main">
                <header class="mb-3">
                    <a href="#" class="burger-btn d-block d-xl-none">
                        <i class="bi bi-justify fs-3"></i>
                    </a>
                </header>

                <div class="page-heading">
                    <div class="page-title">
                        <div class="row">
                            <div class="col-12 col-md-6 order-md-1 order-last">
                                <h3>Request Details</h3>
                                <p class="text-subtitle text-muted">Multiple form layout you can use</p>
                            </div>
                            <div class="col-12 col-md-6 order-md-2 order-first">
                                <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="dashboard">Dashboard</a></li>
                                        <li class="breadcrumb-item"><a href="requests-list">Requests List</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Request Details</li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>

                    <!-- Basic Vertical form layout section start -->
                    <section id="basic-vertical-layouts">
                        <div class="row match-height">
                            <div class="col-8">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="card-title">${req.title}</h4>
                                    </div>
                                    <div class="card-content">
                                        <div class="card-body">
                                            <form class="form form-vertical" action="request-details?id=${req == null ? 0 : req.id}"  method="post">
                                                <div class="form-body">
                                                    <div class="row">
                                                        <c:if test="${req == null}">
                                                            <div class="form-group">
                                                                <label for="request-user-vertical">Title: </label>
                                                                <input type="text" id="request-user-vertical" class="form-control" name="title">
                                                            </div>
                                                        </c:if>

                                                        <c:if test="${req != null}">
                                                            <div class="form-group">
                                                                <label for="status-vertical">Status: </label>
                                                                <input type="text" id="request-user-vertical" value="${req.status}"
                                                                       class="form-control" name="status" readonly>
                                                            </div>
                                                        </c:if>

                                                        <c:if test="${req == null || req.status.equals('Submitted')}">
                                                            <div class="form-group">
                                                                <label for="sp-column">Support Type:</label>
                                                                <select class="form-select" id="sp-column" ${acc.getId() != req.getRaisedStaff().getId() && acc.getId() != manager.getId() && req != null ? "disabled" : ""} name="support-type">
                                                                    <c:forEach items="${sp}" var="s">
                                                                        <option value="${s.id}" ${s.id == req.getSupportType().getId() ? "selected" : ""}>${s.name}</option>
                                                                    </c:forEach> 
                                                                </select>
                                                            </div>
                                                        </c:if>

                                                        <div class="form-group">
                                                            <label>Description: </label>
                                                            <div class="form-group">
                                                                <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="des">${req.des}</textarea>
                                                            </div>
                                                        </div>
                                                        <c:if test="${req != null}">
                                                            <div class="col-6">
                                                                <div class="form-group">
                                                                    <label for="request-date-vertical">Request Date:</label>
                                                                    <input type="date" id="request-date-vertical" readonly value="${req.requestDate}"
                                                                           class="form-control" name="request-date">
                                                                </div>
                                                            </div>
                                                            <div class="col-6">
                                                                <div class="form-group">
                                                                    <label for="updated-date-vertical">Updated Date:</label>
                                                                    <input type="date" id="updated-date-vertical" readonly value="${req.updatedDate}"
                                                                           class="form-control" name="updated-date">
                                                                </div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="request-user-vertical">Request user: </label>
                                                                <a href="profile?id=${req.getRaisedStaff().getId()}"
                                                                   class="form-control" name="request-user">${req.getRaisedStaff().getUsername()}</a>
                                                            </div>
                                                        </c:if>
                                                        <div class="col-12 d-flex justify-content-end">
                                                            <c:if test="${req.status.equals('Submitted')}">
                                                                <button type="submit" class="btn btn-primary me-1 mb-1">Edit</button>
                                                            </c:if>
                                                            <c:if test="${req == null}">
                                                                <button type="submit" class="btn btn-primary me-1 mb-1">Create</button>
                                                            </c:if>
                                                            <a href="requests-list" class="btn btn-light-secondary me-1 mb-1">Cancel</a>
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
                    <!-- // Basic Vertical form layout section end -->
                </div>

                <footer>
                    <div class="footer clearfix mb-0 text-muted">
                        <div class="float-start">
                            <p>2021 &copy; Mazer</p>
                        </div>
                        <div class="float-end">
                            <p>Crafted with <span class="text-danger"><i class="bi bi-heart"></i></span> by <a
                                    href="http://ahmadsaugi.com">A. Saugi</a></p>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
        <script src="assets/js/bootstrap.bundle.min.js"></script>

        <script src="assets/js/main.js"></script>
    </body>

</html>
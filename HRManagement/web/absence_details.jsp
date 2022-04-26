<%-- 
    Document   : absence_details
    Created on : Mar 6, 2022, 2:04:00 PM
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
                                <h3>Absence Details</h3>
                            </div>
                            <div class="col-12 col-md-6 order-md-2 order-first">
                                <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="dashboard">Dashboard</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Absence Details</li>
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
                                        <h4 class="card-title">${absence.title}</h4>
                                    </div>
                                    <div class="card-content">
                                        <div class="card-body">
                                            <div class="form-body">
<<<<<<< Updated upstream
<<<<<<< Updated upstream
                                            If type is Absence, Duration is Optional
                                                <form action="absence-details">
=======
                                                If type is Absence, Duration is Optional
                                                <form action="absence-details?id=${absence.id}" method="post">
>>>>>>> Stashed changes
=======
                                                If type is Absence, Duration is Optional
                                                <form action="absence-details?id=${absence.id}" method="post">
>>>>>>> Stashed changes
                                                    <div class="row">
                                                        <c:if test="${absence == null}">
                                                            <label for="status-vertical">ID: </label>
                                                            <div class="form-group">
                                                                <input type="hidden" class="form-control" value="${absence.id}" name="id">
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${absence == null}">
                                                            <label for="status-vertical">Title: </label>
                                                            <div class="form-group">
                                                                <input type="text" class="form-control" value="${absence.type}" name="title">
                                                            </div>
                                                        </c:if>
                                                        <c:if test="${absence != null}">
                                                            <label for="status-vertical">Status: </label>
                                                            <div class="form-group">
                                                                <input type="text" class="form-control" value="${absence.status}" readonly>
                                                            </div>
                                                        </c:if>

                                                        <div class="col-6">
                                                            <div class="form-group">
                                                                <label for="sp-column">Absence Type</label>
                                                                <select class="form-select" id="sp-column" name="absence-type">
                                                                    <option></option>
                                                                    <c:forEach items="${types}" var="s">
                                                                        <option value="${s}" ${s.equals(type) ? "selected" : ""}>${s}</option>
                                                                    </c:forEach> 
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="col-6">
                                                            <label>Duration</label>
                                                            <div class="form-group">
                                                                <input type="number" class="form-control" name="duration" value="${absence.duration}">
                                                            </div>
                                                        </div>
                                                        <div class="col-6">
                                                            <label>From</label>
                                                            <div class="form-group">
                                                                <input type="date" name="from" class="form-control" value="${absence.startDate}">
                                                            </div>
                                                        </div>
                                                        <div class="col-6">
                                                            <label>To</label>
                                                            <div class="form-group">
                                                                <input type="date" name="to" class="form-control" value="${absence.endDate}">
                                                            </div>
                                                        </div>

                                                        <c:if test="${absence != null}">
                                                            <div class="col-6">
                                                                <label for="request-user-vertical">Request user: </label>
                                                                <div class="form-group">
                                                                    <input type="text" id="request-user-vertical" value="${absence.staff.getUsername()}"
                                                                           class="form-control" name="request-user" readonly>
                                                                </div>
                                                            </div>
                                                            <div class="col-6">
                                                                <div class="form-group">
                                                                    <label for="request-date-vertical">Request Date:</label>
                                                                    <input type="date" id="request-date-vertical" value="${absence.requestDate}"
                                                                           class="form-control" name="request-date" readonly>
                                                                </div>
                                                            </div>
                                                        </c:if>
                                                        <div class="col-12 d-flex justify-content-end">
                                                            <c:if test="${absence == null}">
                                                                <button type="submit" class="btn btn-primary me-1 mb-1">
                                                                    Create
                                                                </button>
                                                            </c:if>
                                                            <c:if test="${absence.status.equals('Submitted') && absence.status.equals('Rejected')}">
                                                                <button type="submit" class="btn btn-primary me-1 mb-1">
                                                                    Edit
                                                                </button>
                                                            </c:if>
                                                        </div>
                                                    </div>

                                                </form>
                                            </div>
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
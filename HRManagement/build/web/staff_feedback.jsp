<%-- 
    Document   : staff_feedback
    Created on : Jan 18, 2022, 7:12:57 PM
    Author     : ZenBook
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Staff Feedback</title>

        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/bootstrap.css">
        <link rel="stylesheet" href="http://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
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
                                <h3>Staff Feedback</h3>
                                <p class="text-subtitle text-muted">Get feedback from staff after a request</p>
                            </div>
                            <div class="col-12 col-md-6 order-md-2 order-first">
                                <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Staff Feedback</li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>

                    <!-- Basic Horizontal form layout section start -->
                    <section id="basic-horizontal-layouts">
                        <div class="row match-height">
                            <div class="col-md-6 col-12">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="card-title">${requestScope.title}</h4>
                                        <c:if test="${param.status.contains('success') || param.status.contains('edit')}">
                                            <div class="alert alert-light-success color-success">
                                                <i class="bi bi-check-circle">${requestScope.mess}</i> 
                                            </div>
                                        </c:if>
                                        <c:if test="${param.status.contains('error')}">
                                            <div class="alert alert-light-danger color-danger">
                                                <i class="bi bi-exclamation-circle">${requestScope.mess}</i> 
                                            </div>
                                        </c:if>
                                    </div>
                                    <div class="card-content">
                                        <div class="card-body">
                                            <form class="form form-horizontal" action="staff-feedback?id=${param.id}" method="post">
                                                <div class="form-body">
                                                    <div class="row">
                                                        <div class="col-12">
                                                            <div class="card-body" style="text-justify: center">
                                                                <p>We would like your feedback to improve our website.
                                                                    What is your opinion of this page?</p>
                                                                <p>
                                                                    <c:set value="${param.star != null ? param.star : requestScope.star}" var="star">
                                                                    </c:set>
                                                                    <input type="radio" class="star star-5" name="star" value="5" 
                                                                           <c:if test="${star.equals('5')}">
                                                                               checked
                                                                           </c:if>
                                                                           />
                                                                    <label class="star star-5" for="star-5">Perfect</label>
                                                                </p>
                                                                <p>
                                                                    <input type="radio" class="star star-4" name="star" value="4" 
                                                                           <c:if test="${star.equals('4')}">
                                                                               checked
                                                                           </c:if>
                                                                           />
                                                                    <label class="star star-4" for="star-4">Very good</label>
                                                                </p>
                                                                <p>
                                                                    <input type="radio" class="star star-4" name="star" value="3"
                                                                           <c:if test="${star.equals('3')}">
                                                                               checked
                                                                           </c:if>
                                                                           />
                                                                    <label class="star star-4" for="star-4">Normal</label>
                                                                </p>
                                                                <p>
                                                                    <input type="radio" class="star star-4" name="star" value="2"
                                                                           <c:if test="${star.equals('2')}">
                                                                               checked
                                                                           </c:if>
                                                                           />
                                                                    <label class="star star-4" for="star-4">Not good</label>
                                                                </p>
                                                                <p>
                                                                    <input type="radio" class="star star-4" name="star" value="1"
                                                                           <c:if test="${star.equals('1')}">
                                                                               checked
                                                                           </c:if>
                                                                           />
                                                                    <label class="star star-4" for="star-4">Bad</label>
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <div class="col-12">
                                                            <div class="form-group mb-3">
                                                                <label for="exampleFormControlTextarea1" class="form-label">Please leave your feedback below:</label>
                                                                <textarea class="form-control" id="exampleFormControlTextarea1" name="comment"
                                                                          rows="3">${param.comment != null ? param.comment : requestScope.comment}</textarea>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-12 d-flex justify-content-end">
                                                            <button type="submit"
                                                                    class="btn btn-primary me-1 mb-1">Submit</button>
                                                            <button type="reset"
                                                                    class="btn btn-light-secondary me-1 mb-1">Reset</button>
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

        <script src="assets/vendors/rater-js/rater-js.js"></script>
        <script src="assets/js/extensions/rater-js.js"></script>

        <script src="assets/js/main.js"></script>
    </body>

</html>
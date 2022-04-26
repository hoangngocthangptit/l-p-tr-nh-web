<%-- 
    Document   : request_response
    Created on : Mar 8, 2022, 9:56:58 PM
    Author     : ZenBook
--%>

<%@page import="dao.UserDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="model.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>DataTable - Mazer Admin Dashboard</title>

        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/bootstrap.css">

        <link rel="stylesheet" href="assets/vendors/simple-datatables/style.css">
        <link rel="stylesheet" href="assets/vendors/fontawesome/all.min.css">

        <style>
            .fontawesome-icons {
                text-align: center;
            }

            article dl {
                background-color: rgba(0, 0, 0, .02);
                padding: 20px;
            }

            .fontawesome-icons .the-icon svg {
                font-size: 24px;
            }
        </style>

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
                                <h3>Request Response</h3>
                            </div>
                            <div class="col-12 col-md-6 order-md-2 order-first">
                                <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="dashboard">Dashboard</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Request Response</li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                    <section class="section">
                        <div class="card">
                            <div class="card-body">
                                <table class="table table-striped" id="table1">
                                    <thead>
                                        <tr>
                                            <th>Title</th>
                                            <th>Support Type</th>
                                            <th>Status</th>
                                            <th>Request Date</th>
                                            <th>Updated Date</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${requests}" var="r">
                                            <tr>
                                                <td>${r.title}</td>
                                                <td>${r.getSupportType().getName()}</td>
                                                <td>
                                                    <span class="badge bg-success">${r.status}</span>
                                                </td>
                                                <td>${r.getDMYRequestDate()}</td>
                                                <td>${r.getDMYUpdatedDate()}</td>
                                                <c:if test="${r.status != 'Closed'}">
                                                    <td>
                                                        <!-- Button trigger for login form modal -->
                                                        <button type="button" class="btn btn-outline-success" data-bs-toggle="modal"
                                                                data-bs-target="#inlineForm-${r.id}">
                                                            <dt class="the-icon"><span class="fa-fw select-all fas"></span></dt>
                                                        </button>

                                                        <!--login form Modal -->
                                                        <div class="modal fade text-left" id="inlineForm-${r.id}" tabindex="-1"
                                                             role="dialog" aria-labelledby="myModalLabel33" aria-hidden="true">
                                                            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
                                                                 role="document">
                                                                <div class="modal-content">
                                                                    <div class="modal-header">
                                                                        <h4 class="modal-title" id="myModalLabel33">Login Form </h4>
                                                                        <button type="button" class="close" data-bs-dismiss="modal"
                                                                                aria-label="Close">
                                                                            <i data-feather="x"></i>
                                                                        </button>
                                                                    </div>
                                                                    <form action="request-response?id=${r.id}" method="post">
                                                                        <div class="modal-body">
                                                                            <label>In-charge Staff: </label>
                                                                            <fieldset class="form-group">
                                                                                <select name="incharge" class="form-select" id="basicSelect">
                                                                                    <c:forEach items="${r.getSupportType().getIn_charge_team().getMembers()}" var="m">
                                                                                        <option value="${m.getId()}">${m.getUsername()}</option>
                                                                                    </c:forEach>
                                                                                </select>
                                                                            </fieldset>
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button type="button" class="btn btn-light-secondary"
                                                                                    data-bs-dismiss="modal">
                                                                                <i class="bx bx-x d-block d-sm-none"></i>
                                                                                <span class="d-none d-sm-block">Close</span>
                                                                            </button>
                                                                            <button type="submit" class="btn btn-primary ml-1">Submit</button>
                                                                        </div>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </c:if>

                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </section>
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

        <script src="assets/vendors/fontawesome/all.min.js"></script>

        <script src="assets/js/mazer.js"></script>
        <script src="assets/vendors/simple-datatables/simple-datatables.js"></script>
        <script>
            // Simple Datatable
            let table1 = document.querySelector('#table1');
            let dataTable = new simpleDatatables.DataTable(table1);
        </script>

        <script src="assets/js/main.js"></script>
    </body>

</html>

<%-- 
    Document   : timesheetlist
    Created on : Mar 5, 2022, 6:45:54 PM
    Author     : Minh Hieu Pham
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Timesheet List</title>

        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/bootstrap.css">

        <link rel="stylesheet" href="assets/vendors/simple-datatables/style.css">

        <link rel="stylesheet" href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
        <link rel="stylesheet" href="assets/vendors/bootstrap-icons/bootstrap-icons.css">
        <link rel="stylesheet" href="assets/css/app.css">
        <link rel="shortcut icon" href="assets/images/favicon.svg" type="image/x-icon">
    </head>
    <body>
        <div id="app">
            <jsp:include page="sidebar.jsp"/>
            <div id="main">
                <div class="page-title">
                    <div class="row">
                        <div class="col-12 col-md-6 order-md-1 order-last">
                            <h3>Timesheet List</h3>
                            <p class="text-subtitle text-muted"></p>
                        </div>
                        <div class="col-12 col-md-6 order-md-2 order-first">
                            <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                <a href="timesheetdetail?action=add" class="btn btn-secondary">New Timesheet</a>
                            </nav>

                        </div>
                    </div>
                </div>
                <div class="card">
                    <div class="card-content">
                        <div class="card-body">
                            <form class="form" action="timesheetlist" method="get">
                                <div class="row">
                                    <div class="col-md-3 col-12">
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="Title" 
                                                   name="title" value="${requestScope.title}">
                                        </div>
                                    </div>
                                    <div class="col-md-1 col-12" style="text-align: right">
                                        From:
                                    </div>
                                    <div class="col-md-3 col-12">
                                        <div class="form-group">
                                            <input type="date" id="from" class="form-control" placeholder="" 
                                                   name="from" value="${requestScope.from}">
                                        </div>
                                    </div>
                                    <div class="col-md-1 col-12" style="text-align: right">
                                        To:
                                    </div>
                                    <div class="col-md-3 col-12">
                                        <div class="form-group">
                                            <input type="date" id="to" class="form-control" placeholder="" 
                                                   name="to" value="${requestScope.to}" onblur="comparedate();">
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-12"></div>
                                    <div class="col-md-7 col-12">
                                        <p id="error_date"></p>
                                    </div>
                                    <div class="col-md-3 col-12">
                                        <div class="form-group">
                                            <select name="process" class="form-select">
                                                <option>All Process</option>
                                                <c:forEach var="process" items="${requestScope.data_process}">
                                                    <option <c:if test="${process.equals(requestScope.process)}">selected=""</c:if>>${process}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-12">
                                        <div class="form-group">
                                            <select name="project" class="form-select">
                                                <option>All Projects</option>
                                                <c:forEach var="p" items="${requestScope.data_projects}">
                                                    <option <c:if test="${p.projectCode.equals(requestScope.project)}">selected=""</c:if>>${p.projectCode}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-1 col-12">
                                        <button type="submit" class="btn btn-primary me-1 mb-1">Search</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>  
                <div class="row" id="table-hover-row">
                    <div class="col-12">
                        <div class="card">

                            <div class="card-content">
                                <!-- table hover -->
                                <div class="table-responsive">
                                    <table class="table table-bordered mb-0" id="table1">
                                        <thead>
                                            <tr>
                                                <th>DATE</th>
                                                <th>TITLE</th>
                                                <th>PROJECT</th>
                                                <th>PROCESS</th>
                                                <th>DURATION</th>
                                                <th>STATUS</th>
                                                <th>ACTION</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="ts" items="${requestScope.data}">
                                                <tr>
                                                    <td>
                                                        <fmt:formatDate value="${ts.timesheetDate}" pattern="dd-MM-yyyy"/>
                                                    </td>
                                                    <td><a href="timesheetdetail?action=update&id=${ts.id}">${ts.timesheetTitle}</a></td>
                                                    <td>${ts.projectCode}</td>
                                                    <td>
                                                        ${ts.process}
                                                    </td>
                                                    <td>${ts.duration}&nbsp;hour(s)</td>
                                                    <td>${ts.status}</td>
                                                    <td>

                                                        <div class="modal-primary me-1 mb-1 d-inline-block">
                                                            <!-- Button trigger for primary themes modal -->
                                                            <button type="button" class="btn btn-danger"
                                                                    <c:if test="${!ts.status.equals('Submitted')}">
                                                                        disabled</c:if>
                                                                        data-bs-toggle="modal" data-bs-target="#primary-${ts.id}">
                                                                        Delete
                                                                    </button>

                                                                    <!--primary theme Modal -->
                                                                    <div class="modal fade text-left" id="primary-${ts.id}" tabindex="-1"
                                                                 role="dialog" aria-labelledby="myModalLabel160"
                                                                 aria-hidden="true">
                                                                <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
                                                                     role="document">
                                                                    <div class="modal-content">
                                                                        <div class="modal-header bg-primary">
                                                                            <h5 class="modal-title white" id="myModalLabel160">
                                                                                Confirm
                                                                            </h5>
                                                                            <button type="button" class="close"
                                                                                    data-bs-dismiss="modal" aria-label="Close">
                                                                                <i data-feather="x"></i>
                                                                            </button>
                                                                        </div>
                                                                        <div class="modal-body">
                                                                            Are you want to delete this support type?
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <button type="button"
                                                                                    class="btn btn-light-secondary"
                                                                                    data-bs-dismiss="modal">
                                                                                <i class="bx bx-x d-block d-sm-none"></i>
                                                                                <span class="d-none d-sm-block">Close</span>
                                                                            </button>
                                                                            <a href="deletetimesheet?id=${ts.id}"
                                                                               style="text-decoration: none; color: inherit;">
                                                                                <button type="button" class="btn btn-primary ml-1">
                                                                                    <i class="bx bx-check d-block d-sm-none"></i>
                                                                                    Accept
                                                                                </button>
                                                                            </a>

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <br>

                    </div>
                </div>
            </div>
        </div>

        <script src="assets/vendors/simple-datatables/simple-datatables.js"></script>
        <script>
                                                       // Simple Datatable
                                                       let table1 = document.querySelector('#table1');
                                                       let dataTable = new simpleDatatables.DataTable(table1);
        </script>
        <script>
            function comparedate()
            {
                var startDt = document.getElementById("from").value;
                var endDt = document.getElementById("to").value;

                if ((new Date(startDt).getTime() > new Date(endDt).getTime()))
                {
                    document.getElementById("error_date").innerHTML = "Start date must be earlier than end date";
                    document.getElementById("error_date").style = "color: red;";
                    document.getElementById("from").style = "border-color: red";
                    document.getElementById("to").style = "border-color: red";
                } else {
                    document.getElementById("error_date").innerHTML = "";
                    document.getElementById("error_date").style = "color:;";
                    document.getElementById("from").style = "border-color: ";
                    document.getElementById("to").style = "border-color: ";
                }

            }
        </script>
        <style>
            .dataTable-input{
                display: none;
            }
        </style>
    </body>
</html>

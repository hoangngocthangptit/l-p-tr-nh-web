<%-- 
    Document   : grouplist
    Created on : Jan 21, 2022, 11:23:37 PM
    Author     : Minh Hieu Pham
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Support Type List</title>

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
                            <h3>Support Type List</h3>
                            <p class="text-subtitle text-muted"></p>
                        </div>
                        <div class="col-12 col-md-6 order-md-2 order-first">
                            <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                <a href="addsupporttype" class="btn btn-secondary">Add new support type</a>
                            </nav>

                        </div>
                    </div>
                </div>
                <section id="basic-horizontal-layouts">
                    <div class="row match-height">
                        <div class="col-md-5 col-12">

                        </div>
                        <div class="col-md-7 col-12">

                        </div>
                    </div>
                </section>
                <section class="section">
                    <div class="row" id="table-hover-row">
                        <div class="col-12">
                            <div class="card">

                                <div class="card-content">
                                    <!-- table hover -->
                                    <div class="table-responsive">
                                        <table class="table table-bordered mb-0" >
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Name</th>
                                                    <th>In-charge Group</th>
                                                    <th>Support Email</th>
                                                    <th>Status</th>
                                                    <th>ACTION</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="sp" items="${requestScope.data}">
                                                    <tr>
                                                        <td>${sp.id}</td>
                                                        <td><a href="updatesupporttype?id=${sp.id}">${sp.name}</a></td>
                                                        <td>${sp.in_charge_team.name}</td>
                                                        <td>${sp.email}</td>
                                                        <td>${sp.status}</td>

                                                        <td>
                                                            <div class="modal-primary me-1 mb-1 d-inline-block">
                                                                <!-- Button trigger for primary themes modal -->
                                                                <c:if test="${sp.status == 'active'}">
                                                                    <button type="button" class="btn btn-danger"
                                                                            data-bs-toggle="modal" data-bs-target="#primary-${sp.id}">
                                                                        Deactivate
                                                                    </button>
                                                                </c:if>
                                                                <c:if test="${sp.status == 'inactive'}">
                                                                    <button type="button" class="btn btn-success"
                                                                            data-bs-toggle="modal" data-bs-target="#primary-${sp.id}">
                                                                        Activate
                                                                    </button>
                                                                </c:if>

                                                                <!--primary theme Modal -->
                                                                <div class="modal fade text-left" id="primary-${sp.id}" tabindex="-1"
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
                                                                                Are you want to&nbsp;
                                                                                <c:if test="${sp.status == 'active'}">
                                                                                    deactivate
                                                                                </c:if>
                                                                                <c:if test="${sp.status == 'inactive'}">
                                                                                    activate
                                                                                </c:if>
                                                                                &nbsp;this support type?
                                                                            </div>
                                                                            <div class="modal-footer">
                                                                                <button type="button"
                                                                                        class="btn btn-light-secondary"
                                                                                        data-bs-dismiss="modal">
                                                                                    <i class="bx bx-x d-block d-sm-none"></i>
                                                                                    <span class="d-none d-sm-block">Close</span>
                                                                                </button>
                                                                                <c:if test="${sp.status == 'active'}">
                                                                                    <a href="deleteactivesupporttype?id=${sp.id}"
                                                                                       style="text-decoration: none; color: inherit;">
                                                                                        <button type="button" class="btn btn-primary ml-1">
                                                                                            <i class="bx bx-check d-block d-sm-none"></i>
                                                                                            Accept
                                                                                        </button>
                                                                                    </a>
                                                                                </c:if>
                                                                                <c:if test="${sp.status == 'inactive'}">
                                                                                    <a href="recoversupporttype?id=${sp.id}"
                                                                                       style="text-decoration: none; color: inherit;">
                                                                                        <button type="button" class="btn btn-primary ml-1">
                                                                                            <i class="bx bx-check d-block d-sm-none"></i>
                                                                                            Accept
                                                                                        </button>
                                                                                    </a>
                                                                                </c:if>
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
        </section>

    </div>
</div>

<script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="assets/js/bootstrap.bundle.min.js"></script>

<script src="assets/vendors/simple-datatables/simple-datatables.js"></script>
<script>
    // Simple Datatable
    let table1 = document.querySelector('#table1');
    let dataTable = new simpleDatatables.DataTable(table1);
</script>

<script src="assets/js/main.js"></script>
</body>
</html>

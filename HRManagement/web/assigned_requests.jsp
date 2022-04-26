<%-- 
    Document   : assigned_requests
    Created on : Feb 19, 2022, 2:12:30 AM
    Author     : ZenBook
--%>

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
        <link rel="stylesheet" href="assets/vendors/dripicons/webfont.css">
        <link rel="stylesheet" href="assets/css/pages/dripicons.css">

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
                                <h3>Assigned Requests</h3>
                                <p class="text-subtitle text-muted">For user to check they list</p>
                            </div>
                            <div class="col-12 col-md-6 order-md-2 order-first">
                                <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Assigned Requests</li>
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                    <section id="multiple-column-form">
                        <div class="row match-height">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-content">
                                        <div class="card-body">
                                            <form action="assigned-requests" method="post" class="form">
                                                <div class="row">
                                                    <div class="col-md-4 col-12">
                                                        <div class="form-group">
                                                            <label for="title-column">Title</label>
                                                            <input type="text" id="title-column" class="form-control"
                                                                   value="${title}" name="title">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4 col-12">
                                                        <div class="form-group">
                                                            <label for="request-column">Request Date</label>
                                                            <input type="date" id="request-column" class="form-control"
                                                                   value="${requestDate}" name="request-date">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4 col-12">
                                                        <div class="form-group">
                                                            <label for="updated-column">Updated Date</label>
                                                            <input type="date" id="updated-column" class="form-control"
                                                                   value="${updatedDate}" name="updated-date">
                                                        </div>
                                                    </div>
                                                    <c:if test="${manager != null}">
                                                        <div class="col-md-4 col-12">
                                                            <div class="form-group">
                                                                <label for="sp-column">Raised Staff</label>
                                                                <select class="form-select" id="sp-column" name="incharge-staff">
                                                                    <option></option>
                                                                    <c:forEach items="${staffs}" var="s">
                                                                        <option value="${s.id}" ${s.id == inchargeId ? "selected" : ""}>${s.name}</option>
                                                                    </c:forEach> 
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </c:if>

                                                    <div class="col-md-4 col-12">
                                                        <div class="form-group">
                                                            <label for="sp-column">Support Type</label>
                                                            <select class="form-select" id="sp-column" name="support-type">
                                                                <option></option>
                                                                <c:forEach items="${sp}" var="s">
                                                                    <option value="${s.id}" ${s.id == spId ? "selected" : ""}>${s.name}</option>
                                                                </c:forEach> 
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-4 col-12">
                                                        <div class="form-group">
                                                            <label for="status-column">Status</label>
                                                            <select class="form-select" id="status-column" name="status">
                                                                <option></option>
                                                                <c:forEach items="${status}" var="s">
                                                                    <option value="${s}" ${s.equals(st) ? "selected" : ""}>${s}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="${manager == null ? 'col-12' : 'col-4'}  d-flex justify-content-end flex-row">
                                                        <button type="submit" class="btn btn-primary me-1 mb-1">Search</button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <section class="section">
                        <div class="card">
                            <div class="card-header">
                                Assigned Requests
                            </div>
                            <div class="card-body">
                                <table class="table table-striped" id="table1">

                                    <thead>
                                        <tr>
                                            <th>Title</th>
                                            <th>Raised Staff</th>
                                            <th>Support Type</th>
                                            <th>Status</th>
                                                ${manager == null ? '' : '<th>In-charge Staff</th>'}
                                            <th>Request Date</th>
                                            <th>Updated</th>
                                            <th>Description</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${requests}" var="r">
                                            <tr>
                                                <td>${r.title}</td>
                                                <td>
                                                    <!-- Button trigger for login form modal -->
                                                    <button type="button" class="btn breadcrumb-item active" data-bs-toggle="modal"
                                                            data-bs-target="#inlineForm-${r.id}">
                                                        ${r.getRaisedStaff().getUsername()}
                                                    </button>
                                                    <!--login form Modal -->
                                                    <div class="modal fade text-left" id="inlineForm-${r.id}" tabindex="-1"
                                                         role="dialog" aria-labelledby="myModalLabel33" aria-hidden="true">
                                                        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
                                                             role="document">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h4 class="modal-title" id="myModalLabel33">Raised Staff Information </h4>
                                                                    <button type="button" class="close" data-bs-dismiss="modal"
                                                                            aria-label="Close">
                                                                        <i data-feather="x"></i>
                                                                    </button>
                                                                </div>
                                                                <form>
                                                                    <div class="modal-body">
                                                                        <div class="form-group">
                                                                            <label>In-charge Staff: </label>
                                                                            <input type="text" class="form-control" readonly value="${r.getRaisedStaff().getFullname()}">
                                                                        </div>

                                                                        <div class="form-group">
                                                                            <label>Mobile: </label>
                                                                            <input type="text" class="form-control" readonly value="${r.getRaisedStaff().getMobile()}">     
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label>Gender: </label>
                                                                            <input type="text" class="form-control" readonly value="${r.getRaisedStaff().getGender()}">     
                                                                        </div>
                                                                        <div class="form-group">
                                                                            <label>Birthdate: </label>
                                                                            <input type="text" class="form-control" readonly value="${r.getRaisedStaff().getBirthdate()}">     
                                                                        </div>


                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-light-secondary"
                                                                                data-bs-dismiss="modal">
                                                                            <i class="bx bx-x d-block d-sm-none"></i>
                                                                            <span class="d-none d-sm-block">Close</span>
                                                                        </button>
                                                                    </div>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>

                                                <td>${r.getSupportType().getName()}</td>
                                                <td>
                                                    <span class="badge bg-success">${r.status}</span>
                                                </td>
                                                <c:if test="${manager != null}">
                                                    <td>${r.getInchargeStaff().getUsername()}</td>
                                                </c:if>
                                                <td>${r.getDMYRequestDate()}</td>
                                                <td>${r.getDMYUpdatedDate()}</td>
                                                <td>${r.des}</td>
                                                <td>
                                                    <c:if test="${!r.status.equals('Completed')}">
                                                        <a href="assigned-requests?reqId=${r.id}&status=Completed" class="btn btn-outline-success">
                                                            <div class="icon dripicons-checkmark"></div>
                                                        </a>
                                                    </c:if>
                                                </td>
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

        <script src="assets/vendors/simple-datatables/simple-datatables.js"></script>
        <script>
            // Simple Datatable
            let table1 = document.querySelector('#table1');
            let dataTable = new simpleDatatables.DataTable(table1);
        </script>

        <!-- Include Choices JavaScript -->
        <script src="assets/vendors/choices.js/choices.min.js"></script>
        <script src="assets/vendors/fontawesome/all.min.js"></script>
        <script src="assets/js/main.js"></script>
        <script src="assets/js/mazer.js"></script>
    </body>

</html>

<%-- 
    Document   : grouplist
    Created on : Jan 21, 2022, 11:23:37 PM
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
        <title>Group List</title>

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
                <section id="basic-horizontal-layouts">
                    <div class="row match-height">
                        <div class="card">
                            <div class="card-content">
                                <div class="card-body">
                                    <form class="form" action="grouplist" method="get">
                                        <div class="row">
                                            <div class="col-md-3 col-12">
                                                <div class="form-group">
                                                    <input type="text" id="first-name" class="form-control"
                                                           name="str" placeholder="Enter text" value="${requestScope.str}">
                                                </div>
                                            </div>

                                            <div class="col-md-3 form-group">
                                                
                                                <select name="parent_group" class="form-select" id="basicSelect">
                                                    <option>Parent Group</option>
                                                    <c:forEach var="g" items="${requestScope.listParentGroup}">
                                                        <option <c:if test="${g.code.equals(requestScope.parent_gr_code)}">
                                                                selected=""</c:if>>${g.code}
                                                            </option>
                                                    </c:forEach>
                                                </select>

                                            </div>


                                            <div class="col-md-3 form-group">
                                                <select name="gr_type" class="form-select" id="basicSelect">
                                                    <option value="Group Type" <c:if test="${gr_type.equals('Group Type')}">selected</c:if>>Group Type</option>
                                                    <option value="BA" <c:if test="${gr_type.equals('BA')}">selected</c:if>>BA</option>
                                                    <option value="Non-BA" <c:if test="${gr_type.equals('Non-BA')}">selected</c:if>>Non-BA</option>
                                                    </select>
                                                </div>


                                                <div class="col-md-2 form-group">
                                                    <select name="status" class="form-select" id="basicSelect">
                                                        <option value="Status" <c:if test="${status.equals('Status')}">selected</c:if>>Status</option>
                                                    <option value="active" <c:if test="${status.equals('active')}">selected</c:if>>active</option>
                                                    <option value="inactive" <c:if test="${status.equals('inactive')}">selected</c:if>>inactive</option>
                                                    </select>
                                                </div>
                                                <div class="col-md-1 col-12">
                                                    <button type="submit" class="btn btn-primary me-1 mb-1">Search</button>
                                                </div>
                                            </div>

                                    </div>
                                    </form>
                                </div>
                            </div>
                        </div>  

                    </section>
                    <div style="text-align: right; margin-bottom: 10px">
                        <a href="addgroup" class="btn btn-secondary">Add new group</a>
                    </div>                      
                    <section class="section">
                        <div class="row" id="table-hover-row">
                            <div class="col-12">
                                <div class="card">

                                    <div class="card-content">
                                        <!-- table hover -->
                                        <div class="table-responsive">
                                            <table class="table table-hover mb-0" id="table1">
                                                <thead>
                                                    <tr>
                                                        <th>Code</th>
                                                        <th>Group Name</th>
                                                        <th>Manager</th>
                                                        <th>Parent Group</th>
                                                        <th>Group Type</th>
                                                        <th>Status</th>
                                                        <th>Updated Date</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach var="g" items="${requestScope.data}">
                                                    <tr>
                                                        <td><a href="updategroup?id=${g.id}">${g.code}</a></td>
                                                        <td><a href="updategroup?id=${g.id}">${g.name}</a></td>
                                                        <td>${g.manager.firstname}
                                                            <c:if test="${g.manager.middlename != null}">
                                                                ${g.manager.middlename}
                                                            </c:if>
                                                            ${g.manager.lastname}
                                                        </td>

                                                        <td>
                                                            <c:if test="${(g.parent_team_id == 0)}">none</c:if>
                                                            <c:if test="${(g.parent_team_id != 0)}">${g.parent_team_code}</c:if>
                                                            </td>
                                                            <td>${g.team_type}</td>
                                                        <td>${g.status}</td>
                                                        <td><fmt:formatDate value="${g.update_date}" pattern="dd-MM-yyyy"/></td>
                                                        <td>
                                                            <div class="modal-primary me-1 mb-1 d-inline-block">
                                                                <!-- Button trigger for primary themes modal -->
                                                                <c:if test="${g.status=='Active'}">
                                                                    <button type="button" class="btn btn-danger"
                                                                            data-bs-toggle="modal" data-bs-target="#primary-${g.id}">
                                                                        Deactivate
                                                                    </button>
                                                                </c:if>
                                                                <c:if test="${g.status=='Inactive'}">
                                                                    <button type="button" class="btn btn-success"
                                                                            data-bs-toggle="modal" data-bs-target="#primary-${g.id}">
                                                                        Activate
                                                                    </button>
                                                                </c:if>

                                                                <!--primary theme Modal -->
                                                                <div class="modal fade text-left" id="primary-${g.id}" tabindex="-1"
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
                                                                                <c:if test="${g.status == 'Active'}">
                                                                                    deactivate
                                                                                </c:if>
                                                                                <c:if test="${g.status=='Inactive'}">
                                                                                    activate
                                                                                </c:if>
                                                                                &nbsp;this group?
                                                                            </div>
                                                                            <div class="modal-footer">
                                                                                <button type="button"
                                                                                        class="btn btn-light-secondary"
                                                                                        data-bs-dismiss="modal">
                                                                                    <i class="bx bx-x d-block d-sm-none"></i>
                                                                                    <span class="d-none d-sm-block">Close</span>
                                                                                </button>
                                                                                <c:if test="${g.status == 'Active'}">
                                                                                    <a href="deleteactivegroup?id=${g.id}"
                                                                                       style="text-decoration: none; color: inherit;">
                                                                                        <button type="button" class="btn btn-primary ml-1">
                                                                                            <i class="bx bx-check d-block d-sm-none"></i>
                                                                                            Accept
                                                                                        </button>
                                                                                    </a>
                                                                                </c:if>
                                                                                <c:if test="${g.status == 'Inactive'}">
                                                                                    <a href="recovergroup?id=${g.id}"
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
        <style>
            .dataTable-input{
                display: none;
            }
        </style>
    </body>
</html>

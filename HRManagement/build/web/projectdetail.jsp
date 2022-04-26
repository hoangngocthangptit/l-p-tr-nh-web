<%-- 
    Document   : projectdetail
    Created on : Mar 4, 2022, 8:53:36 PM
    Author     : nghie
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Project Detail</title>

        <!-- Include Choices CSS -->
        <link rel="stylesheet" href="assets/vendors/choices.js/choices.min.css" />
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/bootstrap.css">

        <link rel="stylesheet" href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
        <link rel="stylesheet" href="assets/vendors/bootstrap-icons/bootstrap-icons.css">
        <link rel="stylesheet" href="assets/css/app.css">
        <link rel="shortcut icon" href="assets/images/favicon.svg" type="image/x-icon">
        <style>
            .card-label{
                padding: 24px 0px;
            }
        </style>
    </head>

    <body>
        <div id="app">
            <%@include file="sidebar.jsp" %>
            <div id="main">
                <!-- Basic choices start -->
                <section class="basic-choices">
                    <div class="row">
                        <div class="col-12">
                            <div class="card">
                                <div class="card-header">
                                    <h4 class="card-title">Project Detail</h4>
                                    <c:if test="${param.error.contains('success')}">
                                        <div class="alert alert-light-success color-success">
                                            <i class="bi bi-check-circle">${requestScope.mess}</i> 
                                        </div>
                                    </c:if>
                                    <c:if test="${param.error.contains('error')}">
                                        <c:forEach items="${requestScope.mess}" var="mess">
                                            <div class="alert alert-light-danger color-danger">
                                                <i class="bi bi-exclamation-circle">${mess}</i> 
                                            </div>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${project == null && !param.action.equals('add')}">
                                        <div class="alert alert-light-danger color-danger">
                                            <i class="bi bi-exclamation-circle">No data</i> 
                                        </div>
                                    </c:if>
                                </div>
                                <c:set value="${requestScope.project}" var="project">
                                </c:set>
                                <c:if test="${project != null || param.action.equals('add')}">
                                    <div class="card-content">
                                        <div class="card-body">
                                            <form action="project-detail?action=${param.action}&code=${param.code}" method="post">
                                                <div class="row">
                                                    <!--Value-->
                                                    <div class="col-md-2">
                                                        <label>Code</label>
                                                    </div>
                                                    <c:set value="${param.projectCode!=null ? param.projectCode : project.getProjectCode()}" var="projectCode">
                                                    </c:set>
                                                    <div class="col-md-8 mb-4">
                                                        <input type="text" class="form-control" name="projectCode" value="${projectCode}">
                                                    </div>
                                                    <div class="col-md-2">
                                                    </div>
                                                    <!--End Value-->

                                                    <!--Value-->
                                                    <div class="col-md-2">
                                                        <label>Name</label>
                                                    </div>
                                                    <c:set value="${param.name!=null ? param.name : project.getProjectName()}" var="name">
                                                    </c:set>
                                                    <div class="col-md-8 mb-4">
                                                        <input type="text" class="form-control" name="name" value="${name}">
                                                    </div>
                                                    <div class="col-md-2">
                                                    </div>
                                                    <!--End Value-->

                                                    <!--Type-->
                                                    <div class="col-md-2">
                                                        <label>Group Code</label>
                                                    </div>
                                                    <div class="col-md-8 mb-4">
                                                        <div class="form-group">
                                                            <select class="choices form-select" name="group">
                                                                <c:forEach items="${requestScope.groups}" var="g">
                                                                    <option value="${g}"
                                                                            <c:if test="${param.group != null ? param.group.equals(g) : project.getTeamCode().equals(g)}">
                                                                                selected
                                                                            </c:if>
                                                                            >${g}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-2">
                                                    </div>
                                                    <!--End Type-->

                                                    <!--Value-->
                                                    <div class="col-md-2">
                                                        <label>Start date</label>
                                                    </div>
                                                    <c:set value="${param.start!=null ? param.start : project.getStartDate()}" var="start">
                                                    </c:set>
                                                    <div class="col-md-8 mb-4">
                                                        <input type="date" class="form-control" name="start" value="${start}">
                                                    </div>
                                                    <div class="col-md-2">
                                                    </div>
                                                    <!--End Value-->

                                                    <!--Order-->
                                                    <div class="col-md-2">
                                                        <label>End Date</label>
                                                    </div>
                                                    <c:set value="${param.end!=null ? param.end : project.getEndDate()}" var="end">
                                                    </c:set>
                                                    <div class="col-md-8 mb-4">
                                                        <input type="date" class="form-control" name="end" value="${end}">
                                                    </div>
                                                    <div class="col-md-2">
                                                    </div>
                                                    <!--End Order-->

                                                    <!--Status-->
                                                    <div class="col-md-2 card-label">
                                                        <label class="">Status</label>
                                                    </div>
                                                    <c:set value="${param.status!=null ? param.status : project.getStatus()}" var="status">
                                                    </c:set>
                                                    <div class="col-md-8 card-body row">
                                                        <div class="col-md-3">
                                                            <input class="form-check-input" type="radio" name="status" 
                                                                   <c:if test="${status.equals('Active')}">
                                                                       checked
                                                                   </c:if>
                                                                   value="Active">
                                                            <label class="form-check-label">
                                                                Active
                                                            </label>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <input class="form-check-input" type="radio" name="status"
                                                                   <c:if test="${status.equals('Inactive')}">
                                                                       checked
                                                                   </c:if>
                                                                   value="Inactive">
                                                            <label class="form-check-label">
                                                                Inactive
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-2"></div>
                                                    <!--End Status-->

                                                    <!--Note-->
                                                    <div class="col-md-2">
                                                        <label>Description</label>
                                                    </div>
                                                    <c:set value="${param.description!=null ? param.description : project.getDescription()}" var="description">
                                                    </c:set>
                                                    <div class="col-md-8 mb-4">
                                                        <textarea class="form-control" rows="3" name="description">${description}</textarea>
                                                    </div>
                                                    <div class="col-md-2">
                                                    </div>
                                                    <!--End Note-->
                                                    <c:if test="${ (!param.action.equals('add')) && project.getManagers().size() > 0 }">
                                                        <div class="col-md-2">
                                                            <label>Manager(s)</label>
                                                        </div>
                                                        <c:forEach items="${project.getManagers()}" var="m">
                                                            <div class="col-md-8 mb-4">
                                                                <input type="text" readonly class="form-control" name="value" value="${m}">
                                                            </div>
                                                            <div class="col-md-2"></div>
                                                            <div class="col-sm-2"></div>
                                                        </c:forEach>
                                                    </c:if>
                                                    <c:if test="${param.action.equals('add') || project.getManagers().size() == 0}">
                                                        <div class="col-sm-2"></div>
                                                    </c:if>
                                                    <div class="col-sm-8">
                                                        <c:if test="${requestScope.role}">
                                                            <button type="submit" class="btn btn-primary me-1 mb-1">${requestScope.action}</button>
                                                            <button type="reset" class="btn btn-light-secondary me-1 mb-1">Reset</button>
                                                        </c:if>
                                                    </div>
                                                </div>
                                            </form>
                                            <c:if test="${param.action.equals('edit')}">
                                                <h4 class="card-title" style="margin-top: 100px;">Resource</h4>
                                                <table class="table table-striped" id="table1">
                                                    <thead>
                                                        <tr>
                                                            <th>Resource name</th>
                                                            <th>Project role</th>
                                                            <th>From Date</th>
                                                            <th>To Date</th>
                                                            <th>% of effort</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach var="r" items="${requestScope.list}">
                                                            <tr>
                                                                <td>${r.getStaffName()}</td>
                                                                <td>${r.getResourceRole()}</td>
                                                                <td>${r.getFromDateFormat()} </td>
                                                                <td>${r.getToDateFormat()}</td>
                                                                <td>${r.getPercentOfEffort()}</td>
                                                            </tr> 
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </c:if>
                                        </div>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- Basic choices end -->
            </div>
        </div>
        <link rel="stylesheet" href="assets/vendors/simple-datatables/style.css">
        <script src="assets/vendors/simple-datatables/simple-datatables.js"></script>
        <script>
            // Simple Datatable
            let table1 = document.querySelector('#table1');
            let dataTable = new simpleDatatables.DataTable(table1);
        </script>
        <style>
            .dataTable-input{
                display: none;
            }
        </style>

        <script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
        <script src="assets/js/bootstrap.bundle.min.js"></script>

        <!-- Include Choices JavaScript -->
        <script src="assets/vendors/choices.js/choices.min.js"></script>

        <script src="assets/js/main.js"></script>
    </body>

</html>
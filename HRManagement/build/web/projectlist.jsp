<%-- 
    Document   : projectlist
    Created on : Mar 4, 2022, 7:16:06 PM
    Author     : nghie
--%>

<%@page import="java.text.SimpleDateFormat"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Project List</title>
        <link rel="stylesheet" href="assets/vendors/choices.js/choices.min.css" />
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
            <%@include file="sidebar.jsp" %>
            <div id="main">
                <div class="card">
                    <div class="card-content">
                        <div class="card-body">
                            <form class="form" action="project-list" method="post">
                                <div class="row">
                                    <div class="col-md-4 col-12">
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="Search by project code" name="code" value="${param.code}" style="height: 46px">
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-12">
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="Search by project name" name="name" value="${param.name}" style="height: 46px">
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-12">
                                        <button type="submit" class="btn btn-primary me-1 mb-1">Search</button>
                                        <button type="reset" class="btn btn-light-secondary me-1 mb-1">Reset</button>
                                    </div>

                                    <div class="col-md-4 col-12 row" style="width: 400px">
                                        <div class="form-group">
                                            <select class="choices form-select" name="group">
                                                <c:forEach items="${requestScope.groups}" var="g">
                                                    <option value="${g}"
                                                            <c:if test="${param.group.equals(g)}">
                                                                selected
                                                            </c:if>
                                                            >${g}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-md-4 col-12 row" style="width: 400px"> 
                                        <div class="form-group">
                                            <select class="choices form-select" name="manager">
                                                <option value="0">All Managers Project</option>
                                                <c:forEach items="${requestScope.managers}" var="m">
                                                    <option value="${m.getId()}"
                                                            <c:if test="${param.manager == m.getId()}">
                                                                selected
                                                            </c:if>
                                                            >${m.getFullName()}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="col-md-4 col-12 row" style="width: 400px">
                                        <div class="form-group">
                                            <select class="choices form-select" name="status">
                                                <option value="All Status">All Status</option>
                                                <option value="Active" 
                                                        <c:if test="${param.status.equals('Active')}">
                                                            selected
                                                        </c:if>
                                                        >Active</option>
                                                <option value="Inactive"
                                                        <c:if test="${param.status.equals('Inactive')}">
                                                            selected
                                                        </c:if>
                                                        >Inactive</option>
                                            </select>
                                        </div>
                                    </div>

                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="card">
                    <div class="card-header">
                        <h4>Project List</h4>
                    </div>
                    <c:set var="settings" value="${requestScope.settings}">
                    </c:set> 
                    <div class="card-body">
                        <form action="setting-list" method="post">
                            <table class="table table-striped" id="table1">
                                <thead>
                                    <tr>
                                        <th>Project code</th>
                                        <th>Group code</th>
                                        <th>Name</th>
                                        <th>Manager(s)</th>
                                        <th>Start date</th>
                                        <th>End date</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="p" items="${requestScope.projects}">
                                        <tr>
                                            <td><a href="project-detail?action=edit&code=${p.getProjectCode()}">${p.getProjectCode()}</a></td>
                                            <td>${p.getTeamCode()}</td>
                                            <td>${p.getProjectName()}</td>
                                            <td>
                                                <% boolean start = true;%>
                                                <c:forEach var="m" items="${p.getManagers()}">
                                                    <c:if test="<%= start%>">
                                                        <% start = false;%>
                                                    </c:if>
                                                    ${m}
                                                    <c:if test="<%= !start%>">
                                                        <br>
                                                    </c:if>
                                                </c:forEach>
                                            </td>
                                            <td>${p.getStartDateFormat()} </td>
                                            <td>${p.getEndDateFormat()}</td>
                                            <td>${p.getStatus()}</td>
                                        </tr> 
                                    </c:forEach>
                                </tbody>
                            </table>
                        </form>
                        <c:if test="${requestScope.show}">
                            <a href="project-detail?action=add">
                                <button type="submit" class="btn btn-primary me-1 mb-1">Add new Project</button>
                            </a>
                        </c:if>
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
            </div>
        </div>
    </body>
</html>


<%-- 
    Document   : settinglist
    Created on : Feb 18, 2022, 9:31:48 PM
    Author     : nghie
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Setting List</title>
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
                            <form class="form" action="setting-list" method="post">
                                <div class="row">
                                    <div class="col-md-4 col-12 row">
                                        <c:set value="${param.type}" var="type">
                                        </c:set>
                                        <div class="col-md-12 mb-4">
                                            <div class="form-group">
                                                <select class="choices form-select" name="type">
                                                    <c:forEach items="${requestScope.allType}" var="s">
                                                        <option value="${s}"
                                                                <c:if test="${type.equals(s)}">
                                                                    selected
                                                                </c:if>
                                                                >${s}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-12 row">
                                        <c:set value="${param.status}" var="status">
                                        </c:set>
                                        <% List<String> allStatus = new ArrayList<String>();
                                         allStatus.add("All Status");
                                         allStatus.add("Active");
                                         allStatus.add("Inactive");
                                        %>
                                        <div class="col-md-12 mb-4">
                                            <div class="form-group">
                                                <select class="choices form-select" name="status">
                                                    <c:forEach items="<%=allStatus%>" var="all">
                                                        <option value="${all}"
                                                                <c:if test="${status.equals(all)}">
                                                                    selected
                                                                </c:if>
                                                                >${all}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3 col-12">
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="Value" name="value" value="${param.value}" style="height: 46px">
                                        </div>
                                    </div>
                                    <div class="col-md-2 col-12">
                                        <button type="submit" class="btn btn-primary me-1 mb-1">Search</button>
                                        <button type="reset" class="btn btn-light-secondary me-1 mb-1">Reset</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="card">
                    <div class="card-header">
                        <h4>Setting List</h4>
                    </div>
                    <c:set var="settings" value="${requestScope.settings}">
                    </c:set> 
                    <div class="card-body">
                        <form action="setting-list" method="post">
                            <table class="table table-striped" id="table1">
                                <thead>
                                    <tr>
                                        <th>Id</th>
                                        <th>Type</th>
                                        <th>Value</th>
                                        <th>Order</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="s" items="${settings}">
                                        <tr>
                                            <td>${s.getId()}</td>
                                            <td>${s.getType()}</td>
                                            <td><a href="setting-detail?action=edit&id=${s.getValueid()}">${s.getValue()}</a></td>
                                            <td>${s.getOrder()}</td>
                                            <td> 
                                                <button type="submit" name="action" value="${s.getValueid()},${s.getStatus()}" 
                                                        class="
                                                        <c:if test="${s.getStatus().equals('Active')}">
                                                            badge bg-success
                                                        </c:if>
                                                        <c:if test="${s.getStatus().equals('Inactive')}">
                                                            badge bg-danger
                                                        </c:if>
                                                        ">
                                                    ${s.getStatus()}
                                                </button>
                                            </td>
                                        </tr> 
                                    </c:forEach>
                                </tbody>
                            </table>
                        </form>
                        <a href="setting-detail?action=add">
                            <button type="submit" class="btn btn-primary me-1 mb-1">Add new Setting</button>
                        </a>

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

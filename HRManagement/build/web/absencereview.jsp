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
        <title>Absence Review</title>

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
                        <div class="col-md-5 col-12">

                        </div>
                        <div class="col-md-7 col-12">

                        </div>
                    </div>
                </section>
                <section class="section">
                    <div class="row" id="table-hover-row">
                        <div class="col-12">
                            <div class="card p-5">
                                <div class="card-content">
                                    <h3> Absence Review </h3>
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

                                        <div class="table-responsive">
                                            <table class="table table-striped" id="table1">
                                                <thead>
                                                    <tr>
                                                        <th>Group</th>
                                                        <th>UserName</th>
                                                        <th>Request Date</th>
                                                        <th>Absence type</th>
                                                        <th>Request title</th>
                                                        <th>From</th>
                                                        <th>To</th>
                                                        <th>Status</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items = "${absence}" var="c">
                                                    <tr>
                                                        <td>${c.team.getName()}</td>
                                                        <td>${c.staff.getUsername()}</td>
                                                        <td>${c.requestDate}</td>
                                                        <td>${c.type}</td>
                                                        <td>${c.title}</td>
                                                        <td>${c.startDate}</td>
                                                        <td>${c.endDate}</td>
                                                        <td>${c.status}</td>
                                                        <td class="d-flex">
                                                            <form action = "absencereviewupdate" method="get">
                                                            <button type ="submit" class="btn btn-success" >Approve</button>
                                                            <a href="absencereviewupdate?id=${c.staff.getId()}" class="btn btn-warning" value = "Approve">Rejected</a>
                                                            </form>
                                                        </td>

                                                    </tr
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

<link rel="stylesheet" href="assets/vendors/simple-datatables/style.css">
<script src="assets/vendors/simple-datatables/simple-datatables.js"></script>
<script>
    // Simple Datatable
    let table1 = document.querySelector('#table1');
    let dataTable = new simpleDatatables.DataTable(table1);
</script>
</body>
</html>

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
        <title>Slider List</title>

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
<!--                                    <form action="sliderlist" >
                                        <div class="col-md-2 form-group">

                                            <select name="status" class="form-select" id="basicSelect">
                                                <option value="select" <c:if test="${option.equals('active')}">selected</c:if>>active</option>
                                                <option value="username" <c:if test="${option.equals('inactive')}">selected</c:if>>inactive</option>
                                                </select>
                                                <div class="col-md-2">
                                                    <div class="col-sm-12 d-flex justify-content-end">
                                                        <button type="submit"
                                                                class="btn btn-primary me-1 mb-1">Search</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>    -->

                                        <div class="table-responsive">
                                            <table class="table table-bordered mb-0" id="table1">
                                                <thead>
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>Title</th>
                                                        <th>Image</th>
                                                        <th>Back Link</th>
                                                        <th>Status</th>
                                                        <th>ACTION</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items = "${slidelist}" var="s">
                                                    <tr>
                                                        <td>${s.id}</td>
                                                        <td>${s.title}</td>
                                                        <td><img style="width: 40%" class="h-1 w-30" src ="image/${s.image}" /></td>
                                                        <td>${s.backlink}</td>
                                                        <td>${s.status}</td>
                                                        <td>
                                                            <a href="slidedetail?sid=${s.id}" class="btn btn-light-primary">Edit</a>
                                                            <a href="slidedetail?sid=${s.id}" class="btn btn-light-success">Show</a>
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

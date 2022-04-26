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
        <title>Contract</title>

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
                                    <h3> Contract </h3>
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
                                                        <th>Username</th>
                                                        <th>Start Date</th>
                                                        <th>End Date</th>
                                                        <th>Status</th>
                                                        <th>Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${contract}" var="c">
                                                    <tr>
                                                        <td>${c.user_id.getUsername()}</td>
                                                        <td>${c.start_date}</td>
                                                        <td>${c.end_date}</td>
                                                        <td>${c.status}</td>
                                                        <td>
                                                            <form class="flex" action="updatecontract?id=${c.id}" method="post">
                                                                <button type="button" data-bs-toggle="modal" data-bs-target="#staticBackdrop2" class="btn btn-light-primary">Update</button>
                                                                <!-- Modal Update -->
                                                                <div class="modal fade" id="staticBackdrop2" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                                                    <div class="modal-dialog modal-dialog-scrollable">
                                                                        <div class="modal-content">
                                                                            <div class="modal-header">
                                                                                <h5 class="modal-title" id="staticBackdropLabel">Update Contract</h5>
                                                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                            </div>
                                                                            <div class="modal-body">
                                                                                <div class="row mb-3">
                                                                                    <div class="col-sm-3">
                                                                                        <h6 class="mb-0">Start Date</h6>
                                                                                    </div>
                                                                                    <div class="col-sm-9 text-secondary">
                                                                                        <input id ="startdate" type="date" class="form-control" value ="${c.start_date}" name ="startdate" >
                                                                                    </div>
                                                                                </div>
                                                                                <div class="row mb-3">
                                                                                    <div class="col-sm-3">
                                                                                        <h6 class="mb-0">End Date</h6>
                                                                                    </div>
                                                                                    <div class="col-sm-9 text-secondary">
                                                                                        <input id="enddate" type="date" class="form-control"  name ="enddate" value="${c.end_date}" onblur="comparedate();">
                                                                                    </div>
                                                                                </div>
                                                                                <p id="error_date2"></p>
                                                                            </div>
                                                                            <div class="modal-footer">
                                                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                                                <button type="submit" class="btn btn-primary" >Update</button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </form>
                                                            <form action = "addcontract?id=${c.user_id.getId()}" method="post">
                                                                <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                                                                    <div class="modal-dialog modal-dialog-scrollable">
                                                                        <div class="modal-content">
                                                                            <div class="modal-header">
                                                                                <h5 class="modal-title" id="staticBackdropLabel">New Contract</h5>
                                                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                            </div>
                                                                            <div class="modal-body">
                                                                                <div class="row mb-3">
                                                                                    <div class="col-sm-3">
                                                                                        <h6 class="mb-0">Start Date</h6>
                                                                                    </div>
                                                                                    <div class="col-sm-9 text-secondary">
                                                                                        <input id ="from" type="date" class="form-control" value ="" name ="from" >
                                                                                    </div>
                                                                                </div>
                                                                                <div class="row mb-3">
                                                                                    <div class="col-sm-3">
                                                                                        <h6 class="mb-0">End Date</h6>
                                                                                    </div>
                                                                                    <div class="col-sm-9 text-secondary">
                                                                                        <input id="to" type="date" class="form-control"  name ="to" value="" onblur="comparedate();">
                                                                                    </div>
                                                                                </div>
                                                                                <p id="error_date2"></p>
                                                                            </div>
                                                                            <div class="modal-footer">
                                                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                                                <button type="submit" class="btn btn-primary" >Add</button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>  
                                                            </form>
                                                        </td>

                                                    </tr>

                                                </tbody>
                                            </c:forEach>
                                        </table>
                                    </div>
                                    <button data-bs-toggle="modal" data-bs-target="#staticBackdrop" class="btn btn-success">Add</button>
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
<!--    // Simple Datatable-->
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
            document.getElementById("error_date2").innerHTML = "Start date must be earlier than end date";
            document.getElementById("error_date2").style = "color: red;";
            document.getElementById("from").style = "border-color: red";
            document.getElementById("to").style = "border-color: red";
        } else {
            document.getElementById("error_date2").innerHTML = "";
            document.getElementById("error_date2").style = "color:;";
            document.getElementById("from").style = "border-color: ";
            document.getElementById("to").style = "border-color: ";
        }

    }
    function comparedate2()
    {
        var startDt = document.getElementById("startdate").value;
        var endDt = document.getElementById("enddate").value;

        if ((new Date(startDt).getTime() > new Date(endDt).getTime()))
        {
            document.getElementById("error_date").innerHTML = "Start date must be earlier than end date";
            document.getElementById("error_date").style = "color: red;";
            document.getElementById("startdate").style = "border-color: red";
            document.getElementById("enddate").style = "border-color: red";
        } else {
            document.getElementById("error_date").innerHTML = "";
            document.getElementById("error_date").style = "color:;";
            document.getElementById("startdate").style = "border-color: ";
            document.getElementById("enddate").style = "border-color: ";
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

<%-- 
    Document   : userlist
    Created on : Jan 15, 2022, 8:17:00 PM
    Author     : Minh Hieu Pham
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>User List</title>

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
        <c:set var="page" value="${requestScope.page}"/>

        <div id="app">

            <jsp:include page="sidebar.jsp"/>

            <div id="main">
                <section class="section">
                    <div class="card">

                        <div class="card-body col-md-12 col-12">


                            <div class="card">
                                <form action="userlist" class="form form-horizontal">
                                    <div class="form-body">
                                        <div class="row">

                                            <div class="col-md-4 form-group">
                                                <input type="text" id="" class="form-control"
                                                       placeholder="Enter text" name="string" value="${requestScope.string}" >
                                            </div>

                                            <div class="col-md-2 form-group">
                                                <select name="option" class="form-select" id="basicSelect">
                                                    <option value="select" <c:if test="${option.equals('select')}">selected</c:if>>select</option>
                                                    <option value="username" <c:if test="${option.equals('username')}">selected</c:if>>username</option>
                                                    <option value="full name" <c:if test="${option.equals('full name')}">selected</c:if>>full name</option>
                                                    <option value="email" <c:if test="${option.equals('email')}">selected</c:if>>email</option>
                                                    <option value="mobile" <c:if test="${option.equals('mobile')}">selected</c:if>>mobile</option>
                                                    </select>

                                                </div>
                                                <div class="col-md-1"></div>
                                                <div class="col-md-1">
                                                    <label>Gender</label>
                                                </div>
                                                <div class="col-md-2 form-group">
                                                    <select name="gender" class="form-select" id="basicSelect">
                                                        <option value="select" <c:if test="${gender.equals('select')}">selected</c:if>>select</option>
                                                    <option value="male" <c:if test="${gender.equals('male')}">selected</c:if>>male</option>
                                                    <option value="female" <c:if test="${gender.equals('female')}">selected</c:if>>female</option>
                                                    <option value="other" <c:if test="${gender.equals('other')}">selected</c:if>>other</option>
                                                    </select>
                                                </div>
                                                <div class="col-md-2">
                                                </div>
                                                <div class="col-md-2">
                                                    <label>Group code</label>
                                                </div>
                                                <div class="col-md-2 form-group">
                                                    <input type="text" id="" class="form-control"
                                                           name="gr_code" value="${requestScope.gr_code}">
                                            </div>
                                            <div class="col-md-3">
                                            </div>
                                            <div class="col-md-1">
                                                <label>Status</label>
                                            </div>
                                            <div class="col-md-2 form-group">
                                                <select name="status" class="form-select" id="basicSelect">
                                                    <option value="select" <c:if test="${status.equals('select')}">selected</c:if>>select</option>
                                                    <option value="registered" <c:if test="${status.equals('registered')}">selected</c:if>>registered</option>
                                                    <option value="verified" <c:if test="${status.equals('verified')}">selected</c:if>>verified</option>
                                                    <option value="active" <c:if test="${status.equals('active')}">selected</c:if>>active</option>
                                                    <option value="inactive" <c:if test="${status.equals('inactive')}">selected</c:if>>inactive</option>
                                                    </select>
                                                </div>
                                                <div class="col-md-2">
                                                    <div class="col-sm-12 d-flex justify-content-end">
                                                        <button type="submit"
                                                                class="btn btn-primary me-1 mb-1">Search</button>
                                                    </div>
                                                </div>

                                            </div>

                                        </div>
                                    </form>

                                </div>
                            </div>
                        <c:if test="${sessionScope.user.role.equals('Manager')}">
                            <table class="table table-striped" id="table1">
                                <thead>
                                    <tr>
                                        <th>group code</th>
                                        <th>username</th>
                                        <th>full name</th>
                                        <th>gender</th>
                                        <th>email</th>
                                        <th>mobile</th>
                                        <th>status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="u" items="${requestScope.data}">
                                        <tr>
                                            <td>${u.group_code}</td>
                                            <td><a href="userview?id=${u.getId()}">${u.username}</a></td>
                                            <td>${u.fullName}</td>
                                            <td>${u.gender}</td>
                                            <td>${u.email}</td>
                                            <td>${u.mobile}</td>
                                            <td>${u.status}</td>
                                        </tr>
                                    </c:forEach>

                                </tbody>

                            </table>
                        </c:if>
                        <c:if test="${sessionScope.user.role.equals('HR')}">
                            <table class="table table-striped" id="table1">
                                <thead>
                                    <tr>
                                        <th>Group</th>
                                        <th>Username</th>
                                        <th>Fullname</th>
                                        <th>Gender</th>
                                        <th>Email</th>
                                        <th>Mobile</th>
                                        <th>Status</th>
                                        <th>Contract</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="u" items="${requestScope.data}">
                                    <td>${u.group_code}</td>
                                    <td><a href="userview?id=${u.getId()}">${u.username}</a></td>
                                    <td>${u.fullName}</td>
                                    <td>${u.gender}</td>
                                    <td>${u.email}</td>
                                    <td>${u.mobile}</td>
                                    
                                    <td> <input type="hidden" id="oldstatus-${u.id}" value="${u.getStatus()}"/>
                                        <form class="flex" action="userlist?id=${u.getId()}" method="post">

                                            <select name="status" id="newstatus-${u.id}" onchange="changeStatus(${u.id})">
                                                <option value="Registered"<c:if test="${u.getStatus().equals('Registered')}">selected</c:if>>Registered</option>
                                                <option value="Verified"<c:if test="${u.getStatus().equals('Verified')}">selected</c:if>>Verified</option>
                                                <option value="Active"<c:if test="${u.getStatus().equals('Active')}">selected</c:if>>Active</option>
                                                <option value="Inactive"<c:if test="${u.getStatus().equals('Inactive')}">selected</c:if>>Inactive</option>
                                                </select>

                                                <button type="button" id="change-${u.id}" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal-${u.id}"
                                                        disabled="">
                                                    Change
                                                </button>

                                                <!-- Modal -->
                                                <div class="modal fade" id="exampleModal-${u.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                            </div>
                                                            <div class="modal-body">
                                                                Do you want to change status?
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                                <button class="btn btn-success" type="submit" value="Submit">Confirm</button>
                                                                </form>

                                                                <form action="reason" method="">
                                                                    <input type="hidden" name="id" value="${u.getId()}"/>
                                                                <button class="btn btn-danger"  type="submit" value="reject">rejected</button>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                    </td>

                                    <td><a href ="contract?id=${u.getId()}"><i class="bi bi-clipboard"></i></a></td>
                                    </tr>
                                </c:forEach>

                                </tbody>

                            </table>
                        </c:if>
                        <!-- Button trigger modal -->
                    </div>
                </section>
            </div>
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
<script>
    function changeStatus(uid){
        var oldstatus = document.getElementById("oldstatus-"+uid).value;
        var newstatus = document.getElementById("newstatus-"+uid).value;
        if(!(oldstatus === newstatus)){
                    document.getElementById("change-"+uid).disabled = false;
        }
        if(oldstatus === newstatus){
                    document.getElementById("change-"+uid).disabled = true;
        }
    }
</script>
<script src="assets/js/main.js"></script>
<style>
    .dataTable-input{
        display: none;
    }
</style>
</body>
</html>

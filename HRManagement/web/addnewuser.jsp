<%-- 
    Document   : userprofile
    Created on : Jan 25, 2022, 4:39:38 PM
    Author     : Duc Huy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Add User</title>

        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/bootstrap.css">

        <link rel="stylesheet" href="assets/vendors/iconly/bold.css">

        <link rel="stylesheet" href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
        <link rel="stylesheet" href="assets/vendors/bootstrap-icons/bootstrap-icons.css">
        <link rel="stylesheet" href="assets/css/app.css">
        <link rel="shortcut icon" href="assets/images/favicon.svg" type="image/x-icon">
    </head>
    <body>
        <div class="main-body">

            <div id ="main">

                <%@include file="sidebar.jsp" %>
                <div class="col-lg-8">
                    <form action = "add" method="post">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex flex-column align-items-center text-center">
                                    <div class="mt-3">
                                        <h4>Add New User</h4>
                                    </div>
                                </div>
                                <p class="text-danger">${fail}</p>
                                <p class="text-success">${success}</p>
                                <div class="row mb-3">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Username</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary">
                                        <input type="text" class="form-control" name = "username">
                                    </div>
                                    <p class="text-danger">${usernameErr}</p>
                                </div>
                                 <div class="row mb-3">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Name</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary">
                                        <input type="text" class="form-control" name = "name">
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Email</h6>
                                    </div>
                                    <input type="text" class="form-control visually-hidden" value="vq3u8fkd" name ="password">
                                    <div class="col-sm-9 text-secondary">
                                        <input type="text" class="form-control" name = "email">
                                    </div>
                                    <p class="text-danger">${emailErr}</p>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Mobile</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary">
                                        <input type="text" class="form-control" name = "mobile">
                                    </div>
                                    <p class="text-danger">${mobileErr}</p>
                                </div>
                                <%
                                    String[] genders = {"Male", "Female", "Other"};
                                %>
                                <div class="col-md-2 card-label">
                                    <h6 class="">Gender</h6>
                                </div>
                                <div class="col-md-8 card-body row">
                                    <c:forEach items="<%= genders%>" var="gender">
                                        <div class="col-md-3">
                                            <input class="form-check-input" type="radio" name="gender"
                                                   <c:if test="${edit}">
                                                       disabled
                                                   </c:if>
                                                   <c:if test="${user.getGender().toLowerCase().equals(gender.toLowerCase())}">
                                                       checked
                                                   </c:if>
                                                   value="${gender}"
                                                   > 
                                            <label class="form-check-label">
                                                ${gender}
                                            </label>
                                        </div>
                                    </c:forEach>
                                </div>
                                <div class="col-md-2"></div> 

                                <!--System Role-->
                                <%
                                    String[] roles = {"Staff", "Manager", "HR", "Admin"};
                                %>
                                <div class="col-md-2 card-label">
                                    <h6>System Role</h6>
                                </div>
                                <div class="col-md-8 card-body row">
                                    <c:forEach items="<%= roles%>" var="role">
                                        <div class="col-md-3">
                                            <input class="form-check-input" type="radio" name="System Role"
                                                   <c:if test="${edit}">
                                                       disabled
                                                   </c:if>
                                                   <c:if test="${user.getRole().toLowerCase().equals(role.toLowerCase())}">
                                                       checked
                                                   </c:if>
                                                   value="${role}"
                                                   > 
                                            <label class="form-check-label">
                                                ${role}
                                            </label>
                                        </div>
                                    </c:forEach>
                                </div>
                                <div class="col-md-2"></div> 
                                <div class="row">
                                    <div class="col-sm-3"></div>
                                    <div class="col-sm-9 text-secondary">
                                        <button type="submit" class="btn btn-primary px-4" > Add</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script>
            function createRequestObject() {
                var tmpXmlHttpObject;

                if (window.XMLHttpRequest) {
                    tmpXmlHttpObject = new XMLHttpRequest();

                } else if (window.ActiveXObject) {
                    tmpXmlHttpObject = new ActiveXObject("Microsoft.XMLHTTP");
                }

                return tmpXmlHttpObject;
            }
            var http = createRequestObject();
            function makeGetRequest(wordId) {
                var wordId = document.forms["myform"]["username"].value;
                http.open('get', 'assets/jsp/exist.jsp?username=' + wordId);
                http.onreadystatechange = processResponse;
                http.send(null);
            }

            function processResponse() {
                if (http.readyState == 4 && http.status == 200) {
                    var response = http.responseText;
                    document.getElementById("description").style.color = "red";
                    document.getElementById('description').innerHTML = response;
                } else {
                    var response = http.responseText;
                    document.getElementById("description").style.color = "green";
                    document.getElementById('description').innerHTML = response;
                }

            }
            var input = document.getElementById('username-column');
            input.oninvalid = function (event) {
                event.target.setCustomValidity('Username should only contain lowercase letters. e.g. john123');
            }
        </script>
        <script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
        <script src="assets/js/bootstrap.bundle.min.js"></script>

        <script src="assets/vendors/apexcharts/apexcharts.js"></script>
        <script src="assets/js/pages/dashboard.js"></script>

        <script src="assets/js/main.js"></script>
    </body>

</html>

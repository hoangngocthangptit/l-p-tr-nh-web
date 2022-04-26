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
        <title>Dashboard - Mazer Admin Dashboard</title>

        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/bootstrap.css">

        <link rel="stylesheet" href="assets/vendors/iconly/bold.css">

        <link rel="stylesheet" href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
        <link rel="stylesheet" href="assets/vendors/bootstrap-icons/bootstrap-icons.css">
        <link rel="stylesheet" href="assets/css/app.css">
        <link rel="shortcut icon" href="assets/images/favicon.svg" type="image/x-icon">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
    </head>
    <body>
        <div class="main-body">

            <div id ="main">

                <%@include file="sidebar.jsp" %>
                <div class="col-lg-8">
                    <form action = "profile" method="post" enctype="multipart/form-data">
                        <div class="card">
                            <div class="card-body">
                                <div class="d-flex flex-column align-items-center text-center">
                                    <img id="blah" src="image/${user.getAva()}" class="rounded-circle p-1 bg-primary" width="150">
                                    <div class="mt-3 mb-3 ml-4">
                                        <input accept="image/*" id="imgInp" type ="file" name ="avata">
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Full Name</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary">
                                        <input type="text" class="form-control" value="${sessionScope.user.getFullName()}" name = "firstname">
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Mobile</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary">
                                        <input size="10" type="text" class="form-control" value="${user.getMobile()}" name = "mobile">
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-sm-3">
                                        <h6 class="mt-4">Gender</h6>
                                    </div>
                                    <div class="col-md-8 card-body row">
                                        <div class="col-md-3">
                                            <input class="form-check-input" type="radio" name="gender" 
                                                   <c:if test="${user.getGender().equalsIgnoreCase('male')}">
                                                       checked
                                                   </c:if>
                                                   value="Male">
                                            <label class="form-check-label">
                                                Male
                                            </label>
                                        </div>
                                        <div class="col-md-3">
                                            <input class="form-check-input" type="radio" name="gender"
                                                   <c:if test="${user.getGender().equalsIgnoreCase('female')}">
                                                       checked
                                                   </c:if>
                                                   value="Female">
                                            <label class="form-check-label">
                                                Female
                                            </label>
                                        </div>
                                        <div class="col-md-3">
                                            <input class="form-check-input" type="radio" name="gender"
                                                   <c:if test="${user.getGender().equalsIgnoreCase('other')}">
                                                       checked
                                                   </c:if>
                                                   value="Other">
                                            <label class="form-check-label">
                                                Other
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-3 ">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">BirthDate</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary">
                                        <div class="md-form md-outline" inline="true">
                                            <input  type="date"  class="form-control" placeholder="dd/mm/yyyy" value="${user.getBirthdate()}" name="date">
                                        </div>
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">System Role</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary">
                                        <input readonly="" type="text" class="form-control" value="${user.getRole()}">
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <h6 class="mb-0">Group</h6>
                                </div>
                                <c:forEach var = "g" items="${requestScope.group}">
                                    <div class="row mb-3">
                                        <div class="col-sm-9 text-secondary">
                                            <input readonly="" type="text" class="form-control" value="${g.getName()}">
                                        </div>
                                    </div>
                                </c:forEach>
                                <div class="row mb-3">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Username</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary">
                                        <input readonly="" type="text" class="form-control" value="${user.getUsername()}">
                                    </div>
                                </div>
                                <div class="row mb-3">
                                    <div class="col-sm-3">
                                        <h6 class="mb-0">Group Manager</h6>
                                    </div>
                                    <div class="col-sm-9 text-secondary">
                                        <input readonly="" type="text" class="form-control" value="">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-3"></div>
                                    <div class="col-sm-9 text-secondary">
                                        <button type="submit" class="btn btn-primary px-4"> Save Changes</button>
                                    </div>
                                </div>
                                <div>
                                    <p class="text-primary">${valid}</p>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <script>
            imgInp.onchange = evt => {
                const [file] = imgInp.files
                if (file) {
                    blah.src = URL.createObjectURL(file)
                }
            }
        </script>                        
        <script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
        <script src="assets/js/bootstrap.bundle.min.js"></script>

        <script src="assets/vendors/apexcharts/apexcharts.js"></script>
        <script src="assets/js/pages/dashboard.js"></script>

        <script src="assets/js/main.js"></script>
    </body>

</html>

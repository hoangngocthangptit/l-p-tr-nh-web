<%-- 
    Document   : userview
    Created on : Jan 12, 2022, 2:20:10 PM
    Author     : nghie
--%>

<%@page import="java.util.List"%>
<%@page import="dao.SettingDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User View</title>
        <link rel="stylesheet" href="assets/vendors/choices.js/choices.min.css" />
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/bootstrap.css">

        <link rel="stylesheet" href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
        <link rel="stylesheet" href="assets/vendors/bootstrap-icons/bootstrap-icons.css">
        <link rel="stylesheet" href="assets/css/app.css">
        <link rel="shortcut icon" href="assets/images/favicon.svg" type="image/x-icon">
        <style>
            <c:set value="${requestScope.edit}" var="edit">
            </c:set>
            .card-label{
                padding: 24px 0px;
            }
        </style>
    </head>
    <body>

        <div id="app">
            <%@include file="sidebar.jsp" %>
            <div id="main">
                <c:set value="${requestScope.user}" var="user">
                </c:set>
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">User View</h4>
                        <c:if test="${param.status.equals('success')}">
                            <div class="alert alert-light-success color-success">
                                <i class="bi bi-check-circle"></i> ${requestScope.mess}
                            </div>
                        </c:if>
                        <c:if test="${param.status.startsWith('error')}">
                            <c:forEach items="${requestScope.mess}" var="mess">
                                <div class="alert alert-light-danger color-danger">
                                    <i class="bi bi-exclamation-circle">${mess}</i> 
                                </div>
                            </c:forEach>
                        </c:if>
                    </div>

                    <div class="card-content">
                        <div class="card-body">
                            <form class="form form-horizontal" action="userview" method="post">
                                <input name="id" value="${param.id}" style="display: none">
                                <div class="form-body">
                                    <div class="row">

                                        <!--Groups code-->
                                        <div class="col-md-2">
                                            <label>Groups Code</label>
                                        </div>
                                        <div class="col-md-8">
                                            <div class="form-group has-icon-left">
                                                <div class="position-relative">
                                                    <!--                                                    <input 
                                                    <c:if test="${edit}">readonly</c:if>
                                                        type="text" class="form-control"
                                                        value="${user.getGroup_code()}" name="Group code">
                                                <div class="form-control-icon">
                                                    <i class="bi bi-code-square"></i>
                                                </div>-->
                                                    <select class="choices form-select" name="Group code" >
                                                        <c:forEach items="${requestScope.groupCode}" var="g">
                                                            <option value="${g}"
                                                                    <c:if test="${user.getGroup_code().equals(g)}">
                                                                        selected
                                                                    </c:if>
                                                                    >${g}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-2"></div>      

                                        <!--User Name-->
                                        <div class="col-md-2">
                                            <label>User Name</label>
                                        </div>
                                        <div class="col-md-8">
                                            <div class="form-group has-icon-left">
                                                <div class="position-relative">
                                                    <input 
                                                        <c:if test="${edit}">readonly</c:if>
                                                            type="text" class="form-control"
                                                            value="${user.getUsername()}" name="User name">
                                                    <div class="form-control-icon">
                                                        <i class="bi bi-person-badge-fill"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-2"></div> 

                                        <!--Full Name-->
                                        <div class="col-md-2">
                                            <label>Full Name</label>
                                        </div>
                                        <div class="col-md-8">
                                            <div class="form-group has-icon-left">
                                                <div class="position-relative">
                                                    <input 
                                                        <c:if test="${edit}">readonly</c:if>
                                                            type="text" class="form-control"
                                                            value="${ (param.fullname!=null?param.fullname:user.getFullName()) }" name="Full Name">
                                                    <div class="form-control-icon">
                                                        <i class="bi bi-person"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-2"></div> 

                                        <!--Email-->
                                        <div class="col-md-2">
                                            <label>Email</label>
                                        </div>
                                        <div class="col-md-8">
                                            <div class="form-group has-icon-left">
                                                <div class="position-relative">
                                                    <input 
                                                        <c:if test="${edit}">readonly</c:if>
                                                            type="email" class="form-control" 
                                                            value="${user.getEmail()}" name="Email">
                                                    <div class="form-control-icon">
                                                        <i class="bi bi-envelope"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-2"></div> 

                                        <!--Mobile-->
                                        <div class="col-md-2">
                                            <label>Mobile</label>
                                        </div>
                                        <div class="col-md-8">
                                            <div class="form-group has-icon-left">
                                                <div class="position-relative">
                                                    <input 
                                                        <c:if test="${edit}">readonly</c:if>
                                                        value="${user.getMobile()}" name="Mobile"
                                                        type="text" class="form-control"  pattern="(0)\d{9,10}" required>
                                                    <div class="form-control-icon">
                                                        <i class="bi bi-phone"></i>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-2"></div> 

                                        <!--Gender-->
                                        <%
                                            String[] genders = {"Male", "Female", "Other"};
                                        %>
                                        <div class="col-md-2 card-label">
                                            <label class="">Gender</label>
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
                                            SettingDAO s = new SettingDAO();
                                            List<String> roles = s.getAllValueSettingByType("Role");
                                        %>
                                        <div class="col-md-2 card-label">
                                            <label>System Role</label>
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

                                        <!--Status-->
                                        <%
                                            List<String> status = s.getAllValueSettingByType("Staff Status");
                                        %>
                                        <div class="col-md-2 card-label">
                                            <label>Status</label>
                                        </div>
                                        <div class="col-md-8 card-body row">
                                            <c:forEach items="<%= status%>" var="stat">
                                                <div class="col-md-3">
                                                    <input class="form-check-input" type="radio" name="Status"
                                                           <c:if test="${edit}">
                                                               disabled
                                                           </c:if>
                                                           <c:if test="${user.getStatus().toLowerCase().equals(stat.toLowerCase())}">
                                                               checked
                                                           </c:if>
                                                           value="${stat}"
                                                           > 
                                                    <label class="form-check-label">
                                                        ${stat}
                                                    </label>
                                                </div>
                                            </c:forEach>
                                        </div>
                                        <div class="col-md-2"></div> 

                                        <!--Notes-->
                                        <div class="col-md-2">
                                            <label>Notes</label>
                                        </div>
                                        <div class="col-md-8">
                                            <div class="form-group">
                                                <div class="position-relative">
                                                    <textarea 
                                                        <c:if test="${edit}">readonly</c:if>
                                                        name="Note" class="form-control" rows="3">${user.getNote()}</textarea>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-2"></div> 

                                        <div class="col-md-2"></div>
                                        <div class="col-md-8">
                                            <c:if test="${!requestScope.edit}">
                                                <button type="submit" class="btn btn-primary me-1 mb-1">Submit</button>
                                                <button type="reset" class="btn btn-light-secondary me-1 mb-1">Reset</button>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>                           
                </div>
                <script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
                <script src="assets/js/bootstrap.bundle.min.js"></script>

                <!-- Include Choices JavaScript -->
                <script src="assets/vendors/choices.js/choices.min.js"></script>

                <script src="assets/js/main.js"></script>
            </div>
        </div>
    </body>
</html>

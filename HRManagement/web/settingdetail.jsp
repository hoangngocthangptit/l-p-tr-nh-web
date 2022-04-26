<%-- 
    Document   : settingdetail
    Created on : Feb 18, 2022, 11:57:38 PM
    Author     : nghie
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Setting Detail</title>

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
                                    <h4 class="card-title">Setting Detail</h4>
                                    <c:if test="${param.error.equals('success')}">
                                        <div class="alert alert-light-success color-success">
                                            <i class="bi bi-check-circle"></i> ${requestScope.mess}
                                        </div>
                                    </c:if>
                                    <c:if test="${param.error.startsWith('err')}">
                                        <c:forEach items="${requestScope.mess}" var="mess">
                                            <div class="alert alert-light-danger color-danger">
                                                <i class="bi bi-exclamation-circle">${mess}</i> 
                                            </div>
                                        </c:forEach>
                                    </c:if>
                                </div>
                                <div class="card-content">
                                    <div class="card-body">
                                        <form action="setting-detail?action=${param.action}&id=${param.id}" method="post">
                                            <div class="row">
                                                <c:set value="${requestScope.setting}" var="setting">
                                                </c:set>

                                                <!--Type-->
                                                <div class="col-md-2">
                                                    <label>Type</label>
                                                </div>
                                                <c:set value="${param.type!=null ? param.type : setting.getType()}" var="type">
                                                </c:set>
                                                <div class="col-md-8 mb-4">
                                                    <div class="form-group">
                                                        <select class="choices form-select" name="type">
                                                            <c:forEach items="${requestScope.settings}" var="s">
                                                                <option value="${s}"
                                                                        <c:if test="${type.equals(s)}">
                                                                            selected
                                                                        </c:if>
                                                                        >${s}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-md-2">
                                                </div>
                                                <!--End Type-->

                                                <!--Value-->
                                                <div class="col-md-2">
                                                    <label>Value</label>
                                                </div>
                                                <c:set value="${param.value!=null ? param.value : setting.getValue()}" var="value">
                                                </c:set>
                                                <div class="col-md-8 mb-4">
                                                    <input type="text" class="form-control" name="value" value="${value}">
                                                </div>
                                                <div class="col-md-2">
                                                </div>
                                                <!--End Value-->

                                                <!--Order-->
                                                <div class="col-md-2">
                                                    <label>Order</label>
                                                </div>
                                                <c:set value="${param.order!=null ? param.order : setting.getOrder()}" var="order">
                                                </c:set>
                                                <div class="col-md-8 mb-4">
                                                    <input type="number" class="form-control" name="order" value="${order}">
                                                </div>
                                                <div class="col-md-2">
                                                </div>
                                                <!--End Order-->

                                                <!--Note-->
                                                <div class="col-md-2">
                                                    <label>Note</label>
                                                </div>
                                                <c:set value="${param.note!=null ? param.note : setting.getNote()}" var="note">
                                                </c:set>
                                                <div class="col-md-8 mb-4">
                                                    <textarea class="form-control" rows="3" name="note">${note}</textarea>
                                                </div>
                                                <div class="col-md-2">
                                                </div>
                                                <!--End Note-->

                                                <!--Status-->
                                                <div class="col-md-2 card-label">
                                                    <label class="">Status</label>
                                                </div>
                                                <c:set value="${param.status!=null ? param.status : setting.getStatus()}" var="status">
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

                                                <div class="col-sm-2"></div>
                                                <div class="col-sm-8">
                                                    <button type="submit" class="btn btn-primary me-1 mb-1">${requestScope.action}</button>
                                                    <button type="reset" class="btn btn-light-secondary me-1 mb-1">Reset</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- Basic choices end -->
            </div>
        </div>
    </div>
    <script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>

    <!-- Include Choices JavaScript -->
    <script src="assets/vendors/choices.js/choices.min.js"></script>

    <script src="assets/js/main.js"></script>
</body>

</html>
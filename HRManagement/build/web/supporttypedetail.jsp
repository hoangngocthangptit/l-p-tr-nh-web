<%-- 
    Document   : groupdetail
    Created on : Jan 23, 2022, 11:50:32 PM
    Author     : Minh Hieu Pham
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Support Type Details</title>

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
                <header class="mb-3">
                    <a href="#" class="burger-btn d-block d-xl-none">
                        <i class="bi bi-justify fs-3"></i>
                    </a>
                </header>

                <div class="page-heading">
                    <div class="page-title">
                        <div class="row">
                            <div class="col-12 col-md-7 order-md-1 order-last buttons" style="margin-left: 15%">
                                <h3>Support Type Detail</h3>
                                <a href="addsupporttype" class="btn btn-secondary">Add New Support Type</a>

                                <c:if test="${requestScope.success!=null}">
                                    <p class="alert alert-success"><i class="bi bi-check-circle"></i>&nbsp;${requestScope.success}</p>
                                </c:if>
                            </div>

                        </div>
                    </div>



                    <!-- Basic Vertical form layout section start -->
                    <section id="basic-horizontal-layouts">
                        <div class="row match-height">
                            <div class="col-md-7 col-12" style="margin-left: 15%">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="card-title">Edit Support Type</h4>
                                    </div>
                                    <div class="card-content">
                                        <div class="card-body">
                                            <form class="form form-horizontal" action="updatesupporttype" method="post">
                                                <div class="form-body">
                                                    <div class="row">
                                                        <c:if test="${requestScope.sp != null}">
                                                            <input type="hidden" name="id" value="${sp.id}"/>
                                                            <div class="col-md-5">
                                                                <label>Support Type Name</label>
                                                            </div>
                                                            <div class="col-md-7 form-group">
                                                                <input type="hidden" name="oldname" value="${sp.name}"/>
                                                                <input type="text" id="first-name" class="form-control" required="" 
                                                                       name="name" placeholder="" value="${requestScope.sp.name}"
                                                                       <c:if test="${requestScope.error2!=null}">
                                                                           style="border-color: red"
                                                                       </c:if>>   
                                                            </div>
                                                            <div class="col-md-5"></div>
                                                            <div class="col-md-7 form-group">
                                                                <c:if test="${requestScope.error2!=null}">
                                                                    <p style="color: red;"><i class="bi bi-file-excel"></i>&nbsp;${requestScope.error2}</p>
                                                                </c:if>
                                                            </div>
                                                            <div class="col-md-5">
                                                                <label>In-charge Group</label>
                                                            </div>
                                                            <div class="col-md-7 form-group">
                                                                <input type="hidden" name="oldgroup" value="${sp.in_charge_team.name}"/>
                                                                <select name="in_charge_group_name" class="form-select">
                                                                    <c:forEach var="gr" items="${requestScope.groups}">
                                                                        <option <c:if test="${gr.name.equals(sp.in_charge_team.name)}">selected=""</c:if>>${gr.name}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                            <div class="col-md-5">
                                                                <label>Support Email</label>
                                                            </div>
                                                            <div class="col-md-7 form-group">
                                                                <input type="hidden" name="oldemail" value="${sp.email}"/>
                                                                <input type="email" id="first-name" class="form-control" required=""
                                                                       name="email" placeholder="" value="${requestScope.sp.email}"
                                                                       <c:if test="${requestScope.error3!=null}">
                                                                           style="border-color: red"
                                                                       </c:if>>
                                                            </div>
                                                            <div class="col-md-5"></div>
                                                            <div class="col-md-7 form-group">
                                                                <c:if test="${requestScope.error3!=null}">
                                                                    <p style="color: red;"><i class="bi bi-file-excel"></i>&nbsp;${requestScope.error3}</p>
                                                                </c:if>
                                                            </div>
                                                            <div class="col-md-5">
                                                                <label>Status</label>
                                                            </div>
                                                            <div class="col-md-7 form-group">
                                                                <input type="radio" name="status" value="active" required=""
                                                                       class="form-check-input"
                                                                       <c:if test="${requestScope.sp.status.equals('active')}"> checked="" </c:if>>&nbsp;<label>active</label>
                                                                       <input type="radio" name="status" value="inactive"
                                                                              class="form-check-input"
                                                                       <c:if test="${requestScope.sp.status.equals('inactive')}"> checked="" </c:if>>&nbsp;<label>inactive</label>
                                                                </div>
                                                                <div class="col-md-5">
                                                                    <label>Description</label>
                                                                </div>
                                                                <div class="col-md-7 form-group">
                                                                    <textarea type="text" class="form-control" rows="3"
                                                                              name="description" placeholder="" >${requestScope.sp.des}</textarea>
                                                            </div>

                                                            <div class="col-sm-12 d-flex justify-content-end">
                                                                <button type="submit"
                                                                        class="btn btn-primary me-1 mb-1">Update</button>

                                                            </div>
                                                        </c:if>    
                                                        <c:if test="${requestScope.sp == null}">
                                                            <input type="hidden" name="id" value="${id}"/>
                                                            <div class="col-md-5">
                                                                <label>Name</label>
                                                            </div>
                                                            <div class="col-md-7 form-group">
                                                                <input type="hidden" name="oldname" value="${oldname}"/>
                                                                <input type="text" id="first-name" class="form-control" required="" 
                                                                       name="name" placeholder="" value="${name}"
                                                                       <c:if test="${requestScope.error2!=null}">
                                                                           style="border-color: red"
                                                                       </c:if>>   
                                                            </div>
                                                            <div class="col-md-5"></div>
                                                            <div class="col-md-7 form-group">
                                                                <c:if test="${requestScope.error2!=null}">
                                                                    <p style="color: red;"><i class="bi bi-file-excel"></i>&nbsp;${requestScope.error2}</p>
                                                                </c:if>
                                                            </div>
                                                            <div class="col-md-5">
                                                                <label>In-charge Group</label>
                                                            </div>
                                                            <div class="col-md-7 form-group">
                                                                <input type="hidden" name="oldgroup" value="${oldgroup}"/>
                                                                <select name="in_charge_group_name" class="form-select">
                                                                    <c:forEach var="gr" items="${requestScope.groups}">
                                                                        <option <c:if test="${gr.name.equals(in_charge_group_name)}">selected=""</c:if>>${gr.name}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                            <div class="col-md-5">
                                                                <label>Support Email</label>
                                                            </div>
                                                            <div class="col-md-7 form-group">
                                                                <input type="hidden" name="oldemail" value="${oldemail}"/>
                                                                <input type="email" id="first-name" class="form-control" required=""
                                                                       name="email" placeholder="" value="${requestScope.email}"
                                                                       <c:if test="${requestScope.error3!=null}">
                                                                           style="border-color: red"
                                                                       </c:if>>
                                                            </div>
                                                            <div class="col-md-5"></div>
                                                            <div class="col-md-7 form-group">
                                                                <c:if test="${requestScope.error3!=null}">
                                                                    <p style="color: red;"><i class="bi bi-file-excel"></i>&nbsp;${requestScope.error3}</p>
                                                                </c:if>
                                                            </div>
                                                            <div class="col-md-5">
                                                                <label>Status</label>
                                                            </div>
                                                            <div class="col-md-7 form-group">
                                                                <input type="radio" name="status" value="active" required=""
                                                                       class="form-check-input"
                                                                       <c:if test="${status.equals('active')}"> checked="" </c:if>>&nbsp;<label>active</label>
                                                                       <input type="radio" name="status" value="inactive"
                                                                              class="form-check-input"
                                                                       <c:if test="${status.equals('inactive')}"> checked="" </c:if>>&nbsp;<label>inactive</label>
                                                                </div>
                                                                <div class="col-md-5">
                                                                    <label>Description</label>
                                                                </div>
                                                                <div class="col-md-7 form-group">
                                                                    <textarea type="text" class="form-control" rows="3"
                                                                              name="description" placeholder="" >${requestScope.description}</textarea>
                                                            </div>

                                                            <div class="col-sm-12 d-flex justify-content-end">
                                                                <button type="submit"
                                                                        class="btn btn-primary me-1 mb-1">Update</button>

                                                            </div>
                                                        </c:if>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
                </body>
                </html>

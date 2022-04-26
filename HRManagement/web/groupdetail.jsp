<%-- 
    Document   : groupdetail
    Created on : Jan 23, 2022, 11:50:32 PM
    Author     : Minh Hieu Pham
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Group Details</title>

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
                            <div class="col-12 col-md-6 order-md-1 order-last buttons"  style="margin-left: 15%">
                                <h3>Group detail</h3>
                                <a href="addgroup" class="btn btn-secondary">Add new group</a>
                                <c:if test="${requestScope.success!=null}">
                                    <p class="alert alert-success"><i class="bi bi-check-circle"></i>&nbsp;${requestScope.success}</p>
                                </c:if>
                            </div>

                        </div>
                    </div>



                    <!-- Basic Vertical form layout section start -->

                    <section id="basic-horizontal-layouts">
                        <div class="row match-height">
                            <div class="col-md-6 col-12"  style="margin-left: 15%">
                                <div class="card">
                                    <div class="card-header">
                                        <h4 class="card-title">Edit group</h4>
                                    </div>
                                    <div class="card-content">
                                        <div class="card-body">
                                            <form class="form form-horizontal" action="updategroup" method="post">
                                                <div class="form-body">
                                                    <div class="row" >

                                                        <input type="hidden"  id="first-name" class="form-control"
                                                               name="id" placeholder="" value="${g.id}">
                                                        <div class="col-md-4">
                                                            <label>Group Code</label>
                                                        </div>
                                                        <div class="col-md-8 form-group">
                                                            <input type="hidden" name="oldcode" value="${oldcode}"/>
                                                            <input type="text" id="first-name" class="form-control" required=""
                                                                   name="code" placeholder="" value="${g.code}"
                                                                   <c:if test="${requestScope.error4!=null}">
                                                                       style="border-color: red"
                                                                   </c:if>>
                                                            <c:if test="${requestScope.error4!=null}">
                                                                <p style="color: red;"><i class="bi bi-file-excel"></i>&nbsp;${requestScope.error4}</p>
                                                            </c:if>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <label>Group name</label>
                                                        </div>
                                                        <div class="col-md-8 form-group">
                                                            <input type="hidden" name="oldname" value="${oldname}"/>
                                                            <input type="text" id="first-name" class="form-control" required=""
                                                                   name="name" placeholder="" value="${g.name}"
                                                                   <c:if test="${requestScope.error!=null}">
                                                                       style="border-color: red"
                                                                   </c:if>>
                                                            <c:if test="${requestScope.error!=null}">
                                                                <p style="color: red;"><i class="bi bi-file-excel"></i>&nbsp;${requestScope.error}</p>
                                                            </c:if>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <label>Manager</label>
                                                        </div>
                                                        <div class="col-md-8 form-group">
                                                            <select name="manager" class="form-select" id="basicSelect">
                                                                <c:forEach var="m" items="${requestScope.managers}">
                                                                    <option value="${m.id}"
                                                                            <c:if test="${m.id == g.manager.id}">
                                                                                selected=""
                                                                            </c:if>>${m.firstname}
                                                                        <c:if test="${m.middlename != null}">
                                                                            ${m.middlename}
                                                                        </c:if>
                                                                        ${m.lastname}
                                                                    </option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <label>Parent Group</label>
                                                        </div>
                                                        <div class="col-md-8 form-group">
                                                            <select name="parentGroupCode" class="form-select" id="basicSelect">
                                                                <option>none</option>
                                                                <c:forEach var="pGroup" items="${requestScope.parentGroup}">
                                                                    <option
                                                                        <c:if test="${pGroup.code.equals(g.parent_team_code)}">
                                                                            selected=""
                                                                        </c:if>>
                                                                        ${pGroup.code}
                                                                    </option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>
                                                        <div class="col-md-4">
                                                            <label>Type</label>
                                                        </div>
                                                        <div class="col-md-8 form-group">

                                                            <input type="radio" name="grType" value="BA" required="" 
                                                                   class="form-check-input"
                                                                   <c:if test="${g.team_type.equals('BA')}"> checked="" </c:if>>&nbsp;<label>BA</label>
                                                                   <input type="radio" name="grType" value="Non-BA"
                                                                          class="form-check-input"
                                                                   <c:if test="${g.team_type.equals('Non-BA')}"> checked="" </c:if>>&nbsp;<label>Non-BA</label>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <label>Status</label>
                                                            </div>
                                                            <div class="col-md-8 form-group">
                                                                <input type="radio" name="status" required="" value="Active"
                                                                       class="form-check-input"
                                                                <c:if test="${g.status.equals('Active')}"> checked="" </c:if>>&nbsp;<label>Active</label>
                                                                <input type="radio" name="status" value="Inactive"
                                                                       class="form-check-input"
                                                                <c:if test="${g.status.equals('Inactive')}"> checked="" </c:if>>&nbsp;<label>Inactive</label>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <label>Description</label>
                                                            </div>
                                                            <div class="col-md-8 form-group">
                                                                <textarea type="text" class="form-control" rows="3" maxlength="200" 
                                                                          name="description" placeholder="" >${g.description}</textarea>
                                                        </div>

                                                        <div class="col-sm-12 d-flex justify-content-end">
                                                            <button type="submit"
                                                                    class="btn btn-primary me-1 mb-1">Update</button>

                                                        </div>

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

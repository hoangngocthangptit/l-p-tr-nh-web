<%-- 
    Document   : timesheetdetail
    Created on : Mar 6, 2022, 12:43:41 AM
    Author     : Minh Hieu Pham
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Timesheet Details</title>

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
                            <div class="col-12 col-md-6 order-md-1 order-last buttons" style="margin-left: 15%">
                                <h3>Timesheet Detail</h3>
                                <c:if test="${requestScope.action.equals('update')}">
                                    <a href="timesheetdetail?action=add" class="btn btn-secondary">New Timesheet</a>
                                </c:if>
                                <c:if test="${requestScope.action.equals('add')}">
                                    <c:if test="${requestScope.success!=null}">
                                        <p class="alert alert-success"><i class="bi bi-check-circle"></i>&nbsp;${requestScope.success}</p>
                                    </c:if>
                                </c:if>    
                                <c:if test="${requestScope.action.equals('update')}">
                                    <c:if test="${requestScope.success!=null}">
                                        <p class="alert alert-success"><i class="bi bi-check-circle"></i>&nbsp;${requestScope.success}</p>
                                    </c:if>
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
                                        <c:if test="${requestScope.action.equals('update')}">
                                            <h4 class="card-title">Information</h4>
                                        </c:if>
                                        <c:if test="${requestScope.action.equals('add')}">
                                            <h4 class="card-title">Add New Timesheet</h4>
                                        </c:if>
                                    </div>
                                    <div class="card-content">
                                        <div class="card-body">
                                            <c:if test="${requestScope.action.equals('add')}">
                                                <form class="form form-horizontal" action="timesheetdetail" method="post">
                                                    <input type="hidden" name="action" value="add"/>

                                                    <div class="form-body">
                                                        <div class="row">
                                                            <div class="col-md-4">
                                                                <label>Timesheet Date</label>
                                                            </div>
                                                            <div class="col-md-8 form-group">
                                                                <input type="date" id="date" class="form-control" required="" 
                                                                       name="date" placeholder="" value="${requestScope.date}"
                                                                       onblur="validatedate()">   
                                                            </div>
                                                            <div class="col-md-4"></div>
                                                            <div class="col-md-8 form-group">
                                                                <p id="error_date"></p>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <label>Title</label>
                                                            </div>
                                                            <div class="col-md-8 form-group">
                                                                <input type="text" id="" class="form-control" required="" 
                                                                       name="title" placeholder="" value="${requestScope.title}">   
                                                            </div>
                                                            <div class="col-md-4">
                                                                <label>Process</label>
                                                            </div>
                                                            <div class="col-md-8 form-group">
                                                                <select name="process" class="form-select">
                                                                    
                                                                    <c:forEach var="process" items="${requestScope.data_process}">
                                                                        <option <c:if test="${process.equals(requestScope.process)}">selected=""</c:if>>${process}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <label>Project</label>
                                                            </div>
                                                            <div class="col-md-8 form-group">
                                                                <select name="project" class="form-select">
                                                                    
                                                                    <c:forEach var="p" items="${requestScope.data_projects}">
                                                                        <option <c:if test="${p.projectCode.equals(requestScope.project)}">selected=""</c:if>>${p.projectCode}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                            <div class="col-md-4"></div>
                                                            <div class="col-md-8 form-group">
                                                                <c:if test="${requestScope.error!=null}">
                                                                    <p style="color: red;"><i class="bi bi-file-excel"></i>&nbsp;${requestScope.error}</p>
                                                                </c:if>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <label>Duration</label>
                                                            </div>
                                                            <div class="col-md-8 form-group">
                                                                <input type="number" id="" class="form-control" required=""
                                                                       name="duration" placeholder="" value="${requestScope.duration}">
                                                            </div>
                                                            
                                                            <div class="col-md-4">
                                                                <label>Work Result</label>
                                                            </div>
                                                            <div class="col-md-8 form-group">
                                                                <textarea type="text" class="form-control" rows="3" maxlength="200" required=""
                                                                          name="workResult" placeholder="" >${requestScope.workResult}</textarea>
                                                            </div>
                                                            

                                                            <div class="col-sm-12 d-flex justify-content-end">
                                                                    <button type="submit"
                                                                            class="btn btn-primary me-1 mb-1">Add</button>
                                                                


                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                            </c:if>
                                            <c:if test="${requestScope.action.equals('update')}">
                                                <form class="form form-horizontal" action="timesheetdetail" method="post">
                                                    <input type="hidden" name="action" value="update"/>
                                                    <input type="hidden" name="id" value="${timesheet.id}"/>

                                                    <div class="form-body">
                                                        <div class="row">
                                                            <div class="col-md-4">
                                                                <label>Timesheet Date</label>
                                                            </div>
                                                            <div class="col-md-8 form-group">
                                                                <input type="date" id="date" class="form-control" required=""
                                                                       <c:if test="${requestScope.timesheet.status.equals('Approved')}">
                                                                           readonly=""
                                                                       </c:if>
                                                                       name="date" placeholder="" value="${timesheet.timesheetDate}"
                                                                       onblur="validatedate()">   
                                                            </div>
                                                            <div class="col-md-4"></div>
                                                            <div class="col-md-8 form-group">
                                                                <p id="error_date"></p>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <label>Title</label>
                                                            </div>
                                                            <div class="col-md-8 form-group">
                                                                <input type="text" id="" class="form-control" required="" 
                                                                       <c:if test="${requestScope.timesheet.status.equals('Approved')}">
                                                                           readonly=""
                                                                       </c:if>
                                                                       name="title" placeholder="" value="${timesheet.timesheetTitle}">   
                                                            </div>
                                                            <div class="col-md-4">
                                                                <label>Process</label>
                                                            </div>
                                                            <div class="col-md-8 form-group">
                                                                <select name="process" class="form-select" 
                                                                        <c:if test="${requestScope.timesheet.status.equals('Approved')}">
                                                                            disabled=""
                                                                        </c:if>>
                                                                    
                                                                    <c:forEach var="process" items="${requestScope.data_process}">
                                                                        <option <c:if test="${process.equals(timesheet.process)}">selected=""</c:if>>${process}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <label>Project</label>
                                                            </div>
                                                            <div class="col-md-8 form-group">
                                                                <select name="project" class="form-select"
                                                                        <c:if test="${requestScope.timesheet.status.equals('Approved')}">
                                                                            disabled=""
                                                                        </c:if>>
                                                                    
                                                                    <c:forEach var="p" items="${requestScope.data_projects}">
                                                                        <option <c:if test="${p.projectCode.equals(timesheet.projectCode)}">selected=""</c:if>>${p.projectCode}</option>
                                                                    </c:forEach>
                                                                </select>
                                                            </div>
                                                            <div class="col-md-4"></div>
                                                            <div class="col-md-8 form-group">
                                                                <c:if test="${requestScope.error!=null}">
                                                                    <p style="color: red;"><i class="bi bi-file-excel"></i>&nbsp;${requestScope.error}</p>
                                                                </c:if>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <label>Duration</label>
                                                            </div>
                                                            <div class="col-md-8 form-group">
                                                                <input type="number" id="" class="form-control" required=""
                                                                       <c:if test="${requestScope.timesheet.status.equals('Approved')}">
                                                                           readonly=""
                                                                       </c:if>
                                                                       name="duration" placeholder="" value="${timesheet.duration}">
                                                            </div>
                                                            <div class="col-md-4">
                                                                <label>Status</label>
                                                            </div>
                                                            <div class="col-md-8 form-group">
                                                                <input type="text" id="status" class="form-control" readonly=""
                                                                       name="status" placeholder="" value="${timesheet.status}">
                                                            </div>
                                                            <div class="col-md-4">
                                                                <label>Work Result</label>
                                                            </div>
                                                            <div class="col-md-8 form-group">
                                                                <textarea type="text" class="form-control" rows="3" maxlength="200"
                                                                          <c:if test="${requestScope.timesheet.status.equals('Approved')}">
                                                                              readonly=""
                                                                          </c:if>
                                                                          name="workResult" placeholder="" >${timesheet.workResult}</textarea>
                                                            </div>
                                                            <div class="col-md-4">
                                                                <label>Reject Reason</label>
                                                            </div>
                                                            <div class="col-md-8 form-group">
                                                                <textarea type="text" class="form-control" rows="3" maxlength="200"
                                                                          <c:if test="${!timesheet.status.equals('Rejected')}">
                                                                              readonly=""
                                                                          </c:if>
                                                                          name="rejectReason" placeholder="" >${timesheet.rejectReason}</textarea>
                                                            </div>

                                                            <div class="col-sm-12 d-flex justify-content-end">
                                                                <button type="submit"
                                                                        class="btn btn-primary me-1 mb-1">Update</button>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
                </body>
                <script>
                    function validatedate()
                    {
                        var date = document.getElementById("date").value;

                        if ((new Date(date).getTime() > new Date().getTime()))
                        {
                            document.getElementById("error_date").innerHTML = "Date must be smaller or equal today";
                            document.getElementById("error_date").style = "color: red;";
                            document.getElementById("date").style = "border-color: red";
                        } else {
                            document.getElementById("error_date").innerHTML = "";
                            document.getElementById("error_date").style = "color:;";
                            document.getElementById("date").style = "border-color: ";
                        }

                    }
                </script>
                </html>

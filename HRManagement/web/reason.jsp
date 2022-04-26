<%-- 
    Document   : editstatus
    Created on : Jan 16, 2022, 1:05:11 AM
    Author     : Minh Hieu Pham
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Reason</title>

        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/bootstrap.css">

        <link rel="stylesheet" href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
        <link rel="stylesheet" href="assets/vendors/bootstrap-icons/bootstrap-icons.css">
        <link rel="stylesheet" href="assets/css/app.css">
        <link rel="shortcut icon" href="assets/images/favicon.svg" type="image/x-icon">
    </head>
    <body>
        <div id="app">
            <jsp:include page="sidebar.jsp"/>

            <div id="main">

                <div class="card-body">
                    <div class="form-group mb-3">
                        <form action="reason" method="post">
                            <input type="hidden" name="id" value="${requestScope.user.getId()}"/>
                            <label for="" class="form-label">Reason for reject status:
                            </label>
                            <textarea class="form-control" name="reason" value=""
                                      rows="3">${requestScope.user.getNote()}</textarea>
                            <br>
                            <button type="submit"
                                    class="btn btn-primary me-1 mb-1">Update</button>
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                <a href="userlist" style="text-decoration: none; color: inherit">Back to user list</a></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>


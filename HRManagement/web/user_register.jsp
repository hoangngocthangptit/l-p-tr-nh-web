<%-- 
    Document   : add
    Created on : Jun 6, 2021, 10:39:39 PM
    Author     : Admin
--%>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login - Mazer Admin Dashboard</title>
        <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/bootstrap.css">
        <link rel="stylesheet" href="assets/vendors/bootstrap-icons/bootstrap-icons.css">
        <link rel="stylesheet" href="assets/css/app.css">
        <link rel="stylesheet" href="assets/css/pages/auth.css">
    </head>
    <body>
        <div id="auth">

            <div class="row h-200">
                <div class="col-lg-10 col-12">
                    <div id="auth-left">
                        <div class="auth-logo">
                            <a href="index.html"><img src="assets/images/logo/logo.png" alt="Logo"></a>
                        </div>
                        <h1 class="auth-title">Sign Up</h1>
                        <p class="auth-subtitle mb-5">Input your data to register to our website.</p>

                        <form class="form" name="myform" id="myform" action="user-register" method="post">

                            <style>
                                :focus {
                                    outline: none;
                                }
                                input:focus:invalid {
                                    box-shadow: 0 0 5px #d45252;
                                    border-color: red;
                                }
                                input:focus:valid {
                                    box-shadow: 0 0 5px #5cd053;
                                }
                            </style>
                            <div class="row">
                                <div class="col-md-4 col-12">
                                    <div class="form-group">
                                        <label for="first-name-column">First Name</label>
                                        <input type="text" id="first-name-column" class="form-control"
                                               name="first" pattern="^[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂẾưăạảấầẩẫậắằẳẵặẹẻẽềềểếỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ\s\W|_]+$" required>
                                    </div>
                                </div>
                                <div class="col-md-4 col-12">
                                    <div class="form-group">
                                        <label for="middle-name-column">Middle Name</label>
                                        <input type="text" id="middle-name-column" class="form-control"
                                               name="middle" pattern="^[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂẾưăạảấầẩẫậắằẳẵặẹẻẽềềểếỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ\s\W|_]+$">
                                    </div>
                                </div>
                                <div class="col-md-4 col-12">
                                    <div class="form-group">
                                        <label for="last-name-column">Last Name</label>
                                        <input type="text" id="last-name-column" class="form-control"
                                               name="last" pattern="^[a-zA-ZÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂẾưăạảấầẩẫậắằẳẵặẹẻẽềềểếỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ\s\W|_]+$" required>
                                    </div>
                                </div>
                                <div class="col-md-6 col-12">
                                    <div class="form-group">
                                        <label for="contact-info-vertical">Mobile</label>
                                        <input type="text" id="contact-info-vertical"
                                               class="form-control" name="mobile" pattern="(0)\d{9,10}" required>
                                        <p class="text-danger">${mobileErr}</p>
                                    </div>
                                </div>
                                <div class="col-md-6 col-12">
                                    <div class="form-group">
                                        <label for="email-id-vertical">Email</label>
                                        <input type="email" id="email-id-vertical"
                                               class="form-control" name="email" pattern="^([0-9a-zA-Z]([-.\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,9})$" required>
                                        <p class="text-danger">${emailErr}</p>
                                    </div>
                                </div>
                                <div class="col-md-6 col-12">
                                    <div class="form-group">
                                        <label for="gender-column">Gender</label>
                                        <div class="input-group mb-3">
                                            <label class="input-group-text"
                                                   for="gender-selector">Options</label>
                                            <select class="form-select" name="gender" id="gender-selector" required>
                                                <option selected>Choose...</option>
                                                <option value="male">Male</option>
                                                <option value="female">Female</option>
                                                <option value="other">Other</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-12">
                                    <div class="form-group">
                                        <label for="username-column">Username</label>
                                        <input type="text" id="username-column" name="username" class="form-control"
                                                onblur="makeGetRequest(this.value)">
                                        <div id="description"></div>
                                        <p class="text-danger">${usernameErr}</p>
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
                                </div>
                                <div class="col-md-6 col-12">
                                    <div class="form-group">
                                        <label for="password-column">Password</label>
                                        <input type="password" id="password-column" class="form-control"
                                               name="password" pattern="[a-zA-Z0-9!@#$%^&*]{8,}" required>
                                    </div>
                                </div>
                                <div class="col-md-6 col-12">
                                    <div class="form-group">
                                        <label for="re-password-column">Confirm Password</label>
                                        <input type="password" id="re-password-column" class="form-control"
                                               name="re-password" pattern="[a-zA-Z0-9!@#$%^&*]{8,}" required>
                                    </div>
                                </div>
                                <div class="col-12 d-flex justify-content-end">
                                    <button type="submit" class="btn btn-primary me-1 mb-1">Sign up</button>
                                    <button type="submit" formaction="user-register" class="btn btn-light-secondary me-1 mb-1">Reset</button>
                                </div>
                            </div>

                        </form>

                        <div class="text-center mt-5 text-lg fs-4">
                            <p class='text-gray-600'>Already have an account? 
                                <a href="auth-login.html" class="font-bold">Log in</a>.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <script>
                var password = document.getElementById("password-column")
                        , confirm_password = document.getElementById("re-password-column");

                function validatePassword() {
                    if (password.value != confirm_password.value) {
                        confirm_password.setCustomValidity("Passwords Don't Match");
                    } else {
                        confirm_password.setCustomValidity('');
                    }
                }

                password.onchange = validatePassword;
                confirm_password.onkeyup = validatePassword;
            </script>                            
        </div>
    </body>
</html>

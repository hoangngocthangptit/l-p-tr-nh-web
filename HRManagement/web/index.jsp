<%-- 
    Document   : index
    Created on : Jan 5, 2022, 9:05:07 PM
    Author     : GearVn
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>

        <script>(function (w, d, s, l, i) {
                w[l] = w[l] || [];
                w[l].push({'gtm.start':
                            new Date().getTime(), event: 'gtm.js'});
                var f = d.getElementsByTagName(s)[0],
                        j = d.createElement(s), dl = l != 'dataLayer' ? '&l=' + l : '';
                j.async = true;
                j.src =
                        'https://www.googletagmanager.com/gtm.js?id=' + i + dl;
                f.parentNode.insertBefore(j, f);
            })(window, document, 'script', 'dataLayer', 'GTM-PPCK5LS');</script>

        <meta charset="utf-8">
        <meta name="csrf-token" content="6XhhkOwkeGZ9oDhmUco8ZkGaiN4HBl3Rl2bsxkBz">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.1.4/toastr.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" integrity="sha512-tS3S5qG0BlhnQROyJXvNjeEM4UpMXHrQfTGmbQ1gKmelCxlSEBUaxhRBj/EFTzpbP4RVSrpEikbmdJobCvhE3g==" crossorigin="anonymous" />
        <link href="main.css" rel="stylesheet">
        <title>HrManagement.vn - Nền tảng đánh giá nhân sự hàng đầu Việt Nam</title>
        <meta name="description" content="Testcenter là nền tảng đánh giá nhân sự toàn diện thông qua các công cụ đánh giá năng lực nhân sự, tính năng tạo bài test online, tổ chức kỳ thi online với nhiều ưu điểm vượt trội dành cho doanh nghiệp Việt Nam">
        <meta name="twitter:card" content="Testcenter là nền tảng đánh giá nhân sự toàn diện thông qua các công cụ đánh giá năng lực nhân sự, tính năng tạo bài test online, tổ chức kỳ thi online với nhiều ưu điểm vượt trội dành cho doanh nghiệp Việt Nam">
        <meta name="twitter:site" content="Testcenter">
        <meta name="twitter:title" content="Testcenter.vn - Nền tảng đánh giá nhân sự hàng đầu Việt Nam">
        <meta name="twitter:description" content="Testcenter là nền tảng đánh giá nhân sự toàn diện thông qua các công cụ đánh giá năng lực nhân sự, tính năng tạo bài test online, tổ chức kỳ thi online với nhiều ưu điểm vượt trội dành cho doanh nghiệp Việt Nam">
        <meta property="og:locale" content="vi_VN" />
        <meta property="og:locale:alternate" content="en_US" />
        <meta name="og:title" content="Testcenter.vn - Nền tảng đánh giá nhân sự hàng đầu Việt Nam">
        <meta name="og:description" content="Testcenter là nền tảng đánh giá nhân sự toàn diện thông qua các công cụ đánh giá năng lực nhân sự, tính năng tạo bài test online, tổ chức kỳ thi online với nhiều ưu điểm vượt trội dành cho doanh nghiệp Việt Nam">
        <meta name="og:site_name" content="Testcenter">
        <meta name="og:image" content="/images/og-image.png">
        <style>
            .noselect {
                -webkit-touch-callout: none; /* iOS Safari */
                -webkit-user-select: none; /* Safari */
                -khtml-user-select: none; /* Konqueror HTML */
                -moz-user-select: none; /* Old versions of Firefox */
                -ms-user-select: none; /* Internet Explorer/Edge */
                user-select: none; /* Non-prefixed version, currently
                                    supported by Chrome, Edge, Opera and Firefox */
            }
        </style>
            <link rel="canonical" href="https://www.testcenter.vn/" />
        <script type="application/ld+json">
            {"@context":"http:\/\/schema.org","@type":"Organization","@id":"https:\/\/www.testcenter.vn","name":"Testcenter","alternateName":"N\u1ec1n c\u00f4ng ngh\u1ec7 \u0111\u00e1nh gia nh\u00e2n s\u1ef1","logo":"https:\/\/www.testcenter.vn\/images\/logo.png","description":"Gi\u1ea3i ph\u00e1p \u0111\u00e1nh gi\u00e1 nh\u00e2n s\u1ef1 to\u00e0n di\u1ec7n, h\u1ed7 tr\u1ee3 t\u1ea1o, cung c\u1ea5p \u0111\u1ec1 thi v\u00e0 b\u00e0i ki\u1ec3m tra online c\u00f9ng nhi\u1ec1u t\u00ednh n\u0103ng h\u1eefu \u00edch","hasMap":"https:\/\/www.google.com\/maps\/place\/N%E1%BB%81n+t%E1%BA%A3ng+%C4%91%C3%A1nh+gi%C3%A1+n%C4%83ng+l%E1%BB%B1c+nh%C3%A2n+s%E1%BB%B1+h%C3%A0ng+%C4%91%E1%BA%A7u+Vi%E1%BB%87t+Nam+-+Testcenter.vn\/@20.9948453,105.8060573,15z\/data=!4m5!3m4!1s0x0:0x87265075bb78d185!8m2!3d20.9948313!4d105.8060376","url":"https:\/\/www.testcenter.vn","email":"soncd@testcenter.vn","telephone":"0967778081","address":{"@type":"PostalAddress","streetAddress":"T\u1ea7ng 03, T\u00f2a nh\u00e0 Goldseason, 47 Nguy\u1ec5n Tu\u00e2n, Thanh Xu\u00e2n, H\u00e0 N\u1ed9i","addressLocality":"Thanh Xu\u00e2n","addressRegion":"H\u00e0 N\u1ed9i","postalCode":"100000","addressCountry":"Vi\u1ec7t Nam"},"geo":{"@type":"GeoCoordinates","latitude":20.9948459,"longitude":105.8038395},"openingHoursSpecification":{"@type":"OpeningHoursSpecification","dayOfWeek":["Monday","Tuesday","Wednesday","Thursday","Friday"],"opens":"08:00","closes":"17:30"},"sameAs":["https:\/\/www.facebook.com\/testcentervn","https:\/\/twitter.com\/testcenter13","https:\/\/www.linkedin.com\/company\/testcenter-vn\/","https:\/\/testcentervn.tumblr.com\/"]}
        </script>
    </head>
    <body>

        <div id="fb-root"></div>
        <script>
            window.fbAsyncInit = function () {
                FB.init({
                    xfbml: true,
                    version: 'v9.0'
                });
            };

            (function (d, s, id) {
                var js, fjs = d.getElementsByTagName(s)[0];
                if (d.getElementById(id))
                    return;
                js = d.createElement(s);
                js.id = id;
                js.src = 'https://connect.facebook.net/en_US/sdk/xfbml.customerchat.js';
                fjs.parentNode.insertBefore(js, fjs);
            }(document, 'script', 'facebook-jssdk'));

        </script>

        <div class="fb-customerchat" attribution=setup_tool page_id="115581680238708" theme_color="#3454b0">
        </div>


        <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-PPCK5LS"
                          height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>


        <script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
        <script src="https://www.google.com/recaptcha/api.js?hl=vi"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.1.4/toastr.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous">
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous">
        </script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js" integrity="sha512-bPs7Ae6pVvhOSiIcyUClR7/q2OAsRiovw4vAkX+zJbw3ShAeeqezq50RIIcIURq7Oa20rW2n2q+fyXBNcU9lrw==" crossorigin="anonymous"></script>
        <div id="main">
            <div>
                <header class="header bg-white">
                    <nav class="container navbar navbar-expand-lg bg-white navbar-light">
                        <a class="navbar-brand" href="/" >
                            <h1 style="color:#2C4A9F" style="font-size: 2rem">HrManagement.vn</h1>
                        </a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarNav">
                            <ul class="navbar-nav mr-auto"></ul>
                            <div class="form-inline">
                                <ul class="navbar-nav mr-auto">
                                    <li class="nav-item">
                                        <a class="nav-link header-item" href="login">Login</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link header-item" href="user-register">Register</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </nav>
                </header>
                <div class="mt-5 pt-3">
                    <section class="container">
                        <div class="row">
                            <div class="col-lg-5 col-md-6 col-sm-12 mb-5 pr-4">
                                <h1  style="font-size: 2rem" class="hero-title">
                                    Giải pháp đánh giá nhân sự toàn diện
                                </h1>
                                <p class="sub-title text-sm mt-4">
                                    HrManagement.vn là nền tảng tạo đề thi và đánh giá năng lực nhân sự hàng đầu Việt Nam. Hỗ trợ Doanh nghiệp thiết lập quy trình tuyển dụng, đào tạo nhân sự theo tiêu chuẩn của các tập đoàn lớn như Google, Microsoft,…
                                </p>
                                <div class="group-button mt-4">
                                    <a href="login" class="mr-3 py-3 px-4 btn btn-primary border-0 font-weight-normal">Trải nghiệm ngay</a>
                                </div>
                            </div>
                            <div class="col-lg-7 col-md-6 col-sm-12">
                                <div class="w-100 h-100">
                                    <img class="w-100 h-100" alt="Giải pháp đánh giá nhân sự" src="section-1.png" alt="">
                                </div>
                            </div>
                        </div>
                    </section>
                    <section class="mt-5 bg-light bg-partern-body px-5 py-3">
                        <div class="container">
                            <h2 style="font-size: 1.75rem" class="hero-title">
                                Công cụ đánh giá nhân sự dành cho doanh nghiệp
                            </h2>
                            <div class="list-features mt-4">
                                <div class="row">
                                    <div class="mt-4 col-12 col-lg-4 col-md-4 col-sm-12">
                                        <div class="bg-white h-100 p-3">
                                            <h5 class="text-dark">Ngân hàng đề thi</h5>
                                            <p class="text-sm mt-4"><strong>300 đề thi trắc nghiệm</strong> tính cách MBTI, DISC, kiểm tra trí thông minh IQ, EQ, đánh giá năng lực chuyên muôn; giúp tiết kiệm thời gian và chi phí mua đề</p>
                                        </div>
                                    </div>
                                    <div class="mt-4 col-12 col-lg-4 col-md-4 col-sm-12">
                                        <div class="bg-white h-100 p-3">
                                            <h5 class="text-dark">Tổ chức đợt thi</h5>
                                            <p class="text-sm mt-4">Gửi đề thi đến hàng ngàn người cùng lúc bằng email hoặc mã QR, tiết kiệm thời gian và chi phí</p>
                                        </div>
                                    </div>
                                    <div class="mt-4 col-12 col-lg-4 col-md-4 col-sm-12">
                                        <div class="bg-white h-100 p-3">
                                            <h5 class="text-dark">Bảo mật</h5>
                                            <p class="text-sm mt-4">Hệ thống bảo mật tuyệt đối bằng mã truy cập giúp kỳ thi diễn ra bảo mật, minh bạch hơn</p>
                                        </div>
                                    </div>
                                    <div class="mt-4 col-12 col-lg-4 col-md-4 col-sm-12">
                                        <div class="bg-white h-100 p-3">
                                            <h5 class="text-dark">Báo cáo</h5>
                                            <p class="text-sm mt-4">Hệ thống bảo mật tuyệt đối bằng mã truy cập giúp kỳ thi diễn ra bảo mật, minh bạch hơn</p>
                                        </div>
                                    </div>
                                    <div class="mt-4 col-12 col-lg-4 col-md-4 col-sm-12">
                                        <div class="bg-white h-100 p-3">
                                            <h5 class="text-dark">Làm việc nhóm</h5>
                                            <p class="text-sm mt-4">Hệ thống phân quyền tài khoản tối đa hiệu quả làm việc nhóm</p>
                                        </div>
                                    </div>
                                    <div class="mt-4 col-12 col-lg-4 col-md-4 col-sm-12">
                                        <div class="bg-white h-100 p-3">
                                            <h5 class="text-dark">Công nghệ</h5>
                                            <p class="text-sm mt-4">Ứng dụng những công nghệ hiện đại để tối ưu trải nghiệm sử dụng</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="row my-5">
                                    <div class="col-lg-6 col-md-12 col-sm-12">
                                        <div class="primary-card px-5 py-4">
                                            <h2 class="text-center text-white">Chỉ mất 5 phút</h2>
                                            <h5 class="text-center text-white font-weight-normal mb-4">để thiết lập đợt thi tuyển</h5>
                                            <a href="login" style="width: fit-content" class="text-sm px-5 d-block m-auto text-center btn btn-warning rounded-pill border-0">Bắt đầu dùng thử ngay</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="mb-5"></div>
                            </div>
                        </div>
                    </section>
                    <section id="section-features" class="mt-5 bg-white px-5 py-3">
                        <div class="container">
                            <div class="row">
                                <div class="col-12">
                                    <h2 style="font-size: 1.75rem" class="hero-title">
                                        4 lợi thế của doanh nghiệp khi sử dụng nền tảng HrManagement.vn
                                    </h2>
                                </div>
                                <div class="col-lg-5 col-md-12 col-sm-12">
                                    <div class="list-segments">
                                        <div onclick="changeSegmentImage(this)" img="https://www.testcenter.vn/images/thum-1.png" class="active rounded segment-item position-relative border-primary p-3 mt-5 cursor-pointer">
                                            <div class="circle-icon position-absolute">
                                                <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="64" height="64" viewBox="0 0 172 172" style=" fill:#000000;"><g fill="none" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal"><path d="M0,172v-172h172v172z" fill="none"></path><g fill="#ffffff"><path d="M32.65313,139.88438c-1.075,1.88125 -0.40313,4.43437 1.47812,5.50937c0.67188,0.40312 1.34375,0.5375 2.01563,0.5375c1.34375,0 2.82188,-0.67187 3.49375,-2.01562c9.54062,-16.6625 27.27812,-27.00938 46.35937,-27.00938c6.31562,0 12.63125,1.075 18.54375,3.35938c0.40312,0.13437 0.94062,0.26875 1.34375,0.26875c1.6125,0 3.225,-0.94062 3.7625,-2.6875c0.80625,-2.15 -0.26875,-4.43437 -2.41875,-5.24062c-6.71875,-2.41875 -13.84063,-3.7625 -21.23125,-3.7625c-22.0375,0 -42.4625,11.95938 -53.34687,31.04063zM86,36.28125c-17.06562,0 -30.90625,13.84062 -30.90625,30.90625c0,17.06562 13.84063,30.90625 30.90625,30.90625c17.06562,0 30.90625,-13.84063 30.90625,-30.90625c0,-17.06563 -13.84063,-30.90625 -30.90625,-30.90625zM86,90.03125c-12.63125,0 -22.84375,-10.2125 -22.84375,-22.84375c0,-12.63125 10.2125,-22.84375 22.84375,-22.84375c12.63125,0 22.84375,10.2125 22.84375,22.84375c0,12.63125 -10.2125,22.84375 -22.84375,22.84375zM158.5625,114.21875c0,-10.34687 -8.46562,-18.8125 -18.8125,-18.8125c-10.34688,0 -18.8125,8.46563 -18.8125,18.8125v12.09375h-1.34375c-3.7625,0 -6.71875,2.95625 -6.71875,6.71875v9.40625c0,14.78125 12.09375,26.875 26.875,26.875c14.78125,0 26.875,-12.09375 26.875,-26.875v-9.40625c0,-3.7625 -2.95625,-6.71875 -6.71875,-6.71875h-1.47813c0,-0.26875 0.13438,-0.40313 0.13438,-0.67187zM143.78125,150.09688c0,2.28437 -1.74687,4.03125 -4.03125,4.03125c-2.28438,0 -4.03125,-1.74688 -4.03125,-4.03125v-6.9875c0,-2.28438 1.74687,-4.03125 4.03125,-4.03125c2.28438,0 4.03125,1.74687 4.03125,4.03125zM129,126.3125v-12.09375c0,-5.9125 4.8375,-10.75 10.75,-10.75c5.9125,0 10.75,4.8375 10.75,10.75v11.42188c0,0.26875 0,0.40313 0.13438,0.67188z"></path></g></g></svg>
                                            </div>
                                            <p class="text-primary mt-4">Hạn chế tối đa tuyển dụng sai ứng viên thông qua bài test online tính cách và chuyên môn</p>
                                        </div>
                                        <div onclick="changeSegmentImage(this)" img="https://www.testcenter.vn/images/thum-2.png" class="rounded segment-item position-relative border-primary p-3 mt-5 cursor-pointer">
                                            <div class="circle-icon position-absolute">
                                                <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="24" height="24" viewBox="0 0 172 172" style=" fill:#000000;"><g transform=""><g fill="none" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal"><path d="M0,172v-172h172v172z" fill="none"></path><path d="" fill="none"></path><g fill="#000000"><path d="M113.62033,89.44717c-5.2675,-3.29667 -12.599,-6.31383 -21.98733,-9.05867c-9.38833,-2.73767 -16.13217,-5.7835 -20.22433,-9.14467c-4.09933,-3.34683 -6.149,-7.85467 -6.149,-13.50917c0,-6.09167 1.94217,-10.85033 5.8265,-14.2545c3.87717,-3.41133 9.4815,-5.10983 16.80583,-5.10983c7.01617,0 12.599,2.3005 16.71983,6.90867c4.128,4.60817 6.192,10.82167 6.192,18.6405l-0.00717,0.5805h16.99933l0.00717,-0.57333c0,-11.33767 -2.87383,-20.2745 -8.63583,-26.80333c-5.762,-6.52167 -13.81017,-10.4275 -24.15883,-11.696l-0.05017,-0.00717v-18.2535h-14.33333v18.28217c-9.976,1.1825 -17.87367,4.5795 -23.6285,10.26267c-5.88383,5.81217 -8.82933,13.25117 -8.82933,22.32417c0,8.90817 3.00283,16.254 9.0085,22.0375c6.00567,5.77633 15.566,10.4705 28.681,14.06817c9.42417,2.82367 16.11783,5.977 20.09533,9.46c3.96317,3.49017 5.9555,7.77583 5.9555,12.86417c0,6.03433 -2.31483,10.793 -6.93017,14.276c-4.6225,3.483 -10.965,5.2245 -19.03467,5.2245c-8.24883,0 -14.62717,-2.07117 -19.12067,-6.22067c-4.4935,-4.1495 -6.73667,-10.06917 -6.73667,-17.759h-17.08533c0,10.95067 3.2465,19.62233 9.7395,26.015c6.32817,6.22783 15.05717,9.81833 26.09383,10.87183v15.96017h14.33333v-15.83833l0.17917,-0.00717c11.266,-1.0535 20.03083,-4.42183 26.28017,-10.1265c6.24217,-5.6975 9.374,-13.2225 9.374,-22.56783c0,-5.86233 -1.25417,-10.97933 -3.741,-15.35817c-2.494,-4.3645 -6.37833,-8.19867 -11.63867,-11.48817z"></path></g></g></g></svg>
                                            </div>
                                            <p class="text-primary mt-4">Giảm 20% chi phí tổ chức thi tuyển và đánh giá so với các bài test giấy truyền thống</p>
                                        </div>
                                        <div onclick="changeSegmentImage(this)" img="https://www.testcenter.vn/images/thum-3.png" class="rounded segment-item position-relative border-primary p-3 mt-5 cursor-pointer">
                                            <div class="circle-icon position-absolute">
                                                <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="32" height="32" viewBox="0 0 172 172" style=" fill:#000000;"><g fill="none" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal"><path d="M0,172v-172h172v172z" fill="none"></path><g fill="#2ecc71"><path d="M26.875,32.25v73.02442l-12.32471,12.3247c-2.451,2.451 -3.80029,5.70842 -3.80029,9.1753c0,7.15412 5.82146,12.97558 12.97559,12.97558h46.14941l10.75,-10.75h-56.89941c-1.2255,0 -2.22559,-1.00009 -2.22559,-2.22558c0,-0.58588 0.237,-1.16083 0.65088,-1.57471l12.32471,-12.32471h62.27441l5.375,-5.375c-0.258,-0.72025 -0.24162,-2.86488 -0.0105,-5.375h-64.4895v-59.125h96.75v25.06933c2.83263,-0.55362 6.407,-0.60813 10.75,0.0315v-35.85083zM142.63696,74.98755c-8.06828,-0.20727 -16.20387,2.76637 -22.32935,8.89185c-6.53526,6.52955 -8.85031,15.3551 -8.17798,23.93555l-31.22119,31.22119c-3.62107,3.62107 -5.65845,8.54139 -5.65845,13.65796c0,5.11988 2.03998,10.02899 5.65845,13.64746c3.62108,3.62107 8.53089,5.65845 13.64746,5.65845c5.11657,0 10.03187,-2.0354 13.64746,-5.65845l31.22119,-31.22119c8.57826,0.67247 17.4018,-1.64424 23.93555,-8.17798c9.33493,-9.33493 11.35787,-23.32018 5.95239,-34.65405c-0.75302,-1.57355 -2.22279,-2.68385 -3.94224,-2.97807c-1.71945,-0.29423 -3.47477,0.26421 -4.70815,1.49785l-12.79712,12.79712c-1.19761,1.19761 -2.98061,1.19761 -4.17822,0c0.0172,0.01827 -0.06355,-0.06355 -0.04199,-0.04199c-1.19761,-1.19761 -1.19761,-2.98061 0,-4.17822l12.79712,-12.79712c1.23364,-1.23338 1.79208,-2.98869 1.49785,-4.70815c-0.29423,-1.71945 -1.40453,-3.18922 -2.97807,-3.94224c-2.83342,-1.35298 -5.83062,-2.24106 -8.88135,-2.66651c-1.14402,-0.15954 -2.29074,-0.25383 -3.44336,-0.28345zM138.6687,85.96851c0.94088,-0.15238 1.84216,0.41413 2.79248,0.39892l-5.41699,5.41699c-5.06549,5.06549 -5.23651,13.2512 -0.62989,18.60254c0.18027,0.26616 0.38405,0.51561 0.60889,0.74536c0.00706,0.00711 0.01391,0.0139 0.02099,0.021v0.0105c0.01392,0.01407 0.02792,0.02807 0.04199,0.04199c5.30614,5.30614 14.07326,5.30614 19.3794,0l5.41699,-5.41699c-0.07821,4.92476 -1.34617,9.7761 -5.12305,13.55298c-4.85234,4.85234 -11.53466,6.61968 -17.7732,5.3855c-1.76248,-0.34805 -3.58232,0.20736 -4.8501,1.48023l-32.53345,32.53345c-0.0035,0.00349 -0.007,0.00699 -0.0105,0.0105c-1.59784,1.601 -3.7677,2.49854 -6.03638,2.49854c-2.26868,0 -4.44345,-0.90561 -6.04687,-2.50903c-1.60603,-1.60603 -2.50903,-3.77075 -2.50903,-6.04687c0,-2.26868 0.90561,-4.45395 2.50903,-6.05737l32.53345,-32.53345c1.27287,-1.26778 1.82827,-3.08762 1.48023,-4.8501c-1.23373,-6.23625 0.53417,-12.9261 5.3855,-17.7732c3.0461,-3.0461 6.83061,-4.87513 10.7605,-5.51147z"></path></g></g></svg>
                                            </div>
                                            <p class="text-primary mt-4">Nâng cao hiệu quả đào tạo và phát triển nhân sự nhờ hệ thống bài đánh giá năng lực phù hợp</p>
                                        </div>
                                        <div onclick="changeSegmentImage(this)" img="https://www.testcenter.vn/images/thum-4.png" class="rounded segment-item position-relative border-primary p-3 mt-5 cursor-pointer">
                                            <div class="circle-icon position-absolute">
                                                <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="64" height="64" viewBox="0 0 172 172" style=" fill:#000000;"><g fill="none" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal"><path d="M0,172v-172h172v172z" fill="none"></path><g fill="#333333"><path d="M112.875,24.1875c-2.28437,0 -4.03125,1.74687 -4.03125,4.03125v67.1875c0,2.28437 1.74688,4.03125 4.03125,4.03125c2.28437,0 4.03125,-1.74688 4.03125,-4.03125v-63.15625h18.8125v63.15625c0,2.28437 1.74687,4.03125 4.03125,4.03125c2.28438,0 4.03125,-1.74688 4.03125,-4.03125v-67.1875c0,-2.28438 -1.74687,-4.03125 -4.03125,-4.03125zM21.5,37.625c-2.28438,0 -4.03125,1.74688 -4.03125,4.03125v67.1875c0,2.28437 1.74687,4.03125 4.03125,4.03125c2.28438,0 4.03125,-1.74688 4.03125,-4.03125v-63.15625h18.8125v63.15625c0,2.28437 1.74687,4.03125 4.03125,4.03125c2.28438,0 4.03125,-1.74688 4.03125,-4.03125v-67.1875c0,-2.28437 -1.74687,-4.03125 -4.03125,-4.03125zM68.53125,51.0625c-2.28437,0 -4.03125,1.74687 -4.03125,4.03125v67.1875c0,2.28437 1.74688,4.03125 4.03125,4.03125c2.28437,0 4.03125,-1.74688 4.03125,-4.03125v-63.15625h18.8125v63.15625c0,2.28437 1.74688,4.03125 4.03125,4.03125c2.28437,0 4.03125,-1.74688 4.03125,-4.03125v-67.1875c0,-2.28438 -1.74688,-4.03125 -4.03125,-4.03125zM126.0448,109.11145c-9.675,0 -17.46875,7.79375 -17.46875,17.46875c0,2.01563 0.40208,3.89792 0.93958,5.77917l-15.45312,8.3302c-3.09063,-3.09062 -7.39062,-4.97083 -12.09375,-4.97083c-6.58437,0 -12.22917,3.6276 -15.18542,8.86823l-14.37708,-4.03125v-0.80573c0,-9.675 -7.79375,-17.46875 -17.46875,-17.46875c-9.675,0 -17.46875,7.79375 -17.46875,17.46875c0,2.95625 0.67188,5.64375 2.01563,8.0625l-15.8573,15.99115c-1.6125,1.6125 -1.6125,4.16458 0,5.6427c0.80625,0.80625 1.88335,1.2099 2.82397,1.2099c1.075,0 2.0151,-0.40365 2.82135,-1.2099l15.31927,-15.58698c2.82187,2.01563 6.44948,3.35938 10.21198,3.35938c6.58438,0 12.22655,-3.6276 15.1828,-8.86823l14.3797,4.1651v0.80573c0,9.675 7.79375,17.46875 17.46875,17.46875c9.675,0 17.46875,-7.79375 17.46875,-17.46875c0,-2.01562 -0.4047,-3.8953 -0.9422,-5.77655l15.72345,-8.60052c3.09062,3.09062 7.39063,4.97083 12.09375,4.97083c3.35938,0 6.44843,-0.94115 9.13593,-2.55365l10.88647,10.88647c0.80625,0.80625 1.88073,1.20728 2.82135,1.20728c0.94063,0 2.0151,-0.40103 2.82135,-1.20728c1.6125,-1.6125 1.6125,-4.1672 0,-5.64532l-10.88385,-10.88385c1.6125,-2.6875 2.55365,-5.77917 2.55365,-9.13855c0,-9.675 -7.79375,-17.46875 -17.46875,-17.46875zM126.3125,116.90625c5.24062,0 9.40625,4.16562 9.40625,9.40625c0,5.24062 -4.16563,9.40625 -9.40625,9.40625c-5.24063,0 -9.40625,-4.16563 -9.40625,-9.40625c0,-5.24063 4.16562,-9.40625 9.40625,-9.40625zM34.9375,130.34375c5.24063,0 9.40625,4.16563 9.40625,9.40625c0,0.94063 -0.13542,1.7474 -0.40417,2.55365c-1.075,3.89687 -4.70208,6.71875 -9.00208,6.71875c-5.24062,0 -9.40625,-4.16563 -9.40625,-9.40625c0,-5.24062 4.16563,-9.2724 9.40625,-9.2724zM81.96875,143.78125c5.24063,0 9.40625,4.16563 9.40625,9.40625c0,5.24062 -4.16562,9.40625 -9.40625,9.40625c-5.24062,0 -9.40625,-4.16563 -9.40625,-9.40625c0,-5.24062 4.16563,-9.40625 9.40625,-9.40625zM162.54388,158.69635c-1.02461,0 -2.03242,0.40365 -2.77148,1.2099c-1.47813,1.6125 -1.47813,4.0302 0,5.6427l3.8974,3.8974c0.80625,0.80625 1.88073,1.2099 2.82135,1.2099c1.075,0 2.2828,-0.40312 3.08905,-1.34375c1.34375,-1.6125 1.21095,-4.16458 -0.40155,-5.6427l-3.76355,-3.76355c-0.80625,-0.80625 -1.84661,-1.2099 -2.87122,-1.2099z"></path></g></g></svg>
                                            </div>
                                            <p class="text-primary mt-4">Theo dõi chất lượng nhân sự dễ dàng thông qua báo cáo kết quả trực quan và minh bạch</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-7 mt-5 d-none d-lg-block d-xl-block">
                                    <div id="img-segment-demo" class="w-100 h-100" style="background-repeat: no-repeat;background-size: cover;"></div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <section class="mt-5 bg-light py-3">
                        <div class="container">
                            <h2 style="font-size: 1.75rem" class="hero-title">
                                Trải nghiệm công nghệ đánh giá nhân sự dựa trên tiêu chuẩn quốc tế
                            </h2>
                            <p class="text-dark">Đưa tiêu chuẩn và phương pháp đánh giá nhân sự quốc tế đến gần hơn với doanh nghiệp Việt Nam</p>
                        </div>
                        <div class="slider-panel position-relative mt-5">
                            <div onclick="owlHandler.prevPage()" id="trigger-prev-slider" class="cursor-pointer position-absolute arrow-slide arrow-slide-left shadow">
                                <svg style="width: 15px" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="arrow-left" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" class="svg-inline--fa fa-arrow-left fa-w-14"><path fill="currentColor" d="M257.5 445.1l-22.2 22.2c-9.4 9.4-24.6 9.4-33.9 0L7 273c-9.4-9.4-9.4-24.6 0-33.9L201.4 44.7c9.4-9.4 24.6-9.4 33.9 0l22.2 22.2c9.5 9.5 9.3 25-.4 34.3L136.6 216H424c13.3 0 24 10.7 24 24v32c0 13.3-10.7 24-24 24H136.6l120.5 114.8c9.8 9.3 10 24.8.4 34.3z" class=""></path></svg>
                            </div>
                            <div onclick="owlHandler.nextPage()" id="trigger-next-slider" class="cursor-pointer position-absolute arrow-slide arrow-slide-right shadow">
                                <svg style="width: 15px" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="arrow-right" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" class="svg-inline--fa fa-arrow-right fa-w-14"><path fill="currentColor" d="M190.5 66.9l22.2-22.2c9.4-9.4 24.6-9.4 33.9 0L441 239c9.4 9.4 9.4 24.6 0 33.9L246.6 467.3c-9.4 9.4-24.6 9.4-33.9 0l-22.2-22.2c-9.5-9.5-9.3-25 .4-34.3L311.4 296H24c-13.3 0-24-10.7-24-24v-32c0-13.3 10.7-24 24-24h287.4L190.9 101.2c-9.8-9.3-10-24.8-.4-34.3z" class=""></path></svg>
                            </div>
                            <div class="slider-images owl-carousel owl-theme owl-carousel-banner">
                                <div class="item bg-primary slider-item pl-5" id="hr-free-manage">
                                    <div class="row">
                                        <div class="slider-item-title col-7">
                                            <p class="text-uppercase text-white">For business owner</p>
                                            <h3 class="text-uppercase text-white">ĐÀO TẠO NHÂN SỰ HIỆU QUẢ</h3>
                                            <p class="text-sm text-light">Nâng cao chất lượng của chương trình đào tạo nhân sự nội bộ bằng cách nắm bắt toàn diện năng lực hiện tại của nhân viên.</p>
                                            <div class="mt-5">
                                                <a href="#" target="_blank" class="btn btn-warning">Tìm hiểu thêm</a>
                                            </div>
                                        </div>
                                        <div class="image-block col-5 m-0">
                                            <img alt="Đào tạo nhân sự hiệu quả" id="slider-image" class="w-100" src="https://www.testcenter.vn/images/slider-1.png" alt="">
                                        </div>
                                    </div>
                                </div>
                                <div class="item bg-primary slider-item pl-5" id="online-test-system">
                                    <div class="row">
                                        <div class="slider-item-title col-7">
                                            <p class="text-uppercase text-white">For business owner</p>
                                            <h3 class="text-uppercase text-white">HỆ THỐNG BÀI TEST ONLINE</h3>
                                            <p class="text-sm text-light">Ngân hàng hơn 300 đề test online được xây dựng dựa trên tiêu chuẩn quốc tế</p>
                                            <div class="mt-5">
                                                <a href="#" target="_blank" class="btn btn-warning">Tìm hiểu thêm</a>
                                            </div>
                                        </div>
                                        <div class="image-block col-5 m-0">
                                            <img alt="Hệ thống bài test online" id="slider-image" class="w-100" src="https://www.testcenter.vn/images/slider-2.png" alt="">
                                        </div>
                                    </div>
                                </div>
                                <div class="item bg-primary slider-item pl-5" id="digitize-hr">
                                    <div class="row">
                                        <div class="slider-item-title col-7">
                                            <p class="text-uppercase text-white">For business owner</p>
                                            <h3 class="text-uppercase text-white">SỐ HÓA QUY TRÌNH ĐÁNH GIÁ NHÂN SỰ</h3>
                                            <p class="text-sm text-light">Dẫn đầu xu hướng chuyển đổi số của doanh nghiệp bằng cách ứng dụng hệ thống công nghệ tiên tiến</p>
                                            <div class="mt-5">
                                                <a href="#" target="_blank" class="btn btn-warning">Tìm hiểu thêm</a>
                                            </div>
                                        </div>
                                        <div class="image-block col-5 m-0">
                                            <img alt="Số hóa quy trình đánh giá nhân sự" id="slider-image" class="w-100" src="https://www.testcenter.vn/images/slider-3.png" alt="">
                                        </div>
                                    </div>
                                </div>
                                <div class="item bg-primary slider-item pl-5" id="desc-wrong-hr">
                                    <div class="row">
                                        <div class="slider-item-title col-7">
                                            <p class="text-uppercase text-white">For business owner</p>
                                            <h3 class="text-uppercase text-white">GIẢM TỈ LỆ TUYỂN DỤNG SAI</h3>
                                            <p class="text-sm text-light">Ứng dụng giải pháp test online vào quy trình quản trị nhân sự giúp đánh giá năng lực nhân sự toàn diện</p>
                                            <div class="mt-5">
                                                <a href="#" target="_blank" class="btn btn-warning">Tìm hiểu thêm</a>
                                            </div>
                                        </div>
                                        <div class="image-block col-5 m-0">
                                            <img alt="Giảm tỷ lệ tuyển dụng sai" id="slider-image" class="w-100" src="https://www.testcenter.vn/images/slider-4.png" alt="">
                                        </div>
                                    </div>
                                </div>
                                <div class="item bg-primary slider-item pl-5" id="DIVERSE SAMPLE TEST BANK">
                                    <div class="row">
                                        <div class="slider-item-title col-7">
                                            <p class="text-uppercase text-white">For business owner</p>
                                            <h3 class="text-uppercase text-white">NGÂN HÀNG ĐỀ THI MẪU ĐA DẠNG</h3>
                                            <p class="text-sm text-light">Lựa chọn và sử dụng hơn 300 đề thi mẫu với đa dạng lĩnh vực như trắc nghiệm tính cách, trắc nghiệm trí thông minh và kiểm tra kiến thức chuyên môn</p>
                                            <div class="mt-5">
                                                <a href="#" target="_blank" class="btn btn-warning">Tìm hiểu thêm</a>
                                            </div>
                                        </div>
                                        <div class="image-block col-5 m-0">
                                            <img alt="diversity-of-test-bank" id="slider-image" class="w-100" src="https://www.testcenter.vn/images/slider-5.png" alt="">
                                        </div>
                                    </div>
                                </div>
                                <div class="item bg-primary slider-item pl-5" id="free-account">
                                    <div class="row">
                                        <div class="slider-item-title col-7">
                                            <p class="text-uppercase text-white">For business owner</p>
                                            <h3 class="text-uppercase text-white">TẠO TÀI KHOẢN SỬ DỤNG MIỄN PHÍ</h3>
                                            <p class="text-sm text-light">Trải nghiệm hệ thống tạo bài test online hoàn toàn miễn phí với đầy đủ mọi tính năng cho doanh nghiệp</p>
                                            <div class="mt-5">
                                                <a href="#" target="_blank" class="btn btn-warning">Tìm hiểu thêm</a>
                                            </div>
                                        </div>
                                        <div class="image-block col-5 m-0">
                                            <img alt="create-account-freely" id="slider-image" class="w-100" src="https://www.testcenter.vn/images/slider-6.png" alt="">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <section class="mt-5 bg-white px-5 py-3" id="section-features">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-7 col-md-7 col-sm-12">
                                    <h2 style="font-size: 1.75rem" class="hero-title">
                                        Tham gia cùng cộng đồng doanh nghiệp chuyển đổi số hoạt động tuyển dụng
                                    </h2>
                                </div>
                                <div class="col-12 mt-3">
                                    <p class="text-dark"><strong>10.865 bài đánh giá</strong> đã được tạo ra trong năm bởi những doanh nghiệp tiên phong</p>
                                </div>
                                <div class="row">
                                    <div class="col-6 col-lg-2 col-md-4 col-sm-4 mt-5 text-center">
                                        <a href="#"><img alt="honda" class="fit-contain gray-filter partner-img" src="https://www.testcenter.vn/images/partner/honda.svg"></a>
                                    </div>
                                    <div class="col-6 col-lg-2 col-md-4 col-sm-4 mt-5 text-center">
                                        <a href="#"><img alt="fpt" class="fit-contain gray-filter partner-img" src="https://www.testcenter.vn/images/partner/fpt.png"></a>
                                    </div>
                                    <div class="col-6 col-lg-2 col-md-4 col-sm-4 mt-5 text-center">
                                        <a href="#"><img alt="sailun" class="fit-contain gray-filter partner-img" src="https://www.testcenter.vn/images/partner/sailun.png"></a>
                                    </div>
                                    <div class="col-6 col-lg-2 col-md-4 col-sm-4 mt-5 text-center">
                                        <a href="#"><img alt="shinhan" class="fit-contain gray-filter partner-img" src="https://www.testcenter.vn/images/partner/shinhan.png"></a>
                                    </div>
                                    <div class="col-6 col-lg-2 col-md-4 col-sm-4 mt-5 text-center">
                                        <a href="#"><img alt="shopee" class="fit-contain gray-filter partner-img" src="https://www.testcenter.vn/images/partner/shopee.png"></a>
                                    </div>
                                    <div class="col-6 col-lg-2 col-md-4 col-sm-4 mt-5 text-center">
                                        <a href="#"><img alt="apax" class="fit-contain gray-filter partner-img" src="https://www.testcenter.vn/images/partner/apax.png"></a>
                                    </div>
                                    <div class="col-6 col-lg-2 col-md-4 col-sm-4 mt-5 text-center">
                                        <a href="#"><img alt="techcombank" class="fit-contain gray-filter partner-img" src="https://www.testcenter.vn/images/partner/techcombank.png"></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <section class="mt-5 bg-light px-5 py-3" id="section-features">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-7 col-md-7 col-sm-12">
                                    <h2 style="font-size: 1.75rem" class="hero-title">
                                        Bắt đầu với 14 ngày trải nghiệm miễn phí & không giới hạn tính năng
                                    </h2>
                                    <div class="group-button mt-4">
                                        <a href="login" class="mr-3 mb-3 py-3 px-4 btn btn-primary border-0 font-weight-normal">Dùng thử HrManagement</a>
                                    </div>
                                    <p class="mt-4">
                                        <span class="mr-3 text-dark" href="#">Đã có tài khoản?</span>
                                        <a class="mr-3 text-primary" href="login">Đăng nhập ngay</a>
                                    </p>
                                </div>
                                <div class="col-5 col-md-5 col-sm-12 d-none d-lg-block d-xl-block">
                                    <img alt="Trải nghiệm testcenter miễn phí" style="top: -250px; width: 90%" class="position-absolute fit-contain" src="https://www.testcenter.vn/images/section-3.png" alt="">
                                </div>
                            </div>
                        </div>
                    </section>
                    <section class="section-latest-news mt-5 mb-5 px-5 py-3">
                        <div class="container">
                            <h2 style="font-size: 1.75rem" class="hero-title">
                                Bài viết mới nhất
                            </h2>
                            <div class="slider-panel-latest-new position-relative">
                                <div id="prev-slider" class="cursor-pointer position-absolute arrow-slide arrow-slide-left">
                                    <svg style="color: #2C4A9F" xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-chevron-compact-left" viewBox="0 0 16 16">
                                    <path fill-rule="evenodd" d="M9.224 1.553a.5.5 0 0 1 .223.67L6.56 8l2.888 5.776a.5.5 0 1 1-.894.448l-3-6a.5.5 0 0 1 0-.448l3-6a.5.5 0 0 1 .67-.223z" />
                                    </svg>
                                </div>
                                <div id="next-slider" class="cursor-pointer position-absolute arrow-slide arrow-slide-right">
                                    <svg style="color: #2C4A9F" xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-chevron-compact-right" viewBox="0 0 16 16">
                                    <path fill-rule="evenodd" d="M6.776 1.553a.5.5 0 0 1 .671.223l3 6a.5.5 0 0 1 0 .448l-3 6a.5.5 0 1 1-.894-.448L9.44 8 6.553 2.224a.5.5 0 0 1 .223-.671z" />
                                    </svg>
                                </div>
                                <div class="owl-carousel owl-theme owl-loaded owl-carousel-latest-news">
                                    <div class="owl-stage-outer">
                                        <div class="owl-stage">
                                            <div class="owl-item">
                                                <div class="card card-item">
                                                    <a target="_blank" href="#">
                                                        <img class="card-img-top" src="https://www.testcenter.vn/blog/wp-content/uploads/2021/06/pexels-ron-lach-8681900.jpg" alt="Đề test kỹ năng tin học văn phòng toàn diện cho nhà quản lý">
                                                    </a>
                                                    <div class="card-body">
                                                        <h3 class="card-title">
                                                            <a target="_blank" href="#">Đề test kỹ năng tin học văn phòng toàn diện cho nhà quản lý</a>
                                                        </h3>
                                                        <div class="more text-center">
                                                            <div class="button-more">
                                                                <a target="_blank" style="color: #fff" href="#" class="btn btn-primary border-0 font-weight-normal">
                                                                    Đọc thêm
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="owl-item">
                                                <div class="card card-item">
                                                    <a target="_blank" href="#">
                                                        <img class="card-img-top" src="https://www.testcenter.vn/blog/wp-content/uploads/2021/06/pexels-pew-nguyen-239548.jpg" alt="DISC là gì? Cách ứng dụng trắc nghiệm DISC trong tuyển dụng">
                                                    </a>
                                                    <div class="card-body">
                                                        <h3 class="card-title">
                                                            <a target="_blank" href="#">DISC là gì? Cách ứng dụng trắc nghiệm DISC trong tuyển dụng</a>
                                                        </h3>
                                                        <div class="more text-center">
                                                            <div class="button-more">
                                                                <a target="_blank" style="color: #fff" href="#" class="btn btn-primary border-0 font-weight-normal">
                                                                    Đọc thêm
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="owl-item">
                                                <div class="card card-item">
                                                    <a target="_blank" href="#">
                                                        <img class="card-img-top" src="https://www.testcenter.vn/blog/wp-content/uploads/2021/06/pexels-firmbeecom-6963740.jpg" alt="Tầm quan trọng của các bài test excel tuyển dụng nhân sự">
                                                    </a>
                                                    <div class="card-body">
                                                        <h3 class="card-title">
                                                            <a target="_blank" href="#">Tầm quan trọng của các bài test excel tuyển dụng nhân sự</a>
                                                        </h3>
                                                        <div class="more text-center">
                                                            <div class="button-more">
                                                                <a target="_blank" style="color: #fff" href="#" class="btn btn-primary border-0 font-weight-normal">
                                                                    Đọc thêm
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="owl-item">
                                                <div class="card card-item">
                                                    <a target="_blank" href="#">
                                                        <img class="card-img-top" src="https://www.testcenter.vn/blog/wp-content/uploads/2021/06/pexels-vojtech-okenka-392018.jpg" alt="Các kỹ năng tin học văn phòng cơ bản cần có của ứng viên">
                                                    </a>
                                                    <div class="card-body">
                                                        <h3 class="card-title">
                                                            <a target="_blank" href="#">Các kỹ năng tin học văn phòng cơ bản cần có của ứng viên</a>
                                                        </h3>
                                                        <div class="more text-center">
                                                            <div class="button-more">
                                                                <a target="_blank" style="color: #fff" href="#" class="btn btn-primary border-0 font-weight-normal">
                                                                    Đọc thêm
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>

                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content lead-modal">
                            <div class="mb-4">
                                <h5 class="modal-title text-center" id="exampleModalLabel">Liên hệ tư vấn</h5>
                                <div class="text-center secondary-color">
                                    0967-778-018
                                </div>
                            </div>
                            <button type="button" class="close modal-close-button" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                            <div>
                                <form>
                                    <div class="form-group">
                                        <input id="fullname" placeholder="Họ tên" type="text" class="form-control modal-input">
                                    </div>
                                    <div class="form-group">
                                        <input id="email" placeholder="Email" type="text" class="form-control modal-input">
                                    </div>
                                    <div class="form-group">
                                        <input id="phone" placeholder="Số điện thoại" type="text" class="form-control modal-input">
                                    </div>
                                    <div class="form-group">
                                        <input id="company" placeholder="Tên công ty" type="text" class="form-control modal-input">
                                    </div>
                                    <div class="form-group">
                                        <select id="position" class="form-control modal-input" placehoder="Vị trí công việc">
                                            <option value="CEO / Founder / Chủ tịch">CEO / Founder / Chủ tịch</option>
                                            <option value="Giám đốc (CFO, CTO, GĐ Nhân sự, VP)">Giám đốc (CFO, CTO, GĐ Nhân sự, VP)</option>
                                            <option value="Quản lý (manager)">Quản lý (manager)</option>
                                            <option value="Nhân viên (staff)">Nhân viên (staff)</option>
                                            <option value="Học sinh / sinh viên (student)">Học sinh / sinh viên (student)</option>
                                            <option value="Vị trí khác (other)">Vị trí khác (other)</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <select id="company_size" class="form-control modal-input" placehoder=">Quy mô nhân sự">
                                            <option value="Dưới 10 nhân viên">Dưới 10 nhân viên</option>
                                            <option value="10 - 25 nhân viên">10 - 25 nhân viên</option>
                                            <option value="26 - 49 nhân viên">26 - 49 nhân viên</option>
                                            <option value="50 - 99 nhân viên">50 - 99 nhân viên</option>
                                            <option value="100 - 500 nhân viên">100 - 500 nhân viên</option>
                                            <option value="Trên 500 nhân viên">Trên 500 nhân viên</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <select class="form-control modal-input" id="provinces">
                                            <option value="An Giang">An Giang</option>
                                            <option value="Bà Rịa - Vũng Tàu">Bà Rịa - Vũng Tàu</option>
                                            <option value="Bắc Giang">Bắc Giang</option>
                                            <option value="Bắc Kạn">Bắc Kạn</option>
                                            <option value="Bạc Liêu">Bạc Liêu</option>
                                            <option value="Bắc Ninh">Bắc Ninh</option>
                                            <option value="Bến Tre">Bến Tre</option>
                                            <option value="Bình Định">Bình Định</option>
                                            <option value="Bình Dương">Bình Dương</option>
                                            <option value="Bình Phước">Bình Phước</option>
                                            <option value="Bình Thuận">Bình Thuận</option>
                                            <option value="Cà Mau">Cà Mau</option>
                                            <option value="Cần Thơ">Cần Thơ</option>
                                            <option value="Cao Bằng">Cao Bằng</option>
                                            <option value="Đà Nẵng">Đà Nẵng</option>
                                            <option value="Đắk Lắk">Đắk Lắk</option>
                                            <option value="Đắk Nông">Đắk Nông</option>
                                            <option value="Điện Biên">Điện Biên</option>
                                            <option value="Đồng Nai">Đồng Nai</option>
                                            <option value="Đồng Tháp">Đồng Tháp</option>
                                            <option value="Gia Lai">Gia Lai</option>
                                            <option value="Hà Giang">Hà Giang</option>
                                            <option value="Hà Nam">Hà Nam</option>
                                            <option value="Hà Nội">Hà Nội</option>
                                            <option value="Hà Tĩnh">Hà Tĩnh</option>
                                            <option value="Hải Dương">Hải Dương</option>
                                            <option value="Hải Phòng">Hải Phòng</option>
                                            <option value="Hậu Giang">Hậu Giang</option>
                                            <option value="Hòa Bình">Hòa Bình</option>
                                            <option value="Hưng Yên">Hưng Yên</option>
                                            <option value="Khánh Hòa">Khánh Hòa</option>
                                            <option value="Kiên Giang">Kiên Giang</option>
                                            <option value="Kon Tum">Kon Tum</option>
                                            <option value="Lai Châu">Lai Châu</option>
                                            <option value="Lâm Đồng">Lâm Đồng</option>
                                            <option value="Lạng Sơn">Lạng Sơn</option>
                                            <option value="Lào Cai">Lào Cai</option>
                                            <option value="Long An">Long An</option>
                                            <option value="Nam Định">Nam Định</option>
                                            <option value="Nghệ An">Nghệ An</option>
                                            <option value="Ninh Bình">Ninh Bình</option>
                                            <option value="Ninh Thuận">Ninh Thuận</option>
                                            <option value="Phú Thọ">Phú Thọ</option>
                                            <option value="Phú Yên">Phú Yên</option>
                                            <option value="Quảng Bình">Quảng Bình</option>
                                            <option value="Quảng Nam">Quảng Nam</option>
                                            <option value="Quảng Ngãi">Quảng Ngãi</option>
                                            <option value="Quảng Ninh">Quảng Ninh</option>
                                            <option value="Quảng Trị">Quảng Trị</option>
                                            <option value="Sóc Trăng">Sóc Trăng</option>
                                            <option value="Sơn La">Sơn La</option>
                                            <option value="Tây Ninh">Tây Ninh</option>
                                            <option value="Thái Bình">Thái Bình</option>
                                            <option value="Thái Nguyên">Thái Nguyên</option>
                                            <option value="Thanh Hóa">Thanh Hóa</option>
                                            <option value="Thừa Thiên Huế">Thừa Thiên Huế</option>
                                            <option value="Tiền Giang">Tiền Giang</option>
                                            <option value="Thành phố Hồ Chí Minh">Thành phố Hồ Chí Minh</option>
                                            <option value="Trà Vinh">Trà Vinh</option>
                                            <option value="Tuyên Quang">Tuyên Quang</option>
                                            <option value="Vĩnh Long">Vĩnh Long</option>
                                            <option value="Vĩnh Phúc">Vĩnh Phúc</option>
                                            <option value="Yên Bái">Yên Bái</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-md-12">
                                            <div class="g-recaptcha" data-sitekey="6LcOyukZAAAAADCyhWi_CQQ-QfN4hMGyGHuNM9or" style="width: 310px; margin: 0 auto;"></div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="d-flex justify-content-end">
                                <button data-dismiss="modal" onclick="submitForm()" type="button" class="btn page-btn small-btn text-white bg-main modal-button">Gửi</button>
                            </div>
                        </div>
                    </div>
                </div>
                <script>
                    $.ajaxSetup({
                        headers: {
                            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                        }
                    });

                    function submitForm() {
                        let name = $('#fullname').val();
                        let leadData = {
                            fullname: $('#fullname').val(),
                            email: $('#email').val(),
                            phone: $('#phone').val(),
                            company: $('#company').val(),
                            position: $('#position').val(),
                            company_size: $('#company_size').val(),
                            fullname: $('#fullname').val(),
                            location: $('#provinces').val(),
                        };

                        $.ajax({
                            url: "https://www.testcenter.vn/lead",
                            data: {
                                data: leadData,
                                'g-recaptcha-response': $('#g-recaptcha-response').val(),
                            },
                            type: 'post',
                            dataType: 'json',
                            beforeSend: function () {
                                console.log('saving...');
                            },
                            success: function (response) {
                                gtag('event', 'NewLead');
                                gtag('event', 'NewLeadGG', {'send_to': 'AW-823531084/24ObCIvr4t0BEMys2IgD'});
                                console.log('response', response);
                                if (response.success) {
                                    toastr.success('Đăng ký thành công, chúng tôi sẽ sớm liên hệ cho bạn');
                                } else {
                                    toastr.error(response.message || 'Đã xảy ra lỗi, vui lòng thử lại sau');
                                }
                            },
                            error: function (error) {
                                console.log('failed!', error);
                            }
                        });
                    }
                </script>
                <div class="modal fade" id="gift-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content gift-modal" style="position: relative">
                            <img style="max-width: 100%;
                                 height: auto;" src="https://www.testcenter.vn/blog/wp-content/uploads/2020/12/unnamed.png">
                            <a style="position: absolute;
                               width:100%;
                               height:100%" href="https://forms.gle/AouErjkKycnXCVvs7" target="_blank">
                            </a>
                            <button type="button" class="close modal-close-button" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                    </div>
                </div>

                <div class="footer bg-primary">
                    <div class="container p-5">
                        <div class="row">
                            <div class="col-lg-3 col-md-12 col-sm-12 pr-5 mb-4">
                                
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-12">
                                <h2 style="margin-bottom: 15px" class="text-white font-weight-bold font-size-16">GIẢI PHÁP CHO DOANH NGHIỆP</h2>
                                <p>
                                    <a target="_blank" href="#" class="text-sm text-light link-item">
                                        Tạo tài khoản miễn phí
                                    </a>
                                </p>
                                <p>
                                    <a target="_blank" href="#" class="text-sm text-light link-item">
                                        Công cụ tạo bài test online
                                    </a>
                                </p>
                                <p>
                                    <a target="_blank" href="#" class="text-sm text-light link-item">
                                        Ngân hàng đề thi mẫu đa dạng
                                    </a>
                                </p>
                                <p>
                                    <a target="_blank" href="#" class="text-sm text-light link-item">
                                        Đánh giá năng lực nhân sự
                                    </a>
                                </p>
                                <p>
                                    <a target="_blank" href="#" class="text-sm text-light link-item">
                                        Đào tạo nhân sự hiệu quả
                                    </a>
                                </p>
                                <p>
                                    <a target="_blank" href="#" class="text-sm text-light link-item">
                                        Giảm tỉ lệ tuyển dụng sai người
                                    </a>
                                </p>
                            </div>
                            <div class="col-lg-3 col-md-4 col-sm-12">
                                <h2 style="margin-bottom: 15px;" class="text-white font-weight-bold font-size-16">VỀ HRMANAGEMENT</h2>
                                <p>
                                    <a href="#" class="text-sm text-light link-item" target="_blank">Giới thiệu</a>
                                </p>
                                <p>
                                    <a href="/dieu-khoan-su-dung" class="text-sm text-light link-item" target="_blank"> Điều khoản sử dụng</a>
                                </p>
                                <p>
                                    <a href="/chinh-sach-bao-mat" class="text-sm text-light link-item" target="_blank">Chính sách bảo mật</a>
                                </p>
                                <div class="list-social-network">
                                    <a target="_blank" href="https://www.facebook.com/testcentervn"><img alt="facebook" class="social-network-icon" src="https://www.testcenter.vn/images/icons/facebook.png" alt=""></a>
                                    <a target="_blank" href="https://twitter.com/testcenter13"><img alt="twitter" class="social-network-icon" src="https://www.testcenter.vn/images/icons/twitter.png" alt=""></a>
                                    <a target="_blank" href="https://www.linkedin.com/in/testcenter-topcv-622191202/"><img alt="linkedin" class="social-network-icon" src="https://www.testcenter.vn/images/icons/linkedin.png" alt=""></a>
                                </div>
                            </div>
                            <div class="col-lg-2 col-md-4 col-sm-12">
                                <a href="tel://0967778018" class="btn btn-warning rounded border-0 px-3 pr-5">
                                    <p class="mb-1 text-left text-dark">Hotline tư vấn</p>
                                    <h4 class="text-large text-dark">0967778018</h4>
                                </a>
                                <p class="noselect text-light text-sm mt-3">@HrManagement.vn 2021</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <script>
                $(document).ready(function () {
                    var owl = $('.owl-carousel-latest-news');
                    owl.owlCarousel({
                        loop: true,
                        mouseDrag: true,
                        touchDrag: true,
                        dots: true,
                        autoplay: true,
                        autoplayTimeout: 5000,
                        autoplayHoverPause: true,
                        responsive: {
                            0: {
                                items: 1
                            },
                            600: {
                                items: 2
                            },
                            1000: {
                                items: 4
                            }
                        }
                    });
                    $('#next-slider').click(function () {
                        owl.trigger('next.owl.carousel', [300]);
                    })
                    $('#prev-slider').click(function () {
                        owl.trigger('prev.owl.carousel', [300]);
                    })

                    $('#desc-wrong-hr .slider-item-title, #online-test-system .slider-item-title').removeClass('col-7')
                    $('#desc-wrong-hr .slider-item-title').addClass('col-5')
                    $('#online-test-system .slider-item-title').addClass('col-6')
                    $('#desc-wrong-hr .image-block, #online-test-system .image-block').removeClass('col-5')
                    $('#desc-wrong-hr .image-block').addClass('col-7')
                    $('#online-test-system .image-block').addClass('col-6')
                });
            </script>
        </div>
        <script>
            const changeSegmentImage = (el) => {
                const imageDemo = document.getElementById('img-segment-demo');
                const imageValue = el.getAttribute('img');
                removeAllClasses('segment-item', 'active');
                el.classList.add('active');
                imageDemo.classList.remove('slide-animation');
                setTimeout(() => {
                    imageDemo.classList.add('slide-animation');
                });
                imageDemo.style.backgroundImage = `url(${imageValue})`;
            }

            const removeAllClasses = (className, classRemoved) => {
                const elements = document.getElementsByClassName(className);
                for (let element of elements) {
                    element.classList.remove(classRemoved);
                }
            }

            const bootstrapElements = () => {
                /**
                 * Load segment demo image
                 */
                const imageDemo = document.getElementById('img-segment-demo');
                const segmentImages = document.getElementsByClassName('segment-item');
                if (segmentImages.length > 0) {
                    imageDemo.style.backgroundImage = `url(${segmentImages[0].getAttribute('img')})`;
                }
                /**
                 * Load slider images
                 */
                let stagePadding = 350;
                const screenWidth = document.body.offsetWidth;
                if (screenWidth > 1000 && screenWidth <= 1500) {
                    stagePadding = 180;
                }
                if (screenWidth > 800 && screenWidth <= 1000) {
                    stagePadding = 60;
                }
                if (screenWidth <= 800) {
                    if (screenWidth > 400 && screenWidth <= 800) {
                        stagePadding = 10;
                    }
                    if (screenWidth <= 400) {
                        stagePadding = 0;
                        let sliderItem = document.getElementsByClassName('slider-item');
                        for (let slider of sliderItem) {
                            slider.style.borderRadius = '0px';
                            document.getElementById('slider-image').style.borderRadius = '0px';
                        }
                    }
                    document.getElementById('trigger-prev-slider').style.left = '10px';
                    document.getElementById('trigger-prev-slider').style.opacity = '.3';
                    document.getElementById('trigger-next-slider').style.right = '10px';
                    document.getElementById('trigger-next-slider').style.opacity = '.3';
                }
                $('.owl-carousel-banner').owlCarousel({
                    stagePadding,
                    loop: true,
                    margin: 10,
                    autoplay: false,
                    autoplayTimeout: 5000,
                    autoplayHoverPause: true,
                    responsive: {
                        0: {
                            items: 1
                        },
                        600: {
                            items: 1
                        },
                        1000: {
                            items: 1
                        }
                    }
                });
            }

            const owlHandler = {
                dots: document.getElementsByClassName('owl-dot'),
                prevPage() {
                    const currentDotIndex = this.currentDotIndex();
                    let triggerDot = currentDotIndex == 0 ? this.dots.length - 1 : currentDotIndex - 1;
                    this.dots[triggerDot].click();
                },
                nextPage() {
                    const currentDotIndex = this.currentDotIndex();
                    let triggerDot = currentDotIndex < this.dots.length - 1 ? +currentDotIndex + 1 : 0;
                    this.dots[triggerDot].click();
                },
                currentDotIndex() {
                    const dots = this.dots;
                    let currentDotIndex = 0;
                    for (let i in dots) {
                        if (dots[i].classList.contains('active')) {
                            currentDotIndex = i;
                            break;
                        }
                    }
                    return currentDotIndex;
                }
            }

            bootstrapElements();

        </script>
    </body>
</html>


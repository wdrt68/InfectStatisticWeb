<!DOCTYPE html>

<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html lang="zh-CN">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>疫情服务</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:400,400i,700,700i,600,600i">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.10.0/baguetteBox.min.css">
    <link rel="stylesheet" href="assets/css/smoothproducts.css">
</head>

<body>
    <nav class="navbar navbar-light navbar-expand-lg fixed-top bg-white clean-navbar">
        <div class="container"><a class="navbar-brand logo" href="#">某次疫情统计数据展示</a><button data-toggle="collapse" class="navbar-toggler" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse"
                id="navcol-1">
                <ul class="nav navbar-nav ml-auto">
                    <li class="nav-item" role="presentation"><a class="nav-link" href="indexServlet">疫情动态</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="map.jsp">迁移地图</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link active" href="service.jsp">疫情服务</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="current.jsp">实时播报</a></li>
                    <li class="nav-item" role="presentation"></li>
                </ul>
            </div>
        </div>
    </nav>
    <main class="page pricing-table-page">
        <section class="clean-block clean-pricing dark">
            <div class="container">
                <div class="block-heading">
                    <h2 class="text-info">爱心捐赠</h2>
                    <div class="row">
                        <div class="col-4"><img class="border rounded" style="width: 300px;height: 200px;"></div>
                        <div class="col-4"><img class="border rounded" style="width: 300px;height: 200px;"></div>
                        <div class="col-4"><img class="border rounded" style="width: 300px;height: 200px;"></div>
                    </div>
                </div>
                <div class="block-heading">
                    <h2 class="text-info">防疫手册</h2>
                    <div class="row">
                        <div class="col-1">
                            <p></p>
                        </div>
                        <div class="col-5"><img style="width: 300px;height: 200px;">
                            <h3 class="booklet">返程返工</h3>
                        </div>
                        <div class="col-5"><img style="width: 300px;height: 200px;">
                            <h3 class="booklet">家庭防护</h3>
                        </div>
                        <div class="col-1">
                            <p></p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-1">
                            <p></p>
                        </div>
                        <div class="col-5"><img style="width: 300px;height: 200px;">
                            <h3 class="booklet">体温监测</h3>
                        </div>
                        <div class="col-5"><img style="width: 300px;height: 200px;">
                            <h3 class="booklet">心里调节</h3>
                        </div>
                        <div class="col-1">
                            <p></p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
    <footer class="page-footer light">
        <div class="container">
            <div class="row">
                <div class="col-sm-3">
                    <h5>Get started</h5>
                    <ul>
                        <li><a href="#">Home</a></li>
                        <li><a href="#">Sign up</a></li>
                        <li><a href="#">Downloads</a></li>
                    </ul>
                </div>
                <div class="col-sm-3">
                    <h5>About us</h5>
                    <ul>
                        <li><a href="#">Company Information</a></li>
                        <li><a href="#">Contact us</a></li>
                        <li><a href="#">Reviews</a></li>
                    </ul>
                </div>
                <div class="col-sm-3">
                    <h5>Support</h5>
                    <ul>
                        <li><a href="#">FAQ</a></li>
                        <li><a href="#">Help desk</a></li>
                        <li><a href="#">Forums</a></li>
                    </ul>
                </div>
                <div class="col-sm-3">
                    <h5>Legal</h5>
                    <ul>
                        <li><a href="#">Terms of Service</a></li>
                        <li><a href="#">Terms of Use</a></li>
                        <li><a href="#">Privacy Policy</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="footer-copyright">
            <p>© 221701218 221701220 第二次结对作业</p>
        </div>
    </footer>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.10.0/baguetteBox.min.js"></script>
    <script src="assets/js/smoothproducts.min.js"></script>
    <script src="assets/js/theme.js"></script>
</body>

</html>
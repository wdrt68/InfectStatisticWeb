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
                    <li class="nav-item" role="presentation"><a class="nav-link active" href="service.jsp">疫情服务</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="live.jsp">疫情直播</a></li>
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
                        <div class="col-4"><img id="hanhong" src="assets/img/local/hanhong.svg" class="border rounded" style="width: 300px;height: 200px;"></div>
                        <div class="col-4"><img id="hubeired" src="assets/img/local/hubeired.svg" class="border rounded" style="width: 300px;height: 200px;"></div>
                        <div class="col-4"><img id="chinared" src="assets/img/local/chinared.svg"class="border rounded" style="width: 300px;height: 200px;"></div>
                    </div>
                </div>
                <div class="block-heading">
                    <h2 class="text-info">防疫手册</h2>
                    <div class="row">
                        <div class="col-1">
                            <p></p>
                        </div>
                        <div class="col-5"><img id="backwork" src="assets/img/local/backwork.svg" style="width: 300px;height: 200px;">
                            <h4 class="booklet">返程返工</h4>
                        </div>
                        <div class="col-5"><img id="family" src="assets/img/local/family.svg" style="width: 300px;height: 200px;">
                            <h4 class="booklet">家庭防护</h4>
                        </div>
                        <div class="col-1">
                            <p></p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-1">
                            <p></p>
                        </div>
                        <div class="col-5"><img id="temperature" src="assets/img/local/temperature.svg" style="width: 300px;height: 200px;">
                            <h4 class="booklet">体温监测</h4>
                        </div>
                        <div class="col-5"><img id="mental" src="assets/img/local/mental.svg" style="width: 300px;height: 200px;">
                            <h4 class="booklet">心里调节</h4>
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
        <div class="footer-copyright">
            <p>© 221701218 221701220 第二次结对作业</p>
        </div>
    </footer>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.10.0/baguetteBox.min.js"></script>
    <script src="assets/js/smoothproducts.min.js"></script>
    <script src="assets/js/theme.js"></script>
    <script src="assets/js/service.js"></script>
</body>

</html>
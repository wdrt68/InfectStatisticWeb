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
    <title>省份详情</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:400,400i,700,700i,600,600i">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.10.0/baguetteBox.min.css">
    <link rel="stylesheet" href="assets/css/smoothproducts.css">
    <link rel="stylesheet" href="assets/css/tabs.css"/>
    
    <script src="assets/js/echarts.min.js"></script>
	<script src="assets/js/china.js" ></script>
    
</head>

<body>
    <nav class="navbar navbar-light navbar-expand-lg fixed-top bg-white clean-navbar">
        <div class="container"><a class="navbar-brand logo" href="#">某次疫情统计数据展示</a><button data-toggle="collapse" class="navbar-toggler" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse"
                id="navcol-1">
                <ul class="nav navbar-nav ml-auto">
                    <li class="nav-item" role="presentation"><a class="nav-link" href="indexServlet">疫情动态</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="map.jsp">迁移地图</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="service.jsp">疫情服务</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="current.jsp">实时播报</a></li>
                    <li class="nav-item" role="presentation"></li>
                </ul>
            </div>
        </div>
    </nav>
    <main class="page landing-page">
        <section class="clean-block clean-info dark">
            <div class="container">
                <div class="block-heading">
                    <h2 class="text-info"><%=request.getAttribute("name") %>疫情数据一览</h2>
                    <div class="row" id="dateRow">
                        <div class="col-8">
                            <p></p>
                        </div>
                        <div class="col-4"><strong class="text-left" id="datechoose">选择日期：</strong><input id="dataDate" type="date"></div>
                    </div>
                    <div class="row" id="seconedRow">
                        <div class="col-4"><strong>累计确诊</strong>
                            <p class="text-danger dataLabel" id="ip"><%=request.getAttribute("ip") %></p>
                            <p>较昨日&nbsp;</p>
                            <%
                            	if(request.getAttribute("n_ip") != null) { 
	                            	int n_ip = (int)request.getAttribute("n_ip");
	                            	request.setAttribute("n_ip", n_ip >= 0 ? "+"+n_ip : n_ip);
                            	}
                            %>
                            <p class="text-danger n_dataLabel"><%=request.getAttribute("n_ip") %></p>
                        </div>
                        <div class="col-4"><strong>累计治愈</strong>
                            <p class="text-success dataLabel" id="cure"><%=request.getAttribute("cure") %></p>
                            <p>较昨日&nbsp;</p>
                            <%
                            	if(request.getAttribute("n_cure") != null) { 
	                            	int n_cure = (int)request.getAttribute("n_cure");
	                            	request.setAttribute("n_cure", n_cure >= 0 ? "+"+n_cure : n_cure);
                            	}
                            %>
                            <p class="text-success n_dataLabel"><%=request.getAttribute("n_cure") %></p>
                        </div>
                        <div class="col-4"><strong>累计死亡</strong>
                            <p class="text-dark dataLabel" id="dead"><%=request.getAttribute("dead") %></p>
                            <p>较昨日&nbsp;</p>
                            <%
                            	if(request.getAttribute("n_dead") != null) { 
	                            	int n_dead = (int)request.getAttribute("n_dead");
	                            	request.setAttribute("n_dead", n_dead >= 0 ? "+"+n_dead : n_dead);
                            	}
                            %>
                            <p class="text-dark n_dataLabel"><%=request.getAttribute("n_dead") %></p>
                        </div>
                    </div>
                    <h2 class="text-info"><%=request.getAttribute("name") %>疫情走势图</h2>
                    <p>数据纯属虚构，仅供作业展示使用</p>
                    <p>The data is unreal which is used for homework display only.</p>
                    <div id="mapArea">
	                    <div class="showed" id="map1" style="height: 600px;width: 800px;">
	                    </div>
	                    <div id="map2" style="height: 600px;width: 800px;">
	                    </div>
	                    <div id="map3" style="height: 600px;width: 800px;">
	                    </div>
                    </div>
                    <div id="buttons" class="btn-group btn-group-lg border-dark" role="group">
	                    <button class="btn btn-primary border-dark" type="button">新增确诊<br/>走势</button>
	                    <button class="btn btn-primary border-dark" type="button">累计确诊<br/>走势</button>
	                    <button class="btn btn-primary border-dark" type="button">治愈/死亡<br/>走势</button>
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
    <script src="assets/js/detialevents.js"></script>
    <script src="assets/js/tabs.js"></script>
</body>

</html>
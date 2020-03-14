<!DOCTYPE html>

<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix='fmt' %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html lang="zh-CN">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>某次疫情统计</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat:400,400i,700,700i,600,600i">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.10.0/baguetteBox.min.css">
    <link rel="stylesheet" href="assets/css/smoothproducts.css">
    
    <script src="assets/js/echarts.min.js"></script>
	<script src="assets/js/china.js" ></script>
	
</head>

<body style="background-color : skyblue;">
    <nav class="navbar navbar-light navbar-expand-lg fixed-top bg-white clean-navbar">
        <div class="container"><a class="navbar-brand logo" href="#">某次疫情统计数据展示</a><button data-toggle="collapse" class="navbar-toggler" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse"
                id="navcol-1">
                <ul class="nav navbar-nav ml-auto">
                    <li class="nav-item" role="presentation"><a class="nav-link active" href="indexServlet">疫情动态</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="service.jsp">疫情服务</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="live.jsp">疫情直播</a></li>
                    <li class="nav-item" role="presentation"></li>
                </ul>
            </div>
        </div>
    </nav>
    <main class="page landing-page">
        <section class="clean-block clean-info dark">
            <div class="container">
                <div class="block-heading">
                    <h2 class="text-info">全国疫情数据一览</h2>
                    <div class="row" id="dateRow">
                        <div class="col-8">
                            <p></p>
                        </div>
                        <div class="col-4"><strong class="text-left" id="datechoose">选择日期：</strong><input id="dataDate" type="date"></div>
                    </div>
                    <div class="row">
                        <div class="col-1">
                            <p></p>
                        </div>
                        <div class="col-5"><strong>累计确诊</strong>
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
                        <div class="col-5"><strong class="text-center">现有疑似</strong>
                            <p class="text-warning dataLabel" id="sp"><%=request.getAttribute("sp") %></p>
                            <p>较昨日&nbsp;</p>
                            <%
                            	if(request.getAttribute("n_sp") != null) { 
	                            	int n_sp = (int)request.getAttribute("n_sp");
	                            	request.setAttribute("n_sp", n_sp >= 0 ? "+"+n_sp : n_sp);
                            	}
                            %>
                            <p class="text-warning n_dataLabel"><%=request.getAttribute("n_sp") %></p>
                        </div>
                        <div class="col-1">
                            <p></p>
                        </div>
                    </div>
                    <div class="row" id="secondRow">
                        <div class="col-1">
                            <p></p>
                        </div>
                        <div class="col-5"><strong>累计治愈</strong>
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
                        <div class="col-5"><strong>累计死亡</strong>
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
                        <div class="col-1">
                            <p></p>
                        </div>
                    </div>
                    <h2 class="text-info">各省疫情一览图</h2>
                    <p>数据纯属虚构，仅供作业展示使用</p>
                    <p>The data is unreal which is used for homework display only.</p>
                    <div id="map" style="height: 750px;width: 800px;">
                    <% Map<String, Integer> ipMap = (HashMap<String, Integer>)request.getAttribute("ipMap"); %>
                    <script>
                    		var myChart = echarts.init(document.getElementById("map"));
		                    window.dataList = [{
		                        name: "南海诸岛",
		                        value: 0
		                    },
		                    {
		                        name: '北京',
		                        value: <%=ipMap.get("北京") %>
		                    },
		                    {
		                        name: '天津',
		                        value: <%=ipMap.get("天津") %>
		                    },
		                    {
		                        name: '上海',
		                        value: <%=ipMap.get("上海") %>
		                    },
		                    {
		                        name: '重庆',
		                        value: <%=ipMap.get("重庆") %>
		                    },
		                    {
		                        name: '河北',
		                        value: <%=ipMap.get("河北") %>
		                    },
		                    {
		                        name: '河南',
		                        value: <%=ipMap.get("河南") %>
		                    },
		                    {
		                        name: '云南',
		                        value: <%=ipMap.get("云南") %>
		                    },
		                    {
		                        name: '辽宁',
		                        value: <%=ipMap.get("辽宁") %>
		                    },
		                    {
		                        name: '黑龙江',
		                        value: <%=ipMap.get("黑龙江") %>
		                    },
		                    {
		                        name: '湖南',
		                        value: <%=ipMap.get("湖南") %>
		                    },
		                    {
		                        name: '安徽',
		                        value: <%=ipMap.get("安徽") %>
		                    },
		                    {
		                        name: '山东',
		                        value: <%=ipMap.get("山东") %>
		                    },
		                    {
		                        name: '新疆',
		                        value: <%=ipMap.get("新疆") %>
		                    },
		                    {
		                        name: '江苏',
		                        value: <%=ipMap.get("江苏") %>
		                    },
		                    {
		                        name: '浙江',
		                        value: <%=ipMap.get("浙江") %>
		                    },
		                    {
		                        name: '江西',
		                        value: <%=ipMap.get("江西") %>
		                    },
		                    {
		                        name: '湖北',
		                        value: <%=ipMap.get("湖北") %>
		                    },
		                    {
		                        name: '广西',
		                        value: <%=ipMap.get("广西") %>
		                    },
		                    {
		                        name: '甘肃',
		                        value: <%=ipMap.get("甘肃") %>
		                    },
		                    {
		                        name: '山西',
		                        value: <%=ipMap.get("山西") %>
		                    },
		                    {
		                        name: '内蒙古',
		                        value: <%=ipMap.get("内蒙古") %>
		                    },
		                    {
		                        name: '陕西',
		                        value: <%=ipMap.get("陕西") %>
		                    },
		                    {
		                        name: '吉林',
		                        value: <%=ipMap.get("吉林") %>
		                    },
		                    {
		                        name: '福建',
		                        value: <%=ipMap.get("福建") %>
		                    },
		                    {
		                        name: '贵州',
		                        value: <%=ipMap.get("贵州") %>
		                    },
		                    {
		                        name: '广东',
		                        value: <%=ipMap.get("广东") %>
		                    },
		                    {
		                        name: '青海',
		                        value: <%=ipMap.get("青海") %>
		                    },
		                    {
		                        name: '西藏',
		                        value: <%=ipMap.get("西藏") %>
		                    },
		                    {
		                        name: '四川',
		                        value: <%=ipMap.get("四川") %>
		                    },
		                    {
		                        name: '宁夏',
		                        value: <%=ipMap.get("宁夏") %>
		                    },
		                    {
		                        name: '海南',
		                        value: <%=ipMap.get("海南") %>
		                    },
		                    {
		                        name: '台湾',
		                        value: <%=ipMap.get("台湾") %>
		                    },
		                    {
		                        name: '香港',
		                        value: <%=ipMap.get("香港") %>
		                    },
		                    {
		                        name: '澳门',
		                        value: <%=ipMap.get("澳门") %>
		                    }
		                ];
		                option = {
		                    tooltip: {
		                        triggerOn: "mousemove",
		                        
		                    },
		                    visualMap: {
		                        min: 0,
		                        max: 100000,
		                        left: 26,
		                        bottom: 40,
		                        showLabel: !0,
		                        text: ["高", "低"],
		                        pieces: [{
		                            gte: 10000,
		                            label: "> 10000 人",
		                            color: "#660208"
		                        },
		                        {
		                            gte: 1000,
		                            lt: 10000,
		                            label: "1000 - 9999 人",
		                            color: "#8c0d0d"
		                        },
		                        {
		                            gte: 100,
		                            lt: 1000,
		                            label: "100 - 999 人",
		                            color: "#cc2929"
		                        },
		                        {
		                            gte: 10,
		                            lt: 100,
		                            label: "10 - 99 人",
		                            color: "#ff7b69"
		                        }, 
		                        {
		                            gte: 1,
		                            lt: 10,
		                            label: "1 - 9 人",
		                            color: "#ffaa85"
		                        }, 
		                        {
		                            value: 0,
		                            color: "#ffffff"
		                        }],
		                        show: !0
		                    },
		                    geo: {
		                        map: "china",
		                        roam: !1,
		                        scaleLimit: {
		                            min: 1,
		                            max: 2
		                        },
		                        zoom: 1.23,
		                        top: 120,
		                        label: {
		                            normal: {
		                                show: !0,
		                                fontSize: "14",
		                                color: "rgba(0,0,0,0.7)"
		                            }
		                        },
		                        itemStyle: {
		                            normal: {
		                                //shadowBlur: 50,
		                                //shadowColor: 'rgba(0, 0, 0, 0.2)',
		                                borderColor: "rgba(0, 0, 0, 0.2)"
		                            },
		                            emphasis: {
		                                areaColor: "#8cfffb",
		                                shadowOffsetX: 0,
		                                shadowOffsetY: 0,
		                                borderWidth: 0
		                            }
		                        }
		                    },
		                    series: [{
		                        name: "确诊病例",
		                        type: "map",
		                        geoIndex: 0,
		                        data: window.dataList
		                    }]
		                };
		                myChart.setOption(option);
		                myChart.on('click', function (params) {
		                    window.location.href="detialServlet?name=" + params.name;
		                });
                    </script>
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
    <script src="assets/js/indexevents.js"></script>
    
</body>

</html>
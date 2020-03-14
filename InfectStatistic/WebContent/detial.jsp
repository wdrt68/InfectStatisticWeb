<!DOCTYPE html>

<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
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
                    
                    <% List<String> dateStrings = (ArrayList<String>)request.getAttribute("dateStrings"); %>
                    
                    <div id="mapArea">
                    
                    	<button class="btn btn-primary border-dark" type="button">新增确诊 走势</button>
	                    <div id="map1" style="height: 600px;width: 1100px;">
	                    <script>
	                    var myChart1 = echarts.init(document.getElementById("map1"));
                    	option1 = {
                    		    title: {
                    		        text: '现有确诊人数走势图'
                    		    },
                    		    tooltip: {
                    		        trigger: 'axis'
                    		    },
                    		    grid: {
                    		        left: '3%',
                    		        right: '4%',
                    		        bottom: '3%',
                    		        containLabel: true
                    		    },
                    		    xAxis: {
                    		        type: 'category',
                    		        boundaryGap: false,
                    		        data: 
                    		        [
                    		        	<%
                    		        		for(int i=0; i<dateStrings.size(); i++) {
                    		        	%>
                    		        	<%="\'" + dateStrings.get(i) + "\',"%>
                    		        	<%	
                    		        		}
                    		        	%>
                    		        ]
                    		    },
                    		    yAxis: {
                    		        type: 'value'
                    		    },
                    		    series: [
                    		        {
                    		            name: '现有确诊',
                    		            type: 'line',
                    		            smooth: true,
                    		            stack: '总量',
                    		            data: 
                    		            [
	                    		        	<%
	                    		        		List<Integer> cIpList = (ArrayList<Integer>)request.getAttribute("cIpList");
	                    		        		for(int i=0; i<cIpList.size(); i++) {
	                    		        	%>
	                    		        	<%=cIpList.get(i) + ","%>
	                    		        	<%	
	                    		        		}
	                    		        	%>
                    		            ]
                    		        }
                    		    ]
                    		};
                    	myChart1.setOption(option1);
	                    </script>
	                    </div>
	                    
	                    <button class="btn btn-primary border-dark" type="button">累计确诊 走势</button>
	                    <div id="map2" style="height: 600px;width: 1100px;">
	                    <script>
	                    var myChart2 = echarts.init(document.getElementById("map2"));
                    	option2 = {
                    		    title: {
                    		        text: '累计确诊人数走势图'
                    		    },
                    		    tooltip: {
                    		        trigger: 'axis'
                    		    },
                    		    grid: {
                    		        left: '3%',
                    		        right: '4%',
                    		        bottom: '3%',
                    		        containLabel: true
                    		    },
                    		    xAxis: {
                    		        type: 'category',
                    		        boundaryGap: false,
                    		        data: 
                    		        [
                    		        	<%
                    		        		for(int i=0; i<dateStrings.size(); i++) {
                    		        	%>
                    		        	<%="\'" + dateStrings.get(i) + "\',"%>
                    		        	<%	
                    		        		}
                    		        	%>
                    		        ]
                    		    },
                    		    yAxis: {
                    		        type: 'value'
                    		    },
                    		    series: [
                    		        {
                    		            name: '累计确诊',
                    		            type: 'line',
                    		            smooth: true,
                    		            stack: '总量',
                    		            data: 
                    		            [
	                    		        	<%
	                    		        		List<Integer> ipList = (ArrayList<Integer>)request.getAttribute("ipList");
	                    		        		for(int i=0; i<ipList.size(); i++) {
	                    		        	%>
	                    		        	<%=ipList.get(i) + ","%>
	                    		        	<%	
	                    		        		}
	                    		        	%>
                    		            ]
                    		        }
                    		    ]
                    		};
                    	myChart2.setOption(option2);

	                    </script>
	                    </div>
	                    
	                    <button class="btn btn-primary border-dark" type="button">治愈/死亡 走势</button>
	                    <div id="map3" style="height: 600px;width: 1100px;">
	                    <script>
	                    var myChart3 = echarts.init(document.getElementById("map3"));
                    	option3 = {
                    		    title: {
                    		        text: '治愈/死亡人数走势图'
                    		    },
                    		    tooltip: {
                    		        trigger: 'axis'
                    		    },
                    		    grid: {
                    		        left: '3%',
                    		        right: '4%',
                    		        bottom: '3%',
                    		        containLabel: true
                    		    },
                    		    xAxis: {
                    		        type: 'category',
                    		        boundaryGap: false,
                    		        data: 
                    		        [
                    		        	<%
                    		        		for(int i=0; i<dateStrings.size(); i++) {
                    		        	%>
                    		        	<%="\'" + dateStrings.get(i) + "\',"%>
                    		        	<%	
                    		        		}
                    		        	%>
                    		        ]
                    		    },
                    		    yAxis: {
                    		        type: 'value'
                    		    },
                    		    series: [
                    		        {
                    		            name: '累计治愈',
                    		            type: 'line',
                    		            smooth: true,
                    		            data: 
                    		            [
	                    		        	<%
	                    		        		List<Integer> cureList = (ArrayList<Integer>)request.getAttribute("cureList");
	                    		        		for(int i=0; i<cureList.size(); i++) {
	                    		        	%>
	                    		        	<%=cureList.get(i) + ","%>
	                    		        	<%	
	                    		        		}
	                    		        	%>
                    		            ]
                    		        },
                    		        {
                    		            name: '累计死亡',
                    		            type: 'line',
                    		            data: 
                    		            [
	                    		        	<%
	                    		        		List<Integer> deadList = (ArrayList<Integer>)request.getAttribute("deadList");
	                    		        		for(int i=0; i<deadList.size(); i++) {
	                    		        	%>
	                    		        	<%=deadList.get(i) + ","%>
	                    		        	<%	
	                    		        		}
	                    		        	%>
                    		            ]
                    		        }
                    		    ]
                    		};
                    	myChart3.setOption(option3);

	                    </script>
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
    <script src="assets/js/detialevents.js"></script>
</body>

</html>
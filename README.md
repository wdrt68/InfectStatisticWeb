# InfectStatisticWeb
第二次结对作业--疫情统计可视化
结对学号 221701218 221701220

## 作业链接
作业要求：<#>
作业仓库：<#>

## 程序介绍
jsp/servlet + bootstrap + echarts实现的疫情统计可视化的Web应用

#### 功能
* 全国疫情统计数据展示、地图展示
* 具体省份的统计数据展示、疫情走势折线图
  
## 构建运行

#### 所需环境
* mysql数据库
* Tomcat v9.0 Server
* Eclipse for JavaEE

#### 具体步骤
1. Eclipse 新建动态Web项目
2. 下载github仓库中的InfectStatistic.sql，在mysql管理平台中执行以创建数据库
3. 将github仓库中src文件夹、WebContent文件夹下的内容复制到Eclipse项目中
4. 更改src/util/DBUtil中的参数配置，以实现数据库连接
5. 启动Tomcat服务器，浏览器中输入http://localhost:8080/InfectStatisticWeb/indexServlet即可进入疫情动态页面



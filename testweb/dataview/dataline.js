//line
		// 初始化两个数组，盛装从数据库中获取到的数据
		var dates = new Array(), num = new Array();
		//调用ajax来实现异步的加载数据
		function getusers() {
			$.ajax({
				type: "post",
				async: false,
				url: "./dataview/lineecharts.php",
				data: {},
				dataType: "json",
				success: function(result){
				   if(result){
						for(var i = 0; i < result.length; i++){
							dates.push(result[i].dates);
							num.push(result[i].num);
						}    
					}
				},
				error: function(errmsg) {
					alert("Ajax获取服务器数据出错了！"+ errmsg);
				}
			});
			return dates, num;
		}
		function monthDay(){
			for(var i = 0; i < dates.length; i++){
				dates[i] = dates[i].substring(5);
			} 
		}
		//执行异步请求
		getusers();
		monthDay();
	// 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('map'));

    // 指定图表的配置项和数据
    var option = {
    	title: {
    		text: '新增确诊趋势'
    	},
    	tooltip: {},
    	legend: {
    		data: ['新增趋势']
    	},
    	xAxis: {
			axisLabel: {  
			   interval:0,  
			   rotate:40,  
			   textStyle: {
			        color: '#000000',
			        fontSize:'16'
			    }
			},  
    		data: dates
    	},
    	yAxis: {},
    	series: [{
    		name: '新增确诊',
    		type: 'line',
			smooth: true,
    		data: num
    	}]
    };

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);


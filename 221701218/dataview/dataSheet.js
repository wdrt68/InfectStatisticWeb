//line
		// 初始化两个数组，盛装从数据库中获取到的数据
		var dates = new Array(), num = new Array();
		var mProvince = new Array(),mDate = new Array(),mNum = new Array();
		//调用ajax来实现异步的加载数据
		function getusers() {
			$.ajax({
				type: "post",
				async: false,
				url: "./dataIndex.php",
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
		//执行异步请求
		getusers();
	// 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));

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
			   rotate:40  
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


//map

function mapGetusers() {
			$.ajax({
				type: "post",
				async: false,
				url: "./mapIndex.php",
				data: {},
				dataType: "json",
				success: function(result){
				   if(result){
						for(var i = 0; i < result.length; i++){
							mProvince.push(result[i].province);
							mDate.push(result[i].dates);
							mNum.push(result[i].num);
						}    
					}
				},
				error: function(errmsg) {
					alert("Ajax获取服务器数据出错了！"+ errmsg);
				}
			});
			//return dates, num;
			return true;
		}
mapGetusers();
	//到此 如何把数据库取出的值循环赋值成一个键值对
		var dataList = new Array();
		for(var i = 0; i < mProvince.length; i++){
			var t = {name:mProvince[i],value:mNum[i]};
			dataList.push(t);
		} 
		var t = {name:"南海诸岛",value:0};
		dataList.push(t);
        /*var dataList=[
            {name:"南海诸岛",value:0},
            {name: '北京', value: randomValue()},
            {name: '天津', value: randomValue()},
            {name: '上海', value: randomValue()},
            {name: '重庆', value: randomValue()},
            {name: '河北', value: randomValue()},
            {name: '河南', value: randomValue()},
            {name: '云南', value: randomValue()},
            {name: '辽宁', value: randomValue()},
            {name: '黑龙江', value: randomValue()},
            {name: '湖南', value: randomValue()},
            {name: '安徽', value: randomValue()},
            {name: '山东', value: randomValue()},
            {name: '新疆', value: randomValue()},
            {name: '江苏', value: randomValue()},
            {name: '浙江', value: randomValue()},
            {name: '江西', value: randomValue()},
            {name: '湖北', value: randomValue()},
            {name: '广西', value: randomValue()},
            {name: '甘肃', value: randomValue()},
            {name: '山西', value: randomValue()},
            {name: '内蒙古', value: randomValue()},
            {name: '陕西', value: randomValue()},
            {name: '吉林', value: randomValue()},
            {name: '福建', value: randomValue()},
            {name: '贵州', value: randomValue()},
            {name: '广东', value: randomValue()},
            {name: '青海', value: randomValue()},
            {name: '西藏', value: randomValue()},
            {name: '四川', value: randomValue()},
            {name: '宁夏', value: randomValue()},
            {name: '海南', value: randomValue()},
            {name: '台湾', value: randomValue()},
            {name: '香港', value: randomValue()},
            {name: '澳门', value: randomValue()}
        ]*/
        var myChart = echarts.init(document.getElementById('map'));
        function randomValue() {
            return Math.round(Math.random()*1000);
        }
        option = {
            tooltip: {
                    formatter:function(params,ticket, callback){
                        return params.seriesName+'<br />'+params.name+'：'+params.value
                    }//数据格式化
                },
            visualMap: {
                min: 0,
                max: 1500,
                left: 'left',
                top: 'bottom',
                text: ['高','低'],//取值范围的文字
                inRange: {
                    color: ['#ffffff', '#9f0000']//取值范围的颜色
                },
                show:true//图注
            },
            geo: {
                map: 'china',
                roam: false,//不开启缩放和平移
                zoom:1.23,//视角缩放比例
                label: {
                    normal: {
                        show: true,
                        fontSize:'10',
                        color: 'rgba(0,0,0,0.7)'
                    }
                },
                itemStyle: {
                    normal:{
                        borderColor: 'rgba(0, 0, 0, 0.2)'
                    },
                    emphasis:{
                        areaColor: '#F3B329',//鼠标选择区域颜色
                        shadowOffsetX: 0,
                        shadowOffsetY: 0,
                        shadowBlur: 20,
                        borderWidth: 0,
                        shadowColor: 'rgba(0, 0, 0, 0.5)'
                    }
                }
            },
            series : [
                {
                    name: '累计确诊',
                    type: 'map',
                    geoIndex: 0,
                    data:dataList
                }
            ]
        };
        myChart.setOption(option);
        myChart.on('click', function (params) {
            alert(params.name);
        });
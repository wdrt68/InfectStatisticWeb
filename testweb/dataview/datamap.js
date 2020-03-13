//map
var mProvince = new Array(),mDate = new Array(),mNum = new Array();
function mapGetusers() {
			$.ajax({
				type: "post",
				async: false,
				url: "./dataview/mapIndex.php",
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
                    name: '现有确诊',
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
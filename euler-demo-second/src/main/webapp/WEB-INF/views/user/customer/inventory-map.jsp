<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Project Management</title>

<!-- CSS件 -->
<link rel="stylesheet" href="/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/customer/home.css">
<link rel="stylesheet" href="/css/plugins/zenburn.css">

<!-- JS file -->
<script src="http://code.jquery.com/jquery.js"></script>

</head>
<body>
    	<!-- header -->
	<jsp:include page="../common/header.jsp"></jsp:include>
	<!-- content -->
	<div class="container-fluid">
		<div class="row">
			<!-- left -->
			<div class="col-sm-3 col-md-2 sidebar">
				<jsp:include page="../common/home-left.jsp"></jsp:include>
			</div>

			<!-- center content -->
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			    <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
			    <div id="main" style="height:550px"></div>
			    <!-- ECharts单文件引入 -->
			    <script src="/build/dist/echarts.js"></script>
			    <script type="text/javascript">
			        // 路径配置
			        require.config({
			            paths: {
			                echarts: '/build/dist'
			            }
			        });
			        
			        // 使用
			        require(
			            [
			                'echarts',
			                'echarts/chart/map'
			            ],
			            function (ec) {
			                // 基于准备好的dom，初始化echarts图表
			                var myChart = ec.init(document.getElementById('main'),'macarons'); 
			                
			                var option = {
				    title : {
				        text: 'iphone销量',
				        subtext: '纯属虚构',
				        x:'center'
				    },
				    tooltip : {
				        trigger: 'item'
				    },
				    legend: {
				        orient: 'vertical',
				        x:'left',
				        data:['iphone3','iphone4','iphone5']
				    },
				    dataRange: {
				        min: 0,
				        max: 2500,
				        x: 'left',
				        y: 'bottom',
				        text:['高','低'],           // 文本，默认为数值文本
				        calculable : true
				    },
				    toolbox: {
				        show: false,
				        orient : 'vertical',
				        x: 'right',
				        y: 'center',
				        feature : {
				            mark : {show: true},
				            dataView : {show: true, readOnly: false},
				            restore : {show: true},
				            saveAsImage : {show: true}
				        }
				    },
				    roamController: {
				        show: false,
				        x: 'right',
				        mapTypeControl: {
				            'china': true
				        }
				    },
				    series : [
				        {
				            name: 'iphone3',
				            type: 'map',
				            mapType: 'china',
				            roam: false,
				            itemStyle:{
				                normal:{label:{show:true}},
				                emphasis:{label:{show:true}}
				            },
				            data:[
				                {name: '北京',value: Math.round(Math.random()*1000)},
				                {name: '天津',value: Math.round(Math.random()*1000)},
				                {name: '上海',value: Math.round(Math.random()*1000)},
				                {name: '重庆',value: Math.round(Math.random()*1000)},
				                {name: '河北',value: Math.round(Math.random()*1000)},
				                {name: '河南',value: Math.round(Math.random()*1000)},
				                {name: '云南',value: Math.round(Math.random()*1000)},
				                {name: '辽宁',value: Math.round(Math.random()*1000)},
				                {name: '黑龙江',value: Math.round(Math.random()*1000)},
				                {name: '湖南',value: Math.round(Math.random()*1000)},
				                {name: '安徽',value: Math.round(Math.random()*1000)},
				                {name: '山东',value: Math.round(Math.random()*1000)},
				                {name: '新疆',value: Math.round(Math.random()*1000)},
				                {name: '江苏',value: Math.round(Math.random()*1000)},
				                {name: '浙江',value: Math.round(Math.random()*1000)},
				                {name: '江西',value: Math.round(Math.random()*1000)},
				                {name: '湖北',value: Math.round(Math.random()*1000)},
				                {name: '广西',value: Math.round(Math.random()*1000)},
				                {name: '甘肃',value: Math.round(Math.random()*1000)},
				                {name: '山西',value: Math.round(Math.random()*1000)},
				                {name: '内蒙古',value: Math.round(Math.random()*1000)},
				                {name: '陕西',value: Math.round(Math.random()*1000)},
				                {name: '吉林',value: Math.round(Math.random()*1000)},
				                {name: '福建',value: Math.round(Math.random()*1000)},
				                {name: '贵州',value: Math.round(Math.random()*1000)},
				                {name: '广东',value: Math.round(Math.random()*1000)},
				                {name: '青海',value: Math.round(Math.random()*1000)},
				                {name: '西藏',value: Math.round(Math.random()*1000)},
				                {name: '四川',value: Math.round(Math.random()*1000)},
				                {name: '宁夏',value: Math.round(Math.random()*1000)},
				                {name: '海南',value: Math.round(Math.random()*1000)},
				                {name: '台湾',value: Math.round(Math.random()*1000)},
				                {name: '香港',value: Math.round(Math.random()*1000)},
				                {name: '澳门',value: Math.round(Math.random()*1000)}
				            ]
				        },
				        {
				            name: 'iphone4',
				            type: 'map',
				            mapType: 'china',
				            itemStyle:{
				                normal:{label:{show:true}},
				                emphasis:{label:{show:true}}
				            },
				            data:[
				                {name: '北京',value: Math.round(Math.random()*1000)},
				                {name: '天津',value: Math.round(Math.random()*1000)},
				                {name: '上海',value: Math.round(Math.random()*1000)},
				                {name: '重庆',value: Math.round(Math.random()*1000)},
				                {name: '河北',value: Math.round(Math.random()*1000)},
				                {name: '安徽',value: Math.round(Math.random()*1000)},
				                {name: '新疆',value: Math.round(Math.random()*1000)},
				                {name: '浙江',value: Math.round(Math.random()*1000)},
				                {name: '江西',value: Math.round(Math.random()*1000)},
				                {name: '山西',value: Math.round(Math.random()*1000)},
				                {name: '内蒙古',value: Math.round(Math.random()*1000)},
				                {name: '吉林',value: Math.round(Math.random()*1000)},
				                {name: '福建',value: Math.round(Math.random()*1000)},
				                {name: '广东',value: Math.round(Math.random()*1000)},
				                {name: '西藏',value: Math.round(Math.random()*1000)},
				                {name: '四川',value: Math.round(Math.random()*1000)},
				                {name: '宁夏',value: Math.round(Math.random()*1000)},
				                {name: '香港',value: Math.round(Math.random()*1000)},
				                {name: '澳门',value: Math.round(Math.random()*1000)}
				            ]
				        },
				        {
				            name: 'iphone5',
				            type: 'map',
				            mapType: 'china',
				            itemStyle:{
				                normal:{label:{show:true}},
				                emphasis:{label:{show:true}}
				            },
				            data:[
				                {name: '北京',value: Math.round(Math.random()*1000)},
				                {name: '天津',value: Math.round(Math.random()*1000)},
				                {name: '上海',value: Math.round(Math.random()*1000)},
				                {name: '广东',value: Math.round(Math.random()*1000)},
				                {name: '台湾',value: Math.round(Math.random()*1000)},
				                {name: '香港',value: Math.round(Math.random()*1000)},
				                {name: '澳门',value: Math.round(Math.random()*1000)}
				            ]
				        }
				    ]
				};
				              //以下的这段代码主要是用来处理用户的选择，应用场景是可以做地图的交互，比如点击地图上的某一个省，获取相应的省的指标变化等。
				             //需要特别注意的是，如果需要点击某一省作地图的操作交互的话，还需要为series属性的每一项添加一个selectedMode属性，这里的属性值为 'single'即单选，也可多选
				            var ecConfig= require('echarts/config');
				            myChart.on(ecConfig.EVENT.MAP_SELECTED,function (param) {
				                varselected=param.selected;
				               varmapSeries=option.series[0];
				                vardata= [];
				                varlegendData= [];
				                varname;
				                for (varp=0,len=mapSeries.data.length; p<len; p++) {
				                    name=mapSeries.data[p].name;
				                    mapSeries.data[p].selected=selected[name];
				                    if (selected[name]) {
				                        alert(name); //这里只是简单的做一个事例说明，弹出用户所选的省，如需做其他的扩展，可以在这里边添加相应的操作
				 
				                    }
				                }
				            });
			                //窗体自适应    
			 				window.onresize = myChart.resize;
			                // 为echarts对象加载数据 
			                myChart.setOption(option); 
			            }
			        );
			    </script>
				
			</div>
		</div>
	</div>

	<!-- JS file -->
	<script src="/js/plugins/highlight.js"></script>
	<script src="/js/plugins/holder.js"></script>
	<script src="/js/customer/img-holder.js"></script>
    
</body>
</html>
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
			                'echarts/chart/pie'
			            ],
			            function (ec) {
			                // 基于准备好的dom，初始化echarts图表
			                var myChart = ec.init(document.getElementById('main'),'macarons'); 
			                
			                var dataStyle = {
			                	    normal: {
			                	        label: {show:false},
			                	        labelLine: {show:false}
			                	    }
			                	};
			                	var placeHolderStyle = {
			                	    normal : {
			                	        color: 'rgba(0,0,0,0)',
			                	        label: {show:false},
			                	        labelLine: {show:false}
			                	    },
			                	    emphasis : {
			                	        color: 'rgba(0,0,0,0)'
			                	    }
			                	};
			                var option = {
			                	    title: {
			                	        text: '${productName}',
			                	        subtext: '${title}',
			                	        x: 'center',
			                	        y: 'center',
			                	        itemGap: 20,
			                	        textStyle : {
			                	            color : 'rgba(30,144,255,0.8)',
			                	            fontFamily : '微软雅黑',
			                	            fontSize : 30,
			                	            fontWeight : 'bolder'
			                	        }
			                	    },
			                	    tooltip : {
			                	        show: true,
			                	        formatter: "{a} <br/>{b} : {c} ({d}%)"
			                	    },
			                	    legend: {
			                	        orient : 'vertical',
			                	        x : document.getElementById('main').offsetWidth / 2,
			                	        y : 45,
			                	        itemGap:12,
			                	        data:['购买意向: ${purposePer} %','商务洽谈: ${businessPer} %','合同确认: ${subscribePer} %','合同完成: ${completePer} %']
			                	    },
			                	    toolbox: {
			                	        show : true,
			                	        feature : {
			                	            mark : {show: true},
			                	            dataView : {show: true, readOnly: false},
			                	            restore : {show: true},
			                	            saveAsImage : {show: true}
			                	        }
			                	    },
			                	    series : [
			                	        {
			                	            name:'购买意向',
			                	            type:'pie',
			                	            clockWise:false,
			                	            radius : [125, 150],
			                	            itemStyle : dataStyle,
			                	            data:[
			                	                {
			                	                    value:${purposePer},
			                	                    name:'合同数:${purpose},占比:${purposePer} %'
			                	                },
			                	                {
			                	                    value:100 - ${purposePer},
			                	                    name:'invisible',
			                	                    itemStyle : placeHolderStyle
			                	                }
			                	            ]
			                	        },
			                	        {
			                	            name:'商务洽谈',
			                	            type:'pie',
			                	            clockWise:false,
			                	            radius : [100, 125],
			                	            itemStyle : dataStyle,
			                	            data:[
			                	                {
			                	                    value:${businessPer}, 
			                	                    name:'合同数:${business},占比:${businessPer} %'
			                	                },
			                	                {
			                	                    value:100 - ${businessPer},
			                	                    name:'invisible',
			                	                    itemStyle : placeHolderStyle
			                	                }
			                	            ]
			                	        },
			                	        {
			                	            name:'合同确认',
			                	            type:'pie',
			                	            clockWise:false,
			                	            radius : [75, 100],
			                	            itemStyle : dataStyle,
			                	            data:[
			                	                {
			                	                    value:${subscribePer}, 
			                	                    name:'合同数:${subscribe},占比:${subscribePer} %'
			                	                },
			                	                {
			                	                    value:100 - ${subscribePer},
			                	                    name:'invisible',
			                	                    itemStyle : placeHolderStyle
			                	                }
			                	            ]
			                	        },
			                	        {
			                	            name:'合同完成',
			                	            type:'pie',
			                	            clockWise:false,
			                	            radius : [50, 75],
			                	            itemStyle : dataStyle,
			                	            data:[
			                	                {
			                	                    value:${completePer}, 
			                	                    name:'合同数:${complete},占比:${completePer} %'
			                	                },
			                	                {
			                	                    value:100 - ${completePer},
			                	                    name:'invisible',
			                	                    itemStyle : placeHolderStyle
			                	                }
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
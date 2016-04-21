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
			    <div id="main" style="height:400px"></div>
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
			                'echarts/chart/line'
			            ],
			            function (ec) {
			                // 基于准备好的dom，初始化echarts图表
			                var myChart = ec.init(document.getElementById('main'),'macarons'); 
			                
			                var option = {
			                	    tooltip : {
			                	        trigger: 'axis'
			                	    },
			                	    legend: {
			                	        data:['购买意向','商务洽谈','合同确认','合同完成']
			                	    },
			                	    toolbox: {
			                	        show : true,
			                	        feature : {
			                	            mark : {show: false},
			                	            dataView : {show: true, readOnly: false},
			                	            magicType : {show: true, type: ['line', 'bar', 'stack', 'tiled']},
			                	            restore : {show: true},
			                	            saveAsImage : {show: true}
			                	        }
			                	    },
			                	    calculable : true,
			                	    xAxis : [
			                	        {
			                	            type : 'category',
			                	            boundaryGap : false,
			                	            data : ['一月','二月','三月','四月','五月','六月']
			                	        }
			                	    ],
			                	    yAxis : [
			                	        {
			                	            type : 'value'
			                	        }
			                	    ],
			                	    series : [
			                	        {
			                	            name:'购买意向',
			                	            type:'line',
			                	            stack: '总量',
			                	            itemStyle: {normal: {areaStyle: {type: 'default'}}},
			                	            data:${purpose}
			                	        },
			                	        {
			                	            name:'商务洽谈',
			                	            type:'line',
			                	            stack: '总量',
			                	            itemStyle: {normal: {areaStyle: {type: 'default'}}},
			                	            data:${business}
			                	        },
			                	        {
			                	            name:'合同确认',
			                	            type:'line',
			                	            stack: '总量',
			                	            itemStyle: {normal: {areaStyle: {type: 'default'}}},
			                	            data:${subscribe}
			                	        },
			                	        {
			                	            name:'合同完成',
			                	            type:'line',
			                	            stack: '总量',
			                	            itemStyle: {normal: {areaStyle: {type: 'default'}}},
			                	            data:${complete}
			                	        }
			                	    ]
			                	};
			                         
			                //窗体自适应    
			 				window.onresize = myChart.resize ;        
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
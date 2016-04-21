<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

<!-- JS file -->
<script src="http://code.jquery.com/jquery.js"></script>

</head>
<body>
<!-- header -->
<jsp:include page="common/header.jsp"></jsp:include>
<!-- content -->
<div class="container-fluid">
	<div class="row">
		<!-- left -->
		<div class="col-sm-3 col-md-2 sidebar">
			<jsp:include page="common/home-left.jsp"></jsp:include>
		</div>
		
		<!-- center content -->
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<div class="row">
				<!-- <div class="col-6 col-sm-6 col-lg-4">
	              <h2>库存统计</h2>
	              <p class="text-muted">
	              	各个产品按照地域仓库展示库存，可按照地域增加库存。
	              </p>
	              <p><a class="btn btn-default" href="/user/home/inventory" role="button"> 详 情    »</a></p>
	            </div> -->
	            <div class="col-6 col-sm-6 col-lg-4">
	              <h2>销售统计</h2>
	              <p class="text-muted">
	              	各个产品本年度按月份统计销售情况，可按照月份增加销售记录。
	              </p>
	              <p><a class="btn btn-default" href="/user/home/sales/month" role="button"> 详 情    »</a></p>
	            </div>
	            <div class="col-6 col-sm-6 col-lg-4">
	              <h2>销售趋势</h2>
	              <p class="text-muted">
	              	产品销售趋势，按照意向、商务、签约、成交四个维度划分。
	              </p>
	              <p><a class="btn btn-default" href="/user/home/sales/tendency" role="button"> 详 情    »</a></p>
	            </div>
			</div>
		</div>
	</div>
</div>

<!-- JS file -->
<script type="text/javascript">
	$(function(){
		$('#home-left li').removeClass("active").eq(0).prop('class', 'active');
	});
</script>
</body>
</html>
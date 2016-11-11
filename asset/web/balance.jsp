<!-- 통계 -> 자산조회  page  -->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;">
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/cover.css" rel="stylesheet">
<title>잔액조회</title>



<!-- DATEPICKE용  -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="css/style.css">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- 그래프   -->
<link rel="stylesheet" href="css/Nwagon.css" type="text/css">  
<script src="js/Nwagon.js"></script>  
<link href="css/cover.css" rel="stylesheet">


<title>Insert title here</title>
<style></style>
<script>



</script>
</head>
<body>

	<h2>Pie Chart with colorblind safe colors</h2>
	<div id="chart"></div>
	<script>
		
		var options = {
			'dataset': {
				title: 'Web accessibility status',
				values:[18, 12, 3, 10, 7],
				colorset: ['#56b4e9', '#e69f00', '#cc79a7', '#009e73', '#0072b2'],
				fields: ['A', 'B',  'C', 'D', 'E'] 
			},
			'donut_width' : 100, 
			'core_circle_radius':0,
			'chartDiv': 'chart',
			'chartType': 'pie',
			'chartSize': {width:600, height:300}
		};

		Nwagon.chart(options);
	</script>
	
		<div class="panel panel-default">
	    <div class="panel-heading">자산</div>
		<table class="table table-bordered table-hover">
		<thead>
		<tr><th>자산</th><th>금액</th></tr>
		</thead>
		<tbody>
		<tr><td>현금</td><td>10000</td></tr>
		</tbody>
		</table>
		<br>
		</div>
		
		
		
		
		<div class="panel panel-default">
		<div class="panel-heading">부채</div>
		<table class="table table-bordered table-hover">
		<thead>
		<tr><th>부채</th><th>금액</th></tr>
		</thead>
		<tbody>
		<tr><td>대출</td><td>10000</td></tr>
		</tbody>
		</table>
		</div>
		
	

</body>
</html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;">
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/header.css" rel="stylesheet">
<link href="css/dashboard.css" rel="stylesheet">
<title>Financial Planner - 내역을 입력하세요</title>
<!-- DATEPICKE용  -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="css/style.css">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
select {
	width: 100px;
	height: 25px;
}
.mcategory{
    margin-left:15px;
}
.lcategory{
    margin-left:15px;
}
form{
    margin-top:50px;
}
input {
	text-align: right;
}
</style>
<script>
	$(document).ready(function() {
		$.ajax({
			url : 'main?cmd=impl&impl=ajaxs&act=slcode',
			datatype : 'json',
			type : 'GET',
			success : function(data) {
				displayall(data);
			},
			error : function() {
				alert('error');
			}
		});
	});
	function displayall(data) {
		var output = '';
		var jsondata = eval(data);

		for (var i = 0; i < jsondata.length; i++) {
			output += '<option value =' + '"' + jsondata[i].lcode + '"' + '>';
			output += jsondata[i].lcodename;
			output += '</option>';
		}
		$('#lcategory').append(output);
	};
	function setvalue(data) {
		$.ajax({
			url : 'main?cmd=impl&impl=ajaxs&act=smcode&lcode=' + data,
			datatype : 'json',
			type : 'GET',
			success : function(data) {
				displayMcategory(data);
			},
			error : function() {
				alert('mcategory error');
			}
		});
	};
	function displayMcategory(data) {
		$('#mcategory').empty();
		var output = '';
		var jsondata = eval(data);

		for (var i = 0; i < jsondata.length; i++) {
			output += '<option value =' + '"' + jsondata[i].mcode + '"' + '>';
			output += jsondata[i].mcodename;
			output += '</option>';
		}
		$('#mcategory').append(output);
	};
	function getSelectValue() {
		var acc = $("#selbox option:selected").val();
	}
	function register(f) {
		var accNO = f.accno.value;
		var dwcode = f.dwcode.value;
		var payment = f.payment.value;
		var price = f.price.value;
		var date = f.date.value;
		var memo = f.memo.value;
		var useloc = f.useloc.value;
		var lcode = f.lcode.value;
		var mcode = f.mcode.value;

		var c = confirm('입력한 내용을 등록하시겠습니까?');
		if (c == true) {
			f.method = 'POST';
			f.action = 'main?cmd=impl&impl=hismgt&act=hrg&lcd=' + lcode
					+ '&mcd=' + mcode + '&dwcode=' + dwcode + '&price=' + price
					+ '&accNO=' + accNO + '&id=${logincust.id}';
			f.submit();
		}
	};
	$(function() {
		$("#datepicker").datepicker();
	});
</script>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<h3>${logincust.name} 님 ! <small>사용내역을 기록하세요</small>  </h3>
				<form class="form-horizontal" method="post">
					<div class="form-group">
						<label class="col-sm-2 control-label">계좌번호</label>
						<div class="col-sm-5">
							<select class="form-control" name="accno"
								onChange="getSelectValue(this.form);" id="selbox">
								<c:forEach var="acc" items="${acclist}">
									<option value="${acc.accNo }">${acc.accNo }</option>
								</c:forEach>
							</select>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label">입금/출금</label>
						<div class="col-sm-5">
							<select class="form-control" name="dwcode"
								onChange="getSelectValue(this.form); ">
								<option value="1">입금</option>
								<option value="2">출금</option>
							</select>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label">카드/현금</label>
						<div class="col-sm-5">
							<select class="form-control" name="payment"
								onChange="getSelectValue(this.form); ">
								<option value="1">카드</option>
								<option value="2">현금</option>
							</select>
						</div>

					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label">금액</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" placeholder="원"
								name="price">						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label">사용일</label>
						<div class="col-sm-5">
							<input type="text" id="datepicker" placeholder="사용한날"
								onclick="" name="date">
						</div>
					</div>



					<div class="form-group">
						<label class="col-sm-2 control-label">메모</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" placeholder="메모"
								name="memo">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">사용처</label>
						<div class="col-sm-5">
							<input type="text" class="form-control" placeholder="사용내역"
								name="useloc">
						</div>
					</div>
					<div class="form-group">
					<label class="col-sm-2 control-label">대분류</label>
						<select id="lcategory" onchange="setvalue(this.value)"
							name="lcode">
							<option value="">- - - -</option>

						</select>
					</div>
					<div class="form-group">
					<label class="col-sm-2 control-label">중분류</label>
						<select id="mcategory" name="mcode">
							<option value="">- - - -</option>
						</select>
					<button style="margin-left:100px;" type="button" onclick="register(this.form);"
                        class="btn btn-info">입력 등록</button>
					</div>


				</form>
			</div>
		</div>
	</div>

</body>
</html>
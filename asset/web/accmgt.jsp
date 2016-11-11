<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html;">
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/header.css" rel="stylesheet">
<link href="css/dashboard.css" rel="stylesheet">
<title>Insert title here</title>

<style>
select {
	width: 100px;
	height: 25px;
}
table > thead > tr > th {
	text-align: center;
}
</style>
<script>
	function register(f) {
		var chkid = f.test;
		f.method = 'POST';
		f.action = 'main?cmd=impl&impl=accmgt&act=adel&id=${logincust.id}';
		f.submit();
	};

	var maxChecked = 1; //선택가능한 체크박스 갯수
	var totalChecked = 0; // 설정 끝
	function CountChecked(field) {
		if (field.checked)
			totalChecked += 1;
		else
			totalChecked -= 1;
		if (totalChecked > maxChecked) {
			alert("최대 1개 까지만 가능합니다.");
			field.checked = false;
			totalChecked -= 1;
		}

	}
	function ResetCount() {
		totalChecked = 0;
	}
</script>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<form class="form-horizontal" method="post">
					<div class="table-responsive">
						<table style="text-align: center"
							class="table table-bordered  table-condensed">
							<thead>
								<tr class="success">
									<th>#</th>
									<th>계좌 번호</th>
									<th>은행</th>
									<th>잔액</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<c:forEach var="acc" items="${acclist}">
										<td><input type="checkbox" onclick=CountChecked(this)
											value="${acc.accNo }" name="test"></td>
										<td>${acc.accNo }</td>
										<td>${acc.bankName }</td>
										<td>${acc.balance }</td>
								</tr>
								</c:forEach>
							</tbody>
							
						</table>
						<a href="main?cmd=page&page=accreg"> <input type="button"
							value="계좌등록" class="btn btn-info"></a> <input type="button"
							value="계좌삭제" onclick="register(this.form);" class="btn btn-info">
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
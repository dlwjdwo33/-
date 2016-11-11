<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta charset="EUC-KR">
<meta http-equiv="Content-Type" content="text/html;">
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/header.css" rel="stylesheet">
<link href="css/dashboard.css" rel="stylesheet">
<title>기간별 조회</title>
<!-- DATEPICKE용  -->
<link rel="stylesheet"	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="css/style.css">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script>
	$(document).ready(function() {
		$("#datepicker").datepicker();
		$("#datepicker1").datepicker();
	});

	function register(f) {

		var date = f.date.value;
		var date1 = f.date1.value;

		var c = confirm('선택하신 기간의 내용을 조회할까요?');
		if (c == true) {
			f.method = 'POST';
			f.action = 'main?cmd=impl&impl=hismgt&act=historysearchdate&sd='
					+ date + '&ed=' + date1 + '&id=${logincust.id}';
			f.submit();
		}
	};
	function accdelete(f) {
		var seq = f.radio.value;
		var id = f.id.value;
		alert(seq);
		var c = confirm('선택한 내역을 삭제하시겠습니까?');
		if (c == true) {
			f.method = 'POST';
			f.action = 'main?cmd=impl&impl=hismgt&act=hdel&seq=' + seq + '&id=${logincust.id}';
			f.submit();
		}
	}
</script>
<style>
table{
    margin-top:20px;
}
</style>

</head>
<body>
	<div class="row">
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<form class="form-horizontal"  method="post">
			          
                 <label>시작 날짜</label>
                 <input type="text" id="datepicker" placeholder="사용일" name="date">
                 
			     <label>종료 날짜</label>
			     <input type="text" id="datepicker1" placeholder="종료일" name="date1">
			   
			     <input type="button" value="날짜별조회" onclick="register(this.form);"
					class="btn btn-info">
			</form>
			<form>
				<div class="table-responsive">
					<table class="table table-bordered  table-condensed">
						<thead>
							<tr class="success">
								<th>#</th>
								<th>계좌번호</th>
								<th>입/출금</th>
								<th>카드/현금</th>
								<th>금액</th>
								<th>날짜</th>
								<th>메모</th>
								<th>사용 내역</th>
                                <th>중 분 류</th>
                                
							</tr>
						</thead>
						<tbody>
							<c:forEach var="his" items="${hislist}">
								<tr>
									<td><input type="radio" name="radio" id="radio"
										value="${his.sequence }"></td>
									<td>${his.accNo }</td>
									<td><c:if test="${his.dwcode == 1 }">입금</c:if> <c:if
											test="${his.dwcode == 2 }">출금</c:if></td>
									<td><c:if test="${his.payment == 1 }">카드</c:if> <c:if
											test="${his.payment == 2 }">현금 </c:if></td>
									<td>${his.price }</td>
									<td>${his.date }</td>
									<td>${his.memo }</td>
									<td>${his.useloc }</td>
									<td>${his.mcodename }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<input type="button" value="내역삭제" onclick="accdelete(this.form);"
					class="btn btn-info">
			</form>
		</div>
	</div>
</body>
</html>
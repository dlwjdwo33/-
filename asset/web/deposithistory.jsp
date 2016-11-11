<!-- 조회 ->  모두출력  page  -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<meta charset="EUC-KR">
<meta http-equiv="Content-Type" content="text/html;">

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/header.css" rel="stylesheet">
<link href="css/dashboard.css" rel="stylesheet">

<script>
function accdelete(f) {
    var seq = f.radio.value;
    var id = f.id.value;
    var c = confirm('선택한 내역을 삭제하시겠습니까?');
    if (c == true) {
        f.method = 'POST';
        f.action = 'main?cmd=impl&impl=hismgt&act=hdel&seq=' + seq + '&id=${logincust.id}';
        f.submit();
    }
};
</script>
</head>
<body>
	<div class="row">
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<form class="form-horizontal" method="post">
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
								<th>대 분 류</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="dwhis" items="${dwhislist}">
								<tr>
									<td><input type="radio" name="radio" id="radio"
										value="${dwhis.sequence }"></td>
									<td>${dwhis.accNo }</td>
									<td><c:if test="${dwhis.dwcode == 1 }">입금</c:if> <c:if
											test="${dwhis.dwcode == 2 }">출금</c:if></td>
									<td><c:if test="${dwhis.payment == 1 }">카드</c:if> <c:if
											test="${dwhis.payment == 2 }">현금 </c:if></td>
									<td>${dwhis.price }</td>
									<td>${dwhis.date }</td>
									<td>${dwhis.memo }</td>
									<td>${dwhis.useloc }</td>
									<td>${dwhis.mcodename }</td>
									<td>${dwhis.lcodename }</td>
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
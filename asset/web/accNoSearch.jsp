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
<link href="css/cover.css" rel="stylesheet">
<link href="css/header.css" rel="stylesheet">
<link href="css/dashboard.css" rel="stylesheet">
<title>계좌별 조회</title>
<style>
table > thead > tr > th {
    text-align: center;
}
</style>
<script>
	function getSelectValue() {
		$("#selbox option:selected").val();
	};
	function accsearch(fd) { //계좌별 조회하는 함수
		var accNo = fd.accno.value;
		var id = fd.id.value;
		fd.method = 'POST';
		fd.action = 'main?cmd=impl&impl=hismgt&act=hsa&accNo=' + accNo + '&id=${logincust.id}';  
		fd.submit();

	};
	function accdelete(f) { 
		var seq = f.radio.value;
		var id = f.id.value;
		var c =confirm('선택한 내역을 삭제하시겠습니까?');
		if(c==true){
		f.method = 'POST';
		f.action = 'main?cmd=impl&impl=hismgt&act=hdel&seq=' + seq +'&id=${logincust.id}';
		f.submit();
		}
	};

</script>

</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<form class="form-horizontal" method="post">
					<div class="form-group" >
						<label class="col-sm-2 control-label">계좌번호</label>
						<div class="col-xs-6 col-sm-4" >
							<select class="form-control" name="accno"
								onChange="getSelectValue(this.form);" id="selbox">
								<c:forEach var="acc" items="${acclist}">
									<option value="${acc.accNo }">${acc.accNo }</option>
								</c:forEach>
							</select> 
							<button type="button" onclick="accsearch(this.form)" class="btn btn-info">계좌별 조회
						</button>
						</div>
					</div>
				</form>
                <form>
				<div class="table-responsive">
					<table style="text-align: center" class="table table-bordered  table-condensed">
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
								<!-- <th>대 분 류</th> -->
							</tr>
						</thead>
						<tbody>

							<c:forEach var="acchis" items="${acchislist}" >
								<tr>
									<td><input type="radio" name="radio" id="radio"
										value="${acchis.sequence }">
								    </td>								    
									<td>${acchis.accNo }</td>
									<td><c:if test="${acchis.dwcode == 1 }">입금</c:if> <c:if
											test="${acchis.dwcode == 2 }">출금</c:if></td>
									<td><c:if test="${acchis.payment == 1 }">카드</c:if> <c:if
											test="${acchis.payment == 2 }">현금 </c:if></td>
									<td>${acchis.price }</td>
									<td>${acchis.date }</td>
									<td>${acchis.memo }</td>
									<td>${acchis.useloc }</td>
									<td>${acchis.mcodename }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<button type="button" onclick="accdelete(this.form);" class="btn btn-info">내역 삭제</button>
                </form>
			</div>
		</div>
	</div>
</body>
</html>
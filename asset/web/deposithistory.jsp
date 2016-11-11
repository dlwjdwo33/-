<!-- ��ȸ ->  ������  page  -->
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
    var c = confirm('������ ������ �����Ͻðڽ��ϱ�?');
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
								<th>���¹�ȣ</th>
								<th>��/���</th>
								<th>ī��/����</th>
								<th>�ݾ�</th>
								<th>��¥</th>
								<th>�޸�</th>
								<th>��� ����</th>
								<th>�� �� ��</th>
								<th>�� �� ��</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="dwhis" items="${dwhislist}">
								<tr>
									<td><input type="radio" name="radio" id="radio"
										value="${dwhis.sequence }"></td>
									<td>${dwhis.accNo }</td>
									<td><c:if test="${dwhis.dwcode == 1 }">�Ա�</c:if> <c:if
											test="${dwhis.dwcode == 2 }">���</c:if></td>
									<td><c:if test="${dwhis.payment == 1 }">ī��</c:if> <c:if
											test="${dwhis.payment == 2 }">���� </c:if></td>
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
				<input type="button" value="��������" onclick="accdelete(this.form);"
					class="btn btn-info">
			</form>
		</div>
	</div>
</body>
</html>
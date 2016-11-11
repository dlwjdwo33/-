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
<title>�Ⱓ�� ��ȸ</title>
<!-- DATEPICKE��  -->
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

		var c = confirm('�����Ͻ� �Ⱓ�� ������ ��ȸ�ұ��?');
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
		var c = confirm('������ ������ �����Ͻðڽ��ϱ�?');
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
			          
                 <label>���� ��¥</label>
                 <input type="text" id="datepicker" placeholder="�����" name="date">
                 
			     <label>���� ��¥</label>
			     <input type="text" id="datepicker1" placeholder="������" name="date1">
			   
			     <input type="button" value="��¥����ȸ" onclick="register(this.form);"
					class="btn btn-info">
			</form>
			<form>
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
                                
							</tr>
						</thead>
						<tbody>
							<c:forEach var="his" items="${hislist}">
								<tr>
									<td><input type="radio" name="radio" id="radio"
										value="${his.sequence }"></td>
									<td>${his.accNo }</td>
									<td><c:if test="${his.dwcode == 1 }">�Ա�</c:if> <c:if
											test="${his.dwcode == 2 }">���</c:if></td>
									<td><c:if test="${his.payment == 1 }">ī��</c:if> <c:if
											test="${his.payment == 2 }">���� </c:if></td>
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
				<input type="button" value="��������" onclick="accdelete(this.form);"
					class="btn btn-info">
			</form>
		</div>
	</div>
</body>
</html>
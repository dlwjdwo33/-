<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>

<head>
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html;">

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/header.css" rel="stylesheet">
<link href="css/dashboard.css" rel="stylesheet">


<script>
	$(document).ready(function() {

	});

	function getSelectValue() {
		$("#selbox option:selected").val();
	};

	function accdelete(f) { //���� �����ϱ� ���� �� �ѱ�� �Լ� 
		var seq = f.radio.value;
		var id = f.id.value;
		f.method = 'POST';
		f.action = 'main?cmd=impl&impl=hismgt&act=hdel&seq=' + seq +'&id=${logincust.id}';
		f.submit();
	};
</script>

</head>
<body>
	<div class="row">
		<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
			<form  method="post">
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
                           <c:forEach var="allhis" items="${hisalllist}">
                            <tr>
                            <td><input type="radio" name="radio" id="radio"
                                        value="${allhis.sequence }"></td>
                                    <td>${allhis.accNo }</td>
                                    <td><c:if test="${allhis.dwcode == 1 }">�Ա�</c:if> <c:if
                                            test="${allhis.dwcode == 2 }">���</c:if></td>
                                    <td><c:if test="${allhis.payment == 1 }">ī��</c:if> <c:if
                                            test="${allhis.payment == 2 }">���� </c:if></td>
                                    <td>${allhis.price }</td>
                                    <td>${allhis.date }</td>
                                    <td>${allhis.memo }</td>
                                    <td>${allhis.useloc }</td>
                                    <td>${allhis.mcodename }</td>
                                    <td>${allhis.lcodename }</td>
                            </tr>
                     
                           </c:forEach>
                        </tbody>
                        </table>
                        </div>
                       <button type="button" onclick="accdelete(this.form);"
                    class="btn btn-info">���� ����</button>            
			</form>

		</div>
	</div>


</body>
</html>
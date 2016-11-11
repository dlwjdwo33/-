<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;">
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/header.css" rel="stylesheet">
<link href="css/dashboard.css" rel="stylesheet">
<title>test시발이게뭐람</title>
<script>
	
</script>
<style>
   form{
        margin-top:50px;
   }
   button {
    margin-top:50px;
    margin-left:30px;
   }
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<form class="form-horizontal" >
					<div class="form-group">
						<label class="col-sm-2 control-label">ID</label>
						<div class="col-xs-12 col-sm-6 col-md-6">
							<input type="text" class="form-control" value="${logincust.id }"
								readonly>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label">Password</label>
						<div class="col-xs-12 col-sm-6 col-md-6">
							<input type="password" class="form-control" value="${logincust.pwd }"
								readonly>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label">이름</label>
						<div class="col-xs-12 col-sm-6 col-md-6">
							<input type="text" class="form-control"
								value="${logincust.name }" readonly>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label">사는곳</label>
						<div class="col-xs-12 col-sm-6 col-md-6">
							<input type="text" value="${logincust.location }" readonly
								class="form-control" name="area">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label">나이</label>
						<div class="col-xs-12 col-sm-6 col-md-6">
							<input type="text" class="form-control" name="age" readonly
								value="${logincust.age }">
						</div>
					</div>

					<a href="main?cmd=page&page=myinfoup">
						<button type="button" class="btn btn-info">정보 수정</button>
					</a> <a href="main?cmd=impl&impl=accmgt&act=aselall&id="
						${logincust.id }>
					
					</a>
				</form>
			</div>
		</div>
	</div>



</body>
</html>
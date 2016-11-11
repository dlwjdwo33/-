<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html;">
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/cover.css" rel="stylesheet">
<title>JOIN US</title>
<!-- DATEPICKE용  -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<link rel="stylesheet" href="css/style.css">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script>
	function register(f) {
		var id = f.id.value;
		var pwd = f.pwd.value;
		var name = f.name.value;
		var gender = f.gender.value;
		var age = f.age.value;
		var location = f.location.value;

		if (id == null || id == '') {
			alert('ID 는 필수 항목 입니다.');
			f.id.focus();
			return;
		}
		;
		if (pwd == null || pwd == '') {
			alert('PWD 는 필수 항목 입니다.');
			f.pwd.focus();
			return;
		}
		;
		if (name == null || name == '') {
			alert('NAME 는 필수 항목 입니다.');
			f.name.focus();
			return;
		}
		;
		if (gender == null || gender == '') {
			alert('gender 는 필수 항목 입니다.');
			f.gender.focus();
			return;
		}
		;
		if (age == null || age == '') {
			alert('age 는 필수 항목 입니다.');
			f.age.focus();
			return;
		}
		;
		if (location == null || location == '') {
			alert('Location 는 필수 항목 입니다.');
			f.location.focus();
			return;
		}
		;

		var c = confirm('회원가입 하시겠습니까?');
		if (c == true) {
			f.method = 'POST';
			f.action = 'main?cmd=impl&impl=custmgt&act=crg';
			f.submit();
		}
		;
	};
</script>
<link href="css/logincover.css" rel="stylesheet">
<link href="css/ie10-viewport-bug-workaround.css" rel="stylesheet">
<script src="css/js/ie10-viewport-bug-workaround.js"></script>
<script src="js/ie-emulation-modes-warning.js"></script>
</head>
<body>
	<header>
		<jsp:include page="header.jsp" />
	</header>
</head>
<body>
	<div class="container">
		<img src="img/fin4.jpg" style="width: 100px; height: 100px">
		<form class="form-horizontal">
			<div class="form-group">
				<label class="col-sm-2 control-label">ID</label>
				<div class="col-xs-12 col-sm-6 col-md-6">
					<input type="text" class="form-control" name="id" placeholder="ID">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">PWD</label>
				<div class="col-xs-12 col-sm-6 col-md-6">
					<input type="password" class="form-control" placeholder="PWD입력"
						name="pwd">
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-2 control-label">NAME</label>
				<div class="col-xs-12 col-sm-6 col-md-6">
					<input type="text" class="form-control" placeholder="NAME입력"
						name="name">
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-2 control-label">성별</label>
				<div class="col-xs-12 col-sm-6 col-md-6">
					<select class="form-control" name="gender">
						<option value="-">- - -</option>
						<option value="1">남자</option>
						<option value="2">여자</option>
					</select>
				</div>
				<br>
			</div>

			<div class="form-group">
				<label class="col-sm-2 control-label">AGE</label>
				<div class="col-xs-12 col-sm-6 col-md-6">
					<input type="text" class="form-control" placeholder="나이입력"
						name="age">
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-2 control-label">AREA</label>
				<div class="col-xs-12 col-sm-6 col-md-6">
					<input type="text" class="form-control" placeholder="사는곳입력"
						name="location">
				</div>
				<input type="button" value="등록" onclick="register(this.form);"
					class="btn btn-info">

			</div>

		</form>
	</div>
</body>
</html>
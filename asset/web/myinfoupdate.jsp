<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/header.css" rel="stylesheet">
<link href="css/dashboard.css" rel="stylesheet">
<style>
   form{
        margin-top:50px;
   }
   button {
    margin-top:50px;
    margin-left:30px;
   }
</style>
<script>

function update(f) {
    
	
    var password = f.password.value;
    var name = f.name.value;
    var area = f.area.value;
    var age = f.age.value;

    var c = confirm('입력한 내용을 등록하시겠습니까?');
    if (c == true) {
        f.method = 'POST';
        f.action = 'main?cmd=impl&impl=hismgt&act=hrg&lcd=' + lcode
                + '&mcd=' + mcode + '&dwcode=' + dwcode + '&price=' + price
                + '&accNO=' + accNO + '&id=${logincust.id}';
        f.submit();
    }
};

</script>
<title>MY PAGE > 수정하기</title>
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
                            <input type="text" class="form-control" name="password" value="${logincust.pwd }">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">이름</label>
                        <div class="col-xs-12 col-sm-6 col-md-6">
                            <input type="text" class="form-control"
                                value="${logincust.name }" name="name" >
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">사는곳</label>
                        <div class="col-xs-12 col-sm-6 col-md-6">
                            <input type="text" value="${logincust.location }"
                                class="form-control" name="area">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">나이</label>
                        <div class="col-xs-12 col-sm-6 col-md-6">
                            <input type="text" class="form-control" name="age"
                                value="${logincust.age }">
                        </div>
                    </div>


<button type="button" class="btn btn-info" onclick="update(this.form);" >수정완료</button></a>


                </form>
            </div>
        </div>
    </div>




</body>
</html>
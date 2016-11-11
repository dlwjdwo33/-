<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html;">
<script src="//code.jquery.com/jquery-1.12.0.min.js"></script>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/cover.css" rel="stylesheet">
   <link href="css/header.css" rel ="stylesheet">
<link href="css/dashboard.css" rel="stylesheet">
<style></style>
<script>
	function register(f) {
		var accNo = f.accNo.value;
		var bankName = f.bankName.value;
		var balance = f.balance.value;
		
		if (accNo == null || accNo == '') {
			alert('accNo 는 필수 항목 입니다.');
			f.accNo.focus();
			return;
		}
		if (bankName == null || bankName == '') {
			alert('bankName 는 필수 항목 입니다.');
			f.bankName.focus();
			return;
		}
		if (balance == null || balance == '') {
			alert('balance 는 필수 항목 입니다.');
			f.balance.focus();
			return;
		}
		var c = confirm('계좌번호를 등록하시겠습니까?');
		if (c == true) {
			f.method = 'POST';
			f.action = 'main?cmd=impl&impl=accmgt&act=arg&aid=${logincust.id}';
			f.submit();
		}
	};
</script>
<body>

    <div class="container-fluid">
<div class="row">          
    <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main"> 
   <form class = "form-horizontal" >
         <div class="form-group">
             <label class="col-sm-2 control-label">계좌번호</label>
             <div class="col-xs-12 col-sm-6 col-md-6">
               <input type="text" class="form-control" name="accNo" placeholder="계좌번호를 입력하세요">
             </div>
         </div>
         <div class="form-group">
             <label  class="col-sm-2 control-label">은행명</label>
             <div class="col-xs-12 col-sm-6 col-md-6">
              <input type="text" class="form-control" placeholder="은행명을 입력하세요" name="bankName">
            </div>
         </div>
         
         <div class="form-group">
             <label  class="col-sm-2 control-label">잔액</label>
             <div class="col-xs-12 col-sm-6 col-md-6">
              <input type="text" class="form-control" placeholder="잔액을 입력하세요" name="balance">
            </div>
         </div>
         
          <input type="button" value="등록" onclick="register(this.form);"
            class="btn btn-info">
          
        </form>
    </div>
    </div>
</div>
</body>
</html>
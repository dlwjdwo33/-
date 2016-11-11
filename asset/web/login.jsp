<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
  <head>
   <meta  charset="EUC-KR">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Financial Planner</title>
    <style>    </style>
    <link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/cover.css" rel="stylesheet">
	<link href="css/logincover.css" rel="stylesheet">
    <link href="css/ie10-viewport-bug-workaround.css" rel="stylesheet">
 	<script src="css/js/ie10-viewport-bug-workaround.js"></script>
    <script src="js/ie-emulation-modes-warning.js"></script>
  </head>
  <body>
<header>
<jsp:include page="header.jsp"/>
</header>
<div class="container centerT">
	<form class="form-horizontal" method="POST" action="main?cmd=impl&impl=login&act=in">
	  <div class="form-group" style="margin-left:500px;">
        <img src="img/money.png"class="img-circle">
      </div>  
	  <div class="form-group" style="padding-left:100px;">
	    <label for="inputid3" class="col-sm-2 control-label">ID</label>
	    <div class="col-xs-12 col-sm-6 col-md-6">
	      <input type="text" class="form-control" id="inputid3" name="id" placeholder="ID">
	    </div>
	  </div>
	  <div class="form-group" style="padding-left:100px;">
	    <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
	    <div class="col-xs-12 col-sm-6 col-md-6">
	      <input type="password" class="form-control" id="inputPassword3" name="pwd"  placeholder="Password">
	    </div>
	  </div>
	  <div class="form-group" style="padding-left:100px;">
	    <div class="col-sm-offset-2 col-sm-6">
	      <div class="checkbox" style="display:inline;">
	        <label>	          <input type="checkbox"> Remember me	        </label>
	      </div>
	    </div>
	  </div>
	  <div class="form-group" style="padding-left:300px;">
        <div class="col-sm-offset-2 col-sm-10">
          <button type="submit" class="btn btn-default glyphicon glyphicon-saved">Login</button>
        </div>
	  </div>
	</form>
    <button type="submit" class="btn btn-default glyphicon glyphicon-import" style="margin-left:10px;"><a href="main?cmd=page&page=join">Sign in</a></button>
      
</div>
 
  </body>
</html>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE>
<html>
<head>
<meta charset="EUC-KR">
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
   <link href="css/header.css" rel ="stylesheet">
<title>플래너 F와 함께 하세요!</title>

<script type="text/javascript" src="/js/jquery-1.2.6.min.js"></script>
</head>
<body>
<div class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span> 
      </button>
       <img class="navbar-brand" src="img/logo.png" style="width: 60px; height: 60px;">  

    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="main?cmd=page&page=manual">HOME</a></li>
        <li><a href="#band">Financial</a></li>
        <li><a href="main?cmd=page&page=myinfo">MY PAGE</a></li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">MORE
            <span class="caret"></span>
          </a>
          <ul class="dropdown-menu">
            <li><a href="#">전체 내역조회</a></li>
            <li><a href="#">날짜별 조회</a></li>
            <li><a href="#">계좌별 조회</a></li> 
          </ul>
        </li>
        <li><a href="#"><span class="glyphicon glyphicon-search"></span></a></li>
      </ul>
    </div>
  </div>
</div>
</body>
</html>
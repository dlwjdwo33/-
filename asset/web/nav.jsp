<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta charset="EUC-KR">
<title>---</title>
<style></style>
<script type="text/javascript" src="/js/jquery-1.2.6.min.js"></script>
</head>
<body>
<div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li class="active">     
                <a href="main?cmd=page&page=myinfo">${logincust.name} 님 <span class="sr-only">(current)</span></a></li>    
          </ul>
          <ul class="nav nav-sidebar">
         
            <li><a href="main?cmd=impl&impl=accmgt&act=aselall&id=${logincust.id }"><span class="glyphicon glyphicon-pushpin" aria-hidden="true" style="margin-right:10px;"></span>계좌 관리</a></li>
           </ul>
          <ul class="nav nav-sidebar">
            <li><a href="main?cmd=impl&impl=hismgt&act=sacid1&id=${logincust.id }"><span class="glyphicon glyphicon-pushpin" aria-hidden="true" style="margin-right:10px;"></span>입력</a></li>
          </ul>          
          <ul class="nav nav-sidebar">
            <li><a href="#"><span class="glyphicon glyphicon-pushpin" aria-hidden="true" style="margin-right:10px;"></span>조  회 </a></li>
            <li><a href="main?cmd=impl&impl=hismgt&act=hselall&id=${logincust.id }"><span class="glyphicon glyphicon-option-horizontal" aria-hidden="true" style="padding-left:15px; margin-right:10px;"></span>입출금 내역 조회</a></li>
            <li><a href="main?cmd=impl&impl=hismgt&act=hsdcode&dwcode=1&id=${logincust.id }"><span class="glyphicon glyphicon-option-horizontal" aria-hidden="true" style="padding-left:15px; margin-right:10px;"></span>입금 내역 조회</a></li>
            <li><a href="main?cmd=impl&impl=hismgt&act=hsdcode&dwcode=2&id=${logincust.id }"><span class="glyphicon glyphicon-option-horizontal" aria-hidden="true" style="padding-left:15px; margin-right:10px;"></span>출금 내역 조회</a></li>
            <li><a href="main?cmd=impl&impl=hismgt&act=historysearchdate&id=${logincust.id }"><span class="glyphicon glyphicon-option-horizontal" aria-hidden="true" style="padding-left:15px; margin-right:10px;"></span>기간별 조회</a></li>
            <li><a href="main?cmd=impl&impl=hismgt&act=sacid&id=${logincust.id }"><span class="glyphicon glyphicon-option-horizontal" aria-hidden="true" style="padding-left:15px; margin-right:10px;"></span>계좌별 조회</a></li>
          </ul>
          <ul class="nav nav-sidebar">
            <li><a href=""><span class="glyphicon glyphicon-pushpin" aria-hidden="true" style="margin-right:10px;"></span>통계</a></li>
            <li><a href="main?cmd=page&page=cate"><span class="glyphicon glyphicon-option-horizontal" aria-hidden="true" style="padding-left:15px; margin-right:10px;"></span>월별 지출</a></li>
            <li><a href="main?cmd=page&page=label"><span class="glyphicon glyphicon-option-horizontal" aria-hidden="true" style="padding-left:15px; margin-right:10px;"></span>분류별 지출</a></li>
            <li><a href="main?cmd=page&page=cardcash"><span class="glyphicon glyphicon-option-horizontal" aria-hidden="true" style="padding-left:15px; margin-right:10px;"></span>카드/현금</a></li>
            
          </ul>
</div>

</body>
</html>
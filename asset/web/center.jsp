<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE>
<html>
<head>
<meta  charset="EUC-KR">
<title>Financial Planner</title>
<script type="text/javascript" src="/js/jquery-1.2.6.min.js"></script>
</head>
<body>
<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="img/fin1.jpg" alt="fin1" width="1200" height="700">
        <div class="carousel-caption">
          <h3>Financial Planner</h3>
          <p> ������ �����ڻ��� �����ص帳�ϴ�.</p>
        </div>      
      </div>

      <div class="item">
        <img src="img/fin3.jpg" alt="fin2" width="1200" height="700">
        <div class="carousel-caption">
          <h3>Accuracy & Speed </h3>
          <p>��Ȯ�ϰ� �ż��ϰ� ��ġȭ �����͸� �����մϴ�.</p>
        </div>      
      </div>
    
      <div class="item">
        <img src="img/fin3.jpg" alt="fin3" width="1200" height="700">
        <div class="carousel-caption">
          <h3>Comming Soon</h3>
          <p>����, CMA, ���� � ���� ���񽺸� �غ����Դϴ�.</p>
        </div>      
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
</div>

<!-- Container (The Band Section) -->
<div id="band" class="container text-center">
  <h3>Financial Planner</h3>
  <p><em>����� �ڻ��� �����ϼ���!</em></p>
  <p>Planner�� ���� ���� �м� �� �� �ֽ��ϴ�. </p>
  <br>
  <div class="row">
    <div class="col-sm-4">
       <p class="text-center"><strong>ANALISIS</strong></p><br>
      <a href="#demo" data-toggle="collapse">
        <img src="img/lo1.png"  class="img-circle" alt="Random Name" width="150" height="150">
      </a>
      <div id="demo" class="collapse">
        <p>ȸ������ �ַ� ����ϴ� ������ �����ϱ��?</p>
        <p>����ڷḦ ���Ͽ� �м��� �� �ֽ��ϴ�</p>
      </div>
    </div>
    <div class="col-sm-4">    
      <p class="text-center"><strong>MONEY</strong></p><br>
      <a href="#demo2" data-toggle="collapse">
        <img src="img/lo2.png"  class="img-circle" alt="Random Name" width="150" height="150">
      </a>
      <div id="demo2" class="collapse">
        <p>���� �帧�� �м��ϼ���</p>
        <p>We can help you.</p>
      </div>
    </div>
    <div class="col-sm-4">
      <p class="text-center"><strong>CONVIENET</strong></p><br>
      <a href="#demo3" data-toggle="collapse">
        <img src="img/lo3.png" class="img-circle" alt="Random Name" width="150" height="150">
      </a>
      <div id="demo3" class="collapse">
        <p>���� ��𿡼���</p>
        <p>������ ��������</p>
      </div>
    </div>
  </div>
</div>

<!-- Container (Contact Section) -->
<div id="contact" class="bg-1 container" >
  <h3 class="text-center">Contact</h3>
  <p class="text-center"><em>We love our fans!</em></p>
  <div class="row">
    <div class="col-md-4">
      <p>Fan? Drop a note.</p>
      <p><span class="glyphicon glyphicon-map-marker"></span>Seoul, KOREA</p>
      <p><span class="glyphicon glyphicon-phone"></span>Phone: +80 38118386</p>
      <p><span class="glyphicon glyphicon-envelope"></span>Email: vimil2ya@mail.com</p>    
    </div>
    <div class="col-md-8">
      <div class="row">
        <div class="col-sm-6 form-group">
          <input class="form-control" id="name" name="name" placeholder="Name" type="text" required>
        </div>
        <div class="col-sm-6 form-group">
          <input class="form-control" id="email" name="email" placeholder="Email" type="email" required>
        </div>
      </div>
      <textarea class="form-control" id="comments" name="comments" placeholder="Comment" rows="5"></textarea>
      <br>
      <div class="row">
        <div class="col-md-12 form-group">
          <button class="btn pull-right" type="submit">Send</button>
        </div>
      </div>    
    </div>
  </div>
</div>
<div id="googleMap"></div>
</body>
</html>
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
<link href="css/cover.css" rel="stylesheet">
<link href="css/header.css" rel="stylesheet">
<link href="css/dashboard.css" rel="stylesheet">

<title>Analysis > Radar Chart</title>
      <script src="js/Chart.js"></script>
      <meta name = "viewport" content = "initial-scale = 1, user-scalable = no">
      <style>
          canvas{
          }
      </style>

</head>
<body>

    <script>
    var radarChartData = {
        labels: ["식비", "주거비", "생활비", "교통비", "통신비", "저축/보험비", "건강비"],
        datasets: [
                   {
                       label: "My First dataset",
                       fillColor: "rgba(151,187,205,0.2)",
                       strokeColor: "rgba(151,187,205,1)",
                       pointColor: "rgba(151,187,205,1)",
                       pointStrokeColor: "#fff",
                       pointHighlightFill: "silver",
                       pointHighlightStroke: "rgba(151,187,205,1)",
                       data: [25,30,15,25,10,5,5]
                   }
                   
        ]
    };

    window.onload = function(){
        window.myRadar = new Chart(document.getElementById("canvas").getContext("2d")).Radar(radarChartData, {
            responsive: true
        });
    }
   
    </script>
    
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            
             <div class="form-group">
                        <label class="col-sm-2 control-label">분류별 지출</label>
                        <div class="col-sm-5">
                            <select class="form-control" name="payment"
                                onChange="getSelectValue(this.form); ">
                                <option value="1월">1월</option>
                                <option value="2월">2월</option>
                                <option value="2월">3월</option>
                                 <option value="1월">4월</option>
                                <option value="2월">5월</option>
                                <option value="2월">6월</option>   
                                 <option value="1월">7월</option>
                                <option value="2월">8월</option>
                                <option value="2월">9월</option> 
                                 <option value="1월">10월</option>
                                <option value="2월">11월</option>
                                <option value="2월">12월</option>                                    
                            </select>
                       
                       </div>
                           <button style="margin-left:100px;" type="button" onclick="register(this.form);"
                        class="btn btn-info">조회</button>
            </div>
            
            
            
            
        <div style="width:50%">
            <canvas id="canvas" height="600" width="600"></canvas>
        </div>
        </div>
        </div>
        </div>
    
    
    </body>
    
</html>

    

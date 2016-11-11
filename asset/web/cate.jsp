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
    
    var data = {
    	    labels: ["January", "February", "March", "April", "May", "June", "July"],
    	    datasets: [
    	        {
    	            label: "지출",
    	            fillColor: "rgba(180,220,220,0.5)",
    	            strokeColor: "rgba(180,220,220,0.8)",
    	            highlightFill: "rgba(180,220,220,0.75)",
    	            highlightStroke: "rgba(180,220,220,1)",
    	            data: [65, 59, 80, 81, 56, 55, 40]
    	        },
    	        {
    	            label: "수입",
    	            fillColor: "rgba(160,187,205,0.5)",
    	            strokeColor: "rgba(160,187,205,0.8)",
    	            highlightFill: "rgba(160,187,205,0.75)",
    	            highlightStroke: "rgba(160,187,205,1)",
    	            data: [28, 48, 40, 19, 32, 27, 44]
    	        }
    	    ]
    	};
  
    window.onload = function(){
        window.myBarChart = new Chart(document.getElementById("canvas").getContext("2d")).Bar(data, {
            responsive: true
        });
    }
   
    </script>
    
    
    
    
    
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            
                   <div class="form-group">
                        <label class="col-sm-2 control-label">상반기 수입/지출</label>
                     
                    </div>
            
            
        <div style="width:50%">
            <canvas id="canvas" height="450px" width="450px"></canvas>
           
           
        </div>
        </div>
        </div>
        </div>
    
    
    </body>
    
</html>

    

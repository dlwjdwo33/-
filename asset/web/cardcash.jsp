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
    
    var data = [
                {
                    value: 70,
                    color:"#F7464A",
                    highlight: "#FF5A5E",
                    label: "ī��"
                    
                },
                {
                    value: 30,
                    color: "#46BFBD",
                    highlight: "#5AD3D1",
                    label: "����"
                }
               
            ]
  
    window.onload = function(){
        window.myDoughnutChart = new Chart(document.getElementById("canvas").getContext("2d")).Doughnut(data, {
            responsive: true
        });
    }
   
    </script>
    
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">ī��/���� ����</label>
                        <div class="col-sm-5">
                            <select class="form-control" name="payment"
                                onChange="getSelectValue(this.form); ">
                                 <option value="1��">1��</option>
                                <option value="2��">2��</option>
                                <option value="2��">3��</option>
                                 <option value="1��">4��</option>
                                <option value="2��">5��</option>
                                <option value="2��">6��</option>   
                                 <option value="1��">7��</option>
                                <option value="2��">8��</option>
                                <option value="2��">9��</option> 
                                 <option value="1��">10��</option>
                                <option value="2��">11��</option>
                                <option value="2��">12��</option>                              
                            </select>
                       
                       </div>
                           <button style="margin-left:100px;" type="button" onclick="register(this.form);"
                        class="btn btn-info">��ȸ</button>
            </div>
            
        <div style="width:50%">
            <canvas id="canvas" height="450px" width="450px"></canvas>
          
           
        </div>
        </div>
        </div>
        </div>
    
    
    </body>
    
</html>

    

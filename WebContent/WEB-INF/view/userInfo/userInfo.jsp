<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true"  contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="tc" tagdir="/WEB-INF/tags" %>
<!DOCTYPE :html>
<html>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>


    <!-- chart.js 파일  -->
    <script src="${contextPath }/js/Chart.js/Chart.js"></script>
    <script src="${contextPath }/js/Chart.js/Chart.min.js"></script>
    <link rel="stylesheet" href="${contextPath }/js/Chart.js/Chart.css">
    <link rel="stylesheet" href="${contextPath }/js/Chart.js/Chart.min.css">
   
    <head>
    <meta charset='UTF-8'>
    <title></title>
        <style>
        body{
        	overflow-x:hidden;
        }
            #background{
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 150%;
                z-index: -99;
                opacity: 0.7;
                background-size: cover;
            }
            #conn{
                margin-top:0%;
                margin-left: 25%;
                margin-right: 30%;
            }
        </style>
    </head>


     <body >
        <img id="background" src="${contextPath }/viewImage/fadeBackground/pier.jpg" 
            style="width: 100vw;height: 100%" />
        <div class="container-fluid"id=conn>
        
        	<div class="text">
            <small style=" margin-right:20px;">
            <i><b>${userInfo.userId} 님 , 오늘 하루는 어떠신가요?</b></i>
            </small>
            <hr />
            <div class="row border" style="width: 50%; height: 50%px;background-color:white; opacity: 0.9">
                
        <canvas id="myChart"></canvas>
        </div>
		<hr />
        <small style=" margin-right:20px;">
            <i><b>일주일 간 기제한 게시글</b></i>
            </small>
        <div class="row" style="width: 50%; height: 50%px;background-color:">
		 <c:forEach items="${articlePage.content}" var="article">
				
				<c:if test="${not empty article }">
				<div class="col d-flex justify-content-center border">
					<h6 class="card-title title-overFlow" id="title" style="margin-bottom: 0px;">Title : ${article.title }</h6>
					<small style="color: #0B3861;"> 조회 : ${article.readCount }</small>
					<small style="color: #0B3861; margin-left: 50%">-<tc:ConversionLocalDataTime date="${article.regdate }"/></small>
				</div>
				<hr />
			</c:if>
				
			</c:forEach> 
			
            
        </div>
        <div class="row">
        <div class="col d-flex justify-content-center">
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<c:if test="${articlePage.startPage > 5 }">
						<li class="page-item">
						<a class="page-link" href="${contextPath }/userInfo.do?pageNo=${articlePage.startPage - 5 }">Previous</a></li>
					</c:if>
					<c:forEach var="pNo" begin="${articlePage.startPage }" end="${articlePage.endPage }">
					<c:if test="${articlePage.total > 0 }">
						<li class="page-item"><a class="page-link" href="${contextPath }/userInfo.do?pageNo=${pNo }">${pNo }</a></li>
					</c:if>
					</c:forEach>
					<c:if test="${articlePage.endPage < articlePage.totalPages }">
						<li class="page-item">
						<a class="page-link" href="${contextPath }/userInfo.do?pageNo=${articlePage.startPage + 5 }">Next</a></li>
					</c:if>
				</ul>
			</nav>
		</div>
		</div>
        
        </div>
        
    </div>


    </body>


    <script type="text/javascript">
    $('#naverTotal').attr('class', 'navbar navbar-expand-lg navbar-light');
    
    var ctx = $('#myChart');
    var myChart = new Chart(ctx, {
        type : "line",
        data : {
              labels: ["날짜1", "날짜2", "날짜3", "날짜4", "날짜5", "날짜6"]
            , datasets : [{
                  label: "일주일 간 조회수"
                , data: [1, 12, 3, 5, 0, 0]
                , backgroundColor : [
                      "rgba(0, 0, 0, 0.0)"
                ]
                , borderColor: [
                      "rgba(255, 159, 64, 1)"
                    , "rgba(255, 159, 64, 1)"
                    , "rgba(255, 159, 64, 1)"
                    , "rgba(255, 159, 64, 1)"
                    , "rgba(255, 159, 64, 1)"
                    , "rgba(255, 159, 64, 1)"
                ]
                , borderWidth : 1
            }]
        }
        , options : {
            scales : {
                yAxes : [{
                    ticks : { beginAtZero : true, }
                }]
            }
        }
    });
    </script>
</html>
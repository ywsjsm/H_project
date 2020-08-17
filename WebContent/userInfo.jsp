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
   
 <!--   <script type="text/javascript">
   $(function() {
		var datee = "";
		$.ajax({
			type:'get',
			url:'/H_Project/sendArticle.do'
		}).done(function(data) {
			datee = data;
		if(datee != null){
			console.log('동작');
	    var availableTitlee = datee; //< 검색어 리스트
	    var titleDatae = JSON.parse(availableTitlee);
		console.log(titleDatae);
		}
		});
   });
   </script> -->
   
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
           .check:hover * {
            	text-decoration: underline;
            }
        </style>
    </head>


     <body >
     <%@include file="/WEB-INF/view/includes/navbar.jsp" %>
     
        <img id="background" src="${contextPath }/viewImage/modifyImage/pencil.jpg" 
            style="width: 100vw;height: 150%" />
        <div class="container-fluid"id=conn>
        
        	<div class="text">
            <small style=" margin-right:20px;">
            <i><b>${userInfo.userId} 님 , 오늘 하루는 어떠신가요?</b></i>
            </small>
            <hr />
            <div class="row border" style="width: 50%; height: 50%;background-color:white; opacity: 1.0">
                
        <canvas id="myChart"></canvas>
        </div>
        <div style="">
		<hr />
        <small style=" margin-right:20px;">
            <i><b>기제한 게시글 (●'◡'●)</b></i>
            </small>
        <div class="row" style="width: 50%; height: 50%px;background-color:">
				<table class="table table-hover table-sm" style="opacity: 1.0">
				 <thead class="thead-dark">
				   <tr class="">
				   <th scope="col">number</th>
				     <th scope="col">Title</th>
				     <th scope="col">RegisterDate</th>
				     <th scope="col">readCount</th>
				   </tr>
				 </thead>
		 <c:forEach items="${articlePage.content}" var="article" varStatus="status">
				
				<c:if test="${not empty article }">
				 <tbody>
				<tr class="check" onclick="location.href='http://localhost:8080/H_Project/read.do?no=${article.boardNum}'">
					<th scope="row">${status.index +1 }</th>
					<td>${article.title }</td>
					<td><tc:ConversionLocalDataTime date="${article.regdate }"/><a href="${contextPath }/read.do?no=${article.boardNum}" class="link"></a> </td>
					<td> ${article.readCount }</td>
				</tr>
				<%--  <div class="col d-flex justify-content-center border">
					<h6 class="card-title title-overFlow" id="title" style="margin-bottom: 0px;">Title : ${article.title }</h6>
					<small style="color: #0B3861;"> 조회 : ${article.readCount }</small>
					<small style="color: #0B3861; margin-left: 50%">-<tc:ConversionLocalDataTime date="${article.regdate }"/></small>
				</div>
				<hr />  --%>
				</tbody>
			</c:if>
				
			</c:forEach> 
			</table>
			</div>
            
        </div>
        <div class="row" style="margin-right: 50%">
        <div class="col justify-content-center">
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
	
	<div  class="container-fluid" id="developers" style="position: relative;">
    <hr />
   <div class="row justify-content-center" >
<i style="color: white;">&copy; H_Project's [ developers JungSM , YunWS ]</i>
</div>
		</div>

    </body>


    <script type="text/javascript">
		var datee = "";
		var titleDatae ="";
		$.ajax({
			type:'get',
			url:'/H_Project/sendArticle.do'
		}).done(function(data) {
			datee = data;
		if(datee != null){
	    var availableTitlee = datee; //< 검색어 리스트
	    var titleDatae = JSON.parse(availableTitlee);
		 console.log(titleDatae); 
		 
		 var Arrayitem= JSON.parse(titleDatae[1]);
		 var Arrayitem1= JSON.parse(titleDatae[2]);
		 var Arrayitem2= JSON.parse(titleDatae[3]);
		 var Arrayitem3= JSON.parse(titleDatae[4]);
		 var Arrayitem4= JSON.parse(titleDatae[5]);
		 var Arrayitem5= JSON.parse(titleDatae[6]);
		 
		 var ctx = $('#myChart');
		    var myChart = new Chart(ctx, {
		        type : "line",
		        data : {
		              labels: [Arrayitem5[0], Arrayitem4[0], Arrayitem3[0], Arrayitem2[0], Arrayitem1[0], Arrayitem[0]]
		            , datasets : [{
		                  label: "조회 수 추이"
		                , data: [Arrayitem5[1], Arrayitem4[1], Arrayitem3[1], Arrayitem2[1], Arrayitem1[1], Arrayitem[1]]
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
		 
		}
		});

    
    
    $('#naverTotal').attr('class', 'navbar navbar-expand-lg navbar-light');
    
   /*  var ctx = $('#myChart');
    var myChart = new Chart(ctx, {
        type : "line",
        data : {
              labels: ["날짜1", "날짜2", "날짜3", "날짜4", "날짜5", "날짜6"]
            , datasets : [{
                  label: "최근 글 조회 수"
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
    }); */
    </script>
</html>
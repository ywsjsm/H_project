<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tc" tagdir="/WEB-INF/tags"%>
<!DOCTYPE html>
<html>
<head>
<%-- <meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet'
	href='https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css'>
<script
	src='https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js'></script>
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js'></script>
<script
	src='https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js'></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script src='<c:url value='/js/head.js' />'></script> --%>



<style type="text/css">
body{
	overflow-x:hidden; 
}
.text-overFlow {
	font-size: 13px;
	overflow: hidden;
	width: 100%;
	height: 60px;
	margin-bottom: 0px;
	-webkit-line-clamp: 3;
	-webkit-box-orient: vertical;
  	text-overflow: ellipsis; 
 	display: -webkit-box;  
}

.title-overFlow{
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}
.card-body {
	padding: 5px;
}

.row.my-underline:hover #title {
	text-decoration: underline;
}

hr#hr1 {
	border: 0;
	height: 1px;
	background-image: -webkit-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0);
	background-image: -moz-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0);
	background-image: -ms-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0);
	background-image: -o-linear-gradient(left, #f0f0f0, #8c8b8b, #f0f0f0);
	margin-top: 0px;
	margin-bottom: 0px;
}

#background{
			position: absolute;
			z-index: -99;
			top: 0;
			left: 0;
			opacity: 0.9;
			height:100%;
			background-size: cover; 
		}
		#noArtilceCard{
			opacity: 0.6;
			display: none;
			margin: auto;
			position: relative;
			top: 0;
			left: -400px;
		}
</style>
<script type="text/javascript">
	$(function(){
		$('#noArtilceCard').slideToggle(1500,function(){
			$('#noArtilceCard').animate({left: '35%'}, 1000,function(){
				$('#noArtilceCard').css('opacity', '1.0');
				setTimeout(function() {
					$('#noArtilceBtn').attr('class', 'btn btn-warning');
				},250);
			});
			
		});
	});

</script>

<title>전체 게시물</title>
</head>
<body>
	<div class="container-fluid"
		style="margin-top: 20px; text-align: center;">
		<div id="background">
			<video src="${contextPath }/video/Boat - 44549.mp4" muted="muted"
				autoplay="autoplay" loop="loop"></video>
		</div>

			<c:if test="${empty articlePage.content}">
				<div class="row" id="noArtilceCard" >
				<div >
					
				<div class="card" style="width: 18rem;" id="">
  <img src="<c:url value='/image/writeArticle.jpg' />" class="card-img-top" alt="...">
  <div class="card-body">
    <h6 class="card-title">(●'◡'●)</h6>
    <p class="card-text">작성 된 글이 없습니다, 첫 글의 주인공이 되어보세요!</p>
    <c:if test="${not empty sessionScope.userInfo }">
    <a href="${contextPath }/write.do" class="btn btn-outline-warning" id="noArtilceBtn">작성하겠습니다 :)</a>
    </c:if>
    <c:if test="${empty sessionScope.userInfo }">
    <a href="${contextPath }/login.do" class="btn btn-outline-warning" id="noArtilceBtn">로그인부터 할게요 :)</a>
    </c:if>
  </div>
</div>
				
					</div>
				</div>
				
			</c:if>
		<c:forEach var="article" items="${articlePage.content }">
			<c:if test="${not empty article }">
				<div class="row my-underline" id="articles"
					style="margin-left: 20%; margin-Right: 20%; text-align: left;">
					<div style="width: 100%; margin-bottom: 30px;" id="content">
						<div class="row no-gutters">
							<div class="col-md-3 rounded">
								<img
									src="/image/${article.userNo}/${article.boardNum}/${article.imageName}"
									class="card-img rounded" alt="이미지를 찾을 수 없습니다..😇" id="listImg"
									style="width: 100%; height: 150px">
							</div>
							<div class="col-md-9 card-body border rounded"
								style="height: 150px; background-color: rgba(255, 255, 255, 0.7);">
								<div class="d-flex justify-content-between">
									<small style="color: FF3399; float: right;"><b><i>Category : <tc:categoryNumConvert categoryNum="${article.categoryNum }" /></i></b></small>
					 		<span class="badge badge-light" style="margin-right: 1.1%;margin-bottom: 1.1%"><small ><b> <i>조회수 ${article.readCount } </i> </b> </small> </span>
								</div>
								<hr id="hr1" />
								<h5 class="card-title title-overFlow" id="title" style="margin-bottom: 0px;">${article.title }</h5>
								<p class="card-text text-overFlow" id="content">${article.content }</p>

								<a href="${contextPath }/read.do?no=${article.boardNum}" class="stretched-link"></a> 									
									<small style="color: gray; margin-left:10px; margin-top: 10px;"><b><i>-Author:${article.userId } </i></b></small>
									<small style="color: #0B3861; float: right;">-<tc:ConversionLocalDataTime date="${article.regdate }"/></small>
							</div>
						</div>
					</div>
				</div>
			</c:if>
		</c:forEach>


		<%@include file="/WEB-INF/view/includes/pagination.jsp"%>


	</div>

</body>
</html>
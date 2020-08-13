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
.text-overFlow {
	font-size: 15px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	width: 100%;
	height: 60px;
	margin-bottom: 0px;
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
			background-size: contain; 
		}
		
		#developers{
			position: absolute;
			bottom: 0;
			color: white;
		}
</style>

<title>전체 게시물</title>
</head>
<body>


	<div class="container-fluid"
		style="margin-top: 20px; text-align: center;">
<div id="background">
	<video muted="muted" autoplay="autoplay" loop="loop" src="${contextPath }/video/Boat - 44549.mp4"></video>
</div>
		<c:forEach var="article" items="${articlePage.content }">
			<c:if test="${empty article}">
				<div class="row">
					<h5>작성 된 글이 없습니다, 첫 글의 주인공이 되어보세요!</h5>
				</div>
			</c:if>
			<c:if test="${not empty article }">
				<div class="row my-underline" id="articles" style="margin-left: 150px; margin-right: 150px; text-align: left;">
					<div style="width: 100%; margin-bottom: 30px;" id="content">
						<div class="row no-gutters">
							<div class="col-md-3">
								<%-- <img src="${contextPath}/image/${article.imageName }" --%>
								<img
									src="/image/${article.userNo}/${article.boardNum}/${article.imageName}"
									class="card-img rounded" alt="이미지를 찾을 수 없습니다..😇" id="listImg"
									style="width: 100%; height: 150px">
							</div>
							<div class="col-md-9 card-body border " style="height: 150px; background-color: rgba(255,255,255,0.7);">
								<div class="d-flex justify-content-between" > 
									<b style="color: green;"><i>Category : <tc:categoryNumConvert categoryNum="${article.categoryNum }" /> </i></b> </small>
									<small style="color: #0000FF;"> <b><i>-Author :${article.userId } </i></b> </small> 
									 
									
									<a role="button" href="" class="btn btn-success btn-sm"
										style="margin-right: 1.1%; margin-bottom: 1px;">
										조회수<span class="badge badge-light">${article.readCount }</span>
									</a>
								</div>
								<hr id="hr1" />
								<h5 class="card-title" id="title" style="margin-bottom: 0px;">${article.title }</h5>
								<p class="card-text text-overFlow" style="white-space: pre-wrap;" id="content">${article.content }</p>

								<a href="${contextPath }/read.do?no=${article.boardNum}" class="stretched-link"></a> 
								<small style="color: #0B3861;">- ${article.regdate }</small>
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
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="convertTime" tagdir="/WEB-INF/tags"  %>
	<%@taglib prefix="category" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<script type="text/javascript">
if(${checkPw}==true){
	alert("삭제 완료");
	
}
</script>

<style>
#background{
			position: absolute;
			z-index: -99;
			top: 0;
			left: 0;
			opacity: 0.9;
			background-size: contain; 
		}
</style>
<c:set var="checkPw" value="false" scope="session"/>
<title>게시물 보기</title>
</head>
<body>
	<div class="border rounded" style="background-color: rgba(255, 255, 255, 0.7); margin-left: 20%; margin-right: 20%;">
	<div id="background">
			<video src="${contextPath }/video/Ocean - 36589.mp4" muted="muted"
				autoplay="autoplay" loop="loop"></video>
		</div>
		<div class="row d-flex justify-content-between">
		<div class="col">
			<h5>
			<br />
				<b style="margin-left: 10px"> <i>Title : ${boardInfo.title }</i></b>
			</h5>
			</div>
			<div>
				<h5>
			<br />
				<small style="color: FF3399; margin-right:20px;"><i><b>- Category : <category:categoryNumConvert categoryNum="${boardInfo.categoryNo}"/></b></i></small>
			</h5>
			</div>
		</div>
		
		<hr  class="border" style="margin-bottom: 2px"/>
		<div class="row">
		<div class="col" style="float: right;">
			<small style="float: right;"><b> <i> Author : ${boardInfo.userId }</i></b></small>
		</div>
		<div class="d-flex justify-content-sm-end" style="margin-bottom: 0px; margin-right: 15px">
			<a role="button" href="" class="col btn btn-success btn-sm" style="margin-right: 1.1% width: 50px; margin-right: 10px;">
  									조회수<span class="badge badge-light">${boardInfo.readCount }</span>
									</a>
		</div>
		</div>
		<div class="row">
		<div class="d-flex justify-content-center" style="margin-left:auto; margin-right:auto; margin-top: 0px; margin-bottom: 0px">
		<figure class="figure">
  <img src="/image/${boardInfo.userNo }/${boardInfo.boardNo }/${boardInfo.imageName }" class="figure-img img-fluid rounded" alt="..." style="max-width: 255px; max-height: 255px">
  <figcaption class="figure-caption" style="font-size: small; font-style: italic;"> -Uploaded : <convertTime:ConversionLocalDataTime dateTime="${boardInfo.regdate}"/></figcaption>
</figure></div>		
		</div>
		<div class="d-flex justify-content-center" style="margin: auto;"><p>${boardInfo.content }</p></div>
		<div class="row">
		<c:if test="${not empty sessionScope.userInfo and sessionScope.userInfo.userId eq boardInfo.userId }">
			<div class="col d-flex justify-content-start">
				<a class="btn btn-outline-info"
					style="margin-left: 50%; width: 100px;"
					href="${contextPath}/modify.do?no=${boardNo}" role="button">Modify</a>
			</div>
					</c:if>
			<c:if test="${not empty sessionScope.userInfo and sessionScope.userInfo.userId eq boardInfo.userId }">
			<!-- 세션정보 아이디와 작성자가 일치할때만 띄움 -->
			<div class="col">
				<a class="btn btn-outline-danger"
					style="margin-left: 50%; width: 100px;"
					href="${contextPath}/delete.do?no=${boardNo}" role="button">Delete</a>
			</div>
			</c:if>
		</div>
		<hr />

		<!-- 댓글란  -->
		<%@include file="/WEB-INF/view/includes/comments.jsp"%>
		
		<!-- 페이지네이션 -->
		<%@include file="/WEB-INF/view/includes/commentPagination.jsp"%>

	</div>
</body>
</html>
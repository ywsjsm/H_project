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
<title>게시물 보기</title>
</head>
<body>
	<div class="container border">
		<div class="row d-flex justify-content-between">
		<div class="col">
			<h5>
			<br />
				<b> <i>Title : ${boardInfo.title }</i></b>
			</h5>
			</div>
			<div class="justify-content-end">
				<h5>
			<br />
				<figcaption class="figure-caption" style="font-size: small; font-style: oblique; margin-right:25px; font-weight: bold; font-size: medium;">- Category : <category:categoryNumConvert categoryNum="${boardInfo.categoryNo}"/></figcaption>
			</h5>
			</div>
		</div>
		
		
		
		<hr  class="border"/>
		<div class="row d-flex justify-content-center">
			<h6>
				<b> <i> Author : ${boardInfo.userId }</i></b>
			</h6>
		</div>
		
		<hr />
		<div class="row" style="white-space: pre-wrap;">
		
		<figure class="figure">
  <img src="${contextPath}/image/${boardInfo.userNo }/${boardInfo.boardNo }/${boardInfo.imageName }" class="figure-img img-fluid rounded" alt="..." style="max-height: 255px;max-width: 255px">
  <figcaption class="figure-caption" style="font-size: small; font-style: italic;"> -Uploaded : <convertTime:ConversionLocalDataTime dateTime="${boardInfo.regdate}"/></figcaption>
</figure>
			<p>${boardInfo.content }</p>		
		</div>
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
					href="${contextPath}/delete.do?no=${pageNo}" role="button">Delete</a>
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
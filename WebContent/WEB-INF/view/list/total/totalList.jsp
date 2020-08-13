<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tc" tagdir="/WEB-INF/tags" %>
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
	height: 46px;
}

.card-body {
	padding: 5px;
}

.row.my-underline:hover #title {
	text-decoration: underline;
}
</style>

<title>전체 게시물</title>
</head>
<body>
	<div class="container-fluid" style="margin-top: 20px">
		<div class="row" id="background" style='background-image: url("${contextPath }/viewImage/404-Pages.jpg");'  >
		h1
		</div>
	
		<c:forEach var="article" items="${articlePage.content }">
		<c:if test="${empty article}">
			<div class="row">
				<h5>작성 된 글이 없습니다, 첫 글의 주인공이 되어보세요!</h5>
			</div>
		</c:if>
		<c:if test="${not empty article }">
			<div class="row my-underline" id="articles">
				<div class="card mb-3" style="width: 100%;" id="content"
					onmouseenter="" onmouseleave="">

					<div class="row no-gutters">
						<div class="col-md-3">
							<%-- <img src="${contextPath}/image/${article.imageName }" --%>
							<img src="/image/${article.userNo}/${article.boardNum}/${article.imageName}"
								class="card-img rounded" alt="이미지를 찾을 수 없습니다..😇" id="listImg"
								style="width: 200px; max-width: 200px; height: 112px; max-height: 112px; margin-top: 8px; margin-left: 7px">
						</div>
						<div class="col-md-9 card-body border ">
						<div class="d-flex justify-content-between">
							<small class="text-muted" style="margin-top: 1.1%"> <b><i>- Author : ${article.userId } / Category : <tc:categoryNumConvert categoryNum="${article.categoryNum }"/></i></b>
							</small>
							<a role="button" href="" class="btn btn-success btn-sm" style="margin-right: 1.1%;margin-top: 5px;margin-bottom: -5px">
  									조회수<span class="badge badge-light">${article.readCount }</span>
									</a>
							</div>
							<hr />
							<h5 class="card-title" id="title">${article.title }</h5> 
							<p class="card-text text-overFlow" style="white-space: pre-wrap;" id="content">${article.content }</p>
								
							<a href="${contextPath }/read.do?no=${article.boardNum}" class="stretched-link"></a>

							<p class="card-text">
								<small class="text-muted">- ${article.regdate }</small>
							</p>
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
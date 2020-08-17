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
#Navar{
	position: fixed;
	top: 0;
	right: 0;
	left: 0;
	z-index: 10;
}
#background{
			position: absolute;
			z-index: -99;
			top: 0;
			left: 0;
			opacity: 0.9;
			background-size: cover; 
			width: 100%;
			height: 200%;
		}
		 #contentModal{
			margin: 0%,10%;
			padding: 0;
			width: 70%;
			height: 70%;
		} 
		body {
	overflow-x: hidden;
}
</style>
<c:set var="checkPw" value="false" scope="session"/>
<title>게시물 보기</title>
</head>
<body >
	<img id="background" alt="" src="${contextPath }/viewImage/readImage/books.jpg">
	<div class="border rounded" style="background-color: rgba(255, 255, 255, 0.7); margin-top:5%; margin-left: 20%; margin-right: 20%;">
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
			<small style="float: right;"><b> <i> - Author : ${boardInfo.userId }</i></b></small>
		</div>
		<div class="d-flex justify-content-sm-end" style="margin-bottom: 0px;margin-left: 1.1%;margin-right: 5%;margin-top: 5%">
		<span class="badge badge-light" style="margin-right: 1.1%;margin-bottom: 1.1%"><small ><b> <i> - 조회수 : ${boardInfo.readCount } </i> </b> </small> </span>
		</div>
		</div>
		<div class="row">
		<div class="d-flex justify-content-center" style="margin-left:auto; margin-right:auto; margin-top: 0px; margin-bottom: 0px">
		<figure class="figure">
  <img src="/image/${boardInfo.userNo }/${boardInfo.boardNo }/${boardInfo.imageName }" id="image" 
  class="figure-img img-fluid rounded" alt="..." style="max-width: 255px; max-height: 255px"
   data-toggle="modal" data-target="#myModal">
  <figcaption class="figure-caption" style="font-size: small; font-style: italic;"> -Uploaded : <convertTime:ConversionLocalDataTime dateTime="${boardInfo.regdate}"/></figcaption>
</figure></div>		
		</div>
		<div class="d-flex justify-content-center" style="margin: auto;"><p>${boardInfo.content }</p></div>
		<div class="row" style="width: 100%">
		<c:if test="${not empty sessionScope.userInfo and sessionScope.userInfo.userId eq boardInfo.userId }">
			<div class="col d-flex justify-content-start">
				<a class="btn btn-outline-info"
					style=" margin-left:10%; width: 10vh;"
					href="${contextPath}/modify.do?no=${boardNo}" role="button">Modify</a>
			</div>
					</c:if>
			<c:if test="${not empty sessionScope.userInfo and sessionScope.userInfo.userId eq boardInfo.userId }">
			<!-- 세션정보 아이디와 작성자가 일치할때만 띄움 -->
			<div class="col d-flex justify-content-end">
				<a class="btn btn-outline-danger"
					style=" width: 10vh;"
					href="${contextPath}/delete.do?no=${boardNo}" role="button">Delete</a>
			</div>
			</c:if>
		</div>
		<hr />

		<!-- 댓글란  -->
		<%@include file="/WEB-INF/view/includes/comments.jsp"%>
		
		<!-- 페이지네이션 -->
		<%@include file="/WEB-INF/view/includes/commentPagination.jsp"%>
		
		<script type="text/javascript">
		$('#myModal').modal("toggle");
		</script>
		<!-- modal -->
		<div class="modal fade" id="myModal">
  <div class="modal-dialog modal-lg" id="contentModal">
    <div class="modal-content" >
      <div class="modal-header">
      	FileName : ${boardInfo.imageName }
      </div>
      <div class="modal-body">
       <img src="/image/${boardInfo.userNo }/${boardInfo.boardNo }/${boardInfo.imageName }" id="image" 
  class="figure-img img-fluid rounded" alt="..." >
      </div>
      <div class="modal-footer">
      	 -Uploaded : <convertTime:ConversionLocalDataTime dateTime="${boardInfo.regdate}"/>
      </div>
    </div>
  </div>
</div>
	
	</div>
</body>
</html>
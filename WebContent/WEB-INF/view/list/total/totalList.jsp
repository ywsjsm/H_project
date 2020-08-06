<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%-- <meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css'>
<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js'></script>
<script src='https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js'></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script src='<c:url value='/js/head.js' />'></script> --%>
<style type="text/css">
		#hoverLink{
			text-decoration: none;
			color: black;
		}	
</style>


<title>전체 게시물</title>
</head>
<body>
			<!-- 해당문 forEach문으로 돌려야함 -->
<div class="container">
	<div class="row">
	<!-- 해당문 forEach문으로 돌려야함 -->
			<div class="card mb-3" style="max-width: 90%;" id="content">
  <div class="row no-gutters">
    <div class="col-md-4">
      <img src="${contextPath}/image/MySQL.jpg" class="card-img" alt="🎊" id="listImg" style="width: 200px" 
       >
    </div>
    <div class="col-md-8">
      <div class="card-body" style="width: 1000px;">
      <a href="${contextPath}/read.do" id="hoverLink">
        <h5 class="card-title">Title</h5>
        <p class="card-text">Content</p>
        <!-- 작성일 -->
        <p class="card-text"><small class="text-muted">RegDate</small></p>
        </a>
      </div>
    </div>
  </div>
</div>
	</div>
	
	<%@include file="/WEB-INF/view/includes/pagination.jsp" %>
	
</div>
			
</body>
</html>
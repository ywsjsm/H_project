<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css'>
<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js'></script>
<script src='https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js'></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Insert title here</title>
</head>
<body>
		<div class="container">
			<div class="row">
				<%@include file="./WEB-INF/view/includes/navbar.jsp" %>
			</div>
			
			<div class="jumbotron">
  <h1 class="display-4">H_Project's main Page</h1>
  <p class="lead">소소한 정보들을 찾고 또 공유해보세요!</p>
  <hr class="my-4">
  <p>회원 가입을 완료하시면 게시와 삭제 이용 가능합니다 :)</p>
  <a class="btn btn-info btn-lg" href="${contextPath}/total.do" role="button">시작하기</a>
</div>
		</div>
		
		<%@ include file="/WEB-INF/view/includes/developers.jspf" %>
</body>
</html>
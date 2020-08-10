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

	<script type="text/javascript">
		$(function(){
			alert('로그아웃을 완료 했습니다. 메인 화면으로 이동합니다.');
			$.ajax({
				type:"get",
				url:"/H_Project"
				
			}).done(function(data){console.log(data);});
		});
	</script>
<title>로그아웃 성공</title>
</head>
<body>
<div class="container">
		<div class="jumbotron">
  <h1 class="display-4">H_Project's main Page</h1>
  <p class="lead">소소한 정보들을 찾고 또 공유해보세요!</p>
  <hr class="my-4">
  <c:if test="${not empty req.id}">
  	<b><i>${req.id} 님 회원가입을 축하합니다.</i></b> 
  </c:if>
  <c:if test="${not empty loginReq.id}">
  	<b><i>${loginReq.id } 님 방문해주셔서 감사합니다 :)</i></b>
  </c:if>
    <c:if test="${empty req.id and loginReq.id}">
  <p>회원 가입을 완료하시면 게시와 삭제 이용 가능합니다 :)</p>
  </c:if>
  <a class="btn btn-info btn-lg" href="${contextPath}/total.do" role="button">시작하기</a>
</div>
		</div>
		
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src='<c:url value='/js/head.js' />'></script>

<title>메인 페이지</title>
</head>
<body>
		<div class="container">
			<div class="row">
			 <%@include file="/WEB-INF/view/includes/navbar.jsp" %> 
			</div>
			
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
  <a class="btn btn-outline-success btn-lg" href="${contextPath}/list/total.do" role="button">시작하기</a>
</div>
		</div>
		
		<%@ include file="/WEB-INF/view/includes/developers.jspf" %>
</body>
</html>
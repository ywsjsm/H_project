<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container-fluid">

				<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="${contextPath}"><b> [H_Project] </b></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="${contextPath}/list/animal.do">동물 <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${contextPath}/list/music.do">음악</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${contextPath}/list/moters.do">자동차</a>
      </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Dropdown
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">경제</a>
          <a class="dropdown-item" href="#">과학</a>
          <a class="dropdown-item" href="#">역사</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="${contextPath}/signUp.do" tabindex="-1" aria-disabled="true">회원가입</a> <!-- disabled -->
      </li>
     <c:if test="${empty sessionScope.userInfo}">
      <li class="nav-item">
        <a class="nav-link" href="${contextPath}/login.do" tabindex="-1" aria-disabled="true">로그인</a> <!-- disabled -->
      </li>
      </c:if>
     <c:if test="${not empty sessionScope.userInfo}">
      <li class="nav-item">
        <a class="nav-link" href="${contextPath}/logout.do" tabindex="-1" aria-disabled="true">로그아웃</a> <!-- disabled -->
      </li>
     </c:if>
    </ul>
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="글찾기" aria-label="글찾기">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">글찾기</button>
    </form>
  </div>
</nav>
		</div>
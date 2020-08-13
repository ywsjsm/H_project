
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src='<c:url value='/js/head.js' />'></script>
	<style type="text/css">
		.backgorund{
			position: absolute;
			z-index: -99;
			top: 0;
			left: 0;
			opacity: 0.9;
			background-size: cover; 
		}
		.container-fluid{
            background-color: rgb(rgba(255, 0, 0, 0), rgba(0, 128, 0, 0), rgba(0, 0, 255, 0));
        }
		#developers{
			position: absolute;
			bottom: 0;
			color: white;
		}
		.row.mainText{
			position: fixed;
			left: 30%;
			top: 50%;
			size: 50%;
		}
		.row.text{
		color: white;
		font-style: italic;	
		}
		#mainText1{
		position: absolute;
		  /* left: 40px; */
		   top: 40%;
		   opacity: 0.0;
		   color: white;
		}
	#mainPara{
		position: fixed;
		top: 45%;
		white-space: pre-wrap;
	}
	.form-group.formLabel{
	color: white;
	font-weight: lighter;
	}
	#formIdHelp,#formPasswordHelp,#rememberId{
	color:orange;
	font-weight: lighter;
	}
	#mainLoginForm{
		display :none;
		position: absolute;
		left: 10%;
		top: 30%;
		width: 300px;
		height: 340px;
	}
	#test{
	display: none;
	color: orange;
	font-weight: 500;
	font-style: italic;
	}
	#mainBtn:hover{
		color: black;
	}
	 body {
	 overflow:hidden;
	 }
	</style>
<title>메인 페이지</title>
</head>
<body>
	

			 <%@include file="/WEB-INF/view/includes/navbar.jsp" %> 
		<div class="container-fluid">
			<div class="row">
			</div>
			<div class="backgorund">
				<video src='<c:url value='/video/Drone - 32657.mp4' />' autoplay="autoplay" loop="loop" muted="muted" ></video>
			</div>	
				<span id="mainText1" style="left: 10%; position: relative; left: 200px;"><h4>H - PROjECT</h4></span>
			
		<div class="row mainText"  id="mainText">
                <div class="col d-flex justify-content-center" style="flex-direction: column;" >

                    <div class="row text  justify-content-center" >
                    <p id="mainPara">소소한 정보들을 찾고 이야기를 나누어 보세요.     
                   <c:if test="${not empty userInfo }"><p id="test">어서오세요. ${userInfo.userName } 님, 오늘도 반갑습니다.</p></c:if> </p>  
                    <c:if test="${empty userInfo }">
                    	<p id="guide1">회원 가입 후에 글 작성 및 댓글 작성이 가능합니다.</p>
                    </c:if>
                    </div>
                    <div class="row butnStart">
                    	<a href="${contextPath }/list/total.do" role="button" style="position: fixed;" class="btn btn-outline-dark" id="mainBtn"> 시작 </a>
                    </div>
                </div>
         </div>
        <c:if test="${empty userInfo }">
			<!-- 로그인 폼 -->
			<form  class="border" id="mainLoginForm" action="${contextPath }/main/login.do" method="post">
			<c:if test="${errors.memberNotFound}">
    <small id="formIdHelp" class="form-text text-muted error" ><label id="formIdHelp">존재하지않는 회원입니다.</label></small>
    </c:if>
  <div class="form-group formLabel" >
    <label for="formId" id="formIdLabel">ID</label>
    <input type="text" class="form-control form-control-sm" id="formId" name="formId" aria-describedby="emailHelp" 
    required="required" value="${loginReq.id }">
    <c:if test="${errors.id}">
    <small id="formIdHelp" class="form-text text-muted error" ><label id="formIdHelp">공백은 허용하지 않습니다.</label></small>
    </c:if>
  </div>
  <div class="form-group formLabel" id="formLabel">
    <label for="formPassword">Password</label>
    <input type="password" class="form-control form-control-sm" id="formPassword" name="formPassword" required="required">
    <c:if test="${errors.password }">
    <small id="formPasswordHelp" class="form-text text-muted"><label id="formPasswordHelp">공백은 허용하지 않습니다.</label></small>
    </c:if>
    <c:if test="${not errors.password and errors.passwordNotMatch }">
    <small id="formPasswordHelp" class="form-text text-muted"><label id="formPasswordHelp">비밀번호가 일치하지 않습니다.</label></small>
    </c:if>
  </div>
  <div class="form-group form-check">
    <input type="checkbox" class="form-check-input" id="exampleCheck1">
    <label class="form-group formLabel" id="rememberId" for="exampleCheck1">Check me out</label>
  </div>
  <button type="submit" class="btn btn-outline-warning">Submit</button>
</form>
</c:if>
			
		
		<%@ include file="/WEB-INF/view/includes/developers.jspf" %>
		</div>
</body>
</html>
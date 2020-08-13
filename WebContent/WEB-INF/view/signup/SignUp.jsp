<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%-- <meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css'>
<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js'></script>
<script src='https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js'></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script> --%>
<%--  <script src='<c:url value='/js/head.js' />'></script>   --%>

<style type="text/css">
	#signup{
		margin-left: 30%;
	}
	#btnSignUp{
		position: relative;
	}
	#background{
			position: absolute;
			z-index: -99;
			top: 0;
			left: 0;
			opacity: 0.9;
			background-size: contain; 
		}
	.container-fluid{
	background-color: rgb(rgba(255, 0, 0, 0), rgba(0, 128, 0, 0), rgba(0, 0, 255, 0));
	}
	.input{
	color: white;
	}
	.help{
		color: orange;
	}
	body {
	 overflow:hidden;
	 }
</style>
<title>SignUp</title>
</head>
<body>
 <script type="text/javascript">
 $(function(){
	
	setInterval(checkForm, 1000);
/* 	 var check  = new Array();  
  $('#btnSignUp').mouseenter(function() {
	 $('#btnSignUp').attr("class", 'btn btn-outline-warning');
	 if($('#inputEmail').val().trim().length > 0){			 
		 check.push($('#inputEmail').val());//<<
			 }
	 $('input:text').each(function(i, element) {
		 if($(element).val().trim().length > 0){			 
	 	check.push($(element).val());//<<
		 }
	 });
	 $('input:password').each(function(i, element) {
		 if($(element).val().trim().length > 0){			 
			 check.push($(element).val());//<<
				 }
		 });
	 console.log($(check).length);
	 
	
 });  */
 function checkForm(){
	 var check  = new Array();  
		 $('#btnSignUp').attr("class", 'btn btn-outline-warning');
		 if($('#inputEmail').val().trim().length > 0){			 
			 check.push($('#inputEmail').val());//<<
				 }
		/*  check.push($('#inputEmail').val()); */
		 $('input:text').each(function(i, element) {
			 if($(element).val().trim().length > 0){			 
		 	check.push($(element).val());//<<
			 }
		 });
		/* check += $('#inputEmail').val(); */
		 $('input:password').each(function(i, element) {
			 if($(element).val().trim().length > 0){			 
				 check.push($(element).val());//<<
					 }/* 
			 	check.push($(element).val()); */
			 });
		console.log($(check).length);
			if($(check).length == 5){
			//	var obj = $('<i class="far fa-address-card fa-spin fa-fw"></i>');// fa-spin fa-fw
			$('#card').attr("class", "far fa-address-card fa-spin fa-fw");
			//버튼 애니메이션 구현
			$('#btnSignUp').animate({
				left:'+=10px'
			},200);
			$('#btnSignUp').animate({
				left:'-=20px'
			},200);
			$('#btnSignUp').animate({
				left:'+=10px'
			},200);
		}else{
			$('#card').attr("class", "far fa-address-card");
		}

 }
 
 $('#btnSignUp').mouseout(function() {
	 $('#btnSignUp').attr("class", 'btn btn-outline-secondary');
 });
 });
</script>

	
	<div class="container-fluid">
	<div id="background">
		<video src="${contextPath }/video/Sea - 24216.mp4" muted="muted" autoplay="autoplay" loop="loop"></video>
	</div>
	<form id="signup" action="${contextPath }/signUp.do"  style="width: 40%" method="post">
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail" class="input">Email</label>
      <input type="email" class="form-control" id="inputEmail" placeholder="이메일" name="email" required="required" value="${req.email}">
    <c:if test="${errors.email}">
    	<small id="emailHelp" class="form-text text-muted"><label class="help">공백은 허용하지 않습니다.</label></small>
    </c:if>
    <c:if test="${errors.emailnotmatch}">
    	<small id="emailHelp" class="form-text text-muted"><label class="help">이메일이 형식에 맞지 않습니다.</label></small>
    </c:if>
    <c:if test="${errors.dulicateEmail}">
    	<small id="emailHelp" class="form-text text-muted"><label class="help">중복된 이메일 입니다.</label></small>
    </c:if>
    </div>
    
    
    <div class="form-group col-md-6">
      <label for="inputName" class="input">Name</label>
      <input type="text" class="form-control" id="inputName" placeholder="사용자 이름" name="name" required="required" value="${req.name}">
    	 <c:if test="${errors.name}">
    	<small id="nameHelp" class="form-text text-muted"><label class="help">공백은 허용하지 않습니다.</label></small>
    </c:if>
    </div>
  </div>
  
  <div class="form-group">
    <label for="inputId" class="input">Id</label>
    <input type="text" class="form-control" id="inputId" placeholder="아이디" name="id" required="required" value="${req.id}">
    <c:if test="${errors.id}">
    	<small id="idHelp" class="form-text text-muted"><label class="help">공백은 허용하지 않습니다.</label></small>
    </c:if>
  </div>
  
  <div class="form-group">
    <label for="inputPassword" class="input">Password</label>
    <input type="password" class="form-control" id="inputPassword" placeholder="비밀번호" name="password" required="required">
    <c:if test="${errors.password}">
    	<small id="passwordHelp" class="form-text text-muted"><label class="help">공백은 허용하지 않습니다.</label></small>
    </c:if>
  </div>
  
  <div class="form-group">
    <label for="inputConfirmPassword" class="input">ConfirmPassword</label>
    <input type="password" class="form-control" id="inputConfirmPassword" placeholder="비밀번호 확인" name="confirmPassword" required="required">
  <c:if test="${errors.confirmPassword}">
    	<small id="confirmPasswordHelp" class="form-text text-muted"><label class="help">공백은 허용하지 않습니다.</label></small>
    </c:if>
    <c:if test="${errors.confirmPasswordNotMatching}">
    	<small id="confirmPasswordHelp" class="form-text text-muted"><label class="help">비밀번호와 확인이 일치하지 않습니다.</label></small>
    </c:if>
  </div>
  
  <div class="form-group">
    <div class="form-check">
      <input class="form-check-input" type="checkbox" id="agree" required="required" name="agree" >
      <label class="form-check-label" for="agree">
        Agree to terms and conditions
      </label>
    </div>
  </div>
  <button type="button" class="btn btn-outline-secondary" id="btnSignUp">Sign in</button>
&nbsp;&nbsp;&nbsp; <i class="far fa-address-card" id="card"></i>
</form>
  
  </div>

	
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- 회원가입 완료 창<<<<<<< -->
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css'>
<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js'></script>
<script src='https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js'></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
	
	<script type="text/javascript">
	$(function(){			
				alert('회원가입이 완료되었습니다.');
			$.ajax({
				type:"get",
				url :"/H_Project/login.do"
				}).done(function(data){
				 		 $('body').empty();
						$('body').append(data); 	 
					});

		
	});

	</script>
<style type="text/css">
	#signup{
		margin-left: 30%;
	}
</style>
<title>SignUpComplete!</title>
</head>
<body>
	
	<input type="hidden" id="hideFlag" value="check"  />
	<div class="container">
	<form id="signup" style="width: 40%" method="post">
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail">Email</label>
      <input type="email" class="form-control" id="inputEmail" placeholder="이메일" name="email" required="required" value="${req.email}">
    <c:if test="${errors.email}">
    	<small id="emailHelp" class="form-text text-muted">공백은 허용하지 않습니다.</small>
    </c:if>
    <c:if test="${errors.emailnotmatch}">
    	<small id="emailHelp" class="form-text text-muted">이메일이 형식에 맞지 않습니다.</small>
    </c:if>
    <c:if test="${errors.dulicateEmail}">
    	<small id="emailHelp" class="form-text text-muted">중복된 이메일 입니다.</small>
    </c:if>
    </div>
    
    
    <div class="form-group col-md-6">
      <label for="inputName">Name</label>
      <input type="text" class="form-control" id="inputName" placeholder="사용자 이름" name="name" required="required" value="${req.name}">
    	 <c:if test="${errors.name}">
    	<small id="nameHelp" class="form-text text-muted">공백은 허용하지 않습니다.</small>
    </c:if>
    </div>
  </div>
  
  <div class="form-group">
    <label for="inputId">Id</label>
    <input type="text" class="form-control" id="inputId" placeholder="아이디" name="id" required="required" value="${req.id}">
    <c:if test="${errors.id}">
    	<small id="idHelp" class="form-text text-muted">공백은 허용하지 않습니다.</small>
    </c:if>
  </div>
  
  <div class="form-group">
    <label for="inputPassword">Password</label>
    <input type="password" class="form-control" id="inputPassword" placeholder="비밀번호" name="password" required="required">
    <c:if test="${errors.password}">
    	<small id="passwordHelp" class="form-text text-muted">공백은 허용하지 않습니다.</small>
    </c:if>
  </div>
  
  <div class="form-group">
    <label for="inputConfirmPassword">ConfirmPassword</label>
    <input type="password" class="form-control" id="inputConfirmPassword" placeholder="비밀번호 확인" name="confirmPassword" required="required">
  <c:if test="${errors.confirmPassword}">
    	<small id="confirmPasswordHelp" class="form-text text-muted">공백은 허용하지 않습니다.</small>
    </c:if>
    <c:if test="${errors.confirmPasswordNotMatching}">
    	<small id="confirmPasswordHelp" class="form-text text-muted">비밀번호와 확인이 일치하지 않습니다.</small>
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
  <button type="button" class="btn btn-primary" id="btnSignUp">Sign in</button>
</form>
  
  </div>

	
</body>
</html>
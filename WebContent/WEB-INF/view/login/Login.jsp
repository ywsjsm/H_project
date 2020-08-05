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


<title>로그인</title>

	<style type="text/css">
		#LoginForm{
			width: 40%;
			margin-left: 30%;
		}
	</style>
</head>
<body>
	<div class="container">
		<%-- <div class="row">
				<%@include file="/WEB-INF/view/includes/navbar.jsp" %>
			</div> --%>
			
	<form id="LoginForm">
  <div class="form-group">
    <label for="Id">Id</label>
    <input type="text" class="form-control" id="Id" aria-describedby="IdHelp" required="required " name="id"
     placeholder="input your Id">
    <small id="Id" class="form-text text-muted">아이디오류</small>
  </div>
  <div class="form-group">
    <label for="Password">Password</label>
    <input type="password" class="form-control" id="Password" required="required" name="password" placeholder="input your password">
  <small id="PasswordHelp" class="form-text text-muted">패스워드 오류</small>
  </div>
  <div class="form-group">
    <label for="ConfirmPassword">ConfirmPassword</label>
    <input type="password" class="form-control" id="ConfirmPassword" required="required" name="confirmPassword" placeholder="input your ConfirmPassword">
  <small id="ConfirmPasswordHelp" class="form-text text-muted">패스워드 확인 오류</small>
  </div>
  <div class="form-group form-check">
    <input type="checkbox" class="form-check-input" id="RemeberId" name="rememberId">
    <label class="form-check-label" for="RemeberId" >Remember my Id</label>
  </div>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
			
	</div>
</body>
</html>
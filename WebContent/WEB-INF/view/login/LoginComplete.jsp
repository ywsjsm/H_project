<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- <meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css'>
<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js'></script>
<script src='https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js'></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script> -->

<style type="text/css">
#LoginForm {
	width: 40%;
	margin-left: 30%;
}
</style>
<title>Login Complete!</title>
<script type="text/javascript">
$(function(){			
		alert('로그인에 성공했습니다.');
		$.ajax({
			type: 'get',
			url:'/H_Project',
		}).done(function(data){
			$('html').empty();
			$('html').append(data); 	
		});

});
</script>
</head>
<body>
	<div class="container">
		<form  method="post" id="LoginForm">
			<div class="form-group">
				<label for="Id">Id</label> 
				<input type="text" class="form-control" id="Id" aria-describedby="IdHelp"
				 value="${UserIdCookie}" required="required " name="id" placeholder="input your Id"> 
					<c:if test="${errors.id}">
					<small id="Id" class="form-text text-muted">공백은 허용하지 않습니다.</small>
					</c:if>
					<c:if test="${!errors.id and errors.memberNotFound}">
					<small id="Id" class="form-text text-muted">해당 아이디는 존재하지 않습니다.</small>
					</c:if>
			</div>
			<div class="form-group">
				<label for="Password">Password</label> 
				<input type="password"
				value="${loginReq.password}" class="form-control" id="Password" required="required" name="password" placeholder="input your password"> 
					<c:if test="${errors.password}">
					<small id="Id" class="form-text text-muted">공백은 허용하지 않습니다.</small>
					</c:if>
					<c:if test="${errors.passwordNotMatch}">
					<small id="Id" class="form-text text-muted">비밀번호가 일치하지 않습니다.</small>
					</c:if>
			</div>
			
			<div class="form-group form-check">
				<input type="checkbox" class="form-check-input" id="RemeberId" name="rememberId" checked="checked"> 
				<label class="form-check-label" for="RemeberId">Remember my Id</label>
			</div>
			<button type="button" class="btn btn-outline-primary" id="loginBtn">Login</button>
		</form>

	</div>
</body>
</html>
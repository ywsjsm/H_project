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
	
	<script type="text/javascript">/* 클릭일 필요는 없다. */
		
	</script>
	
<style type="text/css">
	#signup{
		margin-left: 30%;
	}
</style>
<title>SignUp</title>
</head>
<body>
	<div class="container">
	
	<form id="signup" style="width: 40%" method="post">
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail">Email</label>
      <input type="email" class="form-control" id="inputEmail" placeholder="이메일" name="email" required="required">
    </div>
    <div class="form-group col-md-6">
      <label for="inputName">Name</label>
      <input type="text" class="form-control" id="inputName" placeholder="사용자 이름" name="name" required="required">
    </div>
  </div>
  <div class="form-group">
    <label for="inputId">Id</label>
    <input type="text" class="form-control" id="inputId" placeholder="아이디" name="id" required="required">
  </div>
  <div class="form-group">
    <label for="inputPassword">Password</label>
    <input type="text" class="form-control" id="inputPassword" placeholder="비밀번호" name="password" required="required">
  </div>
  <div class="form-group">
    <label for="inputConfirmPassword">ConfirmPassword</label>
    <input type="text" class="form-control" id="inputConfirmPassword" placeholder="비밀번호 확인" name="confirmPassword" required="required">
  </div>
  
  <div class="form-group">
    <div class="form-check">
      <input class="form-check-input" type="checkbox" id="agree" required="required" name="agree">
      <label class="form-check-label" for="agree">
        Agree to terms and conditions
      </label>
    </div>
  </div>
  <button type="submit" class="btn btn-primary" >Sign in</button>
  
</form>
  
  </div>

	
</body>
</html>
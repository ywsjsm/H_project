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
<title>회원 탈퇴</title>
</head>
<body>
<%-- 	<form action="" method="post">
	기존 계정 존재 하지 않음 : ${ errors.userNotMatching} <br />
	<input type="hidden" name="email" value="${userInfo.userEmail}" />
	<input type="hidden" name="id" value="${userInfo.userId}" />
		<input type="hidden" name="name" value="${userInfo.userName}" />
	
		비밀번호<input type="password" name="password" id="" /> <br />
		<c:if test="${errors.password }">
    	<small id="PasswordWhitePasswordHelp" class="form-text text-muted">공백은 허용하지 않습니다.</small>
    </c:if>
     <c:if test="${! errors.confirmPassword and  errors.passwordNotMatching}">
    	<small id="paswordMatchingHelp" class="form-text text-muted">가입정보와 일치하지 않습니다.</small>
   		</c:if>
    
		비밀번호 확인<input type="password" name="confirmPassword" id="" /><br />
		<c:if test="${errors.confirmPassword }">
    	<small id="ConfirmPasswordWhitePasswordHelp" class="form-text text-muted">공백은 허용하지 않습니다.</small>
   		</c:if>
   		<c:if test="${!errors.passwordNotMatching and  !errors.confirmPassword and errors.confirmPasswordNotMatching }">
    	<small id="ConfirmPaswordMatchingHelp" class="form-text text-muted">입력된 비밀번호와 일치하지 않습니다.</small>
   		</c:if>
   		<input type="checkbox" name="agree" id="" />
		<input type="submit" value="test" />
	</form> --%>
	
	
 	<div class="container d-flex justify-content-center">
<form method="post" action="${contextPath }/withDrawal.do" style="width: 40%">
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail">Email</label>
      <input type="email" class="form-control" id="inputEmail" name="email" readonly="readonly" required="required" value="${userInfo.userEmail}">
    </div>
    <div class="form-group col-md-6">
      <label for="inputName">Name</label>
      <input type="text" class="form-control" id="inputName" name="name" readonly="readonly" required="required" value="${userInfo.userName }">
    </div>
  </div>
  <div class="form-group">
    <label for="inputId">Id</label>
    <input type="text" class="form-control" id="inputId" name="id" readonly="readonly" required="required" value="${userInfo.userId }">
  </div>
  <div class="form-group">
    <label for="inputPassword">Password</label>
    <input type="password" class="form-control" id="inputPassword" placeholder="InputYourPassword Please" required="required" name="password">
  <c:if test="${errors.password }">
    	<small id="PasswordWhitePasswordHelp" class="form-text text-muted">공백은 허용하지 않습니다.</small>
    </c:if>
     <c:if test="${! errors.password and  errors.passwordNotMatching}">
    	<small id="paswordMatchingHelp" class="form-text text-muted">가입정보와 일치하지 않습니다.</small>
   		</c:if>
  </div>
  <div class="form-group">
    <label for="inputConfirmPassword">ConfirmPassword</label>
    <input type="password" class="form-control" id="inputConfirmPassword" placeholder="InputYourConfirmPassword Please" required="required" name="confirmPassword">
  	<c:if test="${errors.confirmPassword }">
    	<small id="ConfirmPasswordWhitePasswordHelp" class="form-text text-muted">공백은 허용하지 않습니다.</small>
   		</c:if>
   		<c:if test="${errors.confirmPasswordNotMatching}">
    	<small id="ConfirmPaswordMatchingHelp" class="form-text text-muted">입력된 비밀번호와 일치하지 않습니다.</small>
   		</c:if>
   		<c:if test="${!errors.passwordNotMatching and  !errors.confirmPassword and errors.confirmPasswordNotMatching }">
    	<small id="ConfirmPaswordMatchingHelp" class="form-text text-muted">입력된 비밀번호와 일치하지 않습니다.</small>
   		</c:if>
  </div>
 
  <div class="form-group">
    <div class="form-check">
      <input class="form-check-input" type="checkbox" id="gridCheck" name="agree" required="required">
      <label class="form-check-label" for="gridCheck">
        Agree to Delete Your data From Web Data, and Our Conditions.
      </label>
    </div>
  </div>
  <button type="submit" class="btn btn-outline-danger">WithDrawal</button>
</form>
</div> 
  
</body>
</html>
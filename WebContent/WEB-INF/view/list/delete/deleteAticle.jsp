<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@taglib prefix="convertTime" tagdir="/WEB-INF/tags"  %>
	<%@taglib prefix="category" tagdir="/WEB-INF/tags" %>
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
<title>게시글 삭제</title>
</head>
<body>
<style>
#background{
	position: absolute;
	z-index: -99;
	top: 0;
	left: 0;
	opacity: 0.9;
	width:100vw;
	height:150%;
	/* background-image:url('${contextPath}/viewImage/deleteImage/pen.jpg'); */
	background-size: cover; 
}
#testD{
	
}
</style>
	<img id="background" alt="" src="${contextPath}/viewImage/deleteImage/pen.jpg"></img>
<div class="container border" style="background-color: rgba(255, 255, 255, 0.7)" >
	
	<div id="background">
		</div>
	<div class="">
	<div class="row d-flex justify-content-between">
		<div class="col">
			<h5>
			<br />
				<b> <i>Title : ${boardInfo.title }</i></b>
			</h5>
			</div>
			<div class="justify-content-end">
				<h5>
			<br />
				<figcaption class="figure-caption" style="font-size: small; font-style: oblique; margin-right:25px; font-weight: bold; font-size: medium;">- Category : <category:categoryNumConvert categoryNum="${boardInfo.categoryNo}"/></figcaption>
			</h5>
			</div>
		</div>
		
		<hr  class="border"/>
		<div class="row">
		<div class="col d-flex justify-content-center" style="margin-bottom: -5px; padding-bottom: 0px;padding-top: 10px;margin-top: -5px">
			<h6>
				<b> <i> Author : ${boardInfo.userId }</i></b>
			</h6>
		</div>
		<!-- <div class="d-flex justify-content-sm-end" style="margin-bottom: 0px;"> -->
			<span class="badge badge-light" style="margin-right: 1.1%;margin-bottom: 1.1%"><small ><b> <i> - 조회수 : ${boardInfo.readCount } </i> </b> </small> </span>
<!-- 		</div> -->
		</div>
		
		<hr />
		<div class="row" style="white-space: pre-wrap;">
		
		<figure class="figure">
 <img src="/image/${boardInfo.userNo }/${boardInfo.boardNo }/${boardInfo.imageName }" class="figure-img img-fluid rounded" alt="..." style="max-width: 255px;max-height: 255px">
  <figcaption class="figure-caption" style="font-size: small; font-style: italic;"> -Uploaded : <convertTime:ConversionLocalDataTime dateTime="${boardInfo.regdate}"/></figcaption>
</figure>
			<p>${boardInfo.content }</p>		
		</div>
		
				<hr />
				
			<form action="${contextPath }/delete.do" method="post" class="form-group">
				<input type="hidden" name="no" value="${boardInfo.boardNo }" />
    			<label for="Password">Password</label>
    			<input class="form-control form-control-sm" id="Password" name="password"
    			placeholder="Input Your Password" type="text"  style="width: 50%;" required="required">
    			<c:if test="${errors.password}">
					<small id="password" class="form-text text-muted">공백은 허용하지 않습니다.</small>
					</c:if>
					<c:if test="${empty errors.password and not empty errors.passwordNotMatch}">
					<small id="passwordNotMatch" class="form-text text-muted">맞지 않는 비밀번호 입니다.</small>
					</c:if>
				<label for="ConfirmPassword">ConfirmPassword</label>
    			<input class="form-control form-control-sm" id="ConfirmPassword" name="confirmPassword"
    			placeholder="Input Your Password Again" type="text"  style="width: 50%;" required="required">
    			<c:if test="${errors.confirmPassword}">
					<small id="password" class="form-text text-muted">공백은 허용하지 않습니다.</small>
					</c:if>
					<c:if test="${empty errors.password and empty errors.confirmPassword and errors.passwordConfirmPasswordNotMatch}">
					<small id="passwordConfirmPasswordNotMatch" class="form-text text-muted">비밀번호와 확인이 일치하지 않습니다.</small>
					</c:if>
    			<br />
    			<c:if test="${errors.NotMatchUser}">
					<small id="NotMatchUser" class="form-text text-muted">일치하지 않는 유저 입니다./small>
					</c:if>
    			<button type="submit" class="btn btn-danger btn-sm" style="width: 70px;">Delete</button>
			</form>
		</div>
		</div>
</body>
</html>
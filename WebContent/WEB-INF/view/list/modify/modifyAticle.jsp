<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="convertTime" tagdir="/WEB-INF/tags" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>게시물 수정</title>
</head>
<body>
	<div class="container" >
	<%-- <input type="hidden" name="no" value="${boardInfo.boardNo}" /> --%>
		<div class="row justify-content-center">
				<h5 > <i>Modify your Infomation :)</i></h5>			
		</div>
		<div class="row justify-content-center">			
			<form method="post" action="${contextPath }/modify.do" style="width: 500px;" enctype="multipart/form-data">
			<input type="hidden" name="no" value="${boardInfo.boardNo}" />
			<div class="form-group">
					<label for="Title">Category</label>
					<select name="category" class="custom-select" id="validatedInputGroupSelect" required>
					<c:choose>
						<c:when test="${boardInfo.categoryNo eq 1}">
							<option value="1" selected="selected">동물</option>
							<option value="2">음악</option>
       					<option value="3">자동차</option>
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${boardInfo.categoryNo eq 2}">
						<option value="1">동물</option>
						<option value="2" selected="selected">음악</option>
       					<option value="3">자동차</option>
						</c:when>
					</c:choose>
					<c:choose>
						<c:when test="${boardInfo.categoryNo eq 3}">
							<option value="1">동물</option>
       						<option value="2">음악</option>
							<option value="3" selected="selected">자동차</option>
						</c:when>
					</c:choose>
        				<!-- <option value="1">동물</option>
       					<option value="2">음악</option>
       					<option value="3">자동차</option> -->
     				</select>
				</div>
			
  <div class="form-group">
    <label for="Title">Title</label>
    <input type="text" class="form-control" id="Title" placeholder="input title" required="required" name="title" value="${boardInfo.title}">

  </div>
  <div class="form-group">
    <label for="content">Infomations</label>
    <textarea class="form-control" id="content" rows="10" placeholder="Your Infomations Write Here!" name="content" style="white-space: pre-wrap;">${boardInfo.content}
    </textarea>
    <div class="form-group">
     <label for="ImgInfo">Your Image <c:if test="${not empty boardInfo.imageName }">
       : <i style="font-weight: 100;text-decoration: underline;">${boardInfo.imageName }</i>
     </c:if></label>
     <br />
     
     <c:if test="${not empty  boardInfo.imageName}">
     <figure class="figure border">
  <img src="${contextPath}/image/${boardInfo.imageName }" class="figure-img img-fluid rounded" alt="..." style="max-width: 255px;max-height: 255px">
   <figcaption class="figure-caption" style="font-size: small; font-style: italic;"> -Uploaded : <convertTime:ConversionLocalDataTime dateTime="${boardInfo.regdate}"/></figcaption>
</figure>
</c:if>
    
    </div>
  </div>
  
  <div class="row justify-content-center">
  		<div class="form-group">
    	<label for="Image">Upload Your Image!</label>
    	<input type="file" class="form-control-file" id="Image" name="fileName" >
  		</div>
		</div>
		
		<div class="col d-flex justify-content-between">
		<a class="btn btn-outline-danger" href="${contextPath}/total.do" role="button">Back</a>
		 <button id="modifyBtn" type="submit" class="btn btn-outline-success">Modify</button>
  	</div>


</form>			
		</div>
		
		
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="convertTime" tagdir="/WEB-INF/tags" %>
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
	<input type="hidden" name="no" value="${boardInfo.boardNo}" />
		<div class="row justify-content-center">
				<h5 > <i>Modify your Infomation :)</i></h5>			
		</div>
		<div class="row justify-content-center">			
			<form method="post" action="${contextPath }/modify.do" style="width: 500px;" enctype="multipart/form-data">
  <div class="form-group">
    <label for="Title">Title</label>
    <input type="text" class="form-control" id="Title" placeholder="input title" required="required" name="title" value="${boardInfo.title}">
  	<c:if test="${errors.title}">
					<small id="title" class="form-text text-muted">공백은 허용하지 않습니다.</small>
	</c:if>
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
		 <button type="submit" class="btn btn-outline-success">Write</button>
  	</div>


</form>			
		</div>
		
		
	</div>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%-- <meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet'
	href='https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css'>
<script
	src='https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js'></script>
<script
	src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js'></script>
<script
	src='https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js'></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script src='<c:url value='/js/head.js' />'></script> --%>

<script type="text/javascript">
	$(function(){
		$('#articles').mouseenter(function(){
			console.log('active!')
			$('#listImg')	.fadeOut();
		});
		
		$('#articles').mouseenter(function(){
			$('#listImg')	.animate({height : '112px', width: '200px'});
		});
		
		$('card mb-3').mouseenter(function(){
			alert('작동')
			$('card mb-3').children('.card-title').css('text-decoration','underline');
		});
		
	});
</script>


<title>전체 게시물</title>
</head>
<body>
	<div class="container">
	<c:forEach var="article" items="${articlePage.content }">
		<div class="row" id="articles">
			<!-- 해당문 forEach문으로 돌려야함 -->
			<div class="card mb-3" style=" width: 100%; " id="content" onmouseenter="" onmouseleave="">

				<div class="row no-gutters">
					<div class="col-md-4">
						<img src="${contextPath}/image/${article.imageName }" 
						class="card-img rounded" alt="이미지를 찾을 수 없습니다..😇" id="listImg" 
						style="width: 200px; max-width: 200px; height:112px; max-height: 112px; margin-top: 8px; margin-left: 7px">
					</div>
					<div class="col-md-8" >
					

						<div class="card-body border" style="width: inherit;height: inherit; ">
								<h5 class="card-title" >${article.title }</h5>
								<p class="card-text" style="white-space: pre-wrap;">${article.content }</p> <!-- 작성일 -->
								<a href="" class="stretched-link"></a>
								<p class="card-text"><small class="text-muted">${article.regdate }</small></p>
						</div>
							
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
	
	
		<%@include file="/WEB-INF/view/includes/pagination.jsp"%>


	</div>

</body>
</html>
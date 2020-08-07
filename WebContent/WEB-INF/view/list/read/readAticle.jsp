<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<title>게시물 보기</title>
</head>
<body>
	<div class="container border">
		<div class="row d-flex justify-content-between">
			<h5>
				<b> <i>${boardInfo.title }</i></b>
			</h5>
		</div>
		<hr />
		<div class="row" style="white-space: pre-wrap;">
		
		<figure class="figure">
  <img src="${contextPath}/image/${boardInfo.imageName }" class="figure-img img-fluid rounded" alt="..." style="max-height: 255px;max-width: 255px">
  <figcaption class="figure-caption">Uploaded \${boardInfo.등록일}</figcaption>
</figure>
		<%-- <img src="${contextPath}/image/${boardInfo.imageName }" class="img-fluid" alt="Responsive image" style="align-content: center;"/> --%>
			<p>${boardInfo.content }</p>		
		</div>
		<div class="row">
			<div class="col d-flex justify-content-start">
				<a class="btn btn-outline-info"
					style="margin-left: 50%; width: 100px;"
					href="${contextPath}/modify.do?no=${pageNo}" role="button">Modify</a>
			</div>
			<!-- 세션정보 아이디와 작성자가 일치할때만 띄움 -->
			<div class="col">
				<a class="btn btn-outline-danger"
					style="margin-left: 50%; width: 100px;"
					href="${contextPath}/delete.do" role="button">Delete</a>
			</div>
		</div>
		<hr />
		<!-- 로그인 정보에 따라 활성화 -->
		<form>
			<div class="form-group">
				<div class="col">
					<div class="row">
						<input class="form-control form-control-sm" type="text"
							placeholder="Enter Your Opinions" name="content"
							style="width: 90%;" required="required">
						<button type="submit" class="btn btn-success btn-sm"
							style="width: 70px">Enter</button>
					</div>
				</div>
			</div>
		</form>
		<!--  -->

		<!-- 댓글란 -->

		<div class="form-group">
			<div class="col">
				<div class="row">
					<input class="form-control form-control-sm" value="Coment"
						type="text" style="width: 90%;" readonly="readonly">
					<!-- 해당버튼은 유저아이디와 개시한 댓글 아이디가 같은 경우 사용 -->
					<button type="submit" class="btn btn-danger btn-sm"
						style="width: 70px;">Delete</button>
					<!--  -->
				</div>
			</div>
		</div>
		</form>


		<!-- 페이지네이션 -->
		<div class="col d-flex justify-content-center">
			<nav aria-label="...">
				<ul class="pagination pagination-sm">
					<li class="page-item disabled"><a class="page-link" href="#"
						tabindex="-1" aria-disabled="true">Previous</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">Next</a></li>
				</ul>
			</nav>
		</div>
	</div>
</body>
</html>
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
<title>게시글 작성</title>
</head>
<body>
	<div class="container">
		<div class="row justify-content-center">
			<h5>
				<i>Writing your Infomations! :)</i>
			</h5>
		</div>
		<div class="row justify-content-center">
			<form action="" method="post" style="width: 500px;" enctype="multipart/form-data">
				<div class="form-group">
					<label for="Title">Category</label>
					<select name="category" class="custom-select" id="validatedInputGroupSelect" required>
        				<option value="1">동물</option>
       					<option value="2">음악</option>
       					<option value="3">자동차</option>
     				</select>
				</div>
				
				<div class="form-group">
					<label for="Title">Title</label> <input type="text"
						class="form-control" id="Title" placeholder="input title"
						required="required" name="title">
				</div>
				<div class="form-group">
					<label for="content">Infomations</label>
					<textarea class="form-control" id="content" rows="10"
						placeholder="Your Infomations Write Here!" name="content"></textarea>
				</div>

				<div class="row justify-content-center">
					<div class="form-group">
						<label for="Image">Upload Yout Image!</label> <input type="file"
							class="form-control-file" id="Image" name="fileName" accept="image/gif,image/jpeg,image/png,image/svg+xml" >
					</div>
				</div>

				<div class="col d-flex justify-content-between">
					<a class="btn btn-outline-danger" href="${contextPath}/total.do"
						role="button">Back</a>
					<button id="writeAritcleBtn"  type="submit" class="btn btn-outline-info">Write</button>
				</div>


			</form>
		</div>


	</div>
</body>
</html>
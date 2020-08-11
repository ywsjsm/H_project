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

<script type="text/javascript">

	  $(function(){
		  $('.container').click(function() {
		  	
		alert('올바르지 않은 경로로 접근하였습니다. 메인화면으로 돌아갑니다');
		$.ajax({
			type:'get',
			url :'/H_Project',
		}).done(function(data) {
			$('html').empty();
			$('html').append(data);
		});
		  });
	});  
</script>
<title>잘못된 경로</title>
</head>
<body>
	<div class="container">
		<div class="row justify-content-center" style="size: inherit;" >
				<img alt="404 NOT FOUND..." style="width: 80%; opacity: 1;" src="${contextPath }/WASERROR/404-Pages.jpg">
		</div>
	</div>
</body>
</html>
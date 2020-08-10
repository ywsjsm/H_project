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
	$(function () {
			$.ajax({
				type:'get',
				url:'/H_Project/withDrawal/redirect.do'
			}).done(function(data) {
				alert('회원탈퇴가 완료되었습니다.');
				$('html').empty();
				$('html').append(data);
			});		
	});
</script>
<title>회원탈퇴 완료</title>
</head>
<body>
	<h2>이용해주셔서 감사합니다.</h2>
</body>
</html>
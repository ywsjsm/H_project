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
		function blink(){
			$('#background404').css('opacity', '0.2');
			setTimeout(function() {
				$('#background404').css('opacity', '0.3');
				 $('#background404').css('opacity', '0.9');
			}, 200);
		}
	
	  $(function(){
		  setTimeout(blink, 1000);
		  $('#background').css('opacity', '0.9');
		  /* $('.container').click(function() {
		  	
		alert('올바르지 않은 경로로 접근하였습니다. 메인화면으로 돌아갑니다');
		$.ajax({
			type:'get',
			url :'/H_Project',
		}).done(function(data) {
			$('html').empty();
			$('html').append(data);
		});
		  }); */
	});  
</script>
<style type="text/css">
	#background404a{
	position: absolute;
	z-index: -99;
	top: 0;
	left: 0;
	opacity: 0.0;
	width:100vw;
	height:100%;
	background-size: cover; 
	}
	#background404{
	position: absolute;
	z-index: -99;
	top: 0;
	left: 0;
	opacity: 0.0;
	width:100vw;
	height:100%;
	background-size: cover; 
}
#developers{
			position: absolute;
			left:0;
			bottom: 0;
		}
</style>
<title>잘못된 경로</title>
</head>
<body style="background-color: black;">
<%@include file="/WEB-INF/view/includes/navbar.jsp" %>
	<div class="container-fluid">
		<div class="row justify-content-center" style="size: inherit;" >
				<img id="background404" alt="404 NOT FOUND..."  src="${contextPath }/WASERROR/404-Pages.jpg">
		</div>
	</div>
	
	<a id="background404a" href="${contextPath }"></a>
	<div  class="container-fluid" id="developers" style="">
    <hr />
   <div class="row justify-content-center" style="">
<i style="color: white;">&copy; H_Project's [ developers JungSM , YunWS ]</i>
</div>
</div>


</body>
</html>
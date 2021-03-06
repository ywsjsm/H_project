<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src='<c:url value='/js/head.js' />'></script>

<style>
 #clock{
 	color: orange;
 	font-weight: lighter;
 }
</style>

<script type="text/javascript">

//<![CDATA[
$(function() {
	var dataa = "";
	$.ajax({
		type:'get',
		url:'/H_Project/sendTitle.do'
	}).done(function(data) {
		dataa = data;
	if(dataa != null){
		console.log('동작');
    var availableTitle = dataa; //< 검색어 리스트
    var titleData = JSON.parse(availableTitle);
	console.log(titleData);
	
    $("#search").autocomplete({
	       source: titleData, 
	       minLength: 2,
        select: function(event, ui) { // 아이템 선택시 실행
            console.log(ui.item);
        },
        focus: function(event, ui) {// 한글 깨짐 현상 수정
            return false;
            /* event.preventDefault(); */
        }
    });
	}
	});
	
	
});

//]]>
</script>

<script type="text/javascript">
	$(function() {
		
		 $('#btnFound').mouseenter(function() {
			 $('#btnFound').attr("class", 'btn btn-outline-warning my-2 my-sm-0');
		 });
		 $('#btnFound').mouseout(function() {
			 $('#btnFound').attr("class", 'btn btn-outline-warning my-2 my-sm-0');
			/*  $('#btnFound').attr("class", 'btn btn-outline-secondary'); */
		 });

		function getValidationTime() {
			var date = new Date();
			var secondes = date.getSeconds();
			var minute = date.getMinutes();
			var hours = date.getHours();

			if (secondes < 10) {
				secondes = '0' + secondes;
			}
			if (minute < 10) {
				minute = '0' + minute;
			}
			if (hours < 10) {
				hours = '0' + hours;
			}

			var clock = hours+':'+minute + ':' + secondes;

			$('#clock').html(clock.toString());
		}
		/* getValidationTime(); */
		function init() {
			getValidationTime();
			setInterval(getValidationTime, 1000);
		}
		init();
		
		$('#logOut').click(function(event) {
			alert('로그아웃 되었습니다.');
		});
		
		$('#check').click(function() {
			$('#navbarSupportedContent').slideToggle(800);
		});
		
	});
</script>
<body>
<div class="container-fluid" id="Navar">

	<nav id="naverTotal" class="navbar navbar-expand-lg navbar-dark" >
		<a class="navbar-brand" href="${contextPath}"><b><label class="navbarFont">H - PROjECT</label>
		</b></a>
		<button class="navbar-toggler" id="check"  type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
			<li class="nav-item" id="Notice"><a class="nav-link"
					href="${contextPath}/main/notice.do"><label class="navbarFont">Notice</label><span class="sr-only">(current)</span> </a>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="${contextPath}/list/animal.do"><label class="navbarFont">동물</label> </a>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="${contextPath}/list/music.do"><label class="navbarFont">음악</label></a></li>
				<li class="nav-item"><a class="nav-link"
					href="${contextPath}/list/moters.do"><label class="navbarFont">자동차</label></a></li>


				<li class="nav-item"><a class="nav-link"
					href="${contextPath}/signUp.do" tabindex="-1" aria-disabled="true"><label class="navbarFont">회원가입</label></a>
					<!-- disabled --></li>
				<c:if test="${empty sessionScope.userInfo}">
					<li class="nav-item"><a class="nav-link"
						href="${contextPath}/login.do" tabindex="-1" aria-disabled="true"><label class="navbarFont">로그인</label></a>
						<!-- disabled --></li>
				</c:if>
				<c:if test="${not empty sessionScope.userInfo}">
					<li class="nav-item"><a class="nav-link"
						href="${contextPath}/logout.do" tabindex="-1" aria-disabled="true"
						id="logOut">로그아웃</a> <!-- disabled --></li>
				</c:if>
				<li class="nav-item"><a class="nav-link" href="#" tabindex="-1"
					aria-disabled="true"> </a> 
					</li>
					<li class="nav-item"><a class="nav-link" href="#" tabindex="-1"
					aria-disabled="true"> </a> <!-- clock --></li>
				<li class="nav-item"><a class="nav-link" href="${contextPath }" tabindex="-1"
					aria-disabled="true" > 현재 시간 </a><!-- clock --></li>
					<li class="nav-item"><a class="nav-link" href="#" tabindex="-1"
					aria-disabled="false" id="clock" >00::00:00</a> <!-- clock --></li>
					<li class="nav-item"><a class="nav-link" href="#" tabindex="-1"
					aria-disabled="true"> </a> 
					</li>
					<li class="nav-item"><a class="nav-link" href="#" tabindex="-1"
					aria-disabled="true"> </a> 
					</li>
					<li class="nav-item"><a class="nav-link" href="#" tabindex="-1"
					aria-disabled="true"> </a> 
					</li>
				<c:if test="${not empty sessionScope.userInfo}">
					<li class="nav-item" ><a class="nav-link"
						href="${contextPath}/userInfo.do" tabindex="-1" aria-disabled="true"
						id="logOut">${userInfo.userId }</a> <!-- disabled --></li>
				</c:if> 
			</ul>
			<div class="ui-widget">
			<div class="col">
			<form class="form-inline my-2 my-lg-0" id="searchForm"
				action="${contextPath }/selectPart.do" method="post">
				
				
				<input class="form-control mr-sm-2" type="search" id="search"
					name="find" placeholder="글찾기" aria-label="글찾기">
				<button class="btn btn-outline-black my-2 my-sm-0" type="submit"
					id="btnFound"><label class="navbarFont">글찾기</label></button>
			</form>
			</div>
		</div>
		</div>
	</nav>
</div>
</body>
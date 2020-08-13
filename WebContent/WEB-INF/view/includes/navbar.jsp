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

			var clock = minute + ':' + secondes;

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
		})
		
	});
</script>

<div class="container">

	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="${contextPath}"><b> [H_Project]
		</b></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link"
					href="${contextPath}/list/animal.do">동물 <span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="${contextPath}/list/music.do">음악</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${contextPath}/list/moters.do">자동차</a></li>


				<li class="nav-item"><a class="nav-link"
					href="${contextPath}/signUp.do" tabindex="-1" aria-disabled="true">회원가입</a>
					<!-- disabled --></li>
				<c:if test="${empty sessionScope.userInfo}">
					<li class="nav-item"><a class="nav-link"
						href="${contextPath}/login.do" tabindex="-1" aria-disabled="true">로그인</a>
						<!-- disabled --></li>
				</c:if>
				<c:if test="${not empty sessionScope.userInfo}">
					<li class="nav-item"><a class="nav-link"
						href="${contextPath}/logout.do" tabindex="-1" aria-disabled="true"
						id="logOut">로그아웃</a> <!-- disabled --></li>
				</c:if>
				<li class="nav-item"><a class="nav-link" href="#" tabindex="-1"
					aria-disabled="true" id="clock">00:00</a> <!-- clock --></li>

			</ul>
			<div class="ui-widget">
			<form class="form-inline my-2 my-lg-0" id="searchForm"
				action="${contextPath }/selectPart.do" method="post">
				<input class="form-control mr-sm-2" type="search" id="search"
					name="find" placeholder="글찾기" aria-label="글찾기">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit"
					id="btnFound">글찾기</button>
			</form>
			</div>
		</div>
	</nav>
</div>
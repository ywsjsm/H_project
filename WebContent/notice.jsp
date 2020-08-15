<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8'>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css'>
<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js'></script>
<script src='https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js'></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src='${contextPath }/js/parallax.min.js'></script>

    <style>
        .parallax-window {
    min-height: 400px;
    background: transparent;
}
#noticeBackground1{
background-color:#CC9966;
z-index: -100000;
position: absolute;
top: 0;
left: 0;
width: 100vw;
/* height: 673px; */
height: 200%
}
#noticeBackground2{
background-color:#FF6666;
z-index: -100000;
position: absolute;
 top: 110%;
left: 0;
width: 100vw;
/* height: 608px; */
height: 200%;
}
#noticeBackground3{
background-color:#9999FF;
z-index: -100000;
position: absolute;
top: 205%;
left: 0;
width: 100vw;
height: 120%;
}
#Navar{
	position: fixed;
	top: 0;
	right: 0;
	left: 0;
	
}
    </style>
    <script>
        $(function(){
            $('.parallax-window').parallax({
                imageSrc: '${contextPath}/viewImage/noitceimage/cat.jpg',
			naturalWidth: '500px' 
        });
        });
    </script>
</head>
<body >
	 <%@include file="/WEB-INF/view/includes/navbar.jsp" %> 
	<div class="container-fluid" >
	<div id="noticeBackground1"></div>
	<div id="noticeBackground2"></div>
	<div id="noticeBackground3"></div>

    <div class="parallax-window" data-parallax="scroll" 
    data-image-src= '${contextPath}/viewImage/noitceimage/cat.jpg' >
</div>
<h4>Notice</h4>
<p  style="white-space: pre-wrap; font-weight: lighter;">
    이 웹페이지는 간소한 대화를 위해서 만들어 졌습니다. 그를 위한 카테고리는 3가지에요.
    첫번째는 동물 입니다. 좋아하는 동물에 대해서 알아보거나, 정보를 수집하세요.
    반대로 먼저 정보를 기재하고 글을 찾아주는 사람들에게 답변을 보내며 이야기를 나누어보세요.
    사랑하는 반려동물에 대한 정보를 찾고, 또 알고 있는 정보를 나누며, 소통하다보면 즐거워질거에요.
     누구라도, 어떻게라도 필요한 정보를 나누고, 또 즐거운 시간을 선사해주기 위해 만들어진 웹페이지입니다.
      동물 카테고리에 대한 설명은 이정도로 마치며, 가벼운 마음으로 시작해주시길 바라겠습니다.

</p>
<div class="parallax-window" data-parallax="scroll" 
    data-image-src= '${contextPath}/viewImage/noitceimage/motors.jpg',>
    </div>
    <p style="white-space: pre-wrap; font-weight: lighter;">
    당신에게 즐거움을 선사할 또다른 카테고리는 자동차입니다.
    평소 생각해왔던 자동차나, 자신의 자동차에 대해서 자랑하거나 자동차를 이용한 여행 등을 기고해주세요.
    자동차와 함께하는 어느 정보라도 좋아요, 전문지식이 아니라도 좋습니다.
    소소한 행복과 순간들 속에서 자동차가 함께 있었다면, 그것으로 충분합니다.
    자동차에 대한 카테고리의 안내또한 이것으로 마무리 하겠습니다.
    
</p>
    
    <div class="parallax-window" data-parallax="scroll" 
    data-image-src= '${contextPath}/viewImage/noitceimage/music.jpg',>
    </div>
    <p style="white-space: pre-wrap; font-weight: lighter;">
    음악을 대부분의 시간과 함께 보내는 사람들이 존재합니다. 또 즐기는 사람들이 존재하기도 합니다.
    음악 카테고리는 그렇게 만들어졌습니다.
    자신이 좋아하는 가수나, 음악에 대한 정보를 얻음으로 행복함을 느낀다면, 당신에게 가장 필요한 카테고리 일지도 모르겠습니다.
    당신이 보기에, 그리고 듣기에 좋은 음악들이나 정보가 존재한다면, 망설이지말고 기고해주세요.
     그것에 우리가 음악 카테고리를 만든 이유이자 목표입니다.
      
      <label style="font-style: oblique;">긴 글을 정독해주신 당신에게 작은 감사의 인사를 미리 하며 글을 마무리 짓겠습니다.</label>  <label style="font-style: oblique; font-weight: bold;">이제, 시작해보세요.</label></p>
	<a class="btn btn-outline-warning btn-lg" href="${contextPath }" role="button" style="margin-left: 50%">Main</a>
	<%@include file="/WEB-INF/view/includes/developers.jspf" %>
</div>
</body>
</html>
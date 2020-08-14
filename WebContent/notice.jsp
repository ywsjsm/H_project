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
height: 673px;
}
#noticeBackground2{
background-color:#FF6666;
z-index: -100000;
position: absolute;
top: 673px;
left: 0;
width: 100vw;
height: 608px;
}
#noticeBackground3{
background-color:#9999FF;
z-index: -100000;
position: absolute;
top: 1280px;
left: 0;
width: 100vw;
height: 800px;
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
<p  style="white-space: pre-wrap;">
    Lorem ipsum dolor sit amet consectetur adipisicing elit. 
    Veritatis nihil ex quibusdam atque amet porro nisi laudantium 
    quam assumenda soluta sapiente tempore culpa iure ipsa nulla sit, eos ullam quod.
    Lorem ipsum dolor, sit amet consectetur adipisicing elit.
     Rerum nesciunt saepe, eos maxime libero odio magni recusandae ab,
      repellat rem minus soluta consequuntur suscipit adipisci ipsam sed obcaecati molestiae? Ad.

</p>
<div class="parallax-window" data-parallax="scroll" 
    data-image-src= '${contextPath}/viewImage/noitceimage/motors.jpg',>
    </div>
    <p style="white-space: pre-wrap;">
    Lorem ipsum dolor sit amet consectetur adipisicing elit. 
    Veritatis nihil ex quibusdam atque amet porro nisi laudantium 
    quam assumenda soluta sapiente tempore culpa iure ipsa nulla sit, eos ullam quod.
    Lorem ipsum dolor, sit amet consectetur adipisicing elit.
     Rerum nesciunt saepe, eos maxime libero odio magni recusandae ab,
      repellat rem minus soluta consequuntur suscipit adipisci ipsam sed obcaecati molestiae? Ad.

</p>
    
    <div class="parallax-window" data-parallax="scroll" 
    data-image-src= '${contextPath}/viewImage/noitceimage/music.jpg',>
    </div>
    <p style="white-space: pre-wrap;">
    Lorem ipsum dolor sit amet consectetur adipisicing elit. 
    Veritatis nihil ex quibusdam atque amet porro nisi laudantium 
    quam assumenda soluta sapiente tempore culpa iure ipsa nulla sit, eos ullam quod.
    Lorem ipsum dolor, sit amet consectetur adipisicing elit.
     Rerum nesciunt saepe, eos maxime libero odio magni recusandae ab,
      repellat rem minus soluta consequuntur suscipit adipisci ipsam sed obcaecati molestiae? Ad.

</p>
</div>
</body>
</html>
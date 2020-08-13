
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src='<c:url value='/js/head.js' />'></script>
	<style type="text/css">
		.backgorund{
			position: absolute;
			z-index: -99;
			top: 0;
			left: 0;
			opacity: 0.9;
			background-size: contain; 
		}
		.container-fluid{
            background-color: rgb(rgba(255, 0, 0, 0), rgba(0, 128, 0, 0), rgba(0, 0, 255, 0));
        }
		#developers{
			position: absolute;
			bottom: 0;
			color: white;
		}
		.row.mainText{
			position: fixed;
			left: 30%;
			top: 50%;
			size: 50%;
		}
		.row.text{
		color: white;
		font-style: italic;	
		}
		#mainText1{
		position: absolute;
		  /* left: 40px; */
		   top: 40%;
		   opacity: 0.0;
		   color: white;
		}
	#mainPara{
		position: fixed;
		top: 45%;
		white-space: pre-wrap;
	}
	</style>
<title>메인 페이지</title>
</head>
<body>
	

			 <%@include file="/WEB-INF/view/includes/navbar.jsp" %> 
		<div class="container-fluid">
			<div class="row">
			</div>
			<div class="backgorund">
				<video src='<c:url value='/video/Drone - 32657.mp4' />' autoplay="autoplay" loop="loop" muted="muted" ></video>
			</div>	
				<span id="mainText1" style="left: 10%; position: relative; left: 200px;"><h4>H - PROjECT</h4></span>
			
		<div class="row mainText"  id="mainText">
                <div class="col d-flex justify-content-center" style="flex-direction: column;" >

                    <div class="row text  justify-content-center" >
                    <p id="mainPara">소소한 정보들을 찾고 이야기를 나누어 보세요.
                    회원 가입 후에 글 작성 및 댓글 작성이 가능합니다.</p>       
                    </div>
                    <div class="row butnStart">
                    	<a href="${contextPath }/list/total.do" role="button" style="position: fixed;" class="btn btn-outline-dark" id="mainBtn"> 시작 </a>
                    </div>
                </div>
         </div>
        
			<!-- 로그인 폼 -->
		
		<%@ include file="/WEB-INF/view/includes/developers.jspf" %>
		</div>
</body>
</html>
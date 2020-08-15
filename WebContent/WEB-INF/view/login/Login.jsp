<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%-- <meta charset="UTF-8">
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
<script src='<c:url value='/js/head.js' />'> 

</script>--%>

<title>로그인</title>

<style type="text/css">
#LoginForm {
	width: 40%;
	margin-left: 30%;
	z-index: 1;
}
#developers{
	position: absolute;
	bottom: 0;
}

 #basic{
            /* background-image: url('<c:url value='/viewImage/fadeBackground/city.jpg' />'); */
            position: absolute;
            display: none;
            top: 0;
            left: 0;
            z-index: -99;
              opacity:0.9;
            width: 100%;
            height: 100%;
            background-repeat: no-repeat;
            background-size: cover;
        }
        #item1{
            /* background-image: url('<c:url value='/viewImage/fadeBackground/boats.jpg' />'); */
            position: absolute;
            display: none;
            top: 0;
            left: 0;
            z-index: -99;
              opacity:0.9;
            width: 100%;
            height: 100%;
            background-repeat: no-repeat;
            background-size: cover;
        }
        #item2{
            /* background-image: url('<c:url value='/viewImage/fadeBackground/lighthouse.jpg' />'); */
            position: absolute;
            display: none;
            top: 0;
            left: 0;
            z-index: -99;
              opacity:0.9;
            width: 100%;
            height: 100%;
            background-repeat: no-repeat;
            background-size: cover;
        }
        #item3{
           /*  background-image: url('<c:url value='/viewImage/fadeBackground/pier.jpg' />'); */
            position: absolute;
            display: none;
            top: 0;
            left: 0;
            opacity:0.9;
            z-index: -99;
            width: 100%;
            height: 100%;
            background-repeat: no-repeat;
            background-size: cover;
        }

        #background-item{
        position:absolute;
        top:0;
        left:0;
        z-index: -99;
            width: 100vw;
            height: 100vh;
        }

        body{
            overflow: hidden; 
        }
        .loginHelp{
        color: orange;
        }
	

</style>
</head>
<body>
	<script type="text/javascript">
	 $(function(){
         $(function(){
 changeView();   
     });

     function changeView(){
         setTimeout(1000);
        //하나가 보이면 하나가 사라져야함
         var i =0;
         $('#basic').show();
         setInterval(() => {
             if(i == 4){
                 i = 0;
             }
             console.log(i);
             switch(i >= 0){
                 case i==0:
                     console.log(i==0);
                     $('#item1').fadeIn(2500);
                     $('#naverTotal').attr('class', 'navbar navbar-expand-lg navbar-dark');
                     $('#basic').fadeOut(2500);
                     break;
                 case i==1:
                 console.log(i==1);
                     $('#item2').fadeIn(2500);
                     $('#naverTotal').attr('class', 'navbar navbar-expand-lg navbar-dark');
                     $('#item1').fadeOut(2500);
                     break;
                 case i==2:
                 console.log(i==2);
                 $('#item3').fadeIn(2500);
                 $('#naverTotal').attr('class', 'navbar navbar-expand-lg navbar-light');
                     $('#item2').fadeOut(2500);
                     break;
                 default:
                     $('#item3').fadeOut(2500);
                     $('#basic').fadeIn(2500);
                 $('#naverTotal').attr('class', 'navbar navbar-expand-lg navbar-dark');
             }
             i++;
         }, 4000);
     }
     });
</script>
	<div class="container-fluid">
	
	<div class="container-fluid">
        <ul id="background-item">  
            <li id="basic">
            <img id="" src="${contextPath }/viewImage/fadeBackground/city.jpg" 
            style="width: 100vw;height: 100%" />
            </li>
            <li id="item1">
            <img id="" src="${contextPath }/viewImage/fadeBackground/boats.jpg" 
            style="width: 100vw;height: 100%" />
            </li>
            <li id="item2">
            <img id="" src="${contextPath }/viewImage/fadeBackground/lighthouse.jpg" 
            style="width: 100vw;height: 100%" />
            </li>
            <li id="item3">
            <img id="" src="${contextPath }/viewImage/fadeBackground/pier.jpg" 
            style="width: 100vw;height: 100%" />
            </li>
        </ul>
    </div>

	
		<form  method="post" id="LoginForm">
			<div class="form-group">
				<label for="Id">Id</label> 
				<input type="text" class="form-control" id="Id" aria-describedby="IdHelp"
				 value="${UserIdCookie}" required="required" name="id" placeholder="input your Id"> 
					<c:if test="${errors.id}">
					<small id="Id" class="form-text text-muted"><label class="loginHelp">공백은 허용하지 않습니다.</label></small>
					</c:if>
					<c:if test="${!errors.id and errors.memberNotFound}">
					<small id="Id" class="form-text text-muted"><label class="loginHelp">해당 아이디는 존재하지 않습니다.</label></small>
					</c:if>
			</div>
			<div class="form-group">
				<label for="Password">Password</label> 
				<input type="password" class="form-control" id="Password" required="required" name="password" placeholder="input your password"> 
					<c:if test="${errors.password}">
					<small id="Id" class="form-text text-muted"><label class="loginHelp">공백은 허용하지 않습니다.</label></small>
					</c:if>
					<c:if test="${errors.passwordNotMatch}">
					<small id="Id" class="form-text text-muted"><label class="loginHelp">비밀번호가 일치하지 않습니다.</label></small>
					</c:if>
			</div>
			
			<div class="form-group form-check">
				<input type="checkbox" class="form-check-input" id="RemeberId" name="rememberId"  required="required"> 
				<label class="form-check-label" for="RemeberId">Remember my Id</label>
			</div>
			<button type="button" class="btn btn-outline-warning" id="loginBtn">Login</button>
		</form>

	</div>
</body>
</html>
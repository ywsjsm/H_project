<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

  <link rel="stylesheet" type="text/css" href="${contextPath }/js/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="${contextPath }/js/slick/slick-theme.css"/>

<script type="text/javascript" src="${contextPath }/js/slick/slick.js"></script>

  <link rel="stylesheet" type="text/css" href="${contextPath }/js/slick/slick-theme.css"/>
  
<script type="text/javascript" src="${contextPath }/js/slick/slick.min.js"></script>
<script>
  $(function(){
  $('#slider-div').slick({
    slide: 'div',		//슬라이드 되어야 할 태그 ex) div, li 
    infinite : false, 	//무한 반복 옵션	 
    slidesToShow : 1,		// 한 화면에 보여질 컨텐츠 개수
    slidesToScroll : 1,		//스크롤 한번에 움직일 컨텐츠 개수
    speed : 100,	 // 다음 버튼 누르고 다음 화면 뜨는데까지 걸리는 시간(ms)
    arrows : true, 		// 옆으로 이동하는 화살표 표시 여부
    dots : true, 		// 스크롤바 아래 점으로 페이지네이션 여부
    autoplay : true,			// 자동 스크롤 사용 여부
    autoplaySpeed : 7000, 		// 자동 스크롤 시 다음으로 넘어가는데 걸리는 시간 (ms)
    pauseOnHover : false,		// 슬라이드 이동	시 마우스 호버하면 슬라이더 멈추게 설정
    vertical : false,		// 세로 방향 슬라이드 옵션
    prevArrow : "<button type='button' class='slick-prev'>Previous</button>",		// 이전 화살표 모양 설정
    nextArrow : "<button type='button' class='slick-next'>Next</button>",		// 다음 화살표 모양 설정
    dotsClass : "slick-dots", 	//아래 나오는 페이지네이션(점) css class 지정
    draggable : false, 	//드래그 가능 여부 
    
    responsive: [ // 반응형 웹 구현 옵션
      {  
        // breakpoint: 1200, //화면 사이즈 960px
        settings: {
          //위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
          slidesToShow:1 
        } 
      },
      { 
        breakpoint: 768, //화면 사이즈 768px
        settings: {	
          //위에 옵션이 디폴트 , 여기에 추가하면 그걸로 변경
          slidesToShow:1 
        } 
      }
    ]

  });
 /*  <!-- ${contextPath}/viewImage/withdrawal/complete/cat-animate.gif  -->
 GoodByeBtn  */
   $('.slick-list').mouseover(function(){
	  console.log('동작 중');
	  $('#item5').attr('src','${contextPath}/viewImage/withdrawal/complete/cat-animate.gif');
	  $('#GoodByeBtn').attr('class','btn btn-outline-success btn-sm active');
	  var a =$('#slider-div').slick('slickCurrentSlide');
	    console.log(a);
	    if(a==4){
	      console.log('슬라이더 중지');
	      $('#slider-div').slick('slickPause');
	    }
	  
  });
 $('.slick-list').mouseout(function(){
	 $('#item5').attr('src','${contextPath}/viewImage/withdrawal/complete/cat-static.gif');
	 $('#GoodByeBtn').attr('class','btn btn-outline-success btn-sm');
 }); 
  });
</script>
  <head>
  <meta charset='UTF-8'>
  <title></title>
    <style>
      #item1{
        z-index: -99;
        /* background-image: url(/images/slide/cat.gif);  */
        position: absolute; 
        width: inherit;
        height:inherit;
        background-size: cover; 
        background-repeat: no-repeat;
        opacity: 0.9;
      }
      #itemPara1{
        color: white;
        white-space: pre-wrap;
        font-weight: bold;
        font-style: italic;
      }
      #item2{
        z-index: -99;
       /*  background-image: url(/images/slide/desk.jpeg);  */
        position: absolute; 
        width: inherit;
        height:inherit;
        background-size: cover; 
        background-repeat: no-repeat;
        opacity: 0.9;
      }
      #itemPara2{
        color: white;
        white-space: pre-wrap;
        font-weight: bold;
        font-style: italic;
      }
      #item3{
        z-index: -99;
        /* background-image: url(${contextPath}/viewImage/withdrawal/complete/desk.jpeg);  */
        position: absolute; 
        width: inherit;
        height:inherit;
        background-size: cover; 
        background-repeat: no-repeat;
        opacity: 0.9;
      }
      #itemPara3{
        color: white;
        white-space: pre-wrap;
        font-weight: bold;
        font-style: italic;
      }
      #item4{
        z-index: -99;
        /* background-image: url(${contextPath}/viewImage/withdrawal/complete/bus.jpg);  */
        position: absolute; 
        width: inherit;
        height:inherit;
        background-size: cover;  
        background-repeat: no-repeat;
        opacity: 0.9;
      }
      #itemPara4{
        color: white;
        white-space: pre-wrap;
        font-weight: bold;
        font-style: italic;
      }
      #item5{
        z-index: -99;
        /* background-image: url(${contextPath}/viewImage/withdrawal/complete/cat.gif);  */
        position: absolute; 
        width: inherit;
        height:inherit;
        background-size: cover;   
        background-repeat: no-repeat;
        opacity: 0.9;
      }
      #itemPara5{
        color: white;
        white-space: pre-wrap;
        font-weight: bold;
        font-style: italic;
      }
      #GoodByeBtn{
        margin-left: 10%;
      }
      body{
        background-color: #333333;
      }
    </style>
  </head>
  <body>
    <div class="container-fluid">
    <div style="width: 70%; height: 70%;
     margin-top:0; margin-left: auto; margin-right: auto; margin-bottom: 5%">
	  	<div id="slider-div"  >
		    <div>
          <img id="item1" src="${contextPath}/viewImage/withdrawal/complete/cat-static.gif"></img>
          <p id="itemPara1" >
            지금 껏 조촐한 웹사이트를 이용해 주셔서 진심으로 감사의 말씀을 드립니다.
             이 슬라이드는 당신께 가벼운 안내를 드리기 위해 만들어졌습니다.
            
            시간이 여의치 않으시다면, 밑에 기재된 마지막 도트를 클릭하시면 됩니다. :)</p>
        </div>
		    <div>
          <img id="item2" src="${contextPath}/viewImage/withdrawal/complete/sorting.jpg"></img>
          <p id="itemPara2">
            시간을 내어주셔서 감사하다는 말씀부터 드리겠습니다.
            
            우리의 웹페이지 정책은 생각하시는 것보다 훨씬 더 조촐합니다. 
            그러니, 가벼운 마음으로 탈퇴를 생각하시길 바라는 마음입니다.

            그저, 
            당신이 탈퇴하신 후에, 벌어지는 일들에 대해서 설명을 드리고자 합니다.
          </p>
        </div>
		    <div>
          <img id="item3" src="${contextPath}/viewImage/withdrawal/complete/desk.jpeg"></img>
          <p id="itemPara2">
            회원정보에 대해서는 30일정도 보관과정을 거치게 됩니다. 
            그 이후에는 회원정보는 전부 삭제되어 저장되지 않습니다.

            안타깝게도 작성하긴 글이나, 댓글의 경우에는 전부 삭제되어
             기록에 남지않게됩니다.

             하지만,
             언제든 다시 가입하고 활동하실 수 있다는 점 또한 말씀드리고 싶습니다.
          </p>
        </div>
		    <div>
         <img id="item4" src="${contextPath}/viewImage/withdrawal/complete/bus.jpg"></img>
          <p id="itemPara4">
            그러니, 가볍게 생각하시고 진행해주시기를 바랍니다.
            공지사항에 기재한 글 그대로, 우리의 Condition은 하나입니다.

            조촐한 정보공유,
            무엇보다도 
             당신의 시간이 조금이라도 행복하기를 바라는 마음에서 만들어진 웹입니다.
          </p>
        </div>
		    <div>
          <img id="item5" src="${contextPath}/viewImage/withdrawal/complete/cat-static.gif"></img>
          
          <p id="itemPara5">
            이것으로 안내문을 마치도록 하겠습니다. 다시금 감사하다는 말씀을 드립니다.

            이용해주셔서 감사합니다. 
            언제나 당신의 시간이 행복하게 채워지기를 소망하겠습니다.

            &copy; H_Project's [ developers JungSM , YunWS ]
          </p>
          <a href="${contextPath }"
          id="GoodByeBtn" 
          class="btn btn-outline-success btn-sm"
           role="button" 
           aria-pressed="true"
           >getting out</a>
        </div>
	  	</div>
  </div>
</div>
  </body>
</html>
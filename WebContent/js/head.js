/**

 * 
 */
 $(function(){
  $('#logOut').on('click',function(){
		   $.ajax({
				type: 'get',
				url:'/H_Project/logout.do'
		  });
  });
  			
	   
	   $('#loginBtn').click(function(){			
			var datab = $('#LoginForm').serialize();
		$.ajax({
			type: 'post',
			url:'/H_Project/login.do',
			data : datab,
		}).done(function(data){
			$('body').empty();
			$('body').append(data); 	
		});
	});
	   
	   $('#btnSignUp').click(function(){
			var dataa = $('#signup').serialize();
			$.ajax({
				type:"post",
				url :"/H_Project/signUp.do",
				data: dataa,
				}).done(function(data){
				 		$('body').empty();
						$('body').append(data); 	
					});
				});
	   
  $('#writeAritcleBtn').click(function(){
		  alert('게시글 등록이 완료되었습니다.');
	   });
  
  $('#modifyBtn').click(function() {
  		alert('게시글 수정이 완료되었습니다.');
  });
  
  // 메인 화면
	  $('#mainText1').animate({left : '40%'}, 2000, function() {
		  	$('#mainBtn').animate({right : '40%'}, 2000,function(){
		  		$('#mainPara').animate({right:'20%'}, function() {
		  			$('#mainLoginForm').fadeToggle(3000);
		  			$('#test').slideToggle();
		  			
		  		});
		  		$('#mainBtn').attr("class", 'btn btn-outline-warning');
		  		$('#btnFound').attr("class", 'btn btn-outline-warning my-2 my-sm-0');
		  	});
	  });

	  

	   
   });
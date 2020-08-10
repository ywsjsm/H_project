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
  

  
	   
   });
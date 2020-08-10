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
   });
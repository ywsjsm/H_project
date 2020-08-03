<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
    
   
    <div class="container">
    <div class="row">
    	<div class="col">
    	 <a class="btn btn-outline-info" style="width: 100px" href="${contextPath}/write.do" role="button">Writing</a>
    <!-- 회원탈퇴 -->
    	</div>
    	<div class="col">
    <nav aria-label="Page navigation example">
  	<ul class="pagination justify-content-center">
    <li class="page-item disabled">
      <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
    </li>
    <li class="page-item"><a class="page-link" href="#">1</a></li><!-- 페이지네이션 -->
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item"><a class="page-link" href="#">4</a></li>
    <li class="page-item"><a class="page-link" href="#">5</a></li>
    <li class="page-item">
      <a class="page-link" href="#">Next</a>
    </li>
  	</ul>
	</nav>
	</div>
		<div class="col">
		<a class="btn btn-outline-danger" style="margin-left: 50%; width: 100px;" href="${contextPath}/withdrawal.do" role="button">Withdrawal</a>
    <!-- 회원탈퇴 -->
		</div>
	
	</div>
	</div>
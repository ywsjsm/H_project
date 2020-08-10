<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
	<div class="row">
		<div class="col d-flex justify-content-center">
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<c:if test="${CommentPage.startPage > 3 }">
						<li class="page-item">
						<a class="page-link" href="${contextPath }/read.do?no=${boardNo}&compageNo=${CommentPage.startPage - 3 }">Previous</a></li>
					</c:if>
					<c:forEach var="pNo" begin="${CommentPage.startPage }" end="${CommentPage.endPage }">
						<li class="page-item"><a class="page-link" href="${contextPath }/read.do?no=${boardNo}&compageNo=${pNo }">${pNo }</a></li>
					</c:forEach>
					<c:if test="${CommentPage.endPage < CommentPage.totalPages }">
						<li class="page-item">
						<a class="page-link" href="${contextPath }/read.do?no=${boardNo}&compageNo=${CommentPage.startPage + 3 }">Next</a></li>
					</c:if>
				</ul>
			</nav>
		</div>
	</div>
</div>
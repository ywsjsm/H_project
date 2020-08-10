<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container">
	<div class="row">
		<c:if test="${not empty sessionScope.userInfo}">
			<div class="col">
				<a class="btn btn-outline-info" style="width: 100px"
					href="${contextPath}/write.do?" role="button">Writing</a>
			</div>
		</c:if>
		<div class="col d-flex justify-content-center">
			<nav aria-label="Page navigation example">
				<ul class="pagination justify-content-center">
					<c:if test="${articlePage.startPage > 5 }">
						<li class="page-item">
						<a class="page-link" href="${contextPath }${ReqServletPath }?pageNo=${articlePage.startPage - 5 }">Previous</a></li>
					</c:if>
					<c:forEach var="pNo" begin="${articlePage.startPage }" end="${articlePage.endPage }">
						<li class="page-item"><a class="page-link" href="${contextPath }${ReqServletPath }?pageNo=${pNo }">${pNo }</a></li>
					</c:forEach>
					<c:if test="${articlePage.endPage < articlePage.totalPages }">
						<li class="page-item">
						<a class="page-link" href="${contextPath }${ReqServletPath }?pageNo=${articlePage.startPage + 5 }">Next</a></li>
					</c:if>
				</ul>
			</nav>
		</div>
		<c:if test="${not empty sessionScope.userInfo}">
			<div class="col">
				<a class="btn btn-outline-danger"
					style="margin-left: 50%; width: 100px;"
					href="${contextPath}/withDrawal.do" role="button">Withdrawal</a>
			</div>
		</c:if>

	</div>
</div>
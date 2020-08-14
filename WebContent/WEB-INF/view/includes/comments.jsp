<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
function deletecheck() {
	var pwValue = prompt('비밀번호를 입력하세요');
	document.getElementById('checkPW').value=pwValue;
	document.forms.deleteform.submit();
}
</script>

<!-- 로그인 정보에 따라 활성화 -->
<c:if test="${not empty sessionScope.userInfo}">
	<form action="${contextPath}/comment/write.do" method="post">
		<div class="form-group">
			<div class="col">
				<div class="row">
					<input class="form-control form-control-sm" type="text"
						placeholder="Enter Your Opinions" name="content"
						style="width: 90%;" required="required">
					<button type="submit" class="btn btn-success btn-sm"
						style="width: 70px">Enter</button>
					<input type="text" hidden="true" name="no" value="${boardNo}" />
				</div>
			</div>
		</div>
	</form>
</c:if>

<!--  -->
<c:if test="${empty CommentPage.content }">
	<b>👍첫 댓글의 주인공이 되어주세요!</b>
</c:if>
<c:forEach var="Comment" items="${CommentPage.content }">
	<form name ="deleteform" id="deleteform" action="${contextPath}/comment/delete.do" method="post">
	<input name="checkPW" id="checkPW" type="text" hidden="true" value="" />
		<div class="form-group" style="size: inherit;">
			<div class="col">
				<div class="row">
					<input class="form-control form-control-sm" value="${Comment.content }" type="text" style="width: 90%;" readonly="readonly">
					<input name="commentNo" type="text" hidden="true" value="${Comment.reply_no }" />
					<!-- 해당버튼은 유저아이디와 개시한 댓글 아이디가 같은 경우 사용  댓글 작성자 정보 와 세션 유저 번호가 같으면 활성-->
					<input type="text" hidden="true" name="no" value="${boardNo}"/>
					<button type="button" onclick="deletecheck()" class="btn btn-danger btn-sm" style="width: 70px;">Delete</button>
				</div>
			</div>
		</div>
	</form>
</c:forEach>

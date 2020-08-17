<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="tc" tagdir="/WEB-INF/tags" %>

<script type="text/javascript">
function deletecheck() {
	var pwValue = prompt('비밀번호를 입력하세요');
	document.getElementById('checkPW').value=pwValue;
	document.forms.deleteform.submit();
}
</script>

<!-- 로그인 정보에 따라 활성화 -->
<c:if test="${not empty sessionScope.userInfo}">
	<form action="${contextPath}/comment/write.do" method="post" style="">
		<div class="form-group">
			<div class="col">
				<div class="row">
					<!-- <input class="form-control form-control-sm" type="text"
						placeholder="250자 이하로 기재 가능합니다." max="250" maxlength="250" name="content"
						style="width: 90%;" required="required"> -->
						<div class="col">
						<textarea class="form-control" id="exampleFormControlTextarea1" name="content"  maxlength="250" placeholder="250자 이하로 기재가능합니다."
						required="required"
    				 style="margin-right: 10%;white-space: pre-wrap; resize:none;  font-size: small;" rows="3" >${Comment.content }</textarea>
						</div>
					<button type="submit" class="btn btn-success btn-sm"
						style="width: 70px;margin-right:1.1%">Enter</button>
					<input type="text" hidden="true" name="no" value="${boardNo}" />
				</div>
			</div>
		</div>
	</form>
</c:if>

<!--  -->
<c:forEach var="Comment" items="${CommentPage.content }">
	<form name ="deleteform" id="deleteform" action="${contextPath}/comment/delete.do" method="post">
	<input name="checkPW" id="checkPW" type="text" hidden="true" value="" />
		<div class="form-group" style="size: inherit;">
			<div class="col">
			<%-- <div class="row">
				<div class="col">
				<small style="color: FF3399; float: left;">${Comment.userid}</small>
				</div>
				<small style="color: #0B3861;float: right; margin-right: 10%">&nbsp;- <tc:ConversionLocalDataTime dateTime="${Comment.regdate }" /></small>
			</div> --%>
				<div class="row">
					<div class="col">
					<small style="color: FF3399; float: left;">${Comment.userid}</small>
					<small style="color: #0B3861;float: right; margin-right: 5%;color: olive;">&nbsp;- <tc:ConversionLocalDataTime dateTime="${Comment.regdate }" /></small>
    				<textarea class="form-control" id="exampleFormControlTextarea1" 
    				 style="margin-right: 10%;white-space: pre-wrap; resize:none;  font-size: small; font-weight: 100;" rows="3" readonly="readonly">${Comment.content }</textarea>
					</div>
					<c:if test="${not empty sessionScope.userInfo and sessionScope.userInfo.userId eq boardInfo.userId }">
					<button type="button" onclick="deletecheck()" class="btn btn-danger btn-sm" style=" margin-top:auto;margin-right:1.1%;width: 70px; height: 100%" >Delete</button>
					</c:if>
					<%-- <input class="form-control form-control-sm" value="${Comment.content }" type="text" style="width: 90%;" readonly="readonly"> --%>
					<input name="commentNo" type="text" max="250" hidden="true" value="${Comment.reply_no }" />
					<!-- 해당버튼은 유저아이디와 개시한 댓글 아이디가 같은 경우 사용  댓글 작성자 정보 와 세션 유저 번호가 같으면 활성-->
					<input type="text" hidden="true" name="no" value="${boardNo}"/>
					<%-- <c:if test="${not empty sessionScope.userInfo and sessionScope.userInfo.userId eq boardInfo.userId }">
					<button type="button" onclick="deletecheck()" class="btn btn-danger btn-sm" style=" margin-top:2%;margin-right:1.1%;width: 70px;" >Delete</button>
					</c:if> --%>
				</div>
			</div>
		</div>
	</form>
</c:forEach>

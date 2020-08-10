<%@ tag language="java" pageEncoding="UTF-8"%>
<%@tag body-content="empty" trimDirectiveWhitespaces="true" %>
<%@attribute name="categoryNum" required="true" type="java.lang.Integer" %>

<%
String categoryStr = "";
	if(categoryNum == 1){
		categoryStr = "Animals";
	}else if(categoryNum == 2){
		categoryStr ="Music";
	}else if(categoryNum == 3){
		categoryStr="Automobiles";
	}
%>

<%=categoryStr %>

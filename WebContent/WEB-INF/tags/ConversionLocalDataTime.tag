<%@ tag language="java" pageEncoding="UTF-8"%>
<%@tag body-content="empty" trimDirectiveWhitespaces="true" %>
<%@tag import="java.time.format.DateTimeFormatter" %>
<%@attribute name="dateTime" required="true" type="java.time.temporal.TemporalAccessor"%>
<%@attribute name="pattern" required="false" type="java.lang.String" %>

<%
	if(pattern == null) pattern = "yyyy.MM.dd a hh:mm:ss ";
%>

<%= DateTimeFormatter.ofPattern(pattern).format(dateTime) %>

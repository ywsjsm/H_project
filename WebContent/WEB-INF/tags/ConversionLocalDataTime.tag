<%@tag import="java.time.LocalDateTime"%>
<%@tag import="java.text.SimpleDateFormat"%>
<%@ tag language="java" pageEncoding="UTF-8"%>
<%@tag body-content="empty" trimDirectiveWhitespaces="true" %>
<%@tag import="java.time.format.DateTimeFormatter" %>
<%@tag import="java.text.SimpleDateFormat" %>
<%@tag import="java.util.Date" %>
<%@attribute name="date" required="false" type="java.util.Date"%>
<%@attribute name="dateTime" required="false" type="java.time.temporal.TemporalAccessor"%>
<%@attribute name="pattern" required="false" type="java.lang.String" %>

<%
	if(pattern == null) pattern = "yyyy.MM.dd a hh:mm:ss ";
%>
<%if(dateTime != null) { %>
<%= DateTimeFormatter.ofPattern(pattern).format(dateTime) %>
<%
}else {
%>
<%= SimpleDateFormat.getInstance().format(date) %>
<%
}
%>

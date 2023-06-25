<%@ tag body-content="scriptless" pageEncoding="utf-8" %>
<%@ tag trimDirectiveWhitespaces="true" %>
<%
	HttpSession httpSession = request.getSession(false); // jsp파일 아니라 받아와야
	if (httpSession != null && httpSession.getAttribute("authUser") != null) {
%>
	<jsp:doBody /> <!-- 태그 속 내용 -->
<%
	}
%>
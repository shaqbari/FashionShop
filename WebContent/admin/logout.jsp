<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/message.jsp" %>
<%
	//현재 사용중인 세션을 무효화 시킨 후, 다시 로그인 페이지를 보여준다.
	session.invalidate();
	
	out.print(showMsgURL("로그아웃되었습니다.", "/admin"));
%>
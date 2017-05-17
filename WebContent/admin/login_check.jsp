<%@page import="com.fashion.admin.Admin"%>
<%@page import="com.fashion.admin.AdminDAO"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ include file="/inc/message.jsp" %>
<%!
	AdminDAO dao=new AdminDAO();
%>
<jsp:useBean id="dto" class="com.fashion.admin.Admin"></jsp:useBean>
<jsp:setProperty property="*" name="dto"/>
<%
	//넘겨받은 아이디와 패스워드를 이용하여, 인증 처리..
	/* String user_id=request.getParameter("user_id");
	String password=request.getParameter("password"); actiontag를 이용해보자 */
	
	Admin admin=dao.select(dto);
	
	//서버는 클라이언트를 구분하기 위해 일련번호를 발생시키는데, 이 때 일련번호를 보유한 객체가 바로 session객체이다.
	//String sid=session.getId();
	//out.print(session);//브라우저 닫기 전까지 유지된다. 닫으면 달라진다. cookie에도 이 번호가 저장된다.
	
	if(admin==null){
		out.print(showMsgBack("로그인정보가 올바르지 않습니다."));
		
	}else{
		//admin은 service 메소드의 지역변수 이므로, 응답시 곧 사라지게 된다.
		//따라서 브라우저를 닫지 않는 한 절대 죽지 않는 세션 객체에 admin을 넣어보자
		session.setAttribute("admin", admin);
		out.print(showMsgURL("인증 성공", "/admin/admin.jsp"));
		
		
	}
%>
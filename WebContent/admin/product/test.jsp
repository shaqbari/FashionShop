<%@ page contentType="text/html;charset=euc-kr"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<%
request.setCharacterEncoding("euc-kr");
String sel=request.getParameter("sel");
out.print(sel);
%>
<HTML>
 <HEAD>
  <TITLE> New Document </TITLE>
 </HEAD>
 <BODY>
 <form name="form1" method="post" action="test.jsp">
  <select name="sel" onChange="form1.submit();">
	<option value="사과" <%if(sel.equals("사과")){%>selected<%}%>>사과</option>
	<option value="딸기" <%if(sel.equals("딸기")){%>selected<%}%>>딸기</option>
	<option  value="바나나" <%if(sel.equals("바나나")){%>selected<%}%>>바나나</option>
	<option value="초코렛" <%if(sel.equals("초코렛")){%>selected<%}%>>초코렛</option>
  </select>
  </form>
 </BODY>
</HTML>

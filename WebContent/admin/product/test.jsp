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
	<option value="���" <%if(sel.equals("���")){%>selected<%}%>>���</option>
	<option value="����" <%if(sel.equals("����")){%>selected<%}%>>����</option>
	<option  value="�ٳ���" <%if(sel.equals("�ٳ���")){%>selected<%}%>>�ٳ���</option>
	<option value="���ڷ�" <%if(sel.equals("���ڷ�")){%>selected<%}%>>���ڷ�</option>
  </select>
  </form>
 </BODY>
</HTML>

<%@ page contentType="text/html;charset=euc-kr"%>
<%@ page import="java.util.*"%>
<%@ page import="model.manager.*"%>
<%@ page import="model.formbean.*"%>
<%
//�Ѱܹ��� �Ķ���Ϳ� ����, ��ȹ ������ db�� ����
String[] ch=request.getParameterValues("ch");
ProductManager pm = new ProductManager();
String tableName=null;
if(request.getParameter("plan").equals("best")){
	tableName="bestProduct";
}else if(request.getParameter("plan").equals("new")){
	tableName="newProduct";
}else if(request.getParameter("plan").equals("pop")){
	tableName="popProduct";
}
int fkey[]=new int[ch.length];
for(int i=0;i<ch.length;i++){
	fkey[i]=Integer.parseInt(ch[i]);
}
pm.insertPlanProduct(tableName,fkey);
%>











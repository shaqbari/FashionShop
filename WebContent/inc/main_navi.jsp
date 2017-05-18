<%@page import="com.fashion.product.TopCategory"%>
<%@page import="java.util.List"%>
<%@page import="com.fashion.product.TopCategoryDAO"%>
<%@ page contentType="text/html; charset=utf-8"%>
<!-- 앞으로 include로 삽입할 예정 -->
<%! TopCategoryDAO topCategoryDAO=new TopCategoryDAO(); %>
<%
	List<TopCategory> list=topCategoryDAO.selectAll();
%>
<table id="mainNavi" bgcolor="#000000" width="100%" cellpadding="0"
	cellspacing="0">
	<tr>
		<%for(int i=0; i<list.size(); i++){ %>			
			<td><%=list.get(i).getTop_name() %></td>
		<%} %>
	</tr>
</table>
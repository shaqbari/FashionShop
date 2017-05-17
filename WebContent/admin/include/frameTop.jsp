<%@page import="com.fashion.admin.Admin"%>
<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" href="/admin/css/intranet.css" type="text/css">
<style>
td{font-size:9pt}
a{text-decoration:none}
</style>
</head>
<body leftmargin="0" topmargin="0">
<table cellpadding="0" cellspacing='0' width='100%' height='50' background="../images/admin_topbg.gif">
<tr>	
	<td width="969"><table width="800"  height="20" border="0" align="right" cellpadding="0" cellspacing="0">
      <tr align="center">
        <td width="88"><a href="/" target="_blank">HOME</a></td>
        <td width="88"><a href="product.jsp" target="menu">상품관리</a></td>
        <td width="88"><a href="order.jsp" 	target="menu">주문관리</a></td>
        <td width="88"><a href="member.jsp" target="menu">회원관리</a></td>
        <td width="88"><a href="customer.jsp"  target="menu">고객센터</a></td>
      </tr>
    </table>	  
    <a href="/index.jsp" target="_mainFrame"></a></td>
	<td width="261" nowrap>
<table width="259" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td width="41"><img src="/admin/images/log_in01.gif" ></td>
		<td  width="186" height="40"  background="../images/log_bg2.gif">
		<table width="186" border="0" cellpadding="0" cellspacing="0" bgcolor="#ffffff">
		<tr>
			    <td style="padding-top:7px" class='t12b'>
			    	<strong>
				<%
					Admin admin=(Admin)session.getAttribute("admin");
					out.print(admin.getName());
				%><!--브라우저 닫거나 일정시간 경과 하면 세션이 삭제된다.  -->&nbsp;님 
               	  </strong><br>
                &nbsp;안녕하세요.
                </td>
			<td><img src="/admin/images/log_icon.gif" width="47" height="30"></td>
			    <td style="padding-top:7px" class='t12b'> <a href="/admin/logout.jsp" target="_parent"> 
                <span><b><font color="#CC0066">로그아웃</font></b></span></a><br>			</td>
		</tr>
		</table>		</td>
		<td width="73"><img src="/admin/images/log_right.gif"></td>
	</tr>
	</table>	</td>
</tr>
</table>
</html>
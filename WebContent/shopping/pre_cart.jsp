<%@page import="java.util.ArrayList"%>
<%@page import="com.fashion.product.Product"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="product" class="com.fashion.product.Product"/><!--new에 해당  -->
<jsp:setProperty property="*" name="product"/><!--모두 담는다.  -->
<%@ include file="/inc/message.jsp" %>
<%!
	ArrayList<Product> list;	
	
%>
<%
	//세션에 담기전에 arraylist에 담아 cart라고 부르면 cart이름만 알면 나머지 제품이름은 몰라도 순서대로 출력하면 된다.
	//ArrayList list=new ArrayList();//새로만들면 안되고 하나만 만들어야 한다.		
	if(session.getAttribute("cart")==null){
		list=new ArrayList<Product>();
		session.setAttribute("cart", list);
	}else{
		list=(ArrayList)session.getAttribute("cart");		
	}
	//제품이 중복될경우 수량을 합쳐서 보여주는것 여기서 처리가 가능하다.
	
	list.add(product);	
	
	out.print(showMsgURL("장바구니에 담았습니다.", "cart.jsp"));
%>
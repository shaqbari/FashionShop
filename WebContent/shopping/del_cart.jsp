<%@page import="org.apache.ibatis.scripting.xmltags.ForEachSqlNode"%>
<%@page import="com.fashion.product.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//세션에 담겨진 객체를 지운다.
	//cart 이름을 갖는 list안의 객체를 삭제
	//product_id를 넘겨받아 검색해 삭제하자.
	String product_id=request.getParameter("product_id");
	//out.print(product_id);	
	
	ArrayList<Product> list=(ArrayList)session.getAttribute("cart");
	out.print(list.size());
	/* for(int i=0; i<list.size(); i++){
		Product product=list.get(i);
		if(product.getProduct_id()==Integer.parseInt(product_id)){
			//list.remove(i);
			list.remove(product);
		}
	} */
	
	//foreach는 사이즈가 고정되기 때문에 list에서 제거할 경우 따로 지울거를 cf에 저장해두거나
	//매번 size를 호출하는 위의 for문을 사용한다.
	//int i=0;
	ArrayList<Product> toRemove=new ArrayList<Product>();
	for(Product p : list){
		if(p.getProduct_id()==Integer.parseInt(product_id)){
			//list.remove(p);
			//list.remove(i);
			toRemove.add(p);
			
		}
		//i++;
	}		
	for(Product p : toRemove){
		list.remove(p);
	}
	
	//응답시, 클라이언트인 브라우저가 지정한 url로 다시 재접속 하라.!
	response.sendRedirect("cart.jsp");
	//아래와 같다.
%>
<!-- <script>
	location.href="cart.jsp";
</script> -->
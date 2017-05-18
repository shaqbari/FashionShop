<%@page import="java.util.ArrayList"%>
<%@page import="com.fashion.product.PlanProduct"%>
<%@page import="com.fashion.product.PlanProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	PlanProductDAO planProductDAO=new PlanProductDAO();
%>
<%
	String plan_id=request.getParameter("plan_id");
	
	//request.getParameter("ch");//배열로 받을때는 이 메소드 불가능
	String[] ch=request.getParameterValues("ch");//배열로 받을때는 이배열로 받아야 한다.
	ArrayList list=new ArrayList();
	for(int i=0; i<ch.length; i++){
		out.print("선택한 제품 id는"+ch[i]+"<br>");
		
		PlanProduct planProduct=new PlanProduct();
		planProduct.setPlan_id(Integer.parseInt(plan_id));
		planProduct.setProduct_id(Integer.parseInt(ch[i]));
		//planProductDAO.insert(planProduct);//for문돌다가 하나라도 실패하면 rollback해야 하므로 DAO에서 commit를 하면 안된다.
		//for문을 DAO에서 돌려야 한다.	
		list.add(planProduct);
	}
		planProductDAO.insert(list);
	//planProductDAO.commit();
	
	
	//insert into planproduct(어떤기획, 누구를) values ( plan_id  ch) 
%>
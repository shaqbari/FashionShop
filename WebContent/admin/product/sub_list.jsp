<%@page import="com.fashion.product.SubCategory"%>
<%@page import="java.util.List"%>
<%@page import="com.fashion.product.SubCategoryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	SubCategoryDAO subCategoryDAO=new SubCategoryDAO();
%>
<%
	String top_id=request.getParameter("top_id");
	//out.print(top);
	/*
		select * from subcategory where top_id=?
	*/
	List<SubCategory> list= subCategoryDAO.select(Integer.parseInt(top_id));
	
	StringBuffer sb=new StringBuffer();	
	sb.append("{");
	sb.append("\"subList\":[");
	for(int i=0; i<list.size(); i++){
		SubCategory sub=list.get(i);
		sb.append("{");
		sb.append("\"sub_id\":"+sub.getSub_id()+",");
		sb.append("\"sub_name\":\""+sub.getSub_name()+"\",");
		sb.append("\"top_id\":"+sub.getTop_id());
		if(i<list.size()-1){
			sb.append("},");
		}else{
			sb.append("}");			
		}
	}
	sb.append("]");
	sb.append("}");
	
	out.print(sb.toString());
	

%>


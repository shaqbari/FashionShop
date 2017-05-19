<%@page import="com.fashion.order.Customer"%>
<%@page import="com.fashion.order.Guest"%>
<%@page import="com.fashion.order.CustomerDAO"%>
<%@page import="com.fashion.order.GuestDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	GuestDAO guestDAO=new GuestDAO();
	CustomerDAO customerDAO=new CustomerDAO();
%>
<%
	request.setCharacterEncoding("utf-8");
	//상품정보	


	//주문정보
	String c_name=request.getParameter("c_name");
	String c_phone1=request.getParameter("c_phone1");
	String c_phone2=request.getParameter("c_phone2");
	String c_phone3=request.getParameter("c_phone3");
	String c_email=request.getParameter("c_email");
	String c_addr1=request.getParameter("c_addr1");
	String c_addr2=request.getParameter("c_addr2");
	
	//배송정보
	String r_name=request.getParameter("r_name");
	String r_phone1=request.getParameter("r_phone1");
	String r_phone2=request.getParameter("r_phone2");
	String r_phone3=request.getParameter("r_phone3");
	String r_addr1=request.getParameter("r_addr1");
	String r_addr2=request.getParameter("r_addr2");

	//결제정보
	String pay_method=request.getParameter("pay_method");
	String total_price=request.getParameter("total_price");
	String bank=request.getParameter("bank");
	String pay_name=request.getParameter("pay_name");
	
	//비회원일 경우 비회원 등록 후 고객 등록!!
	//원래는 if문을 줘야 한다.
	Guest guest=new Guest();
	guest.setName(c_name);
	guest.setPhone(c_phone1+"-"+c_phone2+"-"+c_phone3);
	guest.setEmail(c_email);
	guest.setAddr(c_addr1+c_addr2);
	int guest_id=guestDAO.insert(guest);
	
	Customer customer=new Customer();
	customer.setMember_type("guest");
	customer.setType_id(guest_id);
	int customer_id=customerDAO.insert(customer);
	
	out.print(customer_id);
	
	
%>

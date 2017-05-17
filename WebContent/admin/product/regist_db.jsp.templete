<%@ page contentType="text/html;charset=euc-kr"%>
<%@ page import="model.manager.*"%>
<%@ page import="model.formbean.*"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="java.io.*"%>
<%request.setCharacterEncoding("euc-kr");%>
<%!
MultipartRequest multi;
%>
<%
	//1 파일업로드 컴포넌트 생성 
	String saveDirectory=application.getRealPath("/upload");
	int maxSize=1024*1024*2;//2m
	String encoding="euc-kr";
	multi=new MultipartRequest(request,saveDirectory,maxSize,encoding);
	String productname=multi.getParameter("productname");
	String gender=multi.getParameter("gender");
	String category1=multi.getParameter("category1");
	String category2=multi.getParameter("category2");
	String brand=multi.getParameter("brand");
	String nation=multi.getParameter("nation");
	String price=multi.getParameter("price");
	String discount=multi.getParameter("discount");
	String point=multi.getParameter("point");
	String memo=multi.getParameter("memo");
	String psize=multi.getParameter("psize");
	String color=multi.getParameter("color");
	String stock=multi.getParameter("stock");
	String detail=multi.getParameter("detail");
	String fileType=multi.getParameter("fileType");//확장자 추가
	ProductManager pm=new ProductManager();
	ProductBean pb=new ProductBean();
	pb.setProductname(productname);
	pb.setGender(gender);
	pb.setCategory1(Integer.parseInt(category1));
	pb.setCategory2(Integer.parseInt(category2));
	pb.setBrand(brand);
	pb.setNation(nation);
	pb.setPrice(Integer.parseInt(price));
	pb.setDiscount(Integer.parseInt(discount));
	pb.setPoint(Integer.parseInt(point));
	pb.setMemo(memo);
	pb.setPsize(psize);
	pb.setColor(color);
	pb.setStock(Integer.parseInt(stock));
	pb.setDetail(detail);
	pb.setFileType(fileType);
	if(pm.executeInsert(pb)){
		out.print("데이터 입력 성공!!");
		File file=multi.getFile("filename");
		File destFile=new File(saveDirectory+"/P"+pm.getProductCode()+"."+fileType);// 복사용도 (다시 이름을 지정하기위함)
		file.renameTo(destFile);
		response.sendRedirect("/admin/product/list.jsp");
	}
%>
















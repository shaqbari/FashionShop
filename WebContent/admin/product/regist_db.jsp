<%@page import="Common.file.FileManager"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="com.fashion.product.ProductDAO"%>
<%@page import="java.io.File"%>
<%@page import="com.fashion.product.Product"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	ProductDAO productDAO=new ProductDAO();
%>
<%
	//상품관련 파라미터를 받아와서, db에 등록
	ServletFileUpload upload=new ServletFileUpload(new DiskFileItemFactory());
	upload.setHeaderEncoding("UTF-8");	
	
	//클라이언트가 전송한 파라미터 해석하기
	List<FileItem> list=upload.parseRequest(request);
	FileItem imgItem=null;
	String realPath=null;
	
	//아이템 만큼 반복문 수행하되, 크게 파일 or 파일 아니냐로 구분한다.
	Product dto=new Product();
	
	for(int i=0; i<list.size(); i++){
		FileItem item=list.get(i);
		String name=item.getFieldName();
		String value=item.getString("utf-8");//이거도 utf-8로 지정해야 한다.
		
		if(item.isFormField()){//파일이 아닌 텍스트라면
			if(name.equals("sub")){
				out.print("sub_id value:"+value);
				dto.setSub_id(Integer.parseInt(value));//parseint할때 값이 비어있으면 오류난다. 미리 0으로 채워두자
				out.print("<br>");
				out.print("dto.getProduct_name():"+dto.getSub_id());
				out.print("<br>");
			}else if(name.equals("product_name")){
				dto.setProduct_name(value);
				out.print("product Name value:"+value);
				out.print("<br>");
				out.print("dto.getProduct_name():"+dto.getProduct_name());
				out.print("<br>");
				
			}else if(name.equals("gender")){
				dto.setGender(value);
				
			}else if(name.equals("brand")){
				dto.setBrand(value);
				
			}else if(name.equals("origin")){
				dto.setOrigin(value);
				
			}else if(name.equals("price")){
				dto.setPrice(Integer.parseInt(value));
				
			}else if(name.equals("discount")){
				dto.setDiscount(Integer.parseInt(value));
				
			}else if(name.equals("point")){
				dto.setPoint(Integer.parseInt(value));
				
			}else if(name.equals("memo")){
				dto.setMemo(value);
				
			}else if(name.equals("psize")){
				dto.setPsize(value);
				
			}else if(name.equals("color")){
				dto.setColor(value);
				
			}else if(name.equals("detail")){
				dto.setDetail(value);
				
			}
			
		}else{//파일이라면 업로드.
			imgItem=item;
			dto.setImg(item.getName());					
		}		
	}
	
	out.print("성별은 "+dto.getGender());
	
	//db에 넣기
	int product_id=productDAO.insert(dto);//for문 안에 있어서 에러난거 같다.
	//insert를 한번 해야 currval을 얻어올 수 있다. mybatis에서 지원
	
	out.print("상품등록결과 id"+product_id);
		//업로드
	realPath=application.getRealPath("/product"+File.separator+product_id+"."+FileManager.getExt(imgItem.getName()));
		//out.print("파일명은 "+item.getName());
	
	InputStream is=imgItem.getInputStream();
	FileOutputStream fos=new FileOutputStream(realPath);
	
	byte[] b=new byte[1024];
	int flag;
	while(true){
		flag=is.read(b);
		if(flag==-1)break;
		fos.write(b);
	}
	fos.close();
	is.close();
	
	//지정한 url로 클라이언트의 브라우저가 재접속하라!! 페이지이동만 있으면 이걸 쓰면 편하다.
	response.sendRedirect("/admin/product/list.jsp");
	 
	
%>
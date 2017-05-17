<%@ page contentType="text/html;charset=utf-8"%>
<%!
	//메세지 출력 메소드 정의
	
	//성공 후 원하는 url 요청
	public String showMsgURL(String msg, String url){
		//선언부에서  out을 쓸수 없으므로 String을 제조해서 보내주자
		StringBuffer sb= new StringBuffer();
		sb.append("<script>");
		sb.append("alert('"+msg+"');");
		sb.append("location.href='"+url+"';");
		sb.append("</script>");
			
		return sb.toString();
	}	
	
	//실패 후, 뒤로가기
	public String showMsgBack(String msg){
		//선언부에서  out을 쓸수 없으므로 String을 제조해서 보내주자
		StringBuffer sb= new StringBuffer();
		sb.append("<script>");
		sb.append("alert('"+msg+"');");
		sb.append("history.back();");
		sb.append("</script>");
			
		return sb.toString();
	}
%>

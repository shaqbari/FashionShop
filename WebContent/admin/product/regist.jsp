<%@ taglib uri="http://ckeditor.com" prefix="ckeditor" %>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.fashion.product.TopCategoryDAO"%>
<%@page import="com.fashion.product.TopCategory"%>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="UTF-8" %>
<%!
	TopCategoryDAO topCategoryDAO=new TopCategoryDAO();
%>
<%
	List<TopCategory> topList=topCategoryDAO.selectAll();	
%>

<html>
<head>
<title></title>
<link rel="stylesheet" href="/admin/css/intranet.css" type="text/css">
<style type="text/css">
<!--
	td{font-size:9pt;}
	.style1 {font-weight: bold}
	.style2 {font-weight: bold}
-->
</style>
<script>
	var xhttp;//ajax의  요청객체
	var select_sub; //sublist select태그
	
	function init(){
		xhttp=new XMLHttpRequest();
		
	}

	//서브 카테고리 목록을 서버에 요청한다.
	function getSub(){	
		/*form1.action="sub_list.jsp";
		form1.submit(); 비동기 방식으로 보내야 한다.*/
		
		var top_id=form1.top_id.value;
		
		xhttp.onreadystatechange=function(){
			if (this.readyState==4&&this.status==200) {												
					//alert("조회성공"+this.responseText);
					//console.log(this.responseText);
					var obj=JSON.parse(this.responseText);
					
					//subcategory에 붙이기
					getList(obj);							
			}
		}			
		//누를때마다 열고 보낸다.
		xhttp.open("POST", "sub_list.jsp", true);
		xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");//post방식으로 보낼때는 이
		xhttp.send("top_id="+top_id);	//요청 body를 채운다. get방식(header)일 경우 parameter를 open의 주소에 입력한다. 
		
	}
	
	function getList(obj){
		select_sub=document.getElementById("sub"); //name으로 가져올때는 elements다!! name으로 하니깐 안되고, id로 하니깐 된다.
		//name으로 하려면 subList[0]을 붙여야 하나?
		
		//먼저 지운다.
		/* while(select_sub.hasChildNodes()){
			select_sub.removeChild(select_sub.firstChild);
			
		} */
		
		//지우고
		var leng=select_sub.length;
		for(var i=0; i<leng; i++){			
			//select_sub.remove(select_sub.length-1);//마지막 지운다. i는 안된다. 왜냐하면 length는 실시간으로 변하기 때문에
			select_sub.remove(0);
			
		}
		
		//채운다
		for(var i=0; i<obj.subList.length; i++){
			var subObj=obj.subList[i];
			var op=document.createElement("option");
			op.text=subObj.sub_name;
			op.value=subObj.sub_id;
			select_sub.add(op)
		}
				
		/* var tag="";
		select_sub.innerHTML=tag;//먼저 초기화!
		tag+="<option value=\"0\">▼ 선 택</option>";
		for(var i=0; i<obj.subList.length; i++){
			var sub=obj.subList[i]; //get(i)가아니다!
			tag+="<option value=\""+sub.sub_id+"\">"+sub.sub_name+"</option>";			
		}
		//console.log(tag);
		select_sub.innerHTML=tag; */
	}

	//상품등록
	function regist(){
		//태그에서 enctype을 지정해버리면 위에 하위목록 받는것을 못한다. js로 동적으로 지정해야 한다.
		form1.encoding="multipart/form-data";//binary file이 껴있으면 이 형식으로 보내야 한다.enctype이아니다.
		form1.action="regist_db.jsp";
		form1.submit();
		
	}
	
</script>
</head>
<body leftmargin="50" topmargin="0" marginwidth="0" marginheight="0" onLoad="init();">
<table width="650" border="0" cellpadding="0" cellspacing="0">
<form method="post" name="form1" >
<input type="hidden" name="fileType">
<tr>
	<td>&nbsp;</td>
</tr>
  <tr>
  	<td>
		<table width="650" border="0" cellspacing="0" cellpadding="0" class="default" id="intranet_write">
        <tr> 
          <td colspan="2" height="5" bgcolor="#BBBBBB"></td>
        </tr>
        <tr height="30"> 
          <td height="30" colspan="2" align="center" valign="bottom" bgcolor="#DDDDDD"style="padding-bottom:5"><b> 상품 등록</b></td>
        </tr>
        <tr> 
          <td colspan="2" height="1" bgcolor="#BBBBBB"></td>
        </tr>
        <tr> 
          <td colspan="2" height="5"></td>
        </tr>
        <tr> 
          <td width="100">카테고리</td>
          <td class="pd_l10">
			<select name="top_id" onChange="getSub()">
				<option value="0">▼ 선 택</option>
				<% for(int i=0; i<topList.size(); i++){ %>
					<%TopCategory top=topList.get(i); %>
					<option value="<%=top.getTop_id()%>"><%=top.getTop_name() %></option>
				<%} %>
			</select>
			<select id="sub" name="sub"> <!--id와 name은 중복가능  -->
				<option value="0">▼ 선 택</option>
			</select>
		</td>
        </tr>
        <tr> 
          <td width="100">제품명</td>
          <td class="pd_l10"><input name="product_name" type="text" id="product_name" style="width:120px" maxlength="9"></td>
        </tr>
        <tr> 
          <td width="100">성별구분</td>
          <td class="pd_l10">남성
            <input type="radio" name="gender" value="남성">
&nbsp;&nbsp;여성
          <input name="gender" type="radio" value="여성" checked></td>
        </tr>
        <tr id="pay_id" > 
          <td width="100">브랜드</td>
          <td class="pd_l10"><input name="brand" type="text" id="brand" style="width:120px" maxlength="9">          </td>
        </tr>
        <tr id="bank_id" >
          <td>원산지</td>
          <td><span class="pd_l10">
            <input name="origin" type="text" id="origin" style="width:120px" maxlength="9">
          </span></td>
        </tr>
        <tr id="bank_id" >
          <td>판매 가격</td>
          <td><span class="pd_l10">
            <input name="price" type="text" id="price" style="width:120px; text-align:right" maxlength="9" value="0" >
          </span></td>
        </tr>
        <tr id="bank_id" >
          <td>할인가격</td>
          <td><span class="pd_l10">
            <input name="discount" type="text" id="discount" style="width:120px; text-align:right" maxlength="9" value="0">
          </span></td>
        </tr>
        <tr id="bank_id" >
          <td>적립율</td>
          <td><span class="pd_l10">
            <input name="point" type="text" id="point" style="width:120px; text-align:right" maxlength="9" value="0">
          %</span></td>
        </tr>
        <tr id="bank_id" >
          <td>간단 소개</td>
          <td><span class="pd_l10">
            <input name="memo" type="text" id="memo" style="width:400px" maxlength="9">
          </span></td>
        </tr>
        <tr id="bank_id" >
          <td>사이즈</td>
          <td><span class="pd_l10">
            <input name="psize" type="text" id="psize" style="width:120px" >
          * 쉼표로 구분 ex) 95 , 100 , 105 </span></td>
        </tr>
        <tr id="bank_id" >
          <td>색상</td>
          <td><span class="pd_l10">
            <input name="color" type="text" id="color" style="width:120px" >
* 쉼표로 구분 ex) blue ,yellow ,red </span></td>
        </tr>
      <!--   <tr id="bank_id" >
          <td>재고량</td>
          <td><span class="pd_l10">
            <input name="stock" type="text"  style="width:120px" maxlength="9"></span></td>
        </tr> -->
        <tr id="bank_id" >
          <td>상품 이미지 </td>
          <td><input type="file" name="img"></td><!-- 프리뷰기능 해보자 -->
        </tr>
        <tr> 
          <td width="100">상세 설명 </td>
          <td class="pd_l10"><textarea id="detail" name="detail" cols="80" rows="10"  style="border:1px solid #444444;"></textarea></td>
        <ckeditor:replace  replace="detail" basePath="/ckeditor/" /><!--editor로  변환 -->
        </tr>
        <tr> 
          <td colspan="2" height="5" bgcolor="#BBBBBB"></td>
        </tr>
	</table>
	<table width="650" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td colspan="2" align="right" style="padding-top:10">
			<a href="javascript:history.back();" class="but">목록보기</a>
            <a href="javascript:regist();" class="but">상품등록</a> 
          </tr>
      </table>
	  </td>
  </tr>
  <tr> 
    <td width="590" height="10" colspan="2" valign="top"></td>
  </tr>
  <tr><td><table width="590" border="0" cellpadding="0" cellspacing="0" align="center" class="copyright">
   <tr>
    <td height="43"></td>
  </tr>
  <tr>
    <td class="schedule">COPYRIGHT(C) 2002 BY  Java Fashion ALL RIGHTS RESERVED.</td>
  </tr>
</table>
</td></tr>
  </form>
</table>
</body>
</html>

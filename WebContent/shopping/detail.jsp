<%@page import="Common.file.FileManager"%>
<%@page import="com.fashion.product.Product"%>
<%@page import="com.fashion.product.ProductDAO"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%!
	//디자인 위치 감이 안잡히면 openwith webpage editor이용
	ProductDAO productDAO=new ProductDAO();

%>
<%
	String product_id=request.getParameter("product_id");
	Product product=productDAO.select(Integer.parseInt(product_id));

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr" />
<title>Untitled Document</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
#mainNavi,#sub_category{color:#FFFFFF;text-align:center;font-family:"굴림체", "돋움체","Arial"}
.style3 {color: #FF0000}
.style1 {	font-size: 20px;
	font-weight: bold;
}
.style2 {color: #FF00FF}

-->
</style>
<script>
	function goCart(){
		alert("전송");
		form1.method="post";
		form1.action="pre_cart.jsp";
		form1.submit();
		
	}
</script>

</head>
<body>
<table align="center" width="970" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="722" height="60" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="60"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="224" rowspan="2"><img src="/images/common/logo.gif" width="224" height="64" /></td>
            <td height="30" align="right"><table height="20" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="40"><img src="/images/main/btn_login.gif" width="40" height="18" /></td>
                <td width="64"><img src="/images/main/menu_join.gif" width="64" height="18" /></td>
                <td width="60"><img src="/images/main/menu_cart.gif" width="60" height="18" /></td>
                <td width="88"><img src="/images/main/menu_orderlist.gif" width="88" height="18" /></td>
                <td width="58"><img src="/images/main/menu_cs.gif" width="58" height="18" /></td>
              </tr>
            </table>			</td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="30"><table width="100%" height="30" border="0" cellpadding="0" cellspacing="0" bgcolor="#000000">
          <tr id="mainNavi" align="center">
            <td>메뉴1</td>
            <td>메뉴2</td>
            <td>메뉴3</td>
            <td>메뉴4</td>
            <td>메뉴5</td>
            <td>메뉴6</td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="100"><img src="/images/main/mainVisual.jpg" width="970" height="195" /></td>
      </tr>
      <tr>
        <td height="450" valign="top"><table width="100%" height="300" border="0" cellpadding="0" cellspacing="0">
          <tr height="50">
            <td width="150">&nbsp;</td>
            <td width="10">&nbsp;</td>
            <td width="810" height="30" >상위 카테고리&lt; 하위 카테고리 </td>
          </tr>
          <tr>
            <td width="150" valign="top"></td>
            <td width="10">&nbsp;</td>
            <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="731" height="102" valign="top"background="images/main_bg05.gif" style="padding-top:10px;"><img src="/images/detail/detail_tltle.gif" width="731" height="67" /></td>
              </tr>
              <tr>
                <td>
                <form name="form1">
	                <input type="hidden" name="product_id" value="<%=product.getProduct_id() %>" />
	                <input type="hidden" name="img", value="<%=product.getImg() %>" />
	                <input type="hidden" name="product_name", value="<%=product.getProduct_name() %>" />
	                <input type="hidden" name="price", value="<%=product.getPrice() %>" />
	                <input type="hidden" name="discount", value="<%=product.getDiscount() %>" />
                
                <table border="1" width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="5" rowspan="2" valign="top"><img src="/images/detail/detail_bg01.gif" width="5" height="25" /></td>
                      <td width="690"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="300"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td height="300"><img src="/product/<%=product_id+"."+FileManager.getExt(product.getImg()) %>" width="300" height="300" border="1" /></td>
                                </tr>
                                <tr>
                                  <td height="36" align="center"><img src="/images/detail/detail_btn_view.gif" width="51" height="24" /></td>
                                </tr>
                            </table></td>
                            <td width="19"></td>
                            <td width="370" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                  <td width="100" height="46" valign="top" style="padding-left:20px; padding-top:10px;"><span class="style1"><%=product.getProduct_name() %></span></td>
                                  <td width="269" valign="top"></td>
                                </tr>
                                <tr>
                                  <td height="24" valign="top"><img src="/images/detail/img_price.gif" width="62" height="12" /></td>
                                  <td valign="top"><span class="style2" style="text-decoration:line-through"><%=product.getPrice() %>원</span> ㅡ&gt; <span class="style2"><%=product.getPrice() %>원</span></td>
                                </tr>
                                <tr>
                                  <td height="24" valign="top"><img src="/images/detail/img_point.gif" width="50" height="12" /></td>
                                  <td valign="top"><%=product.getDiscount() %></td>
                                </tr>
                                <tr>
                                  <td height="24" valign="top"><img src="/images/detail/img_brand.gif" width="51" height="12" /></td>
                                  <td valign="top"><%=product.getProduct_name() %></td>
                                </tr>
                                <tr>
                                  <td height="24" valign="top"><img src="/images/detail/img_made.gif" width="49" height="12" /></td>
                                  <td valign="top"><%=product.getOrigin() %></td>
                                </tr>
                                <tr>
                                  <td height="24" valign="top"><img src="/images/detail/img_code.gif" width="63" height="12" /></td>
                                  <td valign="top"><table width="100%" height="24" border="0" cellpadding="0" cellspacing="0">
                                      <tr>
                                        <td width="82" valign="top"><%=product.getDetail() %></td>
                                        <td valign="top"><img src="/images/detail/detail_btn_size.gif" width="79" height="20" /></td>
                                      </tr>
                                  </table></td>
                                </tr>
                                <tr>
                                  <td height="24" valign="top"><img src="/images/detail/img_size.gif" width="51" height="12" /></td>
                                  <td valign="top">
                                  	<%String[] psize=product.getPsize().split(","); %>
                                  	<select name="psize">
                                      <option>선택</option>
			 							<%for(int i=0; i<psize.length; i++){ %>
                                      	<option value="1"><%=psize[i] %></option>
                                      	<%} %>
                                    </select>
                                  </td>
                                </tr>
                                <tr>
                                  <td height="24" valign="top"><img src="/images/detail/img_color.gif" width="40" height="13" /></td>
                                  <td valign="top"><select name="color">
                                      <option value="1">선택</option>
                                  </select></td>
                                </tr>
                                <tr>
                                  <td height="24" valign="top"><img src="/images/detail/img_count.gif" width="39" height="13" /></td>
                                  <td valign="top"><select name="ea">
                                      <option value="1">선택</option>
                                  </select></td>
                                </tr>
                                <tr>
                                  <td height="33" colspan="2" valign="top"></td>
                                </tr>
                                <tr>
                                  <td height="24" colspan="2" valign="top">
                                  <a href="step1.html">
	                                  <img src="/images/detail/detail_btn_buy.gif" width="109" height="23" border="0" />
	                                  </a>&nbsp;
	                                  <img src="/images/detail/detail_btn_cart.gif" width="109" height="23" onClick="goCart();"/>
	                                  &nbsp;
	                                  <img src="/images/detail/detail_btn_wish.gif" width="109" height="23" />
                                  </td>
                                </tr>
                            </table></td>
                          </tr>
                      </table></td>
                      <td rowspan="2"></td>
                    </tr>
                    <tr>
                      <td height="23"></td>
                    </tr>
                </table>
                </form>
                </td>
              </tr>
              <tr>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="4" rowspan="6"></td>
                      <td width="690"><img src="/images/detail/detailinfo_img.gif" width="70" height="25" /></td>
                      <td rowspan="6"></td>
                    </tr>
                    <tr>
                      <td height="3"><img src="/images/detail/detail_bg02.gif" width="690" height="3" /></td>
                    </tr>
                    <tr>
                      <td height="32">&nbsp;</td>
                    </tr>
                    <tr>
                      <td><img src="../product_img/004060-000530_S[3].jpg" width="500" height="500" />
					  <p><img src="../product_img/004060-000562_S[2].jpg" width="500" height="500" />					  </td>
                    </tr>
                    <tr>
                      <td><img src="/images/detail/infotext_img.gif" width="690" height="478" /></td>
                    </tr>
                    <tr>
                      <td><img src="/images/detail/size_img.gif" width="690" height="255" /></td>
                    </tr>
                </table></td>
              </tr>
              <tr>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="4" rowspan="4"></td>
                      <td width="690"><img src="/images/detail/detailinfo2_img.gif" width="110" height="25" /></td>
                      <td rowspan="4"></td>
                    </tr>
                    <tr>
                      <td height="3"><img src="/images/detail/detail_bg02.gif" width="690" height="3" /></td>
                    </tr>
                    <tr>
                      <td height="32">&nbsp;</td>
                    </tr>
                    <tr>
                      <td><img src="/images/detail/text_img.gif" width="690" height="762" /></td>
                    </tr>
                </table></td>
              </tr>
              <tr>
                <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="4" rowspan="5"></td>
                      <td width="690"><img src="/images/detail/detailinfo3_img.gif" width="70" height="25" /></td>
                      <td rowspan="5"></td>
                    </tr>
                    <tr>
                      <td height="1"><img src="/images/detail/detail_bg02.gif" width="690" height="3" /></td>
                    </tr>
                    <tr>
                      <td height="32"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="575"><img src="/images/detail/text02_img.gif" width="575" height="23" /></td>
                            <td><img src="/images/detail/question_btn.gif" width="72" height="23" /></td>
                          </tr>
                      </table></td>
                    </tr>
                    <tr>
                      <td><!-- 상품문의 테이블 시작 ======================================= -->
                          <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                              <td valign="top"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                                  <tr>
                                    <td><!-- 바깥테이블 시작-->
                                        <table width="100%" border="0" cellpadding="0" cellspacing="3" bgcolor="#F2F2F2">
                                          <tr>
                                            <td bgcolor="#D9D9D9" valign="top"><table width="100%"  border="0" cellspacing="1" cellpadding="0">
                                                <tr>
                                                  <td bgcolor="#FFFFFF" valign="top" style="padding:10px;"><!-- 내용시작-->
                                                      <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                          <td valign="top"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                                              <tr>
                                                                <td valign="top"><!-- 입력테이블 시작-->
                                                                    <table
                                                id="__psn_QuestionDlg"
                                                style="display:none;"                                          
                                                width="100%"  border="0" cellspacing="0" cellpadding="0">
                                                                      <tr>
                                                                        <td width="4" height="4" valign="top"><img src="http://www.who-z.com/iPageImages/POINTSHOP_ITEM_GOODSQA/sys_default/table1-1.gif" width="4" height="4" /></td>
                                                                        <td bgcolor="#EBEBEB"></td>
                                                                        <td width="4" height="4" valign="top"><img src="http://www.who-z.com/iPageImages/POINTSHOP_ITEM_GOODSQA/sys_default/table1-2.gif" width="4" height="4" /></td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td width="4" bgcolor="#EBEBEB"></td>
                                                                        <td bgcolor="#EBEBEB" valign="top" style="padding-top:5px;" align="center"><!--입력시작-->
                                                                            <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                                                              <form method="post" name="__oFormGoodsQA" id="__oFormGoodsQA">
                                                                                <input type="hidden" name="iCmdObject" value='TGoodsQA' />
                                                                                <input type="hidden" name="iCmdExec" value='' />
                                                                                <input type="hidden" name="iCmdValue" value='' />
                                                                                <input type="hidden" name="iCategoryId" value='25' />
                                                                                <input type="hidden" name="iCategoryIdMain" value='' />
                                                                                <input type="hidden" name="iGoodsId" value='0025_00035' />
                                                                                <input type="hidden" name="iGoodsQAPage" value='' />
                                                                                <tr>
                                                                                  <td><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                                                                      <tr>
                                                                                        <td width="35" style="padding-left:10px;" >제목</td>
                                                                                        <td><input style="width:97%;"  class="input01" type="text" name="oSubject" size="15" />
                                                                                        </td>
                                                                                      </tr>
                                                                                      <tr>
                                                                                        <td width="35" style="padding-left:10px;">내용 </td>
                                                                                        <td><textarea style="width:97%;" name="oMemo"  rows="3"></textarea>
                                                                                        </td>
                                                                                      </tr>
                                                                                  </table></td>
                                                                                </tr>
                                                                                <tr>
                                                                                  <td align="right" style="padding-top:3px; padding-bottom:3px; padding-right:10px;"><!-- 작성자 입력 테이블-->
                                                                                      <table   border="0" cellspacing="0" cellpadding="0">
                                                                                        <tr>
                                                                                          <td>이름
                                                                                            <input type="text" size="10" name="oName" class="input01">
                                                                                            비밀번호
                                                                                            <input type="password" size="4" name="oPass" class="input01" />
                                                                                          </td>
                                                                                          <td  align="center" style="padding-left:7px;"><a href="javascript:onclick=__ps_GoodsQA_Submit( document.__oFormGoodsQA );">
                                                                                            <image border=0 style="cursor:hand;" SRC=http://www.who-z.com/iPageImages/POINTSHOP_ITEM_GOODSQA/sys_default/btn_write.gif>
                                                                                          </a> </td>
                                                                                        </tr>
                                                                                      </table>
                                                                                    <!-- 작성자 입력 테이블 끝-->
                                                                                  </td>
                                                                                </tr>
                                                                              </form>
                                                                            </table>
                                                                          <!--입력끝-->
                                                                        </td>
                                                                        <td width="4" bgcolor="#EBEBEB"></td>
                                                                      </tr>
                                                                      <tr>
                                                                        <td width="4" height="4" valign="top"><img src="http://www.who-z.com/iPageImages/POINTSHOP_ITEM_GOODSQA/sys_default/table1-3.gif" width="4" height="4" /></td>
                                                                        <td bgcolor="#EBEBEB"></td>
                                                                        <td width="4" height="4" valign="top"><img src="http://www.who-z.com/iPageImages/POINTSHOP_ITEM_GOODSQA/sys_default/table1-4.gif" width="4" height="4" /></td>
                                                                      </tr>
                                                                    </table>
                                                                  <!-- 입력테이블 끝-->
                                                                </td>
                                                              </tr>
                                                          </table></td>
                                                        </tr>
                                                        <tr>
                                                          <td valign="top" style="padding-top:10px;"><table width="100%"  border="0" cellspacing="0" cellpadding="0" style="table-layout:fixed;">
                                                            <tr>
                                                              <td width="30" height="26" align="center"><span style="padding-top:14px;"><img src="http://www.who-z.com/iPageImages/POINTSHOP_ITEM_GOODSQA/sys_default/icon_a.gif" /></span></td>
                                                              <td style="padding-left:7px;"><a href="javascript:__psuToggleMemoView(0);">반스슬립온</a> &nbsp; <img 
    onclick="__ps_GoodsQA_Delete(24079);" style="cursor:hand;"
    src="http://www.who-z.com/iPageImages/POINTSHOP_ITEM_GOODSQA/sys_default/icon_del.gif" width="11" height="11"  align="absmiddle" /></td>
                                                              <td width="50" align="center" style="font-size:8pt; color:#909090;">김석찬</td>
                                                              <td width="40" align="center"><img src="http://www.who-z.com/iPageImages/POINTSHOP_ITEM_GOODSQA/sys_default/icon_3.gif" /></td>
                                                              <td width="80" align="center" style="font-size:8pt; color:#909090;">07-08-13 </td>
                                                            </tr>
                                                            <tr id="__ps_GoodsQA_Data_" style="display:none;">
                                                              <td style="padding:0px;" colspan="5"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                                                  <tr>
                                                                    <td>&nbsp;</td>
                                                                    <td colspan="5" ><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                                                        <tr>
                                                                          <td background="/iPageImages/POINTSHOP_ITEM_GOODSQA/sys_default/line01.gif" height="1"></td>
                                                                        </tr>
                                                                        <tr>
                                                                          <td style="padding:10px;"> 상혁씨가 신고있는 반스슬립온 사이즈가 몇이에요</td>
                                                                        </tr>
                                                                    </table></td>
                                                                  </tr>
                                                                  <tr>
                                                                    <td align="center" valign="top" style="padding-top:14px;"><img src="http://www.who-z.com/iPageImages/POINTSHOP_ITEM_GOODSQA/sys_default/icon_a.gif" /></td>
                                                                    <td colspan="5" ><!-- 관리자 답변내용 -->
                                                                        <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                                                          <tr>
                                                                            <td background="/iPageImages/POINTSHOP_ITEM_GOODSQA/sys_default/line01.gif" height="1"></td>
                                                                          </tr>
                                                                          <tr>
                                                                            <td style="padding:10px;" valign="top"><p>안녕하세요 후즈입니다</p>
                                                                                <br />
                                                                                <p>이제품은 상혁씨 개인소장이시구여</p>
                                                                              <br />
                                                                                <p>싸이즈는 250입니다^^</p>
                                                                              <br />
                                                                                <p>좋은 하루 보내세요</p>
                                                                              <br />
                                                                                <p>감사합니다</p>
                                                                              <br />
                                                                                <p>&nbsp;</p>
                                                                              <br />
                                                                                <span class="text02">TK!! (07-08-13 11:16)</span> </td>
                                                                          </tr>
                                                                        </table>
                                                                      <!-- 관리자 답변내용 끝 -->
                                                                    </td>
                                                                  </tr>
                                                              </table></td>
                                                            </tr>
                                                          </table>
                                                            <table width="100%"  border="0" cellspacing="0" cellpadding="0" style="table-layout:fixed;">
                                                              <tr>
                                                                <td width="30" height="26" align="center"><img src="http://www.who-z.com/iPageImages/POINTSHOP_ITEM_GOODSQA/sys_default/icon_q.gif" /></td>
                                                                <td style="padding-left:7px;"><a href="javascript:__psuToggleMemoView(0);">반스슬립온</a> &nbsp; <img 
    onclick="__ps_GoodsQA_Delete(24079);" style="cursor:hand;"
    src="http://www.who-z.com/iPageImages/POINTSHOP_ITEM_GOODSQA/sys_default/icon_del.gif" width="11" height="11"  align="absmiddle" /></td>
                                                                <td width="50" align="center" style="font-size:8pt; color:#909090;">김석찬</td>
                                                                <td width="40" align="center"><img src="http://www.who-z.com/iPageImages/POINTSHOP_ITEM_GOODSQA/sys_default/icon_3.gif" /></td>
                                                                <td width="80" align="center" style="font-size:8pt; color:#909090;">07-08-13 </td>
                                                              </tr>
                                                              <tr id="__ps_GoodsQA_Data_" style="display:none;">
                                                                <td style="padding:0px;" colspan="5"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                      <td>&nbsp;</td>
                                                                      <td colspan="5" ><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                                                          <tr>
                                                                            <td background="/iPageImages/POINTSHOP_ITEM_GOODSQA/sys_default/line01.gif" height="1"></td>
                                                                          </tr>
                                                                          <tr>
                                                                            <td style="padding:10px;"> 상혁씨가 신고있는 반스슬립온 사이즈가 몇이에요</td>
                                                                          </tr>
                                                                      </table></td>
                                                                    </tr>
                                                                    <tr>
                                                                      <td align="center" valign="top" style="padding-top:14px;"><img src="http://www.who-z.com/iPageImages/POINTSHOP_ITEM_GOODSQA/sys_default/icon_a.gif" /></td>
                                                                      <td colspan="5" ><!-- 관리자 답변내용 -->
                                                                          <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                                                                            <tr>
                                                                              <td background="/iPageImages/POINTSHOP_ITEM_GOODSQA/sys_default/line01.gif" height="1"></td>
                                                                            </tr>
                                                                            <tr>
                                                                              <td style="padding:10px;" valign="top"><p>안녕하세요 후즈입니다</p>
                                                                                  <br />
                                                                                  <p>이제품은 상혁씨 개인소장이시구여</p>
                                                                                <br />
                                                                                  <p>싸이즈는 250입니다^^</p>
                                                                                <br />
                                                                                  <p>좋은 하루 보내세요</p>
                                                                                <br />
                                                                                  <p>감사합니다</p>
                                                                                <br />
                                                                                  <p>&nbsp;</p>
                                                                                <br />
                                                                                  <span class="text02">TK!! (07-08-13 11:16)</span> </td>
                                                                            </tr>
                                                                          </table>
                                                                        <!-- 관리자 답변내용 끝 -->
                                                                      </td>
                                                                    </tr>
                                                                </table></td>
                                                              </tr>
                                                            </table>
                                                            <!--내용출력 시작-->
                                                            <!--내용출력 끝--></td>
                                                        </tr>
                                                      </table>
                                                    <!-- 내용끝--></td>
                                                </tr>
                                            </table></td>
                                          </tr>
                                        </table>
                                      <!-- 바깥테이블 끝-->
                                    </td>
                                  </tr>
                              </table></td>
                            </tr>
                            <tr>
                              <td height="5"></td>
                            </tr>
                            <tr>
                              <td ><table width="100%">
                                  <tr>
                                    <td style="font-family:Tahoma;font-size:9pt; padding-left:5px;" align="center"><a href="javascript:alert('여기가 처음입니다.')"><img src="http://www.who-z.com/iPageImages/POINTSHOP_ITEM_GOODSQA/sys_default/btn_pre.gif" width="36" height="18" border="0" align="absmiddle" /></a>&nbsp;&nbsp; <b>1</b> . <a href="javascript:__ps_OnMoveGoodsQAPage(2)">2</a> .
                                      &nbsp; <a href="javascript:alert('여기가 끝입니다.')"><img src="http://www.who-z.com/iPageImages/POINTSHOP_ITEM_GOODSQA/sys_default/btn_next.gif" width="36" height="18" border="0" align="absmiddle" /></a> </td>
                                  </tr>
                              </table></td>
                            </tr>
                          </table>
                        <!-- 상품문의 테이블 끝-->
                      </td>
                    </tr>
                    <tr>
                      <td>&nbsp;</td>
                    </tr>
                </table></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
              </tr>
            </table></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="30" valign="top">&nbsp;</td>
      </tr>
      <tr>
        <td height="100" valign="top" bgcolor="#CCCCCC">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>

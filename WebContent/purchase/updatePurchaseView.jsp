<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html> 
<%@ page import="java.util.*"  %>
 
<%-- <%
	Purchase psvo = (Purchase)request.getAttribute("psvo"); 
	User uvo = (User)psvo.getBuyer();
	Product pvo = (Product)psvo.getPurchaseProd(); 
%>	 --%>	
<html>
	<head>
		<title>���Ż���ȸ</title> 
		<link rel="stylesheet" href="/css/admin.css" type="text/css"> 
	</head>
	
	<c:set var="uvo" value="${ psvo.buyer }"/>
	<c:set var="pvo" value="${ psvo.purchaseProd }"/>
	<body bgcolor="#ffffff" text="#000000"> 
		<table width="100%" height="37" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td width="15" height="37">
					<img src="/images/ct_ttl_img01.gif"	width="15" height="37"/>
				</td>
				<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="93%" class="ct_ttl01">���Ż���ȸ</td>
							<td width="20%" align="right">&nbsp;</td>
						</tr>
					</table>
				</td>
				<td width="12" height="37">
					<img src="/images/ct_ttl_img03.gif"	width="12" height="37"/>
				</td>
			</tr>
		</table>
		
<form name="updatePurchase" method="post" action="/updatePurchase.do?tranNo=${ psvo.tranNo }">
		
		<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 13px;">
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">
					���Ź�ȣ <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
				</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="105">
								${ psvo.tranNo }
								</td>	
								<input type="hidden" value="${ psvo.tranNo }" name="tranNo"/>						
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td width="104" class="ct_write">
					��ǰ��ȣ <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
				</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="105"> 
								${ pvo.prodNo }
								</td> 
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">
					�����ھ��̵� <img	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
				</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">${ uvo.userId }</td>
				<input type="hidden" name="buyerId" value="${ uvo.userId }" />
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
		
		
			<tr>
				<td width="104" class="ct_write">���Ź��</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01"> 
					<select 	name="paymentOption" class="ct_input_g" style="width: 100px; height: 19px" maxLength="20">  
						<option value="0" ${ !empty psvo.paymentOption  && fn:trim(psvo.paymentOption)==0 ? "selected" :"" } >���ݱ���</option>
						<option value="1" ${ !empty psvo.paymentOption  && fn:trim(psvo.paymentOption)==1 ? "selected" : "" } >�ſ뱸��</option>  
					</select>     
				</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">�������̸�</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">
					<input name="receiverName" type="text" value="${ psvo.receiverName }"/>
				</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">�����ڿ���ó</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">
					<input name="receiverPhone" type="text" readonly value="${ psvo.receiverPhone }"/>
				</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">�������ּ�</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01"> 
					<input 	type="text" name="receiverAddr" class="ct_input_g" 
										style="width: 100px; height: 19px" maxLength="20" value="${ psvo.divyAddr }" />
					
				</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">���ſ�û����</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td class="ct_write01">
					
					<input 	type="text" name="receiverRequest" value="${ psvo.divyRequest }"/>
				</td>
			</tr>
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			<tr>
				<td width="104" class="ct_write">��������</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td width="200" class="ct_write01"> 
					<input 	type="text" name="receiverDate" value="${ psvo.divyDate } "/>
				</td>
			</tr>
		
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
		
			<tr>
				<td width="104" class="ct_write">�ֹ���</td>
				<td bgcolor="D6D6D6" width="1"></td>
				<td width="200" class="ct_write01">
					${ psvo.orderDate } 
				</td>
			</tr>
		
			<tr>
				<td height="1" colspan="3" bgcolor="D6D6D6"></td>
			</tr>
			
		</table>
		
		<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
			<tr>
				<td width="53%"></td>
				<td align="right">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="17" height="23">
								<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
							</td>
							<td background="/images/ct_btnbg02.gif" class="ct_btn01"	style="padding-top: 3px;">
								
								<input type="submit" value="����">
							</td>
							<td width="14" height="23">
								<img src="/images/ct_btnbg03.gif" width="14" height="23"/>
							</td>
							<td width="30"></td>
							<td width="17" height="23">
								<img src="/images/ct_btnbg01.gif" width="17" height="23"/>
							</td>
							<td background="/images/ct_btnbg02.gif" class="ct_btn01"	style="padding-top: 3px;">
								<a href="javascript:history.go(-1);">Ȯ��</a>
							</td>
							<td width="14" height="23">
								<img src="/images/ct_btnbg03.gif"width="14" height="23"/>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
</form>
	</body>
</html>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%--      
<%
	Purchase psvo = (Purchase)request.getAttribute("psvo"); 
	User uvo = (User)psvo.getBuyer();
	Product pvo = (Product)psvo.getPurchaseProd(); 
%>	 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���� ����</title>
</head>
<body>
  
<c:set var="uvo" value="${ psvo.buyer }"/>
<c:set var="pvo" value="${ psvo.purchaseProd }"/>
	<table width="600" border="0" cellspacing="0" cellpadding="0"	align="center" style="margin-top: 13px;">
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="300" class="ct_write">
				��ǰ��ȣ <img src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
			</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01" width="299">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="105">${ pvo.prodNo }</td>
						 
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
	 
		<tr>
			<td width="104" class="ct_write">
				�����ھ��̵� <img 	src="/images/ct_icon_red.gif" width="3" height="3" align="absmiddle"/>
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
			<td class="ct_write01">${ psvo.paymentOption }</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="104" class="ct_write">�������̸�</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				${ psvo.receiverName }
			</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="104" class="ct_write">�����ڿ���ó</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				${ psvo.receiverPhone }
			</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="104" class="ct_write">�������ּ�</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				${ psvo.divyAddr }
			</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="104" class="ct_write">���ſ�û����</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				${ psvo.divyRequest }
			</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="104" class="ct_write">����������</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td width="200" class="ct_write01">
				${ psvo.divyDate }
				
			</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
	</table>
			

</body>
</html>
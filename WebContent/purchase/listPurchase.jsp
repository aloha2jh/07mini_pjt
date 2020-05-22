<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
  
<html>
	<head>
		<title>���� �����ȸ</title> 
		<link rel="stylesheet" href="/css/admin.css" type="text/css"> 
		<script type="text/javascript">
			function fncGetList (  cPage   ){
				document.getElementById("currentPage").value = cPage;
				document.detailForm.submit();
			}
		</script>
	</head>
	
	<body bgcolor="#ffffff" text="#000000"> 
	<c:set var="resultPage" value="${ resultPage }"/>
	 
	
	
	
		<div style="width: 98%; margin-left: 10px;"> 
		
			<form name="detailForm" action="/listPurchase.do" method="post"> 
				<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
					<tr>
						<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"width="15" height="37"></td>
						<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="93%" class="ct_ttl01">���� �����ȸ</td>
								</tr>
							</table>
						</td>
						<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
					</tr>
				</table>
				
				<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
					<tr>
						<td colspan="11" >��ü  ${ resultPage.totalCount } �Ǽ�, ���� ${ resultPage.currentPage } ������</td>
					</tr>
					<tr>
						<td class="ct_list_b" width="100">No</td>
						<td class="ct_line02"></td>
						<td class="ct_list_b" width="150">ȸ��ID</td>
						<td class="ct_line02"></td>
						<td class="ct_list_b" width="150">ȸ����</td>
						<td class="ct_line02"></td>
						<td class="ct_list_b">��ȭ��ȣ</td>
						<td class="ct_line02"></td>
						<td class="ct_list_b">�����Ȳ</td>
						<td class="ct_line02"></td>
						<td class="ct_list_b">��������</td>
					</tr>
					<tr>
						<td colspan="11" bgcolor="808285" height="1"></td>
					</tr>
				
					<c:set var="i" value="0"/> <!--  -->
					<c:forEach var="psvo" items="${map}">
					<c:set var="i" value="${ i+1 }" /> <!--  -->
					
					<c:set var="uvo" value="${ psvo.buyer }"/>
					<c:set var="pvo" value="${ psvo.purchaseProd }"/>
					
					<tr class="ct_list_pop">
						<td align="center">
							<a href="/getPurchase.do?tranNo=${ psvo.tranNo }">
								${ psvo.tranNo }
							</a>
						</td>
						<td></td>
						<td align="left">
							<a href="/getUser.do?userId=${ uvo.userId }">
								${ uvo.userId }
							</a>
						</td>
						<td></td>
						<td align="left">${ psvo.receiverName }</td>
						<td></td>
						<td align="left">${ psvo.receiverPhone }</td>
						<td></td>
						<td align="left">���� 
						 
						<c:choose>
							<c:when test="${ psvo.tranCode=='001' }">
										���ſϷ�
							</c:when>
							<c:when test="${psvo.tranCode=='002' }">
										�����
								  <a href="/updateTranCode.do?prodNo=${ pvo.prodNo }&tranCode=003">(���ǵ���)</a> 
							</c:when>
							<c:when test="${psvo.tranCode=='003' }">
										��ۿϷ�
							</c:when> 
						</c:choose>	
							
								���� �Դϴ�.</td>
						<td></td>
						<td align="left">
							
						</td>
					</tr>
					


					</c:forEach>





					<tr>
						<td colspan="11" bgcolor="D6D7D6" height="1"></td>
					</tr>
					 
					
				</table>
				
				<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
					<tr>
						<td align="center">
						 	
						
		   					<input type="hidden" id="currentPage" name="currentPage" value="${resultPage.currentPage}"/> <!-- �ְ� ���紩������ ��Ƽ� ���̺����� �� --> 
							<jsp:include page="../common/pageNavigator.jsp"/>
							
						</td>
					</tr>
				</table>
				
			<!--  ������ Navigator �� -->
			</form>
			
		</div>
		
	</body>
</html>













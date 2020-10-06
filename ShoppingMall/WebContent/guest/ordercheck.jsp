<%@page import="pack.member.ZipcodeBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="memberMgr" class="pack.member.MemberMgr"/>
<%
request.setCharacterEncoding("utf-8");
String check = request.getParameter("check");
String p_area3 = request.getParameter("area3");
ArrayList<ZipcodeBean> list = memberMgr.addressRead(p_area3);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QR코드로 결제하기</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script src="../js/script.js"></script>
<script type="text/javascript">
window.onload = function() {
	document.getElementById("btnZipClose").onclick = function(){
		window.location.href='orderlist.jsp';
	};
}
function dongCheck(){
	if(zipForm.area3.value === ""){ // zipform area3의 값이 "" 즉 없으면
		alert("검색할 동 이름을 입력하시오.");
		zipForm.area3.focus(); // focus 가져다 놓기
		return;
	}
	zipForm.submit();
}
function send(zipcode, a1, a2, a3, a4){
	//alert(zipcode);
	opener.document.regForm.zipcode.value = zipcode; // register.jsp의 regForm에 값을 주는 것
	var addr = a1 + " " + a2 + " " + a3 + " " + a4;
	opener.document.regForm.address.value = addr;
	window.close();
}
</script>
</head>
<body>
<form action="orderlist.jsp" name="zipForm" method="post">
<table>
	<tr>
		<td>
		<img src="../images/qr.png">
		</td>
	</tr>
	<tr>
		<td>
		<Button id ="btnZipClose">결제 완료</Button>
		</td>
	</tr>
</table>

</form>
</body>
</html>
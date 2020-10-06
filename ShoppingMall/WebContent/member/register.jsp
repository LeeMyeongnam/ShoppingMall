<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>회원가입</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script src="../js/script.js"></script>
<script type="text/javascript">
	window.onload = function() {
		regForm.id.focus();
		document.getElementById("btnZip").onclick = zipCheck;
		document.getElementById("btnId").onclick = idCheck;
		document.getElementById("btnSubmit").onclick = inputCheck;
	}
</script>
</head>
<body>
	<br>
	<%@include file="../guest/guest_top.jsp"%>
	<section class="bg-title-page p-t-50 p-b-40 flex-col-c-m"
		style="background-image: url(../images/login.jpg);">
		<h2 class="l-text2 t-center">Join - Us</h2>
		<p class="m-text13 t-center">Shopping with DB Holic</p>
	</section>
	<table class="table">
		<tr>
			<td align="center" valign="middle" style="background-color: #FFFFFF">
				<form name="regForm" method="post" action="registerproc.jsp">
					<table>
						<tr>
							<td><input type="text" name="id" size="100" placeholder="ID">
								<input type="button" value="ID중복확인" id="btnId"></td>
						</tr>
						<tr>
							<td><input type="password" name="passwd" size="15" placeholder="PassWord"></td>
						</tr>
						<tr>
							<td><input type="password" name="repasswd" size="15" placeholder="PassWord"></td>
						</tr>
						<tr>
							<td><input type="text" name="name" size="15" placeholder="name"></td>
						</tr>
						<tr>
							<td><input type="text" name="email" size="27" placeholder="email"></td>
						</tr>
						<tr>
							<td><input type="text" name="phone" size="20" placeholder="phone"></td>
						</tr>
						<tr>
							<td><input type="text" name="zipcode" size="7" placeholder="zip-code"> <input
								type="button" value="우편번호찾기" id="btnZip"></td>
						</tr>
						<tr>
							<td><input type="text" name="address" size="60" placeholder="address"></td>
						</tr>
						<tr>
							<td><select name=job>
									<option value="0">선택하세요
									<option value="회사원">회사원
									<option value="학생">학생
									<option value="자영업">자영업
									<option value="주부">주부
									<option value="기타">기타
							</select></td>
						</tr>
						<tr>
							<td colspan="2" align="center"><input type="button"
								value="회원가입" id="btnSubmit"> &nbsp;&nbsp;&nbsp;&nbsp; <input
								type="reset" value="다시쓰기"> &nbsp;&nbsp;&nbsp;&nbsp; <input
								type="button" value="메인으로"
								onclick="location.href='../index.jsp'"></td>
						</tr>
					</table>
				</form>
			</td>
		</tr>
	</table>
</body>
</html>
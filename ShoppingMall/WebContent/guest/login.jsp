<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% String id = (String)session.getAttribute("idKey"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 로그인</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script src="../js/script.js"></script>
<script type="text/javascript">
	window.onload = function() {
		var btn1 = document.getElementById("btnLogin");
		if (btn1) {
			btn1.addEventListener("click", funcLogin, false);
		}

		var btn2 = document.getElementById("btnNewMember");
		if (btn2) {
			btn2.addEventListener("click", funcNew, false);
		}

	}
	function funcLogin() {
		if (loginForm.id.value === "") {
			alert("아이디 입력!!!");
			loginForm.id.focus();
		} else {
			if (loginForm.passwd.value === "") {
				alert("비번 입력!!!!");
				loginForm.passwd.focus();

			} else {
				loginForm.action = "loginproc.jsp";
				loginForm.method = "post";
				loginForm.submit();
			}
		}
	}
	function funcNew() {
		location.href = "../member/register.jsp";
	}
</script>
</head>
<body>

	<%@include file="guest_top.jsp"%>
	<section class="bg-title-page p-t-50 p-b-40 flex-col-c-m" style="background-image: url(../images/login.jpg);">
		<h2 class="l-text2 t-center">
			Log - In
		</h2>
		<p class="m-text13 t-center">
			Shopping with DB Holic
		</p>
	</section>
	<!-- content page -->
	<section class="bgwhite p-t-60 p-b-25">
		<div class="container">
			<div class="row">
				<div class="col-md-8 col-lg-9 p-b-80">
					<div class="p-r-50 p-r-0-lg">
						<div class="p-b-40">
							
							</div>
								<%
								if(id !=null){
								%>
								<h4 class="m-text25 p-b-14"><b><%=id %></b>님  로그 아웃 되셨습니다.</h4>
								
								<%
								//session.removeAttribute("idKey");
								session.invalidate();
								%>
							
								<%}else{%>
							<!-- Leave a comment -->
							<form class="leave-comment" name="loginForm">
								<h4 class="m-text25 p-b-14">LOGIN</h4>
								<div class="bo12 of-hidden size19 m-b-20">
									<input class="sizefull s-text7 p-l-18 p-r-18" type="text"
										name="id" placeholder="ID">
								</div>
									
								<div class="bo12 of-hidden size19 m-b-20">
									<input class="sizefull s-text7 p-l-18 p-r-18" type="password"
										name="passwd" placeholder="Password">
								</div>

								<div class="w-size24" >
									<button class="flex-c-m size1 bg1 bo-rad-20 hov1 s-text1 trans-0-4" id="btnLogin">SIGNIN</button>
									<a href="../member/register.jsp">회원이 아니신가요?</a>
								</div>
							</form>
					</div>

				</div>
			</div>
		</div>
	</section>
	<%	
	}
	%>


</body>
</html>
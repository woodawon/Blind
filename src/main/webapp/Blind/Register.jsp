<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="./Register.css">
<link rel="stylesheet" href="./global.css">
<%@include file="Footer.jsp"%>
</head>
<body>

	<%
	if (session.getAttribute("Joined") != null) {
	%>
	<script>
		alert("회원가입이 완료되었습니다.");
	</script>
	<%
	response.sendRedirect("Login.jsp");
	%>
	<%
	}
	%>

	<header>
		<%@include file="Header.jsp"%>
	</header>
	<section align="center" ; class="allsec">
		<div class="hehe">

			<h2 class="h2">blind에 오신걸 환영합니다</h2>
			<ul>
				<li>기존 회원가입 정보와 일치하는 정보를 입력하셔야 회원가입 여부를<br> 정확하게 확인하실 수
					있습니다.<br> 입력하신 정보는 회원가입 여부에만 사용되며 저장되지 않습니다.
				</li>
				<br>
				<li>상일미디어고등학교 블라인드에서 만 14세 미만의 어린이와<br> 만 19세 이상의 성인은
					회원가입을 제한합니다.
				</li>
			</ul>
		</div>
		<form action="RegisterUpdate.jsp" class="indiv" method="post">
			<input type="text" name="ID" placeholder="id를 입력하세요" required
				minlength="4"><br> <input type="submit" id="in"
				value="중복 조회" class="button"> <br> <input type="text"
				name="PW" placeholder="pw를 입력하세요" required maxlength="12"><br>
			<input type="text" name="PW2" placeholder="pw 확인" required
				maxlength="12"> <br> <input type="text" name="EMAIL"
				placeholder="email" required> <br> <input type="text"
				name="SCHOOL" placeholder="학교" required> <br> <input
				type="submit" id="in" value="회원가입" class="button"> <br>
		</form>
	</section>
</body>
</html>
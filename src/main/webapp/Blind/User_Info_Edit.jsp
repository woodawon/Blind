<%@page import="membership.MemberDTO"%>
<%@page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필</title>

<%@include file="Footer.jsp"%>
<link rel="stylesheet" href="./User_info.css">
<link rel="stylesheet" href="./global.css">
</head>
<body>
	<%
	String school = session.getAttribute("UserCH").toString();
	String email = session.getAttribute("UserEM").toString();
	%>
	<header>
		<%@include file="Header2.jsp"%>
	</header>
	<div class="Head">
		<h2>프로필 수정</h2>
		<p class="depeu">블라인드 대표 프로필과 수정 하실 수 있습니다.</p>
	</div>
	<section>
		<form method="post" action="User_Info_Edit_Process.jsp">
			<h3 class="H3">프로필</h3>
			<div class="allP">
				<img class="Picture" alt="logo" src="./images/blind.png">

				<div class="secP">
					<p id="preview"><%=email%></p>
					<p class="Email">
						이메일 : <input type="text" placeholder="example@abc.com"
							name="editEM" required />
					</p>
					<br>
					<p id="preview"><%=school%></p>
					<p class="School">
						학교명 : <input type="text" placeholder="00고등학교" name="editCH"
							required />
					</p>
				</div>
			</div>
			<div class="allsub">
				<input type="submit" value="확인" class="delete">
			</div>
		</form>
	</section>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./Header.css">
<link rel="stylesheet" href="./global.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="tag">
		<a href="./home.jsp" class="maintitle"> 
		<img src="https://i.namu.wiki/i/YEmalxMrXbQcoqIWG5cyPYhEfYV_2LUOiBUTlnLQQqw2ixMJmiD63J_fGBkiHLMaKv_NRjOPk0k3Z6AckkyCdg.webp" alt="img" class="mainlogo"/>
		<h1><strong>blind</strong></h1>
		</a>
		<h3>
			<a href="School_Review.jsp">학교 리뷰</a>
		</h3>
		<h3>
			<a href="Live_Board_Post.jsp">실시간 게시물</a>
		</h3>
		
		<div class="inter">
			<a href="home.jsp" class="writing" onclick="button1_click();" ><strong>글쓰기</strong></a> 
			<div class="lomem">
			<a href="Login.jsp" class="login"><strong>로그인</strong></a> 
			<a href="Register.jsp" class="member"><strong>회원가입</strong></a>
			</div>
			<a	href="User_Info.jsp">프로필</a>
		</div>

	</div>
	<script>
	function button1_click() {
		alert('로그인 후 이용해주세요.');
   }
</script>
</body>
</html>
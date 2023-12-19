<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./Header.css">
<link rel="stylesheet" href="./global.css">
<link id="hidden" rel="stylesheet" type="text/css"
	href="User_Info_Hidden_Header.css" disabled>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="tag">
		<a href="./home.jsp" class="maintitle"> <img
			src="https://i.namu.wiki/i/YEmalxMrXbQcoqIWG5cyPYhEfYV_2LUOiBUTlnLQQqw2ixMJmiD63J_fGBkiHLMaKv_NRjOPk0k3Z6AckkyCdg.webp"
			alt="img" class="mainlogo" />
			<h1>
				<strong>blind</strong>
			</h1>
		</a>
		<h3>
			<a href="School_Review.jsp">학교 리뷰</a>
		</h3>
		<h3>
			<a href="Live_Board_Post.jsp">실시간 게시물</a>
		</h3>

		<div class="inter">
			<a class="writing" onclick="button1_click();"><strong>글쓰기</strong></a>
			<div class="lomem">
				<a href="Login.jsp" class="login"><strong>로그인</strong></a> <a
					href="Register.jsp" class="member"><strong>회원가입</strong></a>
			</div>
			<img src="images/user.png" src="프로필" onclick="openModal();" id="profile" />
		</div>

	</div>

	<div id="myModal">
		<div class="modal-content">
			<span class="close" onclick="closeModal()">&times;</span>
			<p id="first">로그인 해야 프로필을 확인할 수 있습니다.</p>
			<p id="second">로그인을 하시겠습니까?</p>
			<button onclick="movePage()">네</button>
			<button onclick="closeModal()">아니요</button>
		</div>
	</div>
	<script>
		function openModal() { // 활성화
			document.getElementById('myModal').style.display = 'block';
			document.getElementById('hidden').disabled = false;
		}
		function closeModal() { // 비활성화
			document.getElementById('myModal').style.display = 'none';
			document.getElementById('hidden').disabled = true;
		}
		function movePage() {
			var url = 'Login.jsp';
			window.location.href = url;
		}
		function button1_click() {
			alert('로그인 후 이용해주세요.');
		}
	</script>
</body>
</html>
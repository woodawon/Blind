<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필</title>

<%@include file = "Footer.jsp" %>
<link rel="stylesheet" href="./User_info.css">
<link rel="stylesheet" href="./global.css">
</head>
<body>
<header>
	<%@include file = "Header2.jsp" %>
	</header>
	
	<div class="Head">
<h2>프로필 수정</h2>
<p class="depeu">블라인드 대표 프로필과 수정 하실 수 있습니다.</p>
</div>

<section>
<h3 class="H3">프로필</h3>
<div class="allP">
	<img class="Picture" alt="logo" src="./images/blind.png">

	<div class="secP">
		<p class="Email">이메일 : </p>
		<br>
		<p class="School">학교명 : </p>
	</div>
</div>

<div class="allsub">
	<form action="">
		<input type="submit" value="수정" class="su">
		<input type="submit" value="탈퇴" class="tal">
	</form>
</div>
</section>
</body>
</html>
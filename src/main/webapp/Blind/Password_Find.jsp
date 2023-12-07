<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="./Passward_Find.css">
<link rel="stylesheet" href="./global.css">

<%@include file = "Footer.jsp" %>
</head>
<body>
<header>
	<%@include file = "Header.jsp" %>
	</header>

<section>

<h3 class="h3">비밀번호 찾기</h3>
<br>
	<ul>
		<li>비밀번호가 기억나지 않으세요?<br>원하시는 방법을 선택하여 비밀번호를 재설정하실 수 있습니다.</li>
		<br>
		<li>본인인증 시 제공되는 정보는 해당 인증기관에서 직접 수집 하며,<br>인증 이외의 용도로 이용 또는 저장하지 않습니다.</li>
 	</ul>



<div class="pwf">
<h3>비밀번호를 재설정할 이메일을 입력해주세요</h3>
<br>
<form action="">
	<input type="text" id="id">
	<input type="submit" value="조회" class="johe">
	</form>
	</div>
	</section>
</body>
</html>
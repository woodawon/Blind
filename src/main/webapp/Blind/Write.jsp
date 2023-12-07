<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./Write.css">
<link rel="stylesheet" href="./global.css">
<meta charset="UTF-8">
<title>글쓰기</title>
</head>
<body>
	<header>
		<%@include file="Header2.jsp"%>
	</header>

	<div id="wrapper">
		<h2 class="writingH2">
			글쓰기 <img class="writingLogo" alt="logo" src="./images/blind.png">
		</h2>
		<form class="writingForm" action="WriteProcess.jsp">
			<ul>
				<li onclick="changeStyle(this)">토픽 베스트</li>
				<li onclick="changeStyle(this)">자유 게시판</li>
				<li onclick="changeStyle(this)">썸&연애</li>
				<li onclick="changeStyle(this)">급식 자랑</li>
				<li onclick="changeStyle(this)">진학&성적</li>
				<li onclick="changeStyle(this)">헬스&다이어트</li>
				<li onclick="changeStyle(this)">여행&먹방</li>
			</ul>
			<ul>
				<li onclick="changeStyle(this)">학교생활</li>
				<li onclick="changeStyle(this)">취미생활</li>
				<li onclick="changeStyle(this)">지름&쇼핑</li>
				<li onclick="changeStyle(this)">반려 동물</li>
				<li onclick="changeStyle(this)">스포츠</li>
				<li onclick="changeStyle(this)">게임</li>
				<li onclick="changeStyle(this)">패션&뷰티</li>
				<li onclick="changeStyle(this)">직접홍보</li>
				<li onclick="changeStyle(this)">고민 상담</li>
			</ul>
			<input type="text" class="writingTitle" name="title"
				placeholder="제목을 입력하시오">
			<div class="interface">
				<a href="" class="file"><img alt=""
					src="https://cdn-icons-png.flaticon.com/512/807/807341.png">
					파일</a>
			</div>
			<input type="text" class="content" name="content"> <input
				type="text" style="display: none;" name="tag" value="" id="tagInput" />
			<div class="button">
				<input type="submit" value="등록" class="enroll"> <input
					type="submit" value="취소" class="cancel">
			</div>
		</form>
	</div>
	<footer>
		<%@include file="Footer.jsp"%>
	</footer>
	<script>
		function changeStyle(tag) {
			// 모든 li 태그에 대해 선택 해제
			var list = document.querySelectorAll('li');
			list.forEach(function(li) {
				li.classList.remove('selected');
			});

			// 선택된 li 태그에 스타일 적용
			tag.classList.add('selected');

			// 선택된 내용을 input 태그에 설정
			var tagInput = document.getElementById('tagInput');
			tagInput.value = tag.textContent;
		}
	</script>
</body>
</html>
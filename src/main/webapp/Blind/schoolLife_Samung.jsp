<%@page import="model1.board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
BoardDAO dao = new BoardDAO(application);
BoardDTO tagCheck = new BoardDTO();

Map<String, Object> param = new HashMap<String, Object>();
int totalCount = dao.selectCount(param);

List<BoardDTO> boardLists = dao.selectSamung(param); 
dao.close(); 
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./topicBest.css">
<link rel="stylesheet" href="./global.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="titleImg">
		<div class="slidebox">
			<input type="radio" name="slide" id="slide01" checked> <input
				type="radio" name="slide" id="slide02"> <input type="radio"
				name="slide" id="slide03"> <input type="radio" name="slide"
				id="slide04">
			<ul class="slidelist">
				<li class="slideitem">
					<div>
						<label for="slide04" class="left"></label> <label for="slide02"
							class="right"></label> <a><img
							src="https://caching2.lottecinema.co.kr/lotte_image/2023/MountCHIAK/MountCHIAK_1920420.jpg"></a>
					</div>
				</li>
				<li class="slideitem">
					<div>
						<label for="slide01" class="left"></label> <label for="slide03"
							class="right"></label> <a><img
							src="https://caching2.lottecinema.co.kr/lotte_image/2023/Afire/Afire_1920420.jpg"></a>
					</div>
				</li>
				<li class="slideitem">
					<div>
						<label for="slide02" class="left"></label> <label for="slide04"
							class="right"></label> <a><img
							src="https://caching2.lottecinema.co.kr/lotte_image/2023/Disclosure/Disclosure_1920420.jpg"></a>
					</div>
				</li>
				<li class="slideitem">
					<div>
						<label for="slide03" class="left"></label> <label for="slide01"
							class="right"></label> <a><img
							src="https://caching2.lottecinema.co.kr/lotte_image/2023/DetectiveKnight/DetectiveKnight_1920420.jpg"></a>
					</div>
				</li>
			</ul>
		</div>


		<!--  <img class="title" alt="titleImg" src="https://d2u3dcdbebyaiu.cloudfront.net/img/web_banner/web_banner_kr_1685004600.png">-->
	</div>
	<div class="interface">
		<strong>
			<ul class="interfaceall">
				<a href="topicBest.jsp"><li>토픽 베스트</li></a>
				<a href="freePost.jsp"><li>자유 게시판</li></a>
				<a href="love.jsp"><li>썸&연애</li></a>
				<a href="cafeteria.jsp"><li>급식 자랑</li></a>
				<a href="transfer.jsp"><li>전학&성적</li></a>
				<a href="health.jsp"><li>헬스&다이어트</li></a>
				<a href="travel.jsp"><li>여행&먹방</li></a>
				<a href="schoolLife.jsp"><li class="main">학교생활</li></a>
				<a href="hobby.jsp"><li>취미생활</li></a>
				<a href="flex.jsp"><li>지름&쇼핑</li></a>
				<a href="animal.jsp"><li>반려 동물</li></a>
				<a href="sports.jsp"><li>스포츠</li></a>
				<a href="game.jsp"><li>게임</li></a>
				<a href="fashion.jsp"><li>패션&뷰티</li></a>
				<a href="promotion.jsp"><li>직접홍보</li></a>
				<a href="worry.jsp"><li>고민 상담</li></a>
			</ul>
		</strong>
	</div>

	<%
	int check = 0;
	int step = 0;
	String left = "postLeft";
	String right = "postRight";
	%>
	<div class="postall">
	<% 
	// 게시물이 있을 때 & 태그가 학교생활일 때
	for (BoardDTO dto : boardLists) {
		if (dto.getTag().equals("학교생활")) {
			check++;
			step++;
			if (step % 2 != 0) {
	%>
	<div class="postLeft">
		<ul>
			<li class="caeegory"><%=dto.getTag()%></li>
			<li class="title"><h3>
					<strong><%=dto.getTitle()%>
				</h3> </strong></li>
			<li class="content"><%=dto.getContent()%></li>
			<li class="name">
				<p><%=dto.getChname()%></p>
				<p><%=" | "%></p>
				<p><%=dto.getId()%></p>
			</li>
			<div class="wrapInfo">
				<img class="eyes" alt="fd"
					src="https://cdn-icons-png.flaticon.com/512/1536/1536593.png">
				<p><%=dto.getVisitcount()%></p>
				<img class="eyes" alt="asdf"
					src="https://cdn-icons-png.flaticon.com/512/6611/6611465.png">
				<p><%=dto.getGood()%></p>
				<img class="eyes" alt="asdf"
					src="https://cdn-icons-png.flaticon.com/512/2598/2598880.png">
				<p>123</p>
			</div>
		</ul>
	</div>
	<%
	} else if (step % 2 == 0) {
	%>
	<div class="postRight">
		<ul>
			<li class="caeegory"><%=dto.getTag()%></li>
			<li class="title"><h3>
					<strong><%=dto.getTitle()%>
				</h3> </strong></li>
			<li class="content"><%=dto.getContent()%></li>
			<li class="name">
				<p><%=dto.getChname()%></p>
				<p><%=" | "%></p>
				<p><%=dto.getId()%></p>
			</li>
			<div class="wrapInfo">
				<img class="eyes" alt="fd"
					src="https://cdn-icons-png.flaticon.com/512/1536/1536593.png">
				<p><%=dto.getVisitcount()%></p>
				<img class="eyes" alt="asdf"
					src="https://cdn-icons-png.flaticon.com/512/6611/6611465.png">
				<p><%=dto.getGood()%></p>
				<img class="eyes" alt="asdf"
					src="https://cdn-icons-png.flaticon.com/512/2598/2598880.png">
				<p>123</p>
			</div>
		</ul>
	</div>
	<%
	}
	}
	}
	%>
	<%
	if (check == 0) {
	%>
	<p id="noPost">등록된 게시물이 없습니다.</p>
	<%
	}
	%>
	</div>
</body>
</html>
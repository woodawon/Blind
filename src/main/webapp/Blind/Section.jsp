<%@page import="model1.board.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
BoardDAO dao = new BoardDAO(application);
ArrayList<BoardDTO> list;
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./Section.css">
<link rel="stylesheet" href="./global.css">
<meta charset="UTF-8">
<title>도제 블라인드</title>
</head>
<body>
	<%@ include file="Header.jsp"%>

	<form action="Section_Process.jsp">
		<input type="text" placeholder="관심있는 내용을  검색해보세요!" class="inp"
			name="search">
	</form>
	<div class="Topic">
		<div class="Tothe">
			<h3 class="H3">
				<img class="logo"
					src="https://static.teamblind.com/img/web/ico-best.png">토픽
				베스트
			</h3>
			<a href="topicBest.jsp" class="A">더보기 &gt;</a>
		</div>
		<ul>
			<%
			list = dao.previewPost("토픽 베스트");
			for (int i = 0; i < list.size(); i++) {
			%>
			<li>
				<div id="topicPackage">
					<p id="tag">토픽 베스트</p>
					<form action="BoardProcess.jsp">
						<input id="titleClick" type="submit" name="title"
							value="<%=list.get(i).getTitle()%>" />
					</form>
				</div>
				<p id="like"><%=list.get(i).getGood()%></p>
			</li>
			<%
			}
			dao.close();
			list.clear();
			%>
		</ul>

		<div class="Tothe">
			<h3 class="H3">
				<img class="logo"
					src="https://d2u3dcdbebyaiu.cloudfront.net/img/web/topic_logo_kr_1587367050.png">자유
				게시판
			</h3>
			<a href="freePost.jsp" class="A">더보기 &gt;</a>
		</div>
		<ul>
			<%
			dao = new BoardDAO(application);
			list = dao.previewPost("자유 게시판");
			for (int i = 0; i < list.size(); i++) {
			%>
			<li>
				<form action="BoardProcess.jsp">
					<input id="titleClick" type="submit" name="title"
						value="<%=list.get(i).getTitle()%>" />
				</form>
				<p id="like"><%=list.get(i).getGood()%></p>
			</li>
			<%
			}
			dao.close();
			list.clear();
			%>
		</ul>
	</div>

	<div class="allone">
		<div class="onepic">
			<div class="Tothe">
				<h3 class="H3">
					<img class="logo"
						src="https://d2u3dcdbebyaiu.cloudfront.net/img/web/topic_logo_kr_1587367690.png">썸&연애
				</h3>
				<a href="love.jsp" class="A">더보기 &gt;</a>
			</div>
			<ul>
				<%
				dao = new BoardDAO(application);
				list = dao.previewPost("썸&연애");
				for (int i = 0; i < list.size(); i++) {
				%>
				<li>
					<form action="BoardProcess.jsp">
						<input id="titleClick" type="submit" name="title"
							value="<%=list.get(i).getTitle()%>" />
					</form>
					<p id="like"><%=list.get(i).getGood()%></p>
				</li>
				<%
				}
				dao.close();
				%>
			</ul>
		</div>

		<div class="onepic">
			<div class="Tothe">
				<h3 class="H3">
					<img class="logo"
						src="https://img.freepik.com/premium-vector/food-tray-icon-isolated-on-white-background-vector-illustration_736051-483.jpg">급식
					자랑
				</h3>
				<a href="cafeteria.jsp" class="A">더보기 &gt;</a>
			</div>
			<ul>
				<%
				dao = new BoardDAO(application);
				list = dao.previewPost("급식 자랑");
				for (int i = 0; i < list.size(); i++) {
				%>
				<li>
					<form action="BoardProcess.jsp">
						<input id="titleClick" type="submit" name="title"
							value="<%=list.get(i).getTitle()%>" />
					</form>
					<p id="like"><%=list.get(i).getGood()%></p>
				</li>
				<%
				}
				dao.close();
				%>
			</ul>
		</div>
	</div>

	<div class="allone">
		<div class="onepic">
			<div class="Tothe">
				<h3 class="H3">
					<img class="logo"
						src="https://d2u3dcdbebyaiu.cloudfront.net/img/web/topic_logo_kr_1587367606.png">전학&성적
				</h3>
				<a href="transfer.jsp" class="A">더보기 &gt;</a>
			</div>
			<ul>
				<%
				dao = new BoardDAO(application);
				list = dao.previewPost("전학&성적");
				for (int i = 0; i < list.size(); i++) {
				%>
				<li>
					<form action="BoardProcess.jsp">
						<input id="titleClick" type="submit" name="title"
							value="<%=list.get(i).getTitle()%>" />
					</form>
					<p id="like"><%=list.get(i).getGood()%></p>
				</li>
				<%
				}
				dao.close();
				%>
			</ul>
		</div>

		<div class="onepic">
			<div class="Tothe">
				<h3 class="H3">
					<img class="logo"
						src="https://d2u3dcdbebyaiu.cloudfront.net/img/web/topic_logo_kr_1587457694.png">헬스&다이어트
				</h3>
				<a href="health.jsp" class="A">더보기 &gt;</a>
			</div>
			<ul>
				<%
				dao = new BoardDAO(application);
				list = dao.previewPost("헬스&다이어트");
				for (int i = 0; i < list.size(); i++) {
				%>
				<li>
					<form action="BoardProcess.jsp">
						<input id="titleClick" type="submit" name="title"
							value="<%=list.get(i).getTitle()%>" />
					</form>
					<p id="like"><%=list.get(i).getGood()%></p>
				</li>
				<%
				}
				dao.close();
				%>
			</ul>
		</div>
	</div>

	<div class="allone">
		<div class="onepic">
			<div class="Tothe">
				<h3 class="H3">
					<img class="logo"
						src="https://d2u3dcdbebyaiu.cloudfront.net/img/web/topic_logo_kr_1587367576.png">여행&먹방
				</h3>
				<a href="travel.jsp" class="A">더보기 &gt;</a>
			</div>
			<ul>
				<%
				dao = new BoardDAO(application);
				list = dao.previewPost("여행&먹방");
				for (int i = 0; i < list.size(); i++) {
				%>
				<li>
					<form action="BoardProcess.jsp">
						<input id="titleClick" type="submit" name="title"
							value="<%=list.get(i).getTitle()%>" />
					</form>
					<p id="like"><%=list.get(i).getGood()%></p>
				</li>
				<%
				}
				dao.close();
				%>
			</ul>
		</div>

		<div class="onepic">
			<div class="Tothe">
				<h3 class="H3">
					<img class="logo"
						src="https://d2u3dcdbebyaiu.cloudfront.net/img/web/topic_logo_kr_1587367530.png">학교생활
				</h3>
				<a href="schoolLife.jsp" class="A">더보기 &gt;</a>
			</div>
			<ul>
				<%
				dao = new BoardDAO(application);
				list = dao.previewPost("학교생활");
				for (int i = 0; i < list.size(); i++) {
				%>
				<li>
					<form action="BoardProcess.jsp">
						<input id="titleClick" type="submit" name="title"
							value="<%=list.get(i).getTitle()%>" />
					</form>
					<p id="like"><%=list.get(i).getGood()%></p>
				</li>
				<%
				}
				dao.close();
				%>
			</ul>
		</div>
	</div>

	<div class="allone">
		<div class="onepic">
			<div class="Tothe">
				<h3 class="H3">
					<img class="logo"
						src="https://d2u3dcdbebyaiu.cloudfront.net/img/web/topic_logo_kr_1587521934.png">취미생활
				</h3>
				<a href="hobby.jsp" class="A">더보기 &gt;</a>
			</div>
			<ul>
				<%
				dao = new BoardDAO(application);
				list = dao.previewPost("취미생활");
				for (int i = 0; i < list.size(); i++) {
				%>
				<li>
					<form action="BoardProcess.jsp">
						<input id="titleClick" type="submit" name="title"
							value="<%=list.get(i).getTitle()%>" />
					</form>
					<p id="like"><%=list.get(i).getGood()%></p>
				</li>
				<%
				}
				dao.close();
				%>
			</ul>
		</div>

		<div class="onepic">
			<div class="Tothe">
				<h3 class="H3">
					<img class="logo"
						src="https://d2u3dcdbebyaiu.cloudfront.net/img/web/topic_logo_kr_1587367409.png">지름&쇼핑
				</h3>
				<a href="flex.jsp" class="A">더보기 &gt;</a>
			</div>
			<ul>
				<%
				dao = new BoardDAO(application);
				list = dao.previewPost("지름&쇼핑");
				for (int i = 0; i < list.size(); i++) {
				%>
				<li>
					<form action="BoardProcess.jsp">
						<input id="titleClick" type="submit" name="title"
							value="<%=list.get(i).getTitle()%>" />
					</form>
					<p id="like"><%=list.get(i).getGood()%></p>
				</li>
				<%
				}
				dao.close();
				%>
			</ul>
		</div>
	</div>

	<div class="allone">
		<div class="onepic">
			<div class="Tothe">
				<h3 class="H3">
					<img class="logo"
						src="https://d2u3dcdbebyaiu.cloudfront.net/img/web/topic_logo_kr_1587367371.png">반려
					동물
				</h3>
				<a href="animal.jsp" class="A">더보기 &gt;</a>
			</div>
			<ul>
				<%
				dao = new BoardDAO(application);
				list = dao.previewPost("반려 동물");
				for (int i = 0; i < list.size(); i++) {
				%>
				<li>
					<form action="BoardProcess.jsp">
						<input id="titleClick" type="submit" name="title"
							value="<%=list.get(i).getTitle()%>" />
					</form>
					<p id="like"><%=list.get(i).getGood()%></p>
				</li>
				<%
				}
				dao.close();
				%>
			</ul>
		</div>

		<div class="onepic">
			<div class="Tothe">
				<h3 class="H3">
					<img class="logo"
						src="https://d2u3dcdbebyaiu.cloudfront.net/img/web/topic_logo_kr_1587367386.png">스포츠
				</h3>
				<a href="sports.jsp" class="A">더보기 &gt;</a>
			</div>
			<ul>
				<%
				dao = new BoardDAO(application);
				list = dao.previewPost("스포츠");
				for (int i = 0; i < list.size(); i++) {
				%>
				<li>
					<form action="BoardProcess.jsp">
						<input id="titleClick" type="submit" name="title"
							value="<%=list.get(i).getTitle()%>" />
					</form>
					<p id="like"><%=list.get(i).getGood()%></p>
				</li>
				<%
				}
				dao.close();
				%>
			</ul>
		</div>
	</div>

	<div class="allone">
		<div class="onepic">
			<div class="Tothe">
				<h3 class="H3">
					<img class="logo"
						src="https://d2u3dcdbebyaiu.cloudfront.net/img/web/topic_logo_kr_1587521916.png">게임
				</h3>
				<a href="game.jsp" class="A">더보기 &gt;</a>
			</div>
			<ul>
				<%
				dao = new BoardDAO(application);
				list = dao.previewPost("게임");
				for (int i = 0; i < list.size(); i++) {
				%>
				<li>
					<form action="BoardProcess.jsp">
						<input id="titleClick" type="submit" name="title"
							value="<%=list.get(i).getTitle()%>" />
					</form>
					<p id="like"><%=list.get(i).getGood()%></p>
				</li>
				<%
				}
				dao.close();
				%>
			</ul>
		</div>

		<div class="onepic">
			<div class="Tothe">
				<h3 class="H3">
					<img class="logo"
						src="https://d2u3dcdbebyaiu.cloudfront.net/img/web/topic_logo_kr_1587457726.png">패션&뷰티
				</h3>
				<a href="fashion.jsp" class="A">더보기 &gt;</a>
			</div>
			<ul>
				<%
				dao = new BoardDAO(application);
				list = dao.previewPost("패션&뷰티");
				for (int i = 0; i < list.size(); i++) {
				%>
				<li>
					<form action="BoardProcess.jsp">
						<input id="titleClick" type="submit" name="title"
							value="<%=list.get(i).getTitle()%>" />
					</form>
					<p id="like"><%=list.get(i).getGood()%></p>
				</li>
				<%
				}
				dao.close();
				%>
			</ul>
		</div>
	</div>

	<div class="allone">
		<div class="onepic">
			<div class="Tothe">
				<h3 class="H3">
					<img class="logo"
						src="https://d2u3dcdbebyaiu.cloudfront.net/img/web/topic_logo_kr_1587521953.png">유우머
				</h3>
				<a href="joke.jsp" class="A">더보기 &gt;</a>
			</div>
			<p>안돼..!</p>
		</div>
		<div class="onepic">
			<div class="Tothe">
				<h3 class="H3">
					<img class="logo" S
						src="https://d2u3dcdbebyaiu.cloudfront.net/img/web/topic_logo_kr_1591332040.png">고민상담
				</h3>
				<a href="worry.jsp" class="A">더보기 &gt;</a>
			</div>
			<ul>
				<%
				dao = new BoardDAO(application);
				list = dao.previewPost("패션&뷰티");
				for (int i = 0; i < list.size(); i++) {
				%>
				<li>
					<form action="BoardProcess.jsp">
						<input id="titleClick" type="submit" name="title"
							value="<%=list.get(i).getTitle()%>" />
					</form>
					<p id="like"><%=list.get(i).getGood()%></p>
				</li>
				<%
				}
				dao.close();
				%>
			</ul>
		</div>
	</div>

	<div class="ilbe">
		<h5>베스트</h5>
		<ol>
		<%
		dao = new BoardDAO(application);
		ArrayList<BoardDTO> bestList = dao.bestPost();
		int count = bestList.size();
		if(count > 10) {
			for(int i = 0;i < 10;i++) {
		%>
				<li><%=list.get(i).getTitle() %></li>
		<% 
			}
		} else {
			for(int i = 0;i < count;i++) {
		%>
				<li><%=list.get(i).getTitle() %></li>
		<% 
			}
		}
		%>
		
		</ol>
	</div>


</body>
</html>
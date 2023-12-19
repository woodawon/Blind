<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="membership.MemberDTO"%>
<%@page import="model1.board.BoardDTO"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
response.setContentType("text/html; charset=UTF-8");
request.setCharacterEncoding("UTF-8");

String num = request.getParameter("num");
BoardDAO dao = new BoardDAO(application);

dao.updateVisitCount(num); // 조회수 증가
BoardDTO dto = dao.selectView(num); // 게시물 가져오기

String mail = (String) session.getAttribute("UserMail");
String school = (String) session.getAttribute("userCH");
String id = (String) session.getAttribute("UserId");
String PostId = (String) session.getAttribute("PostId");
String Tag = (String) session.getAttribute("Tag");
String Content = (String) session.getAttribute("Content");
Date PostDate = (Date) session.getAttribute("PostDate");
String Title = (String) session.getAttribute("Title");
String ChName = (String) session.getAttribute("ChName");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./View.css">
<link rel="stylesheet" href="./global.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="allin">

		<div class="contentall">
			<%
			ArrayList<BoardDTO> list = dao.getComment(Title);
			%>
			<div class="VIewContent">
				<div class="ViewTitle">
					<ul>
						<li><%=Tag%></li>
						<li id="userViewTitle"><strong><h2><%=Title%></strong>
							</h2></li>
					</ul>
					<div data-v-5d915d2e="" class="wrap-info">
						<span data-v-5d915d2e="" class="date"><%=PostDate%></span> <span
							data-v-5d915d2e="" class="pv"><%=dto.getVisitcount()%></span> <a
							data-v-5d915d2e="" class="cmt"><%=list.size()%></a>
					</div>
				</div>


				<div class="content">
					<p>
						<%
						dto = dao.selecView(Title);
						%>
						<%=dto.getContent()%>
					</p>
					<div data-v-5d915d2e="" class="article_info">
						<div data-v-5d915d2e="" class="info">
							<a data-v-5d915d2e="" class="like"><%=dto.getGood()%></a> <a
								data-v-5d915d2e="" class="cmt"><%=list.size()%></a>
						</div>

					</div>
				</div>

				<div class="article-comments">
					<h3>댓글</h3>
					<div class="write_area">
						<div id="btn_add_comment">
							<form action="ViewProcess.jsp">
								<div class="reply_area">
									<input type="text" placeholder="내용을 남겨주세요" class="btn_reply"
										name="comin" /> <input type="submit" value="등록" />
								</div>
							</form>
						</div>

					</div>
				</div>
				<%
				for (int j = 0; j < list.size(); j++) {
				%>
				<div class="wrap-comment comment_area">
					<div id="userInfo">
						<p class="name"><%=list.get(j).getChname()%>
						<p id="dat">·</p>
						<p class="uId" id="uId">
							<%
							String[] getId = list.get(j).getId().split("");
							String star = "";
							for (int i = 0; i < getId.length - 1; i++) {
								star += "*";
							}
							String setId = getId[0] + star;
							%>
							<%=setId%>
						</p>
					</div>
					<p class="cmt_txt"><%=list.get(j).getContent()%></p>
					<div class="wrap-info">
						<div class="info_fnc">
							<div class="more_wp">
								<span><span style="display: none;">
										<div class="ly_more popper">
											<div class="tip"></div>
										</div>
								</span>
							</div>
						</div>
					</div>
				</div>
				<%
				}
				%>
			</div>


			<div class="ilbe">
				<h3>추천글</h3>
				<%
				ArrayList<BoardDTO> lists = dao.randomPost(10);
				for (int i = 0; i < lists.size(); i++) {
				%>
				<ul class="numbers">
					<li class="number"><a
						href="BoardProcess.jsp?title=<%=lists.get(i).getTitle()%>"><%=lists.get(i).getTitle()%></a></li>
				</ul>
				<%
				}
				%>
			</div>
		</div>

	</div>
	<!-- <script>
		// 문자열을 받아와 각 문자를 가리고 새로운 문자열을 반환하는 함수
		function hideCharacters(text) {
			return text[0] + '*'.repeat(text.length - 1);
		}

		// id가 uId인 요소의 내용을 가져와 가려진 문자열로 교체
		var originalElement = document.getElementById('uId');
		var originalText = originalElement.textContent;
		var hiddenText = hideCharacters(originalText);
		originalElement.innerHTML = '<span class="hidden-text">' + hiddenText
				+ '</span>';
	</script> -->

</body>
</html>
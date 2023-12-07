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
dao.close();
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

			<div class="VIewContent">

				<div class="ViewTitle">
					<ul>
						<li><%=dto.getTag()%></li>
						<li><strong><h2><%=dto.getTitle()%></h2></strong></li>
						<li><a href=""><%=dto.getChname()%></a></li>
						<div data-v-5d915d2e="" class="wrap-info">
							<span data-v-5d915d2e="" class="date">2일</span> <span
								data-v-5d915d2e="" class="pv"><%=dto.getVisitcount()%></span> <span
								data-v-5d915d2e="" class="cmt">72</span>
						</div>
					</ul>
				</div>


				<div class="content">
					<p>
						<%=dto.getContent()%>
					</p>
					<div data-v-5d915d2e="" class="article_info">
						<div data-v-5d915d2e="" class="info">
							<a data-v-5d915d2e="" class="like"><%=dto.getGood()%></a> <a
								data-v-5d915d2e="" class="cmt">66</a>
						</div>

					</div>
				</div>

				<div class="article-comments">
					<h3>댓글</h3>
					<div class="write_area">
						<div id="btn_add_comment">
							<div class="reply_area">
								<button type="button" class="btn_reply">댓글을 남겨주세요.</button>
							</div>
						</div>

					</div>
				</div>
				<div class="wrap-comment comment_area">
					<p class="name">대충 학교 · 대충 아이디(여기도 학교 홈페이지 링크)</p>
					<p class="cmt-txt">대충 내용</p>
					<div class="wrap-info">
						<span class="date">11시간</span> <a class="like">좋아요</a> <a
							class="cmt">대댓글</a>
						<div class="info_fnc">
							<div class="more_wp">
								<span><span style="display: none;">
										<div class="ly_more popper">
											<div class="tip"></div>
											<ul class="type_icons">
												<li><a><span class="ico ico_comment"><em
															class="blind">write comment</em></span>대댓글 쓰기</a></li>
											</ul>
										</div>
								</span>
							</div>
						</div>
					</div>
				</div>
				<div class="wrap-comment comment_area">
					<p class="name">
					<p class="point">대충 학교 · 대충 아이디(여기도 학교 홈페이지 링크)</p>
					</p>
					<p class="cmt-txt">대충 내용</p>
					<div class="wrap-info">
						<span class="date">11시간</span> <a class="like">좋아요</a> <a
							class="cmt">대댓글</a>
						<div class="info_fnc">
							<div class="more_wp">
								<span><span style="display: none;">
										<div class="ly_more popper">
											<div class="tip"></div>
											<ul class="type_icons">
												<li><a><span class="ico ico_comment"><em
															class="blind">write comment</em></span>대댓글 쓰기</a></li>
											</ul>
										</div>
								</span>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="ilbe">
				<h3>추천글</h3>
				<ul class="numbers">
					<li class="number">대충 내용</li>
					<li class="number">대충 내용</li>
					<li class="number">대충 내용</li>
					<li class="number">대충 내용</li>
					<li class="number">대충 내용</li>
					<li class="number">대충 내용</li>
					<li class="number">대충 내용</li>
					<li class="number">대충 내용</li>
					<li class="number">대충 내용</li>
					<li class="number">대충 내용</li>
				</ul>
			</div>
		</div>

	</div>

</body>
</html>
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

String action = request.getParameter("action");

BoardDAO dao = new BoardDAO(application);

BoardDTO dto = new BoardDTO();

response.setContentType("text/html; charset=UTF-8");
request.setCharacterEncoding("UTF-8");

String scName = session.getAttribute("scName").toString(); //학교 이름
String scFond = session.getAttribute("scFond").toString(); //공립 or 사립
String scATPT = session.getAttribute("scATPT").toString(); //교육청명
String scRDNMA = session.getAttribute("scRDNMA").toString(); //도로명주소
String scRDNDA = session.getAttribute("scRDNDA").toString(); //상세 도로명주소
String scTELNO = session.getAttribute("scTELNO").toString(); //전화번호
String scHMPG = session.getAttribute("scHMPG").toString(); //홈페이지 주소
String scCOEDU = session.getAttribute("scCOEDU").toString(); //남녀공학 구분
String scHS = session.getAttribute("scHS").toString(); //고등학교 구분
String scSPCLY = session.getAttribute("scSPCLY").toString(); //특수목적 고등학교 구분
request.setAttribute("scName", scName);

String userId = session.getAttribute("UserId").toString();
String userCH = session.getAttribute("UserCH").toString();

if ("insert".equals(action)) {

	String grade = request.getParameter("rating");
	String content = request.getParameter("comin");

	dto.setContent(content);
	dto.setId(userId);
	dto.setGrade(grade);
	dto.setSchool(scName);
	dto.setChname(userCH);

	// 리뷰 등록
	dao.insertReview(dto);
}
// 학교별 리뷰 조회
ArrayList<BoardDTO> reviewList = dao.getReviewsBySchool(scName);
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
	<%
	String[] arr = { scName, scFond, scATPT, scRDNDA, scRDNDA, scTELNO, scHMPG, scCOEDU, scHS };
	%>
	<ul class="schoolInfo">
		<h3 class="bigtitle">학교 정보</h3>
		<h1><%=arr[0]%></h1>
		<div id="schoolIntroduce">
			<h1><%=arr[0]%>
				학교 소개
			</h1>
			<div id="introInline">
				<div id="left">
					<p>홈페이지</p>
					<a href="<%=arr[6]%>"><%=arr[6]%></a>
					<p>위치</p>
					<p><%=arr[3]%></p>
					<p>남녀공학 여부</p>
					<p><%=arr[7]%></p>
				</div>
				<div id="right">
					<p>공립 or 사립</p>
					<p><%=arr[1]%></p>
					<p>고등학교 구분</p>
					<p><%=arr[8]%></p>
					<p>전화번호</p>
					<p><%=arr[5]%></p>
				</div>
			</div>
		</div>
		<%
		if (scSPCLY != null) {
		%>
		<li><%=scSPCLY%></li>
		<%
		}
		%>
	</ul>

	<div class="allin">
		<div class="article-comments">
			<!-- 리뷰 등록 폼 -->
			<div class="write_area">
				<div id="btn_add_comment">
					<form action="SchoolView.jsp?action=insert" method="post">
						<label for="rating">평점:</label> <input type="number" name="rating"
							min="1" max="5" required> <br>
						<div class="reply_area">
							<input type="text" placeholder="내용을 남겨주세요" class="btn_reply"
								name="comin" /> <input type="submit" value="등록" />
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- 리뷰 목록 출력 -->
		<h3 class="reviewlist">리뷰 목록</h3>
		<%
		for (BoardDTO review : reviewList) {
		%>
		<div class="wrap-comment comment_area">
			<div id="comment_user">
				<p id="comment_p"><%=review.getChname()%></p>
				<p id="comment_p">·</p>
				<p id="comment_p" class="uId">
					<%
					String[] getId = review.getId().split("");
					String star = "";
					for (int i = 0; i < getId.length - 1; i++) {
						star += "*";
					}
					String setId = getId[0] + star;
					%>
					<%=setId%>
				</p>
			</div>
			<p class="name">
				<%=review.getSchool()%>
				- 평점:
				<%=review.getGrade()%></p>
			<p class="cmt-txt"><%=review.getContent()%></p>

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

</body>
</html>
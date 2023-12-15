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

if ("insert".equals(action)) {

	String grade = request.getParameter("rating");
	String content = request.getParameter("comin");

	dto.setContent(content);
	dto.setId(session.getAttribute("UserId").toString());
	dto.setGrade(grade);
	dto.setSchool(scName);
	dto.setChname(session.getAttribute("userCH").toString());

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
	String[] arr = { "1. 학교 이름: " + scName, "2. 분류: " + scFond, "3. 교육청명: " + scATPT, "4. 도로명주소: " + scRDNDA,
			"5. 상세 도로명주소: " + scRDNDA, "6. 전화번호: " + scTELNO, "7. 홈페이지 주소: " + scHMPG, "8. 남녀공학 구분: " + scCOEDU,
			"고등학교 구분: " + scHS };
	%>
	<ul class="schoolInfo">
		<h3 class="bigtitle">학교 정보</h3>
		<%
		for (int i = 0; i < 8; i++) {
		%>
		<li><%=arr[i]%></li>
		<%
		}
		%>
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
			<h2>
				리뷰 페이지 -
				<%=scName%></h2>

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
			<p class="name"><%=review.getId()%> ▲
				<%= review.getChname() %></p>
			<p class="name"> <%= review.getSchool() %>	- 평점:
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
	
</body>
</html>
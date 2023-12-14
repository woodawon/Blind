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
	<ul>
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

	<%-- <div class="allin">

		<div class="contentall">
			<div class="VIewContent">
				<div class="ViewTitle">
					<ul>

						<li><%=Tag%></li>
						<li><strong><h2><%=Title%></strong>
							</h2></li>
						<li><a href=""><%=ChName%></a></li>
						<div data-v-5d915d2e="" class="wrap-info">
							<span data-v-5d915d2e="" class="date"><%=PostDate%></span> <span
								data-v-5d915d2e="" class="pv"><%=dto.getVisitcount()%></span> <span
								data-v-5d915d2e="" class="cmt"><%=list.size()%></span>
						</div>
					</ul>
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
					<p class="name"><%=list.get(j).getId()%>
						<%=list.get(j).getChname()%></p>
					<p class="cmt-txt"><%=list.get(j).getContent()%></p>
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
		</div>
	</div> --%>
</body>
</html>
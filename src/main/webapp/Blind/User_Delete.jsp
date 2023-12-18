<%@page import="membership.MemberDAO"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String oracleDriver = application.getInitParameter("OracleDriver");
	String oracleURL = application.getInitParameter("OracleURL");
	String oracleId = application.getInitParameter("OracleId");
	String oraclePwd = application.getInitParameter("OraclePwd");

	BoardDAO bdao = new BoardDAO(application);
	MemberDAO mdao = new MemberDAO(oracleDriver, oracleURL, oracleId, oraclePwd);
	int check1 = bdao.deletePostedBoard(session.getAttribute("UserId").toString());
	int check2 = mdao.deleteUserInfo(session.getAttribute("UserId").toString());
	bdao.close();
	mdao.close();

	if (check1 + check2 == 2) {
		response.sendRedirect("home.jsp");
	}
	%>
</body>
</html>
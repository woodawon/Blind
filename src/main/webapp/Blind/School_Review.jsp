<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학교 리뷰</title>
<link rel="stylesheet" href="./global.css">
</head>
<body>
	<%
	if (session.getAttribute("logined") != null) {
	%>
	<header>
		<%@include file="Header2.jsp"%>
	</header>
	<%
	} else {
	%>
	<header>
		<%@include file="Header.jsp"%>
	</header>
	<%
	}
	%>
	<section id="main">
	<%@include file = "SchoolReview_Main.jsp" %>
	</section>
	<footer>
	<%@include file = "Footer.jsp" %>
	</footer>
</body>
</html>
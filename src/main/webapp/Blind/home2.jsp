<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	session.setAttribute("logined", "logined");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>청소년 블라인드</title>
<link rel="stylesheet" href="./global.css">
</head>
<body>
	<header>
		<%@include file="Header2.jsp"%>
	</header>
	<section id="wrapper">
		<%@include file="Section.jsp"%>
	</section>
	<footer>
		<%@include file="Footer.jsp"%>
	</footer>
</body>
</html>
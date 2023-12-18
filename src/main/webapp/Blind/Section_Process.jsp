<%@page import="model1.board.BoardDTO"%>
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
	String search = request.getParameter("search");
	%>
	<input type="text" name="title" value="<%=search %>" />
	<%
	request.getRequestDispatcher("BoardProcess.jsp").forward(request, response);
	%>
</body>
</html>
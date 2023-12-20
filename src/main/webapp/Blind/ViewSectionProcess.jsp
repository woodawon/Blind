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
		String title = (String) session.getAttribute("Title");
		BoardDAO dao = new BoardDAO(application);
		dao.GoodUpdate(title);
		request.getRequestDispatcher("View.jsp").forward(request, response);
	%>
</body>
</html>
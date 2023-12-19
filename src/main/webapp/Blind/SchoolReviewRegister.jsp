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
	
	BoardDAO dao = new BoardDAO(application);
	BoardDTO dto = new BoardDTO();
	
	String grade = session.getAttribute("grade").toString();
	String content = session.getAttribute("content").toString();
	String scName = request.getAttribute("scName").toString();

	dto.setContent(content);
	dto.setId(session.getAttribute("UserId").toString());
	dto.setChname(session.getAttribute("userCH").toString());

	// 리뷰 등록
	dao.insertReview(dto);
	request.getRequestDispatcher("SchoolView.jsp").forward(request, response);
	%>
</body>
</html>
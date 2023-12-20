<%@page import="model1.board.BoardDAO"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
String id = (String)session.getAttribute("UserId");
String chName = (String)session.getAttribute("userCH");
String title = request.getParameter("title");
title = URLDecoder.decode(title, "UTF-8");

BoardDAO dao = new BoardDAO(application);
BoardDTO dto = dao.selecView(title);
dao.close();

if (dto.getTitle() != null) {
	session.setAttribute("PostId", dto.getId());
	session.setAttribute("Tag", dto.getTag());
	session.setAttribute("Content", dto.getContent());
	session.setAttribute("PostDate", dto.getPostdate());
	session.setAttribute("Title", dto.getTitle());
	session.setAttribute("ChName", dto.getChname());
	session.setAttribute("VisitCount", dto.getVisitcount());
	session.setAttribute("Good", dto.getGood());
   	response.sendRedirect("View.jsp");
} else {
   request.setAttribute("comErr", "다시 시도해주세요");
   request.getRequestDispatcher("View.jsp").forward(request, response);
}
%>
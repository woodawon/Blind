<%@page import="model1.board.BoardDTO"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
BoardDTO Dto = new BoardDTO();
request.setCharacterEncoding("UTF-8");
String id = (String)session.getAttribute("UserId");
String chName = (String)session.getAttribute("userCH");
String title = (String)session.getAttribute("Title");
String content = request.getParameter("comin");

BoardDAO dao = new BoardDAO(application);
BoardDTO dto = dao.insertComment(id, chName, title, content);
dao.close();

if (dto.getId() != null) {
   session.setAttribute("comin", dto.getContent());
   response.sendRedirect("View.jsp");
} else {
   request.setAttribute("comErr", "다시 시도해주세요");
   request.getRequestDispatcher("View.jsp").forward(request, response);
}


%>

<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="common.JDBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>JDBC</title>
</head>
<body>
	<%
	// DB에 연결
	JDBConnect jdbc = new JDBConnect(application);
	String sql = "INSERT INTO member VALUES (?, ?, sysdate, ?, ?, ?)";
	PreparedStatement psmt = jdbc.con.prepareStatement(sql);

	String id = request.getParameter("ID");
	String pw = request.getParameter("PW");
	String school = request.getParameter("SCHOOL");
	String pw2 = request.getParameter("PW2");
	String email = request.getParameter("EMAIL");

	psmt.setString(1, id);
	psmt.setString(2, pw);
	psmt.setString(3, school);
	psmt.setString(4, pw2);
	psmt.setString(5, email);
	// 쿼리 수행
	int inResult = psmt.executeUpdate();
	// 연결 닫기
	jdbc.close();
	session.setAttribute("Joined", "joined");
	response.sendRedirect("Register.jsp");
	%>
</body>
</html>
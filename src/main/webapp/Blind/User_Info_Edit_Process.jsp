<%@page import="model1.board.BoardDAO"%>
<%@page import="membership.MemberDAO"%>
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
	response.setContentType("text/html; charset=UTF-8");
	request.setCharacterEncoding("UTF-8");

	String email = request.getParameter("editEM").toString();
	String school = request.getParameter("editCH").toString();
	String id = session.getAttribute("UserId").toString();
	String pw = session.getAttribute("UserPW").toString();

	String oracleDriver = application.getInitParameter("OracleDriver");
	String oracleURL = application.getInitParameter("OracleURL");
	String oracleId = application.getInitParameter("OracleId");
	String oraclePwd = application.getInitParameter("OraclePwd");

	MemberDAO dao = new MemberDAO(oracleDriver, oracleURL, oracleId, oraclePwd);
	int update = dao.updateUserInfo(email, school, id, pw);
	dao.close();
	if(update == 1) {
		session.setAttribute("UserCH", school);
		session.setAttribute("UserEM", email);
	}
	response.sendRedirect("User_Info.jsp");

	%>
</body>
</html>
<%@page import="utils.JSFunction"%>
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
	String id = request.getParameter("ID");
	String oracleDriver = application.getInitParameter("OracleDriver");
	String oracleURL = application.getInitParameter("OracleURL");
	String oracleId = application.getInitParameter("OracleId");
	String oraclePwd = application.getInitParameter("OraclePwd");
	
	MemberDAO dao = new MemberDAO(oracleDriver, oracleURL , oracleId, oraclePwd);
	int result = dao.checkID(id);
	if(result == 1) {
		session.setAttribute("canId", id);
		JSFunction.alertLocation("사용하실 수 있는 아이디입니다.", "Register.jsp", out);
	} else {
		JSFunction.alertBack("중복된 아이디가 이미 있습니다.", out);
	}
	%>
</body>
</html>
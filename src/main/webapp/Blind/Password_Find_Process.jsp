<%@page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<%
	String oracleDriver = application.getInitParameter("OracleDriver");
	String oracleURL = application.getInitParameter("OracleURL");
	String oracleId = application.getInitParameter("OracleId");
	String oraclePwd = application.getInitParameter("OraclePwd");
	MemberDAO dao = new MemberDAO(oracleDriver, oracleURL, oracleId, oraclePwd);

	String email = request.getParameter("emailCheck");
	String pwd = dao.passwordCheck(email);
	%>
	<%
	if (pwd != null) {
	%>
	<script>
        $(function() {

            alert("<%=pwd%>");

		});
	</script>
	<%
	}
	%>
</body>
</html>
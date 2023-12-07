<%@page import="membership.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String userId = request.getParameter("Blind_id");
	String userPwd = request.getParameter("Blind_pass");
	
	
	String oracleDriver = application.getInitParameter("OracleDriver");
	String oracleURL = application.getInitParameter("OracleURL");
	String oracleId = application.getInitParameter("OracleId");
	String oraclePwd = application.getInitParameter("OraclePwd");
	
	
	MemberDAO dao = new MemberDAO(oracleDriver, oracleURL , oracleId, oraclePwd);
	MemberDTO blindDTO = dao.getMemberDTO(userId, userPwd);
	dao.close();
	
	
	if(blindDTO.getId() != null){
		
		session.setAttribute("UserId", blindDTO.getId());
		session.setAttribute("userCH", blindDTO.getChname());
		response.sendRedirect("home2.jsp");
	}
	
	else{
		request.setAttribute("LoginErrMsg","로그인 오류입니다.");
		request.getRequestDispatcher("Login.jsp").forward(request, response);
		
	}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
</body>
</html>
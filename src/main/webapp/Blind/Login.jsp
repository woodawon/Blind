<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<%@include file="Footer.jsp"%>
<link rel="stylesheet" href="./Login.css">
<link rel="stylesheet" href="./global.css">
</head>
<body>
	<header>
		<%@include file="Header.jsp"%>
	</header>
	<span style="color: red; font-size: 1.2em;"> <%=request.getAttribute("LoginErrMsg") == null ? "" : request.getAttribute("LoginErrMsg")%>
	</span>
	<section class="sec">
		<form action="LoginProcess.jsp" method="post">
			<div class="indidi">
				<p>아이디 비밀번호를 입력하신 후, 로그인 버튼을 클릭해 주세요.</p>
				<br> <input type="text" id="id" name="Blind_id"> <input
					type="password" id="pw" name="Blind_pass"> <input
					type="submit" id="Login" value="로그인" class="log">
			</div>
			<a href="Passward_Find.jsp" class="aTag">비밀번호 찾기 &gt;</a> <a
				href="Register.jsp" class="Regi">회원가입 &gt;</a>
		</form>
	</section>
	<!-- <script>
    document.getElementById("Login").addEventListener("click", function() {
        var id = document.getElementById("id").value;
        var pw = document.getElementById("pw").value;

        if (id && pw) {
        	window.open("LoginQ.jsp")
        } else if(id == false){
        	alert("아이디를 입력하세요");
        } else if(pw == false) {
        	alert("비밀번호를 입력하세요");
        }        
    });
</script> -->
</body>
</html>
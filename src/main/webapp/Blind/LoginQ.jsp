<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){ 
        	 var confirmation = confirm("로그인 하시겠습니까?");
        	 if (confirmation) {
        		 window.location.href = "home2.jsp";
        		 alert(id + "님, 로그인되었습니다");
             }else{
            	 window.location.href = "Login.jsp"
            	 
             }
});
</script>


</body>
</html>
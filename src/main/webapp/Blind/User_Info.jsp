<%@page import="java.io.IOException"%>
<%@page import="java.util.Base64"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="membership.MemberDTO"%>
<%@page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%!
	String getImagePathFromDatabase(HttpSession session) throws ClassNotFoundException  {
    Class.forName("oracle.jdbc.OracleDriver");
    String url = "jdbc:oracle:thin:@localhost:1521:xe";
    String username = "blind";
    String password = "1234";

    String id = session.getAttribute("UserId").toString();

    try (Connection connection = DriverManager.getConnection(url, username, password)) {
        String query = "select image from member where id=?";
        try (PreparedStatement psmt = connection.prepareStatement(query)) {
            psmt.setString(1, id);

            try (ResultSet resultSet = psmt.executeQuery()) {
                if (resultSet.next()) {
                    Blob imageBlob = resultSet.getBlob("image");
                    InputStream inputStream = imageBlob.getBinaryStream();
                    
                    // InputStream을 byte 배열로 변환
                    byte[] buffer = new byte[4096];
                    ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                    int bytesRead = -1;
                    while ((bytesRead = inputStream.read(buffer)) != -1) {
                        outputStream.write(buffer, 0, bytesRead);
                    }

                    byte[] imageBytes = outputStream.toByteArray();
                    inputStream.close();
                    outputStream.close();

                    // Base64로 인코딩된 이미지 데이터를 반환
                    return "data:image/png;base64," + Base64.getEncoder().encodeToString(imageBytes);
                }
            }
        }
    } catch (SQLException | IOException e) {
        e.printStackTrace();
    }
    return null;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필</title>

<%@include file="Footer.jsp"%>
<link rel="stylesheet" href="./User_info.css">
<link rel="stylesheet" href="./global.css">
</head>
<body>
	<%
	String school = session.getAttribute("UserCH").toString();
	String email = session.getAttribute("UserEM").toString();
	%>
	<header>
		<%@include file="Header2.jsp"%>
	</header>

	<div class="Head">
		<h2>프로필 수정</h2>
		<p class="depeu">블라인드 대표 프로필과 수정 하실 수 있습니다.</p>
	</div>

	<section>
		<h3 class="H3">프로필</h3>
		<div class="allP">
			<%
			if (session.getAttribute("UserImg") == null) {
			%>
			<img class="Picture" alt="logo" src="./images/blind.png">
			<%
			} else {
			%>
			<img src="<%=getImagePathFromDatabase(session)%>"
				alt="Uploaded Image">
			<%
			}
			%>
			<form method="post" action="/Blind/FileUploadServlet"
				enctype="multipart/form-data">
				<input type="file" name="file" accept="image/*"> <input
					type="text" name="id" value="<%=session.getAttribute("UserId")%>" />
				<input type="text" name="pw"
					value="<%=session.getAttribute("UserPW")%>" /> <input
					type="submit" value="Upload">
			</form>
			<div class="secP">
				<p class="Email">
					이메일 :
					<%=email%>
				</p>
				<br>
				<p class="School">
					학교명 :
					<%=school%>
				</p>
			</div>
		</div>

		<div class="allsub">
			<form action="User_Info_Edit.jsp">
				<input type="submit" value="수정" class="edit">
			</form>
			<form action="User_Delete.jsp">
				<input type="submit" value="탈퇴" class="delete">
			</form>
		</div>
	</section>
</body>
</html>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.Base64"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="java.io.ByteArrayInputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="membership.MemberDTO"%>
<%@page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로필</title>
<%!String getImagePathFromDatabase(HttpSession session) throws ClassNotFoundException {
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

						// 인코딩된 이미지 데이터 리턴
						return "data:image/png;base64," + Base64.getEncoder().encodeToString(imageBytes);

					}
					return null;
				}
			}
		} catch (SQLException | IOException e) {
			e.printStackTrace();
		}
		return null;
	}%>

<%
String imagePath = getImagePathFromDatabase(session);
if (imagePath != null) {
	session.setAttribute("UserImg", "img");
}
%>
<%@include file="Footer.jsp"%>
<link rel="stylesheet" href="./User_info_Edit.css">
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
		<form method="post" action="<%="/Blind/FileUploadServlet"%>"
			enctype="multipart/form-data" class="fileForm">
			<input type="file" name="file" accept="image/*"> <input
				type="submit" value="Upload">
		</form>
		<form method="post" action="User_Info_Edit_Process.jsp">
			<h3 class="H3">프로필</h3>
			<div class="allP">
				<%
				if (session.getAttribute("UserImg") != null) {
				%>
				<img id="profileImage" alt="Uploaded Image" src="<%=imagePath%>">
				<%
				} else {
				%>
				<img class="Picture" alt="logo" src="./images/blind.png"
					id="profileImage">
				<%
				}
				%>

				<div class="secP">
					<p id="preview"><%=email%></p>
					<p class="Email">
						이메일 : <input type="text" placeholder="example@abc.com"
							name="editEM" required />
					</p>
					<br>
					<p id="preview"><%=school%></p>
					<p class="School">
						학교명 : <input type="text" placeholder="00고등학교" name="editCH"
							required />
					</p>
				</div>
			</div>
			<div class="allsub">
				<input type="submit" value="확인" class="delete">
			</div>
		</form>
	</section>
</body>
</html>
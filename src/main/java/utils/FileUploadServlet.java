package utils;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/FileUploadServlet")
@MultipartConfig
public class FileUploadServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Part filePart = req.getPart("file");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

        // 파일을 서버에 저장할 물리적인 경로
        Path filePath = Paths.get("C:\\Picture\\", fileName);

        try (InputStream fileContent = filePart.getInputStream(); 
             OutputStream os = Files.newOutputStream(filePath)) {

            // 파일을 복사하고 닫기
            byte[] buffer = new byte[8192];
            int bytesRead;
            while ((bytesRead = fileContent.read(buffer)) != -1) {
                os.write(buffer, 0, bytesRead);
            }
        }

        HttpSession session = req.getSession();

        // 데이터베이스에 파일 경로 저장
        String dbPath = "C:\\Picture\\" + fileName;

        try {
            saveFilePathToDatabase(dbPath, session);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        session.setAttribute("UserImg", "img");
        resp.sendRedirect("/Blind/Blind/User_Info_Edit.jsp");
    }

    private void saveFilePathToDatabase(String filePath, HttpSession session) throws ClassNotFoundException {
        Class.forName("oracle.jdbc.OracleDriver");
        String url = "jdbc:oracle:thin:@localhost:1521:xe";
        String username = "blind";
        String password = "1234";

        String id = session.getAttribute("UserId").toString();
        String pw = session.getAttribute("UserPW").toString();

        try (Connection connection = DriverManager.getConnection(url, username, password)) {
            String query = "UPDATE member SET image = ? WHERE id = ? AND pwd = ?";

            try (PreparedStatement psmt = connection.prepareStatement(query)) {
                // 이미지 파일 읽기
                byte[] imageData = Files.readAllBytes(Paths.get(filePath));
                ByteArrayInputStream bis = new ByteArrayInputStream(imageData);

                // 이미지 파일 DB에 저장
                psmt.setBinaryStream(1, bis, imageData.length);
                psmt.setString(2, id);
                psmt.setString(3, pw);

                psmt.executeUpdate();
            }
        } catch (SQLException | IOException e) {
            e.printStackTrace();
        }
    }
}


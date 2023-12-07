package model1.board;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

import common.JDBConnect;

public class BoardDAO extends JDBConnect {

	public BoardDAO(ServletContext application) {
		super(application);
	}

	public int selectCount(Map<String, Object> map) { // 게시물 개수 알려주는 메소드

		int totalCount = 0;

		String query = "SELECT COUNT(*) FROM board";

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);

			rs.next();
			totalCount = rs.getInt(1);

		} catch (Exception e) {
			System.out.println("게시물 구하는 중 오류 발생.");

		}
		return totalCount;
	}

	public List<BoardDTO> selectList(Map<String, Object> map) { // 게시물 목록 가져올 메소드
		List<BoardDTO> bbs = new Vector<BoardDTO>();

		String query = "SELECT * FROM board";

		query += " ORDER BY num DESC "; // 정렬

		try {
			stmt = con.createStatement(); // 쿼리문 생성
			rs = stmt.executeQuery(query); // 쿼리 실행

			while (rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setNum(rs.getString("num")); // 일련번호
				dto.setTitle(rs.getString("title")); // 제목
				dto.setContent(rs.getString("content")); // 내용
				dto.setPostdate(rs.getDate("postdate")); // 작성일
				dto.setId(rs.getString("id")); // 작성자 아이디
				dto.setVisitcount(rs.getString("visitcount")); // 조회수
				dto.setTag(rs.getString("tag")); // 카테고리
				dto.setChname(rs.getString("chname")); // 학교 이름
				dto.setGood(rs.getString("good"));

				bbs.add(dto); // 결과 목록에 저장
			}

		} catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}

		return bbs;
	}

	public int insertWrite(BoardDTO dto) { // 게시물 데이터 받아서 DB에 추가(글쓰기)
		int result = 0;

		try {
			String query = "insert into board (" + "tag, title, content, visitcount, id, postdate, chname, good, num)"
					+ "values (" + "?, ?, ?, 0, ?, sysdate, ?, 0, seq_board_num.nextval)";

			psmt = con.prepareStatement(query); // 동적 쿼리
			psmt.setString(1, dto.getTag());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getId());
			psmt.setString(5, dto.getChname());

			result = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}

		return result;
	}

	public BoardDTO selectView(String num) {
		BoardDTO dto = new BoardDTO();

		String query = "select B.*, M.name " + " from member M inner join board B" + " on M.id=B.id" + " where num=?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num); // 일련번호 지정
			rs = psmt.executeQuery();

			if (rs.next()) {
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString("visitcount"));

			}
		} catch (Exception e) {
			System.out.println("게시물 상세보기 중 예외 발생");
			e.printStackTrace();
		}
		return dto;
	}

	public void updateVisitCount(String num) { // 조회수 ++시키는 메서드
		// 쿼리문 준비
		String query = "update board set " + " visitcount=visitcount+1" + " where num=?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			psmt.executeQuery();
		} catch (Exception e) {
			System.out.println("게시물 조회수 증가 중 예외 발생");
			e.printStackTrace();
		}
	}

}

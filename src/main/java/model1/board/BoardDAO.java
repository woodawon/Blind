package model1.board;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Vector;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletContext;

import common.JDBConnect;

public class BoardDAO extends JDBConnect {

	public BoardDAO(ServletContext application) {
		super(application);
	}


	    // 리뷰 등록
	    public int insertReview(BoardDTO dto) {
	    	int result = 0;

			try {
				String query = "insert into review (" + "id, chname, content, grade, SCHOOL)"
						+ "values (" + "?, ?, ?, ?, ?)";

				psmt = con.prepareStatement(query); // 동적 쿼리
				psmt.setString(1, dto.getId());
				psmt.setString(2, dto.getChname());
				psmt.setString(3, dto.getContent());
				psmt.setString(4, dto.getGrade());
				psmt.setString(5, dto.getSchool());

				result = psmt.executeUpdate();
			} catch (Exception e) {
				System.out.println("게시물 입력 중 예외 발생");
				e.printStackTrace();
			}

			return result;
		}

	    // 학교별 리뷰 조회
	    public ArrayList<BoardDTO> getReviewsBySchool(String school) {
	        ArrayList<BoardDTO> list = new ArrayList<>();
	        try {
	            String query = "SELECT * FROM review WHERE school = ?";
	            psmt = con.prepareStatement(query);
	            psmt.setString(1, school);
	            rs = psmt.executeQuery();

	            while (rs.next()) {
	                BoardDTO dto = new BoardDTO();
	                dto.setId(rs.getString("id"));
	                dto.setChname(rs.getString("chname"));
	                dto.setContent(rs.getString("content"));
	                dto.setGrade(rs.getString("grade"));
	                dto.setSchool(rs.getString("school"));
	                list.add(dto);
	            }
	        } catch (SQLException e) {
	        	System.out.println("리뷰 구하는 중 오류 발생.");
	        }
	        return list;
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

	public List<BoardDTO> selectSamung(Map<String, Object> map) { // 상미고 게시물 목록 가져올 메소드
		List<BoardDTO> bbs = new Vector<>();
		String query = "SELECT * FROM board WHERE title LIKE '%세명컴퓨터고등학교%' OR title LIKE '%세명고%' OR title LIKE '%세컴고%'";

		try {
			stmt = con.createStatement(); // 쿼리문 생성
			rs = stmt.executeQuery(query); // 쿼리 실행

			while (rs.next()) { // 결과를 순화하며...
				// 한 행(게시물 하나)의 내용을 DTO에 저장
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
			System.out.println("해쉬태그 조회중 예외 발생");
			e.printStackTrace();
		}
		return bbs;
	}

	public List<BoardDTO> selectSangil(Map<String, Object> map) { // 상미고 게시물 목록 가져올 메소드
		List<BoardDTO> bbs = new Vector<>();
		String query = "SELECT * FROM board WHERE title LIKE '%상일미디어고등학교%' OR title LIKE '%상미고%'";

		try {
			stmt = con.createStatement(); // 쿼리문 생성
			rs = stmt.executeQuery(query); // 쿼리 실행

			while (rs.next()) { // 결과를 순화하며...
				// 한 행(게시물 하나)의 내용을 DTO에 저장
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
			System.out.println("해쉬태그 조회중 예외 발생");
			e.printStackTrace();
		}
		return bbs;
	}

	public List<BoardDTO> selectList(Map<String, Object> map) { // 게시물 목록 가져올 메소드
		List<BoardDTO> bbs = new Vector<>();

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

		String query = "select B.*, M.chname " + " from member M inner join board B" + " on M.id=B.id" + " where num=?";

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

	public BoardDTO insertComment(String id, String chname, String title, String content) { // 댓글 추가 메서드
		BoardDTO Dto = new BoardDTO();

		try {
			String query = "insert into comment_tbl values (?, ?, ?, ?)";

			psmt = con.prepareStatement(query); // 동적 쿼리
			psmt.setString(1, id);
			psmt.setString(2, chname);
			psmt.setString(3, title);
			psmt.setString(4, content);
			rs = psmt.executeQuery();
			if (rs.next()) {
				Dto.setId(id);
				Dto.setChname(chname);
				Dto.setContent(content);
			}
		} catch (Exception e) {
			System.out.println("댓글 입력 중 예외 발생");
			e.printStackTrace();
		}

		return Dto;
	}

	
	
	public ArrayList<BoardDTO> getComment(String title) { // Arraylist 타입으로 댓글 가져옴
		ArrayList<BoardDTO> list = new ArrayList<>();
		try {
			String query = "SELECT * FROM comment_tbl WHERE title= ?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, title);
			rs = psmt.executeQuery();
			while (rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setId(rs.getString(1));
				dto.setChname(rs.getString(2));
				dto.setContent(rs.getString(4));
				list.add(dto);
			}
		} catch (SQLException e) {
			System.out.println("댓글 조회 중 예외 발생");
			e.printStackTrace();
		}
		return list;
	}


	public BoardDTO selecView(String title) { // View.jsp에서 보일 content 등등 가져옴(BoardProcess에서 씀)
		BoardDTO dto = new BoardDTO();
		try {
			String query = "select * from Board where title = ?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, title);
			rs = psmt.executeQuery();

			if (rs.next()) {
				dto.setTitle(title);
				dto.setTag(rs.getString(1));
				dto.setContent(rs.getString(2));
				dto.setId(rs.getString(5));
				dto.setPostdate(rs.getDate(6));
				dto.setChname(rs.getString(7));
			}
		} catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		return dto;
	}

	public ArrayList<BoardDTO> randomPost(int count) { // ArrayList 형식으로 반환(게시물 수가 적을때 css도 달라지도록) count는 최대 반환수
		ArrayList<BoardDTO> list = new ArrayList<>();

		try {
			String countQuery = "SELECT COUNT(*) FROM board"; // 현재 board 테이블의 전체필드 수(게시물수)반환(아마 where tag= 추가하면 됨)
			stmt = con.createStatement(); // 정적 쿼리
			rs = stmt.executeQuery(countQuery);

			if (rs.next()) {
				int totalCount = rs.getInt(1); // rs 첫번째꺼 가져옴
				Set<Integer> selectedNums = new HashSet<>(); // 중복되는 결과 제외

				while (list.size() < count && selectedNums.size() < totalCount) {
					int num = (int) (Math.random() * totalCount) + 8; // 우리 board 테이블 num 값이 8부터 시작함

					if (selectedNums.add(num)) {
						String query = "SELECT title FROM board WHERE num = ?";
						psmt = con.prepareStatement(query); // 동적 쿼리
						psmt.setInt(1, num);
						rs = psmt.executeQuery();

						if (rs.next()) {
							BoardDTO dto = new BoardDTO(); // if문 안에 넣어야 새로운 dto 계속 생성함
							dto.setTitle(rs.getString("title")); // dto title에 값 넣음
							list.add(dto); // arrayList에 추가
						}
					}
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

}

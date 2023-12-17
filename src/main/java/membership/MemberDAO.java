package membership;

import common.JDBConnect;

public class MemberDAO extends JDBConnect {

	public MemberDAO(String drv, String url, String id, String pw) {
		super(drv, url, id, pw);
	}

	public MemberDTO getMemberDTO(String uid, String upass) {
		MemberDTO dto = new MemberDTO();
		String query = "select * from member where id=? and pwd=?";

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, uid);
			psmt.setString(2, upass);
			rs = psmt.executeQuery();

			if (rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pwd"));
				dto.setRegidate(rs.getString("regidate"));
				dto.setChname(rs.getString("chname"));
				dto.setEmail(rs.getString("email"));
				dto.setImg(rs.getBlob("image"));;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public int updateUserInfo(String email, String school, String id, String pw) {
		String query = "update member set email=?, chname=? "
				+ "where id=? and pwd=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, email);
			psmt.setString(2, school);
			psmt.setString(3, id);
			psmt.setString(4, pw);
			psmt.executeUpdate();
			return 1;
		} catch (Exception e) {
			System.out.println("사용자 정보 수정 실패");
			e.printStackTrace();
			return 0;
		}
	}
	
	
}

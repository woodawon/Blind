package membership;

import java.util.ArrayList;

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
				dto.setImg(rs.getBlob("image"));
				;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	public int updateUserInfo(String email, String school, String id, String pw) {
		String query = "update member set email=?, chname=? " + "where id=? and pwd=?";
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

	public int deleteUserInfo(String id) {
		try {
			String query = "delete from member " + "where id=?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			psmt.executeQuery();
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	public int checkID(String id) {
		ArrayList<String> list = new ArrayList<>();
		try {
			String query = "select id from member";
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			while (rs.next()) {
				list.add(rs.getString("id"));
			}
			for(int i=0;i < list.size();i++) {
				if(id.equals(list.get(i))) {
					return 0;
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 1;
	}
	
	public String passwordCheck(String email) {
		String pwd = "";
		try {
			String query ="select pwd from member where email=?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, email);
			rs = psmt.executeQuery();
			if(rs.next()) {
				pwd = rs.getString("pwd");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pwd;
	}

}

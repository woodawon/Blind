package utils;

import javax.servlet.jsp.JspWriter;

public class JSFunction {
	// 메세지 알림창을 띄운 후 명시한 URL로 이동한다.
	public static void alertLocation(String msg, String url, JspWriter out) {
		// msg : 알림창을 띄울 메세지
		// url : 알림창을 닫은 후 이동할 페이지의 url
		// out : 자바스크립트 코드를 삽입할 출력 스트림(jsp의 out 내장객체)
		
		try {
			String script = ""  // 삽입할 자바스크립트 코드
						+ "<script>" 
						+ "		alert('"+ msg +"'); " 
						+ "		location.href='"+ url + "';"
						+ "</script>";
			out.println(script); // 자바스크립트 코드를 out 내장 객체로 출력(삽입)
					
		}
		catch(Exception e) {
			
		}
	}
	
	// 메세지 알림창을 띄운 후 이전 페이지로 돌아감.
	public static void alertBack(String msg, JspWriter out) {
		// 알림창을 띄운 후 다른페이지로 이동(무조껀! 이전페이지로만)
		try {
			String script = "" // 삽입할 자바스크립트 코드
						+ "<script>" 
						+ "		alert('"+ msg +"'); " 
						+ "		history.back();" // 얘 때문임
						+ "</script>";
			out.println(script); // 자바스크립트 코드를 out 내장 객체로 출력(삽입)
					
		}
		catch(Exception e) {
			
		}
	}
}

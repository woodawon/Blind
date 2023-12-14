<%@page
	import="
  org.w3c.dom.Element,
  org.w3c.dom.Node,
  org.xml.sax.InputSource,
  org.w3c.dom.Document,
  org.xml.sax.SAXException,
  javax.xml.parsers.ParserConfigurationException,
  java.io.IOException,
  javax.xml.parsers.DocumentBuilder,
  javax.xml.parsers.DocumentBuilderFactory,
  java.util.stream.Collectors,
  java.io.InputStreamReader,
  java.io.BufferedReader,
  java.net.HttpURLConnection,
  java.net.URL,
  utils.SchoolInfo,
  model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String school = request.getParameter("q");
	try {
		String apiKey = "626172576a776f6f3537515266776a";
		String apiUrl = "http://openapi.seoul.go.kr:8088/" + apiKey + "/xml/neisSchoolInfoHs/1/1000/";

		// url 넣어서 데이터 값 받아오기
		URL url = new URL(apiUrl);
		HttpURLConnection connection = (HttpURLConnection) url.openConnection();
		connection.setRequestMethod("GET");

		BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
		String responses = reader.lines().collect(Collectors.joining(System.lineSeparator()));
		//		System.out.println("API 응답:\n" + response);

		// XML 파싱
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		DocumentBuilder builder = factory.newDocumentBuilder();
		Document document = builder.parse(new InputSource(new java.io.StringReader(responses)));

		// 검색한 학교 이름
		String targetSchoolName = request.getParameter("q");

		// 학교 정보 처리
		org.w3c.dom.NodeList nodeList = document.getElementsByTagName("row");
		for (int i = 0; i < nodeList.getLength(); i++) {
			Node node = nodeList.item(i);
			if (node.getNodeType() == Node.ELEMENT_NODE) {
		Element element = (Element) node;
		String schoolName = element.getElementsByTagName("SCHUL_NM").item(0).getTextContent(); // 학교 이름

		if (schoolName.equals(targetSchoolName)) {
			// item(0).getTextContent()  :  nodelist의 여러 데이터값 중에서 0번째인 특정 elemet를 text형태로 갖는다는 의미. 
			// 몇 번째 item인지를 형식상 정해줘야 하기 때문에 무조껀 0번째로 다 넣어줌
			String schoolFond = element.getElementsByTagName("FOND_SC_NM").item(0).getTextContent(); // 공립 or 사립
			String schoolATPT = element.getElementsByTagName("ATPT_OFCDC_SC_NM").item(0).getTextContent(); // 교육청명
			String schoolRDNMA = element.getElementsByTagName("ORG_RDNMA").item(0).getTextContent(); // 도로명주소
			String schoolRDNDA = element.getElementsByTagName("ORG_RDNDA").item(0).getTextContent(); // 상세 도로명주소
			String schoolTELNO = element.getElementsByTagName("ORG_TELNO").item(0).getTextContent(); // 전화번호
			String schoolHMPG = element.getElementsByTagName("HMPG_ADRES").item(0).getTextContent(); // 홈페이지 주소
			String schoolCOEDU = element.getElementsByTagName("COEDU_SC_NM").item(0).getTextContent(); // 남녀공학 구분
			String schoolHS = element.getElementsByTagName("HS_SC_NM").item(0).getTextContent(); // 고등학교 구분
			String schoolSPCLY = element.getElementsByTagName("SPCLY_PURPS_HS_ORD_NM").item(0).getTextContent(); // 특수목적 고등학교 구분	
			
			session.setAttribute("scSPCLY", schoolSPCLY);// 특수목적 고등학교 구분
			session.setAttribute("scName", schoolName);// 학교 이름
			session.setAttribute("scFond", schoolFond);// 공립 or 사립
			session.setAttribute("scATPT", schoolATPT);// 교육청명
			session.setAttribute("scRDNMA", schoolRDNMA);// 도로명주소
			session.setAttribute("scRDNDA", schoolRDNDA);// 상세 도로명주소
			session.setAttribute("scTELNO", schoolTELNO);// 전화번호
			session.setAttribute("scHMPG", schoolHMPG);// 홈페이지 주소
			session.setAttribute("scCOEDU", schoolCOEDU);// 남녀공학 구분
			session.setAttribute("scHS", schoolHS);// 고등학교 구분
 			response.sendRedirect("SchoolView.jsp"); 
		}
			}
		}

	} catch (IOException | ParserConfigurationException | SAXException e) {
		e.printStackTrace();
	}
	%>
</body>
</html>
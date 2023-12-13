package utils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.stream.Collectors;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

public class SchoolInfo {
	public static void main(String[] args) {
		try {
			String apiKey = "626172576a776f6f3537515266776a";
			String apiUrl = "http://openapi.seoul.go.kr:8088/" + apiKey + "/xml/neisSchoolInfoHs/1/1000/";

			// url 넣어서 데이터 값 받아오기
			URL url = new URL(apiUrl);
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setRequestMethod("GET");

			BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			String response = reader.lines().collect(Collectors.joining(System.lineSeparator()));
//				System.out.println("API 응답:\n" + response);

			// XML 파싱
			DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
			DocumentBuilder builder = factory.newDocumentBuilder();
			Document document = builder.parse(new InputSource(new java.io.StringReader(response)));

			// 검색한 학교 이름
			String targetSchoolName = "상일미디어고등학교";

			// 학교 정보 처리
			org.w3c.dom.NodeList nodeList = document.getElementsByTagName("row");
			for (int i = 0; i < nodeList.getLength(); i++) {
				Node node = nodeList.item(i);
				if (node.getNodeType() == Node.ELEMENT_NODE) {
					Element element = (Element) node;
					String schoolName = element.getElementsByTagName("SCHUL_NM").item(0).getTextContent();

					if (schoolName.equals(targetSchoolName)) {
						break; // 특정 학교를 찾았으면 더 이상 반복하지 않음
					}
				}
			}

		} catch (IOException | ParserConfigurationException | SAXException e) {
			e.printStackTrace();
		}
	}
}

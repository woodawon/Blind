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
	String scName = session.getAttribute("scName").toString();
	String scFond = session.getAttribute("scFond").toString();
	String scATPT = session.getAttribute("scATPT").toString();
	String scRDNMA = session.getAttribute("scRDNMA").toString();
	String scRDNDA = session.getAttribute("scRDNDA").toString();
	String scTELNO = session.getAttribute("scTELNO").toString();
	String scHMPG = session.getAttribute("scHMPG").toString();
	String scCOEDU = session.getAttribute("scCOEDU").toString();
	String scHS = session.getAttribute("scHS").toString();
	String scSPCLY = session.getAttribute("scSPCLY").toString();
	String[] arr = { scName, scFond, scATPT, scRDNDA, scRDNDA, scTELNO, scHMPG, scCOEDU, scHS }; 

	%>
	<ul>
		<%
		for (int i = 0; i < 8; i++) {
		%>
		<li><%=arr[i]%></li>
		<%
		}
		%>
		<%
		if (scSPCLY != null) {
		%>
		<li><%=scSPCLY%></li>
		<%
		}
		%> 
	</ul>

</body>
</html>
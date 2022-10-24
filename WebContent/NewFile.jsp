<%@page import="dao.CoSodao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		try {
			CoSodao cs = new CoSodao();
			cs.KetNoi();
		}
		catch(Exception e){
			e.printStackTrace();
		}
	%>
</body>
</html>
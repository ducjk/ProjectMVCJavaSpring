
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>AJax</title>
	<meta charset="utf-8">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  	<link rel="stylesheet" type="text/css" href="./assets/css/main.css">
</head>
<body>
	<form action="text1.jsp" method="get">
		<input name="text" type="number"/> <br>
		<input name="submit" type="submit" value="Tong"/>
		<br>
		<% 
		
			String numberString = request.getParameter("text");
			if (session.getAttribute("Sum") == null)
				session.setAttribute("Sum", 0);
			if (numberString != null){
				int number = Integer.parseInt(numberString);
				//b1: gan bien session cho 1 bien
				int ss = (int) session.getAttribute("Sum");
				
				ss = ss + number;
				
				session.setAttribute("Sum", ss);
				out.print("Tong :" + session.getAttribute("Sum"));
			}
			
		%>
	</form>
	
	<a href="htsach.jsp">Mo Trang chu</a>
</body>
</html>
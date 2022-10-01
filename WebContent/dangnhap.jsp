<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="ktdn.jsp" method="post" >
		un= <input name="txtun" type="text" value="" placeholder="nhap un" > <br>
       pass= <input name="txtpass" type="password" value="" placeholder="nhap pass"> <br>
		<input name="butdn" type="submit" value="Login">
		<%
		if(request.getParameter("kt")!=null){
			out.print("dang nhap sai");
		}
		%>
	</form>
</body>
</html>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Sum of two number</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>
	<%	
		double kq = 0;
		ArrayList<Double> list;
		if (request.getAttribute("list") != null)
			list = (ArrayList<Double>)request.getAttribute("list");
		for (double item: list){
			
		}
	
	/* String a = "";
		String b = "";
  		String resutl ="";
  		if(request.getParameter("kq") != null){
  			resutl = request.getParameter("kq");
  		}
  		if(request.getParameter("so1") != null){
  			a = request.getParameter("so1");
  		}
  		if(request.getParameter("so2") != null){
  			b = request.getParameter("so2");
  		} */
  	%>
    <form action="test" method="post">
       a= <input name="txta" type="number"> <br>
       b= <input name="txtb" type="number"> <br>
       kq= <input name="txtkq" type="number" value="<%=%>"><br>
       <input name="butc" type="submit" value="+" > 
       <input name="butt" type="submit" value="-">
       <input name="butn" type="submit" value="*">
       <input name="butchia" type="submit" value="/">
    </form>
</body>
</html>
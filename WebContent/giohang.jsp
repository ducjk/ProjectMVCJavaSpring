<%@page import="bo.giohangbo"%>
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
		giohangbo gh;
		//chay lan dau
		if (session.getAttribute("gio") == null){
			gh = new giohangbo();
			session.setAttribute("gio", gh);
		}
		//b1: gan session vao 1 bien
		gh = (giohangbo) session.getAttribute("gio");
		//b2: thao tac tren bien
		String removeItem = request.getParameter("remove");
		if (removeItem != null){
			String maSach = request.getParameter("ms");
			gh.Xoa(maSach);
		}
		else {
			String maSach = request.getParameter("ms");
			String tenSach = request.getParameter("tensach");
			long soLuong = (long)1;
			long giaSach = Long.parseLong(request.getParameter("gia"));
			String anh = request.getParameter("anh");
			gh.Them(maSach, tenSach, giaSach, soLuong, anh);
		}
		//b3: luu gh vao session
		
		session.setAttribute("gio", gh);
		
		//Hien thi gio
		
		response.sendRedirect("htgio.jsp");
	%>
</body>
</html>
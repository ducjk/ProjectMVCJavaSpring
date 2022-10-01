<%@page import="bo.loaibo"%>
<%@page import="bo.sachbo"%>
<%@page import="bean.sachbean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.sachdao"%>
<%@page import="bean.loaibean"%>
<%@page import="dao.loaidao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>AJax</title>
	<meta charset="utf-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  	<link rel="stylesheet" type="text/css" href="./assets/css/main.css">
  	

</head>
<body>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
    		<div class="navbar-header">
      			<a class="navbar-brand" href="#">Trang Chủ</a>
    		</div>
		    <ul class="nav navbar-nav">
			      <li class="active"><a href="#">Giỏ Hàng</a></li>
			      <li><a href="#">Thanh Toán</a></li>
			      <li><a href="#">Lịch sử mua hàng</a></li>
			      <li><a href="#"><%=session.getAttribute("Sum")%></a></li>
		    </ul>
		    
		    <form class="navbar-form navbar-left">
				 <input type="text" class="form-control" placeholder="Tìm kiếm ở đây" name="search">
		 		<button type="submit" class="btn btn-primary">Submit</button>
			</form>
		    <ul class="nav navbar-nav navbar-right">
			      <li><a href="removesession.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
			      <li>
			      <% if (session.getAttribute("login") == null){ %>
			    	 <a href="dangnhap.jsp"><span class="glyphicon glyphicon-user"></span>Log In</a>
			      <%}else{ %>
			    	 <a href="#"><span class="glyphicon glyphicon-user">
			    	 	<%=session.getAttribute("login") %>
			    	 	</span>
			    	 </a>
			      <%} %>
			      
			      
			      
			      </a></li>
		    </ul>
  		</div>
	</nav>
	
	<div class="container">
		<div class="container-fluid container">
		    <ul class="list-group list-item">
				<%
				request.setCharacterEncoding("utf-8");
				response.setCharacterEncoding("uft-8");
				loaibo loai = new loaibo();
					for(loaibean l: loai.getloai()){%>
						<li class=""><a class="list-group-item" href="htsach.jsp?ml=<%=l.getMaLoai()%>">
						<%=l.getTenLoai()%></a></li>
					<%
					}
				%>
		    </ul>
		    
		    
		    <table width="600" style="padding: 0 15px">
		   		<%  sachbo sbo= new sachbo();
		   		    ArrayList<sachbean> dssach = sbo.getsach();
		   		    
		   		    if (request.getParameter("search")!=null){
		   		    	dssach = sbo.timKiemTheoTen(dssach, request.getParameter("search"));
		   		    	if (dssach.isEmpty()) {
		   		 %>   		
		   		 			<h4>Không có sách tên <%=request.getParameter("search")%></h4>
		   		 <%   	}
		   		    }
		   		    else if (request.getParameter("ml")!=null){
		   		    	dssach = sbo.timKiemTheoLoai(dssach, request.getParameter("ml"));
		   		    	
		   		    	if (dssach.isEmpty()) {
		   		 %>   		
		   		   		 			<h4>Không có sách loại <%=request.getParameter("ml")%></h4>
		   		 <%   	
		   		   		 }
		   		    }
		   		    
			   		    int n=dssach.size();
			   		    for(int i=0;i<n;i++){
			   		    	sachbean s = dssach.get(i);
			   		%>
			   		     <tr>
				   		      <td>
					   		  	 <img style="border-radius: 6px" src="<%=s.getAnh() %>"> <br>
					   		     <%=s.getTenSach() %> <br>
					   		     <%=s.getTacGia() %><br>
					   		     <%=s.getGia() %><br>
					   		     
					   		     <a href="giohang.jsp?ms=<%=s.getMaSach()%>&tensach=<%=s.getTenSach()%>&gia=<%=s.getGia()%>&anh=<%=s.getAnh()%>">
					   		     	<img src="mua.jpg"/>
					   		     </a>
					   		  </td>
				   		   
				   		   	  <% i++; 
				   		   	  if(i<n){
				   		      		s = dssach.get(i);%>
				   		     		<td>
							   		    <img style="border-radius: 6px" src="<%=s.getAnh() %>"> <br>
							   		    <%=s.getTenSach()%> <br>
							   	     	<%=s.getTacGia() %><br>
							   		    <%=s.getGia() %><br>
							   		    <a href="giohang.jsp?ms=<%=s.getMaSach()%>&tensach=<%=s.getTenSach()%>&gia=<%=s.getGia()%>&anh=<%=s.getAnh()%>">
					   		     			<img src="mua.jpg"/>
					   		     		</a>
						   		     </td>
					   		
				   		     <%} %>
				   		  </tr>
				   	<%} %>
				   	
		   		   
	   		 </table>
			
		</div>
		
	</div>
	

</body>
</html>
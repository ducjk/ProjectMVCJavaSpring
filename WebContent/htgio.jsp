<%@page import="bean.khachhangbean"%>
<%@page import="bean.giohangbean"%>
<%@page import="bo.giohangbo"%>
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
  	
  	<style type="text/css">
  		.htgio-img-title {
			width: 40px;
			height: 40px;
			object-fit: cover;
			border-radius: 50%;
		}
		
		.row-item {
			height: 50px;
		}
		
		.row-item:hover {
			background-color: rgba(0, 0, 0, 0.08);
			cursor: pointer;
		}
		
		.test {
			font-size: 24px;
			font-weight: 400;
			cursor: pointer;
			color: red;
		}
		.test:link {
			text-decoration: none;
		}
		
		.btn-action {
			display: flex;
			justify-content: center;
		}
		
		.btn-action-1 + .btn-action-1 {
			margin-left: 40px;
		}
		
		.btn-action-1 {
			font-size: 18px;
			color: #fff;
			border: 1px solid #111;
			border-radius: 6px;
			padding: 8px 12px;
			background-color: #337AB7;
			
		}
		
		.btn-action-1:hover {
			text-decoration: none;
			cursor: pointer;
		}
		
		.input-quantity {
			width: 42px;
			
		}
		
		.login-item {
			position: relative;
		}
		
		.login-item:hover .sub-login{
			display: block;
		}
		
		.sub-login {
			position: absolute;
			z-index: 10;
			background-color: #fff;
			width: 200px;
			top: 40px;
			left: -20px;
			box-shadow: 1px 4px 10px rgba(0, 0, 0, 0.09);
			border-radius: 6px;
			list-style: none;
			padding-left: 0;
			display: none;
		}
		.sub-login-item {
			cursor: pointer;
		}
		.sub-login-item:hover {
			background-color: rgba(0, 0, 0, 0.09);
		}
		
		.link-sub-login-item {
			color: black;
			display: block;
			padding: 12px 20px;
		}
		
		.link-sub-login-item:hover {
			text-decoration: none;
			color: #1d4bbf;
		}
		
		
  	</style>
</head>
<body>
	<% giohangbo gh = (giohangbo) session.getAttribute("gio"); %>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
    		<div class="navbar-header">
      			<a class="navbar-brand" href="htsach">Trang Chủ</a>
    		</div>
		    <ul class="nav navbar-nav">
			      <li class="active">
			      	<a href="htgio.jsp">Giỏ Hàng(
			      	<%=gh.countBook() %>
			      	)
			      	</a></li>
			      <li><a href="#">Thanh Toán</a></li>
			      <li><a href="#">Lịch sử mua hàng</a></li>
			      <li><a href="#"><%=session.getAttribute("Sum")%></a></li>
		    </ul>
		    
		    <form class="navbar-form navbar-left">
				 <input type="text" class="form-control" placeholder="Tìm kiếm ở đây" name="search">
		 		<button type="submit" class="btn btn-primary">Submit</button>
			</form>
		    <ul class="nav navbar-nav navbar-right">
		    			<%
			    	 		khachhangbean kh = (khachhangbean) session.getAttribute("khachhang");
			    	 	%>
			      <% if (kh == null){ %>
			      	<li><a href="dangky"><span class="glyphicon glyphicon-user"></span>Register</a></li>
			      <% }%>
			      <li class="login-item">
			      <% if (kh == null){ %>
			    	 <a href="ktdn"><span class="glyphicon glyphicon-user"></span>Log In</a>
			      <%}else{ %>
			    	 <a href="#"><span class="glyphicon glyphicon-user">
			    	 	<%=kh.getHoten() %>
			    	 	</span>
			    	 </a>
			    	 <ul class="sub-login">
					      <li class="sub-login-item"><a class="link-sub-login-item" href="#">Thông tin cá nhân</a></li>
					      <li class="sub-login-item"><a class="link-sub-login-item" href="removeLogin">Đăng xuất</a></li>
			     	 </ul>
			      <%} %>
			      
			      
			      </li>
		    </ul>
  		</div>
	</nav>
	
	<div class="container">
		<div class="container-fluid container">
		    <ul class="list-group list-item">
				<%
				request.setCharacterEncoding("utf-8");
				response.setCharacterEncoding("uft-8");
				
				ArrayList<loaibean> loai = (ArrayList<loaibean>)request.getAttribute("dsloai");
				/* loaibo loai = new loaibo(); */
					for(loaibean l: loai){%>
						<li class=""><a class="list-group-item" href="htsach?ml=<%=l.getMaLoai()%>">
						<%=l.getTenLoai()%></a></li>
					<%
					}
				%>
		    </ul>
		    
		    
		    <div>
		    	<table width="600" style="padding: 0 15px" >
		    	<tr>
		    		<td></td>
		    		<td>Tên Sách</td>
		    		<td>Số lượng</td> 	
		    		<td>Giá</td>
		    		<td>Thành tiền</td>
		    	</tr>
		   		<%	
		   			if (gh.ds.size() == 0){
						response.sendRedirect("htsach");
					}
		   			if (gh.ds.size() != 0)
		   				for (giohangbean item: gh.ds){ 	
		   			%>
		   				<tr class="row-item">
		   					<td>
			   					<input type="checkbox" name="delete" form="form-1" value="<%=item.getMaSach()%>"/>
			   				</td>
		   					<td>
		   						<img src="<%=item.getAnh()%>" class="htgio-img-title"/> 
			   				</td>
			   				<td>
			   					<%=item.getTenSach() %>
			   				</td>
			   				<td>
			   					<form method="post" action="giohang?ms=<%=item.getMaSach()%>&tensach=<%=item.getTenSach()%>&gia=<%=item.getGiaSach()%>&anh=<%=item.getAnh()%>&addbook=true&">
			   						<input type="number" name="quantity" min="1" value="<%=item.getSoLuong()%>" class="input-quantity"/>
			   						
			   						<input type="submit" name="submit" value="Cập nhật"/>
			   					</form>
			   				</td>
			   				<td>
			   					<%=item.getGiaSach() %>
			   				</td>
			   				<td>
			   					<%=item.getThanhtien() %>
			   				</td>
			   				<td>
			   					<a class="test" href="giohang?ms=<%=item.getMaSach() %>&remove=1">&times</a>
			   				</td>
			   				
			   				
		   				</tr>
		   			<%}%>
		   			<tr>
		   				<td style="font-size: 24px; font-weight: bold;" colspan="2">Tổng tiền: </td>
		   				<td style="font-size: 24px; font-weight: bold"><%=gh.TongTien() %></td>
		   				<td>
		   					<form id="form-1" method="post" action="giohang?suanhieu=true&">
		   						<input type="submit" value="Xóa đã chọn"/>
		   					</form>
		   				</td>
		   			</tr>
	   		 </table>
	   		 <div class="btn-action" style="margin-top: 20px;">
				<a class="btn-action-1" href="giohang?removeall=true">Trả lại toàn bộ</a>
				<a class="btn-action-1" href="htsach">Tiếp tục mua hàng</a>
				<a class="btn-action-1" href="thanhtoan">Thanh toán</a>
			</div>
		    </div>
		
		</div>
			
	</div>
	
	

</body>
</html>
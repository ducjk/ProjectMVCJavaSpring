<%@page import="bean.khachhangbean"%>
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
  	
	<style>
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
	<% giohangbo gh = (giohangbo) session.getAttribute("gio"); 
	khachhangbean kh = (khachhangbean) session.getAttribute("khachhang");
	%>
	
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
    		<div class="navbar-header">
      			<a class="navbar-brand" href="htsach">Trang Chủ</a>
    		</div>
		    <ul class="nav navbar-nav">
			      <li class="<% if (gh != null && gh.countBook() != 0) out.print("active"); %>"><a href="giohang">
			      <% if (gh != null){
			    	  if (gh.countBook() == 0)
				    		out.print("Giỏ Hàng");
				    	else{
				    		out.print("Giỏ Hàng (" + gh.countBook() + ")");
				    	} 
			      }
			      else{
			    	  out.print("Giỏ Hàng");
			      }
			      
			      %>
			      </a></li>
			      <li><a href="<%=kh == null ? "#" : "thanhtoan"%>">Thanh Toán</a></li>
			      
			      <li><a href="<%=kh == null ? "ktdn" : "lichsumuahang"%> ">Lịch sử mua hàng</a></li>
		    </ul>
		    
		    <form class="navbar-form navbar-left">
				 <input type="text" class="form-control" placeholder="Tìm kiếm ở đây" name="search">
		 		<button type="submit" class="btn btn-primary">Submit</button>
			</form>
		    <ul class="nav navbar-nav navbar-right">
		    			
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
				//loaibo loai = new loaibo();
				ArrayList<loaibean> loai = (ArrayList<loaibean>)request.getAttribute("dsloai");
					for(loaibean l: loai){%>
						<li class=""><a class="list-group-item" href="htsach?ml=<%=l.getMaLoai()%>">
						<%=l.getTenLoai()%></a></li>
					<%
					}
				%>
		    </ul>
		    
		    <div>
		    	<table width="600" style="padding: 0 15px">
		   		
		   		 <%   	
		   		   		 //}
		   		    //}
		   				//ArrayList<sachbean> dssach = (ArrayList<sachbean>)request.getAttribute("dssach");
		   		    	ArrayList<sachbean> dssach = (ArrayList<sachbean>) session.getAttribute("dssach");
		   				int pageNumber = 10;
			   		    int n = dssach.size();
			   		    for(int i=0;i<pageNumber;i++){
			   		    	sachbean s = dssach.get(i);
			   		%>
			   		     <tr style="height: 380px;">
				   		      <td>
					   		  	 <img style="border-radius: 6px; width: 240px; height: 264px; object-fit: cover;" src="<%=s.getAnh() %>"> <br>
					   		     <%=s.getTenSach() %> <br>
					   		     <%=s.getTacGia() %><br>
					   		     <%=s.getGia() %><br>
					   		     
					   		     <a href="giohang?addbook=true&ms=<%=s.getMaSach()%>&tensach=<%=s.getTenSach()%>&gia=<%=s.getGia()%>&anh=<%=s.getAnh()%>">
					   		     	<img src="mua.jpg"/>
					   		     </a>
					   		  </td>
				   		   
				   		   	  <% i++; 
				   		   	  if(i<n){
				   		      		s = dssach.get(i);%>
				   		     		<td>
							   		    <img style="border-radius: 6px; width: 240px; height: 264px; object-fit: cover;" src="<%=s.getAnh() %>"> <br>
							   		    <%=s.getTenSach()%> <br>
							   	     	<%=s.getTacGia() %><br>
							   		    <%=s.getGia() %><br>
							   		    <a href="giohang?addbook=true&ms=<%=s.getMaSach()%>&tensach=<%=s.getTenSach()%>&gia=<%=s.getGia()%>&anh=<%=s.getAnh()%>">
					   		     			<img src="mua.jpg"/>
					   		     		</a>
						   		     </td>
					   		
				   		     <%} %>
				   		  </tr>
				   	<%} %>
				   	
				   	
		   		   
	   		 </table>
			<% 			
						int pages = 1;
						if (n > 0){
							pages = (int) n/pageNumber;
					   		if (n % pageNumber != 0)
					   			pages++;
						}
				   	
				   	%>	
				   		<form method="post" action="pagination">
				   			<%for (int trang=1; trang <= pages; trang++){ %>
				   				<input name="page" type="submit" value="<%=trang %>"/>	
				   			<%} %>
				   		</form>
		    </div>
		    
		</div>
		
	</div>
	
	
</body>
</html>
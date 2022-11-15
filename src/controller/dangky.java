package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.khachhangbean;
import bo.khachhangbo;

/**
 * Servlet implementation class dangky
 */
@WebServlet("/dangky")
public class dangky extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dangky() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		
		String hoten = request.getParameter("fullname");
		String email = request.getParameter("email");
		String taikhoan = request.getParameter("username");
		String matkhau = request.getParameter("password");
		if (hoten != null && email != null && taikhoan != null && matkhau != null) {
			khachhangbo khbo = new khachhangbo();
			int kt = khbo.themkhachhang(hoten, email, taikhoan, matkhau);
			
			if (kt == 0) {
				request.setAttribute("Themthatbai", "true");
				RequestDispatcher rd = request.getRequestDispatcher("dangky.jsp");
				rd.forward(request, response);
			}else {
				khachhangbean khachhang = khbo.kiemtradangnhap(taikhoan, matkhau);
				
				if (session.getAttribute("khachhang") == null) {
					session.setAttribute("khachhang", null);
				}
				
				session.setAttribute("khachhang", khachhang);
//				Chuyen tiep ve trang htsach
				RequestDispatcher rd = request.getRequestDispatcher("htsach");
				rd.forward(request, response);
			}
		}else {
			RequestDispatcher rd = request.getRequestDispatcher("dangky.jsp");
			rd.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.khachhangbean;
import bean.lichsubean;
import bean.loaibean;
import bo.lichsubo;
import bo.loaibo;

/**
 * Servlet implementation class lichsumuahang
 */
@WebServlet("/lichsumuahang")
public class lichsumuahang extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public lichsumuahang() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		khachhangbean kh = (khachhangbean) session.getAttribute("khachhang");
		loaibo lbo = new loaibo();
		ArrayList<loaibean> dsloai = lbo.getloai();
		request.setAttribute("dsloai", dsloai);
		if (kh == null) {
			request.setAttribute("khachhangnull", true);
			RequestDispatcher rd = request.getRequestDispatcher("htsach");
			rd.forward(request, response);
		}else {
			lichsubo lsbo = new lichsubo();
			ArrayList<lichsubean> listls = lsbo.getList(kh.getMaKhachHang());
			if (listls != null) {
				request.setAttribute("listlichsu", listls);
			}
			RequestDispatcher rd = request.getRequestDispatcher("lichsumuahang.jsp");
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

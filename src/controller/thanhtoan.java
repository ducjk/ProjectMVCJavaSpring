package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.giohangbean;
import bean.khachhangbean;
import bo.giohangbo;
import bo.hoadonbo;
import dao.hoadondao;

/**
 * Servlet implementation class thanhtoan
 */
@WebServlet("/thanhtoan")
public class thanhtoan extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public thanhtoan() {
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
		String diachi = request.getParameter("address");
		String sdt = request.getParameter("phone");
		
		if (hoten != null && email != null && diachi != null && sdt != null) {
			try {
				khachhangbean kh = (khachhangbean) session.getAttribute("khachhang");
				if (kh != null) {
					hoadonbo hdbo = new hoadonbo();
					SimpleDateFormat dd = new SimpleDateFormat("yyyy-MM-dd");
					Date d = new Date();
					Date ngay = dd.parse(dd.format(d));
					int themhoadon = hdbo.themhoadon(kh.getMaKhachHang(), ngay);
					int mahoadon = hdbo.maxmahd();
					giohangbo gh = (giohangbo) session.getAttribute("gio");
					khachhangbean khachhang = hdbo.getkhachhang(kh.getEmail());
					for (giohangbean item: gh.ds) {
						int themchitiethoadon = hdbo.themchitiethoadon(item.getMaSach(), (int)item.getSoLuong(), mahoadon);
					}
					
					session.removeAttribute("gio");
					
					RequestDispatcher rd = request.getRequestDispatcher("htsach");
					rd.forward(request, response);
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else {
			RequestDispatcher rd = request.getRequestDispatcher("thanhtoan.jsp");
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

package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bo.giohangbo;

/**
 * Servlet implementation class giohang
 */
@WebServlet("/giohang")
public class giohang extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public giohang() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		giohangbo gh;
		HttpSession session = request.getSession();
		
		if (session.getAttribute("gio") == null){
			gh = new giohangbo();
			session.setAttribute("gio", gh);
		}
		
		gh = (giohangbo) session.getAttribute("gio");
		
		String removeItem = request.getParameter("remove");
		if (request.getParameter("remove") != null){
			String maSach = request.getParameter("ms");
			gh.Xoa(maSach);
			
		}
		else if (request.getParameter("addbook") != null){
			String maSach = request.getParameter("ms");
			long soLuong = (long)1;
			if (request.getParameter("quantity") != null)
				soLuong = Long.parseLong(request.getParameter("quantity"));
			
			String tenSach = request.getParameter("tensach");
			long giaSach = Long.parseLong(request.getParameter("gia"));
			String anh = request.getParameter("anh");
			gh.Them(maSach, tenSach, giaSach, soLuong, anh);
		}
		
		else if (request.getParameter("removeall") != null){
			gh.XoaAll();
		}
		else if (request.getParameter("suanhieu") != null && request.getParameter("delete") != null) {
			
			gh.XoaNhieu(request.getParameterValues("delete"));
		}
		//b3: luu gh vao session
		
		session.setAttribute("gio", gh);
		
//		RequestDispatcher rd = request.getRequestDispatcher("htgio");
//		rd.forward(request, response);
		
		response.sendRedirect("htgio");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

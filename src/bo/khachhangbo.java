package bo;

import java.util.ArrayList;

import bean.khachhangbean;
import dao.khachhangdao;


public class khachhangbo {
	khachhangdao khdao = new khachhangdao();
	ArrayList<khachhangbean> ds;
	public ArrayList<khachhangbean> getdskhachhang(){
		ds = khdao.getdskhachhang();
		return ds;
	}
	
	public khachhangbean kiemtradangnhap(String un, String pass) {
		ds = khdao.getdskhachhang();
		for(khachhangbean kh:ds) {
			if (un.equals(kh.getTendangnhap()) && pass.equals(kh.getMatkhau()))
				return kh;
		}
		return null;
	}
	
	public int themkhachhang(String hoten, String email, String taikhoan, String pass) {
		try {
			ds = khdao.getdskhachhang();
			for(khachhangbean kh:ds) {
				if (email.equals(kh.getEmail()) && taikhoan.equals(kh.getTendangnhap()))
					return 0;
			}
			
			int kt = khdao.ThemKhachHang(hoten, email, taikhoan, pass);
			return kt;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}
	}
}

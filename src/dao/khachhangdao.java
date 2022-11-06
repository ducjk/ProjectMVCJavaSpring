package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.khachhangbean;
import bean.loaibean;

public class khachhangdao {
	public ArrayList<khachhangbean> getdskhachhang(){
		   try {
			   ArrayList<khachhangbean> dskhachhang= new ArrayList<khachhangbean>();
//			   b1: ket noi vao csdl
			   CoSodao cs = new CoSodao();
			   cs.KetNoi();
//			   b2: Lay du lieu ve
			   String sql = "select * from KhachHang";
			   PreparedStatement cmd = cs.cn.prepareStatement(sql);
			   ResultSet rs = cmd.executeQuery();
			   while(rs.next()) {
				   String hoten = rs.getString("hoten");
				   String diachi = rs.getString("diachi");
				   String email = rs.getString("email");
				   String TenDangNhap = rs.getString("tendn");
				   String MatKhau = rs.getString("pass");
				   dskhachhang.add(new khachhangbean(hoten, diachi, email, TenDangNhap, MatKhau));
			   }
			   
//			   b3: close rs, cn
			   rs.close();
			   cs.cn.close();
			   
			   return dskhachhang;
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				return null;
			}
	   }
	public int ThemKhachHang(String hoten, String email, String tendangnhap, String matkhau) throws Exception{
		CoSodao cs = new CoSodao();
		cs.KetNoi();
		
        String sql = "insert into KhachHang (hoten, email, tendn, pass) values (?,?,?,?)";
        PreparedStatement cmd = cs.cn.prepareStatement(sql);    
        
        cmd.setString(1, hoten);
        cmd.setString(2, email);
        cmd.setString(3, tendangnhap);
        cmd.setString(4, matkhau);
        
        return cmd.executeUpdate();
    }
}

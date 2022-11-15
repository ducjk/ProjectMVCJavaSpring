package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Date;

import bean.khachhangbean;

public class hoadondao {
	public int maxhoadon(){
		 try {
	        	CoSodao cs = new CoSodao();
	    		cs.KetNoi();
	           String sql = "select max(mahoadon) as maxhd from hoadon";
	           	PreparedStatement cmd = cs.cn.prepareStatement(sql);
		    	
	            ResultSet rs = cmd.executeQuery();
	            int kq = 0;
	            if(rs.next()) {
	            	kq = rs.getInt("maxhd");
	            }
	            
	            rs.close();
				   
	            return kq;
		} catch (Exception e) {
	            // TODO: handle exception
	            e.printStackTrace();
	            return 0;
		}
	}
	
	public int ThemHoaDon(int makhachhang, Date ngaylap) throws Exception{
		CoSodao cs = new CoSodao();
		cs.KetNoi();
		
        String sql = "insert into hoadon (makh, NgayMua, damua) values (?,?,?)";
        PreparedStatement cmd = cs.cn.prepareStatement(sql);    
        
        cmd.setInt(1, makhachhang);
        cmd.setDate(2, new java.sql.Date(ngaylap.getTime()));
        cmd.setBoolean(3, false);
        
        return cmd.executeUpdate();
    }
	
	public int ThemChiTietHoaDon(String maSach, int soluong, int mahoadon) throws Exception{
		CoSodao cs = new CoSodao();
		cs.KetNoi();
		
        String sql = "insert into ChiTietHoaDon (MaSach, SoLuongMua, MaHoaDon) values (?,?,?)";
        PreparedStatement cmd = cs.cn.prepareStatement(sql);    
        
        cmd.setString(1, maSach);
        cmd.setInt(2, soluong);
        cmd.setInt(3, mahoadon);
        
        return cmd.executeUpdate();
    }
	
	public khachhangbean getkhachhang(String chechemail){
        try {
        	CoSodao cs = new CoSodao();
    		cs.KetNoi();
//			   b2: Lay du lieu ve
           String sql = "select * from KhachHang where email = ?";
           	PreparedStatement cmd = cs.cn.prepareStatement(sql);
	    	cmd.setString(1, chechemail);
            
            ResultSet rs = cmd.executeQuery();
            khachhangbean kh = new khachhangbean();
            if(rs.next()) {
            	int maKhachHang = rs.getInt("makh");
				   String hoten = rs.getString("hoten");
				   String diachi = rs.getString("diachi");
				   String email = rs.getString("email");
				   String sdt = rs.getString("sodt");
				   String TenDangNhap = rs.getString("tendn");
				   String MatKhau = rs.getString("pass");
				   kh = new khachhangbean(maKhachHang, hoten, diachi, email, sdt, TenDangNhap, MatKhau);
            }
            
            rs.close();
			   
            return kh;
	} catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
            return null;
	}
    }
}

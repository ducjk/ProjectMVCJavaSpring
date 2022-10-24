package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.loaibean;
import bean.sachbean;

public class sachdao {
	
	public ArrayList<sachbean> getsach() {
		try {
			ArrayList<sachbean> dssach = new ArrayList<sachbean>();
//			   b1: ket noi vao csdl
			   CoSodao cs = new CoSodao();
			   cs.KetNoi();
//			   b2: Lay du lieu ve
			   String sql = "select * from sach";
			   PreparedStatement cmd = cs.cn.prepareStatement(sql);
			   ResultSet rs = cmd.executeQuery();
			   while(rs.next()) {
				   String maSach = rs.getString("masach");
				   String tenSach = rs.getString("tensach");
				   String tacGia = rs.getString("tacgia");
				   long soLuong = rs.getLong("soluong");
				   long gia = rs.getLong("gia");
				   String anh = rs.getString("anh");
				   String maLoai = rs.getString("maloai");
				   dssach.add(new sachbean(maSach, tenSach, tacGia, soLuong, gia, anh, maLoai));

			   }
			   
//			   b3: close rs, cn
			   rs.close();
			   cs.cn.close();
			   
//			   
//			   dsloai.add(new loaibean("tin", "Công nghệ thông tin"));
//			   dsloai.add(new loaibean("ly", "Vật lý"));
//			   dsloai.add(new loaibean("toan", "Toán ứng dụng"));
//			   dsloai.add(new loaibean("van", "Văn học Việt Nam"));
			   return dssach;
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				return null;
			}
		
//		ArrayList<sachbean> dssach = new ArrayList<sachbean>();
//		dssach.add(new sachbean("s1", "Cấu trúc dữ liệu", "Nguyễn Hoảng Hà", 100, 100000, "b1.jpg", "tin"));
//		dssach.add(new sachbean("s2", "Cấu trúc dữ liệu", "Nguyễn Hoảng Hà", 100, 100000, "b2.jpg", "tin"));
//		dssach.add(new sachbean("s3", "Cơ sở toán", "Nguyễn Hoảng Hà", 100, 100000, "b3.jpg", "toan"));
//		dssach.add(new sachbean("s4", "Giải tích", "Nguyễn Hoảng Hà", 100, 100000, "b4.jpg", "toan"));
//		dssach.add(new sachbean("s5", "Truyền Kiều", "Nguyễn Hoảng Hà", 100, 100000, "b5.jpg", "van"));
//		
//		return dssach;
	}
	
	
}
package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.loaibean;

public class loaidao {
	
	   public ArrayList<loaibean> getloai(){
		   try {
			   ArrayList<loaibean> dsloai= new ArrayList<loaibean>();
//			   b1: ket noi vao csdl
			   CoSodao cs = new CoSodao();
			   cs.KetNoi();
//			   b2: Lay du lieu ve
			   String sql = "select * from loai";
			   PreparedStatement cmd = cs.cn.prepareStatement(sql);
			   ResultSet rs = cmd.executeQuery();
			   while(rs.next()) {
				   String maloai = rs.getString("maloai");
				   String tenloai = rs.getString("tenloai");
				   dsloai.add(new loaibean(maloai, tenloai));
			   }
			   
//			   b3: close rs, cn
			   rs.close();
			   cs.cn.close();
			   
//			   
//			   dsloai.add(new loaibean("tin", "Công nghệ thông tin"));
//			   dsloai.add(new loaibean("ly", "Vật lý"));
//			   dsloai.add(new loaibean("toan", "Toán ứng dụng"));
//			   dsloai.add(new loaibean("van", "Văn học Việt Nam"));
			   return dsloai;
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
				return null;
			}
	   }
}
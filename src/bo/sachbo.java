package bo;

import java.util.ArrayList;

import bean.sachbean;
import dao.sachdao;

public class sachbo {
	sachdao lsach = new sachdao();
	ArrayList<sachbean> ds;
	
	public ArrayList<sachbean> getsach(){
		ds = lsach.getsach();
		
		return ds;
	}
	
	public ArrayList<sachbean> timKiemTheoLoai(ArrayList<sachbean> ds ,String maLoai) {
		ArrayList<sachbean> dsSachCungMa = new ArrayList<sachbean>();
		for (sachbean item: ds) {
			if (item.getMaLoai().equals(maLoai)) {
				dsSachCungMa.add(item);
			}
		}
		
		return dsSachCungMa;
	}
	
	public ArrayList<sachbean> timKiemTheoTen(ArrayList<sachbean> ds ,String tenSach) {
		ArrayList<sachbean> dsSachCungTen = new ArrayList<sachbean>();
		for (sachbean item: ds) {
			if (item.getTenSach().toLowerCase().trim().contains(tenSach.toLowerCase().trim())
			 || item.getMaLoai().toLowerCase().trim().contains(tenSach.toLowerCase().trim())
			 || item.getTacGia().toLowerCase().trim().contains(tenSach.toLowerCase().trim())
			) {
				dsSachCungTen.add(item);
			}
		}
		
		return dsSachCungTen;
	}
}

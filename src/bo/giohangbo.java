package bo;

import java.util.ArrayList;

import bean.giohangbean;

public class giohangbo {
	public ArrayList<giohangbean> ds = new ArrayList<giohangbean>();
	public void Them(String maSach, String tenSach, long giaSach, long soLuong, String anh) {
		for (giohangbean g:ds) {
			if (g.getMaSach().equals(maSach)) {
				g.setSoLuong(soLuong);
				return;
			}
		}
		
		ds.add(new giohangbean(maSach, tenSach, giaSach, soLuong, anh));
		
	}
	
	public void Xoa(String maSach) {
		for (int i=0; i<ds.size(); i++) {
			if (ds.get(i).getMaSach().equals(maSach)) {
				ds.remove(i);
				return;
			}
		}
	}
	
	public void XoaAll() {
		ds.removeAll(ds);
	}
	
	public long TongTien() {
		long Sum = 0;
		for (giohangbean g: ds) {
			Sum += g.getThanhtien();
		}
		return Sum;
	}
}

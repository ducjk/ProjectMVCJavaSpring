package bean;

public class giohangbean {
	String maSach, tenSach;
	long giaSach, soLuong, thanhtien;
	String anh;
	public giohangbean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public giohangbean(String maSach, String tenSach, long giaSach, long soLuong, String anh) {
		super();
		this.maSach = maSach;
		this.tenSach = tenSach;
		this.giaSach = giaSach;
		this.soLuong = soLuong;
		this.thanhtien = soLuong*giaSach;
		this.anh = anh;
	}
	public String getMaSach() {
		return maSach;
	}
	public void setMaSach(String maSach) {
		this.maSach = maSach;
	}
	public String getTenSach() {
		return tenSach;
	}
	public void setTenSach(String tenSach) {
		this.tenSach = tenSach;
	}
	public long getGiaSach() {
		return giaSach;
	}
	public void setGiaSach(long giaSach) {
		this.giaSach = giaSach;
	}
	public long getSoLuong() {
		return soLuong;
	}
	public void setSoLuong(long soLuong) {
		this.soLuong = soLuong;
	}
	public long getThanhtien() {
		return soLuong*giaSach;
	}
	
	public void setThanhtien(long thanhtien) {
		this.thanhtien = thanhtien;
	}
	public String getAnh() {
		return anh;
	}
	public void setAnh(String anh) {
		this.anh = anh;
	}
	
	
}

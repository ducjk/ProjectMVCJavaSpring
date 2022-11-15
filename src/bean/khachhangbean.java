package bean;

public class khachhangbean {
	int makhachhang;
	String hoten;
	String diachi;
	String email;
	String sdt;
	String tendangnhap;
	String matkhau;
	
	public khachhangbean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public khachhangbean(int maKhachHang, String hoten, String diachi, String email, String sdt,String tendangnhap, String matkhau) {
		super();
		this.makhachhang = maKhachHang;
		this.hoten = hoten;
		this.diachi = diachi;
		this.email = email;
		this.sdt = sdt;
		this.tendangnhap = tendangnhap;
		this.matkhau = matkhau;
	}
	public khachhangbean(String hoten, String diachi, String email, String sdt, String tendangnhap, String matkhau) {
		super();
		this.hoten = hoten;
		this.diachi = diachi;
		this.email = email;
		this.sdt = sdt;
		this.tendangnhap = tendangnhap;
		this.matkhau = matkhau;
	}
	public int getMaKhachHang() {
		return makhachhang;
	}

	public String getHoten() {
		return hoten;
	}

	public void setHoten(String hoten) {
		this.hoten = hoten;
	}

	public String getDiachi() {
		return diachi;
	}

	public void setDiachi(String diachi) {
		this.diachi = diachi;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getSdt() {
		return sdt;
	}
	
	public void setSdt(String sdt) {
		this.sdt = sdt;
	}

	public String getTendangnhap() {
		return tendangnhap;
	}

	public void setTendangnhap(String tendangnhap) {
		this.tendangnhap = tendangnhap;
	}

	public String getMatkhau() {
		return matkhau;
	}

	public void setMatkhau(String matkhau) {
		this.matkhau = matkhau;
	}
	
	
	
	
}

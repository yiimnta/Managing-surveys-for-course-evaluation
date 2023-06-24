package model.form;

import org.apache.struts.action.*;


public class LopForm extends ActionForm {
	private static final long serialVersionUID = 1L;
	private String maLop;
	private String tenLop;
	private String maKhoa;
	
	public String getMaLop() {
		return maLop;
	}
	public void setMaLop(String maLop) {
		this.maLop = maLop;
	}
	public String getTenLop() {
		return tenLop;
	}
	public void setTenLop(String tenLop) {
		this.tenLop = tenLop;
	}
    public String getMaKhoa() {
        return maKhoa;
    }
    public void setMaKhoa(String maKhoa) {
        this.maKhoa = maKhoa;
    }
	
}

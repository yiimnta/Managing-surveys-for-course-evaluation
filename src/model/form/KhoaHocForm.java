package model.form;

import org.apache.struts.action.*;


public class KhoaHocForm extends ActionForm {
	private static final long serialVersionUID = 1L;
	private String maKhoa;
	private String tenKhoa;
	
	public String getMaKhoa() {
		return maKhoa;
	}
	public void setMaKhoa(String maKhoa) {
		this.maKhoa = maKhoa;
	}
	public String getTenKhoa() {
		return tenKhoa;
	}
	public void setTenKhoa(String tenKhoa) {
		this.tenKhoa = tenKhoa;
	}
	
}

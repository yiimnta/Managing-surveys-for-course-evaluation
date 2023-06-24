package model.form;

import java.util.*;

import model.bean.*;

import org.apache.struts.action.*;

@SuppressWarnings("serial")
public class DanhSachGiangVienForm extends ActionForm {
	private ArrayList<GiangVien> dsGiangVien;

	public ArrayList<GiangVien> getDsGiangVien() {
		return dsGiangVien;
	}

	public void setDsGiangVien(ArrayList<GiangVien> dsGiangVien) {
		this.dsGiangVien = dsGiangVien;
	}
	
}

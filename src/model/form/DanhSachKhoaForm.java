package model.form;

import java.util.*;

import model.bean.*;

import org.apache.struts.action.*;

@SuppressWarnings("serial")
public class DanhSachKhoaForm extends ActionForm {
	private ArrayList<Khoa> dsKhoa;

	public ArrayList<Khoa> getDsKhoa() {
		return dsKhoa;
	}

	public void setDsKhoa(ArrayList<Khoa> dsKhoa) {
		this.dsKhoa = dsKhoa;
	}
	
}

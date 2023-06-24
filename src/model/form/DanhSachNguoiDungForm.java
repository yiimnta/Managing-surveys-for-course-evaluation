package model.form;

import java.util.*;

import model.bean.*;

import org.apache.struts.action.*;

@SuppressWarnings("serial")
public class DanhSachNguoiDungForm extends ActionForm {
	private ArrayList<NguoiDung> dsNguoiDung;

	public ArrayList<NguoiDung> getDsNguoiDung() {
		return dsNguoiDung;
	}

	public void setDsNguoiDung(ArrayList<NguoiDung> dsNguoiDung) {
		this.dsNguoiDung = dsNguoiDung;
	}
	
}

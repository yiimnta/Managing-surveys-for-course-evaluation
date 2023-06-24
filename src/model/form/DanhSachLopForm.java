package model.form;

import java.util.*;

import model.bean.*;

import org.apache.struts.action.*;

@SuppressWarnings("serial")
public class DanhSachLopForm extends ActionForm {
	private ArrayList<Lop> dsLop;
	private ArrayList<Khoa> dsKhoa;
	private String maKhoaThem;
	private String maKhoaSua;

	public ArrayList<Lop> getDsLop() {
		return dsLop;
	}

	public void setDsLop(ArrayList<Lop> dsLop) {
		this.dsLop = dsLop;
	}

    public ArrayList<Khoa> getDsKhoa() {
        return dsKhoa;
    }

    public void setDsKhoa(ArrayList<Khoa> dsKhoa) {
        this.dsKhoa = dsKhoa;
    }

    public String getMaKhoaThem() {
        return maKhoaThem;
    }

    public void setMaKhoaThem(String maKhoaThem) {
        this.maKhoaThem = maKhoaThem;
    }

    public String getMaKhoaSua() {
        return maKhoaSua;
    }

    public void setMaKhoaSua(String maKhoaSua) {
        this.maKhoaSua = maKhoaSua;
    }
	
}

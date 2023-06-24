package model.form;

import java.util.*;

import model.bean.*;

import org.apache.struts.action.*;

@SuppressWarnings("serial")
public class DanhSachPhieuDanhGiaForm extends ActionForm {
	private ArrayList<PhieuDanhGia> dsPhieuDanhGia;
	private String maLoai;
	
    public ArrayList<PhieuDanhGia> getDsPhieuDanhGia() {
        return dsPhieuDanhGia;
    }

    public void setDsPhieuDanhGia(ArrayList<PhieuDanhGia> dsPhieuDanhGia) {
        this.dsPhieuDanhGia = dsPhieuDanhGia;
    }

    public String getMaLoai() {
        return maLoai;
    }

    public void setMaLoai(String maLoai) {
        this.maLoai = maLoai;
    }
	
}

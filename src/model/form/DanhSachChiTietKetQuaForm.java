package model.form;

import java.util.*;

import model.bean.*;

import org.apache.struts.action.*;

@SuppressWarnings("serial")
public class DanhSachChiTietKetQuaForm extends ActionForm {
    private ArrayList<NoiDung> dsNoiDung;
    private PhieuDanhGia phieuDanhGia;
    private ArrayList<Route> dsThongKe = new ArrayList<Route>();
	private String maKQ;

    public String getMaKQ() {
        return maKQ;
    }

    public void setMaKQ(String maKQ) {
        this.maKQ = maKQ;
    }

    public ArrayList<NoiDung> getDsNoiDung() {
        return dsNoiDung;
    }

    public void setDsNoiDung(ArrayList<NoiDung> dsNoiDung) {
        this.dsNoiDung = dsNoiDung;
    }

    public PhieuDanhGia getPhieuDanhGia() {
        return phieuDanhGia;
    }

    public void setPhieuDanhGia(PhieuDanhGia phieuDanhGia) {
        this.phieuDanhGia = phieuDanhGia;
    }

    public ArrayList<Route> getDsThongKe() {
        return dsThongKe;
    }

    public void setDsThongKe(ArrayList<Route> dsThongKe) {
        this.dsThongKe = dsThongKe;
    }

}

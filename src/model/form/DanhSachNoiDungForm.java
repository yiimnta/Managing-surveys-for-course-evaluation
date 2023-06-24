package model.form;

import java.util.*;

import model.bean.*;

import org.apache.struts.action.*;

@SuppressWarnings("serial")
public class DanhSachNoiDungForm extends ActionForm {
    private String maDG;
    private ArrayList<NoiDung> dsNoiDung;
    private PhieuDanhGia phieuDanhGia;
    private String listVitri;
    private String loaiSX;
    private String parrentId;
    
    public String getMaDG() {
        return maDG;
    }

    public void setMaDG(String maDG) {
        this.maDG = maDG;
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

    public String getLoaiSX() {
        return loaiSX;
    }

    public void setLoaiSX(String loaiSX) {
        this.loaiSX = loaiSX;
    }

    public String getListVitri() {
        return listVitri;
    }

    public void setListVitri(String listVitri) {
        this.listVitri = listVitri;
    }

    public String getParrentId() {
        return parrentId;
    }

    public void setParrentId(String parrentId) {
        this.parrentId = parrentId;
    }
    
}

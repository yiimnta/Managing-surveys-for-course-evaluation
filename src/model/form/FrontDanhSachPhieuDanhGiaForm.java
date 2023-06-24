package model.form;

import java.util.*;

import model.bean.*;

import org.apache.struts.action.*;

@SuppressWarnings("serial")
public class FrontDanhSachPhieuDanhGiaForm extends ActionForm {
	private ArrayList<PhieuDanhGia> dsPhieuDanhGia;
	private PhieuDanhGia phieuDanhGia;
	private String maDG;
	private Integer curPage;
	private Integer maxPage;
	private ArrayList<Integer> listPage = new ArrayList<Integer>();
	private String loaiP = "";
	private String choPhepDanhGia;
	private String find ="";

    public ArrayList<PhieuDanhGia> getDsPhieuDanhGia() {
        return dsPhieuDanhGia;
    }

    public void setDsPhieuDanhGia(ArrayList<PhieuDanhGia> dsPhieuDanhGia) {
        this.dsPhieuDanhGia = dsPhieuDanhGia;
    }

    public Integer getCurPage() {
        return curPage;
    }

    public void setCurPage(Integer curPage) {
        this.curPage = curPage;
    }

    public Integer getMaxPage() {
        return maxPage;
    }

    public void setMaxPage(Integer maxPage) {
        this.maxPage = maxPage;
    }

    public ArrayList<Integer> getListPage() {
        return listPage;
    }

    public void setListPage(ArrayList<Integer> listPage) {
        this.listPage = listPage;
    }

    public String getLoaiP() {
        return loaiP;
    }

    public void setLoaiP(String loaiP) {
        this.loaiP = loaiP;
    }

    public PhieuDanhGia getPhieuDanhGia() {
        return phieuDanhGia;
    }

    public void setPhieuDanhGia(PhieuDanhGia phieuDanhGia) {
        this.phieuDanhGia = phieuDanhGia;
    }

    public String getMaDG() {
        return maDG;
    }

    public void setMaDG(String maDG) {
        this.maDG = maDG;
    }

    public String getChoPhepDanhGia() {
        return choPhepDanhGia;
    }

    public void setChoPhepDanhGia(String choPhepDanhGia) {
        this.choPhepDanhGia = choPhepDanhGia;
    }

    public String getFind() {
        return find;
    }

    public void setFind(String find) {
        this.find = find;
    }
    
}

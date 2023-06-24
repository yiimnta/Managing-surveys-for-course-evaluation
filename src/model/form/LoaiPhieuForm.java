package model.form;

import org.apache.struts.action.*;

public class LoaiPhieuForm extends ActionForm {
    private static final long serialVersionUID = 1L;
    private String loaiP;
    private String ten;
    private String trangThai;

    public String getLoaiP() {
        return loaiP;
    }

    public void setLoaiP(String loaiP) {
        this.loaiP = loaiP;
    }

    public String getTen() {
        return ten;
    }

    public void setTen(String ten) {
        this.ten = ten;
    }

    public String getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(String trangThai) {
        this.trangThai = trangThai;
    }

}

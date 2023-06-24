package model.form;

import org.apache.struts.action.*;

public class MonHocForm extends ActionForm {
    private static final long serialVersionUID = 1L;
    private String maMon;
    private String tenMon;
    private String soTC;
    private String loaiMH;
    private String trangThai;
    private String submit = "";

    public String getMaMon() {
        return maMon;
    }

    public void setMaMon(String maKhoa) {
        this.maMon = maKhoa;
    }

    public String getTenMon() {
        return tenMon;
    }

    public void setTenMon(String tenMon) {
        this.tenMon = tenMon;
    }

    public String getSoTC() {
        return soTC;
    }

    public void setSoTC(String soTC) {
        this.soTC = soTC;
    }

    public String getLoaiMH() {
        return loaiMH;
    }

    public void setLoaiMH(String loaiMH) {
        this.loaiMH = loaiMH;
    }

    public String getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(String trangThai) {
        this.trangThai = trangThai;
    }

    public String getSubmit() {
        return submit;
    }

    public void setSubmit(String submit) {
        this.submit = submit;
    }

}

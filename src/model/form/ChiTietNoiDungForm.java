package model.form;


import org.apache.struts.action.*;

@SuppressWarnings("serial")
public class ChiTietNoiDungForm extends ActionForm {
    private String maCT;
    private String maNDu;
    private String moTa;
    private String loaiCT;
    private String viTri;
    private String submit = "";

    public String getMaCT() {
        return maCT;
    }

    public void setMaCT(String maCT) {
        this.maCT = maCT;
    }

    public String getMaNDu() {
        return maNDu;
    }

    public void setMaNDu(String maNDu) {
        this.maNDu = maNDu;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    public String getLoaiCT() {
        return loaiCT;
    }

    public void setLoaiCT(String loaiCT) {
        this.loaiCT = loaiCT;
    }

    public String getViTri() {
        return viTri;
    }

    public void setViTri(String viTri) {
        this.viTri = viTri;
    }

    public String getSubmit() {
        return submit;
    }

    public void setSubmit(String submit) {
        this.submit = submit;
    }

}

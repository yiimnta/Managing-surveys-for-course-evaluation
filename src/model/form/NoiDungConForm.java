package model.form;

import org.apache.struts.action.*;

@SuppressWarnings("serial")
public class NoiDungConForm extends ActionForm {
    private String maNDC;
    private String maCT;
    private String tieuDe;
    private String viTri;
    private String submit = "";

    public String getMaNDC() {
        return maNDC;
    }

    public void setMaNDC(String maNDC) {
        this.maNDC = maNDC;
    }

    public String getMaCT() {
        return maCT;
    }

    public void setMaCT(String maCT) {
        this.maCT = maCT;
    }

    public String getTieuDe() {
        return tieuDe;
    }

    public void setTieuDe(String tieuDe) {
        this.tieuDe = tieuDe;
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

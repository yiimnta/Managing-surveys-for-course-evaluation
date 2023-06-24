package model.form;

import org.apache.struts.action.*;

@SuppressWarnings("serial")
public class NoiDungForm extends ActionForm {
    private String maNDu;
    private String maDG;
    private String tieuDe;
    private String viTri;
    private String submit = "";

    public String getMaNDu() {
        return maNDu;
    }

    public void setMaNDu(String maNDu) {
        this.maNDu = maNDu;
    }

    public String getMaDG() {
        return maDG;
    }

    public void setMaDG(String maDG) {
        this.maDG = maDG;
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

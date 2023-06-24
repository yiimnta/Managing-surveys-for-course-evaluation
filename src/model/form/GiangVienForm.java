package model.form;

import org.apache.struts.action.*;

public class GiangVienForm extends ActionForm {
    private static final long serialVersionUID = 1L;
    private String maGV;
    private String hoTen;
    private String maDD;
    private String submit = "";

    public String getSubmit() {
        return submit;
    }

    public void setSubmit(String submit) {
        this.submit = submit;
    }

    public String getMaGV() {
        return maGV;
    }

    public void setMaGV(String maGV) {
        this.maGV = maGV;
    }

    public String getHoTen() {
        return hoTen;
    }

    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }

    public String getMaDD() {
        return maDD;
    }

    public void setMaDD(String maDD) {
        this.maDD = maDD;
    }
}

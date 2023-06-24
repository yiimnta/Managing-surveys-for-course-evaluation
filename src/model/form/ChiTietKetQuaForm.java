package model.form;

import org.apache.struts.action.*;

@SuppressWarnings("serial")
public class ChiTietKetQuaForm extends ActionForm {
    private String maCTKQ;
    private String maKQ;
    private String maCT;
    private String ketQuaDG;
    private String submit;

    public String getMaCTKQ() {
        return maCTKQ;
    }

    public void setMaCTKQ(String maCTKQ) {
        this.maCTKQ = maCTKQ;
    }

    public String getMaKQ() {
        return maKQ;
    }

    public void setMaKQ(String maKQ) {
        this.maKQ = maKQ;
    }

    public String getMaCT() {
        return maCT;
    }

    public void setMaCT(String maCT) {
        this.maCT = maCT;
    }

    public String getKetQuaDG() {
        return ketQuaDG;
    }

    public void setKetQuaDG(String ketQuaDG) {
        this.ketQuaDG = ketQuaDG;
    }

    public String getSubmit() {
        return submit;
    }

    public void setSubmit(String submit) {
        this.submit = submit;
    }

}

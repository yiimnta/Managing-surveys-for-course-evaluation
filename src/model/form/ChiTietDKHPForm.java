package model.form;

import org.apache.struts.action.*;

@SuppressWarnings("serial")
public class ChiTietDKHPForm extends ActionForm {
    private String maGD;
    private String maCTDK;

    public String getMaGD() {
        return maGD;
    }

    public void setMaGD(String maGD) {
        this.maGD = maGD;
    }

    public String getMaCTDK() {
        return maCTDK;
    }

    public void setMaCTDK(String maCTDK) {
        this.maCTDK = maCTDK;
    }
}

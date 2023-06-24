package model.form;

import org.apache.struts.action.*;

@SuppressWarnings("serial")
public class ThayDoiMatKhauForm extends ActionForm {
	
    private String maND;
    private String passOld;
    private String passNew;
    private String passRetype;
    
    public String getMaND() {
        return maND;
    }
    public void setMaND(String maND) {
        this.maND = maND;
    }
    public String getPassOld() {
        return passOld;
    }
    public void setPassOld(String passOld) {
        this.passOld = passOld;
    }
    public String getPassNew() {
        return passNew;
    }
    public void setPassNew(String passNew) {
        this.passNew = passNew;
    }
    public String getPassRetype() {
        return passRetype;
    }
    public void setPassRetype(String passRetype) {
        this.passRetype = passRetype;
    }
	
    
}

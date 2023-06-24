package model.form;

import java.util.*;

import model.bean.*;

import org.apache.struts.action.*;

@SuppressWarnings("serial")
public class DanhSachGopYForm extends ActionForm {
	private ArrayList<GopY> dsGopY;

    public ArrayList<GopY> getDsGopY() {
        return dsGopY;
    }

    public void setDsGopY(ArrayList<GopY> dsGopY) {
        this.dsGopY = dsGopY;
    }
	
}

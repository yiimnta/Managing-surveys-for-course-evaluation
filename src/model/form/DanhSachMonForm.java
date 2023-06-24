package model.form;

import java.util.*;

import model.bean.*;

import org.apache.struts.action.*;

@SuppressWarnings("serial")
public class DanhSachMonForm extends ActionForm {
	private ArrayList<MonHoc> dsMon;

    public ArrayList<MonHoc> getDsMon() {
        return dsMon;
    }

    public void setDsMon(ArrayList<MonHoc> dsMon) {
        this.dsMon = dsMon;
    }
	
}
